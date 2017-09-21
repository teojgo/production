enum MachineConfiguration {
    MC("mc"),
    GPU("gpu"),
    BOTH("gpu mc")
    
    private final configuration

    MachineConfiguration(String conf) {
        configuration = conf
    }

    String toString() {
        return configuration
    }
}

MachineConfiguration getMachineConfiguration(String message, String machine) {
    def machinePattern = ".*${machine}.*"
    def machineGPU = ".*${machine}-gpu.*"
    def machineMC = ".*${machine}-mc.*"

    if (message ==~ machineGPU) {
        if (message ==~ machineMC) {
            return config.MachineConfiguration.BOTH
        }
        else {
            return config.MachineConfiguration.GPU
        }
    }
    else if (message ==~ machineMC) {
        return MachineConfiguration.MC
    }
     
    return config.MachineConfiguration.BOTH
}

boolean machineCheck(String message, String machine) {
    def machinePattern = ".*${machine}.*"
    
    return message ==~ machinePattern? true : false 
}

boolean checkWorkInProgress(String message) {
    if (message ==~ /.*WIP.*/) {
        return true
    }
    
    return false
}

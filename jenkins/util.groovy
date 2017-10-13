String[] getMachineConfiguration(String message, String machine) {
    def machinePattern = ".*${machine}.*"
    def machineGPU = ".*${machine}-gpu.*"
    def machineMC = ".*${machine}-mc.*"

    if (message ==~ machineGPU) {
        if (message ==~ machineMC) {
            return ["gpu", "mc"] 
        }
        else {
            return ["gpu"]
        }
    }
    else if (message ==~ machineMC) {
        return ["mc"]
    }
     
    return ["gpu", "mc"]
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

return this

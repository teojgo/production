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

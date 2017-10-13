def daint = [name: 'daint', 
             regressionCommand: 'srun -u --constraint=ARCH --job-name=$project_name --time=24:00:00',
             testingCommand: '',
             unuse_path: '$APPS/UES/jenkins/6.0.UP04/ARCH/easybuild/modules/all']

def dom = [name: 'dom', 
           regressionCommand: 'srun -u --constraint=ARCH --job-name=$project_name --time=24:00:00',
           testingCommand: 'srun -u --constraint=ARCH --job-name=${project_name} --time=06:00:00',
           unuse_path: '$APPS/UES/jenkins/6.0.UP04/ARCH/easybuild/modules/all']

def kesch = [name: 'kesch', 
             regressionCommand: '',
             testingCommand: '',
             unuse_path: '/apps/escha/UES/generic/modulefiles:/apps/escha/UES/PrgEnv-gnu-17.02/modulefiles:/apps/escha/UES/PrgEnv-cray-17.06/modulefiles:/apps/escha/UES/experimental/modulefiles']

def leone = [name: 'leone', 
             regressionCommand: '',
             testingCommand: '',
             unuse_path: '$APPS/UES/PrgEnv-gnu-2016b']

def monch = [name: 'monch', 
             regressionCommand: '',
             testingCommand: '',
             unuse_path: '$APPS/UES/jenkins/RH6.9-17.06/easybuild/modules/all/']

return [daint, dom, kesch, leone, monch]

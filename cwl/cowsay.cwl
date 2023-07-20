cwlVersion: v1.2
class: CommandLineTool

baseCommand: /usr/games/cowsay

requirements:
  DockerRequirement:
    dockerPull: chuanwen/cowsay

stdout: output.txt

inputs:
  message: 
    type: string
    inputBinding:
      position: 1

outputs:
  cowfile:
    type: File
    outputBinding:
      glob: output.txt





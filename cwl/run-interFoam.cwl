cwlVersion: v1.1

class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: chgarth/openfoam:latest

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.case)
        entryname: case
        writable: true
  ResourceRequirement:
    coresMin: 8

baseCommand: ["/bin/bash", "-c", "cd case && /usr/bin/openfoam2306 interFoam"]

inputs:
  case: Directory

outputs:
  - id: case
    type: Directory
    outputBinding:
      glob: case

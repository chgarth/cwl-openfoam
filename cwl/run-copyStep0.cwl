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

baseCommand: ["/bin/bash", "-c", "cd case && cp -Rv 0.orig 0"]

inputs:
  case: Directory

outputs:
  - id: case
    type: Directory
    outputBinding:
      glob: case

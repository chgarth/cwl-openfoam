cwlVersion: v1.1

class: CommandLineTool

hints:
  DockerRequirement:
    dockerImageId: chgarth/openfoam:latest

requirements:
  InitialWorkDirRequirement:
    listing:
      - entry: $(inputs.case)
        entryname: case
        writable: true

baseCommand: ["cd case && setFields"]

inputs:
  case: Directory

outputs:
  - id: case
    type: Directory?
    outputBinding:
      glob: case

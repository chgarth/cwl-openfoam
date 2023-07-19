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

baseCommand: ["cd case && foamToVTK"]

inputs:
  case: Directory

outputs:
  - id: vtk
    type: Directory?
    outputBinding:
      glob: case/VTK

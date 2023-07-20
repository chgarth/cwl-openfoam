cwlVersion: v1.1

class: Workflow

requirements:
  InlineJavascriptRequirement: {}

inputs:
  case: Directory

outputs:
  - id: output
    type: Directory
    outputSource: foamToVTK/vtk

steps:
  blockMesh:
    run: run-blockMesh.cwl
    in:
      case: case
    out: [case]
  copyStep:
    run: run-copyStep0.cwl
    in:
      case: blockMesh/case
    out: [case]
  setFields:
    run: run-setFields.cwl
    in:
      case:
        source: copyStep/case
    out: [case]
  interFoam:
    run: run-interFoam.cwl
    in:
      case: 
        source: setFields/case
    out: [case]
  foamToVTK:
    run: run-foamToVTK.cwl
    in:
      case: 
        source: interFoam/case
    out: [vtk]
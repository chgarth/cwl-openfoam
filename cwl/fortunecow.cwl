cwlVersion: v1.2
class: Workflow

inputs: []

steps:
  step1:
    run: fortune.cwl
    in:  []
    out: [message]
  step2:
    run: cowsay.cwl
    in:
      message: step1/message
    out: [cowfile]

outputs:
  out:
    type: File
    outputSource: step2/cowfile

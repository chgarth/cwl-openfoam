cwlVersion: v1.2
class: CommandLineTool

requirements:
  DockerRequirement:
    dockerPull: perarneng/fortune

baseCommand: /usr/games/fortune

stdout: output.txt

inputs: []

outputs:
  message:
    type: string
    outputBinding:
      glob: output.txt
      loadContents: true
      outputEval: $(self[0].contents)

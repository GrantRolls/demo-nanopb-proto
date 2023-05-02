
# Protobuf Example, with nanopb generation

https://jpa.kapsi.fi/nanopb/

https://protobuf.dev/programming-guides/

Look through the demo.proto to find best practice (or, at least, proven) definition/style example for protobuf for host<>embedded device communications 

demo.options Shows the extra options required with nanopb to generate the proto for embedded systems (Int sizing, fixed size arrays etc.)


See the 'generated' branch for a pre-generated files, else run the scripts as below

## Example, Generating the .c/.h from the proto

### Requirements

* Python3
* Pip packages installed from 'requirements.txt'

### Run Script

`.\lib\demo-proto\nanopb_generate.ps1 .\lib\nanopb`


## Best Practices

https://protobuf.dev/programming-guides/dos-donts/


## Other Examples

### Chirpstack (open-source LoRaWAN Network Server)

Uses proto for all MQTT messaging

https://github.com/chirpstack/chirpstack/tree/master/api/proto
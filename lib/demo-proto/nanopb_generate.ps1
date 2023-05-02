param(
    # path to nanopb lib folder. Should have generator script inside
    [Parameter(Mandatory = $true)]
    [String]
    $nanopb_dir,

    # path to outdir, default path of this script
    [Parameter(Mandatory = $false)]
    [String]
    $input_dir = $PSScriptRoot,

    # path to outdir, default path of this script
    [Parameter(Mandatory = $false)]
    [String]
    $output_dir = $PSScriptRoot,

    # name of protofile
    [Parameter(Mandatory = $false)]
    [String]
    $protofile_name = "demo.proto"
)

function Invoke-WithPrint($Command, $PreRunMsg = "", $ContinueOnFail = $false) {
    Write-Host "$PreRunMsg"
    Write-Host "Running cmd >> $Command"
    try {
        Invoke-Expression $Command
    }
    catch {
        Write-Host "Error: $_"
        if ($ContinueOnFail -eq $false) {
            Write-Host "Exit?"
            throw $_
        }
    }
}

$generate_proto_c_h = "python `"$nanopb_dir/generator/nanopb_generator.py`" --c-style -I $input_dir\ --output-dir `"$output_dir`" `"$input_dir\$protofile_name`""
Invoke-WithPrint $generate_proto_c_h
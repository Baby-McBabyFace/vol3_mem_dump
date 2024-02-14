#!/bin/sh

if [ -z "$1" ]
then
echo Image file not specified
else
echo Creating results folder...
foldername=$(date +%Y_%m_%d_%H_%M)
mkdir -p "$foldername"
echo Created folder "$foldername"

echo Generating PsList output
./vol.py -f "$1" windows.pslist.PsList > "$foldername"/PsList_output.txt

echo Generating PsScan output
./vol.py -f "$1" windows.psscan.PsScan > "$foldername"/PsScan_output.txt

echo Generating PsTree output
./vol.py -f "$1" windows.pstree.PsTree > "$foldername"/PsTree_output.txt

echo Generating DllList output
./vol.py -f "$1" windows.dlllist.DllList > "$foldername"/DllList_output.txt

echo Generating CmdLine output
./vol.py -f "$1" windows.cmdline.CmdLine > "$foldername"/CmdLine_output.txt

echo Generating GetSIDs output
./vol.py -f "$1" windows.getsids.GetSIDs > "$foldername"/GetSIDs_output.txt

echo Generating Handles output
./vol.py -f "$1" windows.handles.Handles > "$foldername"/Handles_output.txt

echo Generating NetScan output
./vol.py -f "$1" windows.netscan.NetScan > "$foldername"/NetScan_output.txt

echo Generating Malfind output
./vol.py -f "$1" windows.malfind.Malfind > "$foldername"/Malfind_output.txt

echo All outputs generated in folder "$foldername"
fi

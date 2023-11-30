// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FileStorage {
    // File data structure
    struct File {
        string filename;
        string filepath;
        string ipfsHash;
        string timestamp;
        string fileSize;
    }

    // map array of files owned by address
    mapping(address => File[]) private userFiles;

    // Onramp files owned by msg.sender
    function onrampUserFile(string memory _filename, string memory _filepath, string memory _ipfsHash, string memory _timestamp, string memory _fileSize) public {
        File memory newFile = File({
            filename: _filename,
            filepath: _filepath,
            ipfsHash: _ipfsHash,
            timestamp: _timestamp,
            fileSize: _fileSize
        });

        userFiles[msg.sender].push(newFile);
    }

    // Get files owned by given address
    function getFiles(address userAddress) public view returns (File[] memory) {
        return userFiles[userAddress];
    }
}

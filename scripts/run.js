const { utils } = require("ethers");

async function main() {
    const baseTokenURI = "ipfs://QmZGbrKmMm6TVxZNZzWrkqqxM6PfcornrwS9TFAEkYvUXY/";

    const [owner] = await hre.ethers.getSigners();
    const contractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
    const contract = await contractFactory.deploy(baseTokenURI);
    await contract.deployed();

    // Get contract address
    console.log("Contract deployed to:", contract.address);

    // Mint 1 NFTs by sending 0.03 ether
    txn = await contract.mintcwb(1, { value: utils.parseEther('0.00000001') });
    await txn.wait()
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
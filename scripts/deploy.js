
const core = async () => {
    const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();

    console.log("Contract deployed to:", nftContract.address);

    // Calling the function makeCwbNft
    let cwb = await nftContract.makeCwbNft();
     // Wating for minting
    await cwb.wait();
    console.log("Minted NFT #1")

    // Mint another one
    cwb = await nftContract.makeCwbNft();
    // Wating for minting
    await cwb.wait();
    console.log("Minted NFT #2")
}

const runCore = async () => {
    try{
        await core();
        process.exit(0)
    } catch (error){
        console.log(error)
        process.exit(1)
    }
}


runCore();
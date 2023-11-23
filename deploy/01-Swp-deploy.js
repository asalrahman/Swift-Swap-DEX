const{ethers, network}= require("hardhat");



module.exports = async function({ getNamedAccounts, deployments}){
    const{deploy,log}=deployments;
    const{deployer}= await getNamedAccounts();
    const chainId = network.config.chainId;

    console.log("deploying....")

    const swpToken= await deploy('Swp',{
        from: deployer,
        args: [],
        log:true,
        waitConfirmations: network.config.blockConfirmations || 1,
    });
    console.log("deployed");
}

module.exports.tags = ["all","swpToken"]
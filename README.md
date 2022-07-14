

## XDC Private - Create your own Private Blockchain 

Setup a XDC private network with four Masternodes.

***Software requirements -***
- Operating System - Ubuntu 20.04 64-bit or higher
- Language - Shell, Go,Python
- Wallet -https://chrome.google.com/webstore/detail/xdcpay/bocpokimicclpaiekenaeelehdjllofo?hl=en-GB

***Hardware requirements*** - Recommended CPU, memory, and storage requirements for each node
- Compute - t3 large -AWS Instance
- Memory -16 GB
- Storage - 500 GB (min)

***Firewall configuration - DDoS protection &amp; Intrusion detection***
1. Secure RPC URL - https://rpc.euphrates.network:8545/
2. Secure WebSocket URL - wss://ws.euphrates.network/
3. Secure faucet URL - https://faucet.euphrates.network/
4. Expose ports of the node for the network to be able to -
 respond to nodes outside the firewall
 respond to requests from apps like -

## Setup Configuration
***Download git repository*** 

    cd /home/ubuntu/
    git clone https://github.com/QCloud-DevOps/PrivateXDCNode_SetupScript.git

***Edit config.yml File:***

    #Set chain name EX:Leo
    Chain_Name: "Leo"
    
    #Configure Chain
    #1. Show Network stats 
    #2.Configure New Genesis 
    #3.Track new remote server 
    #4.Deploy network Components 
    Configure_New_Genesis: 1
    
    #Choose Consensus Engine
    #1.Ethash - proof of work
    #2.Clique - proof of authority 
    #3.XDPoS Delegated proof of stake
    Consensus: 3
    
    #Set time between each block in seconds
    BlockTime: 2
    
    #Set a reward for each epoch
    EpochReward: 2000
    
    #Set addresses to be initial masternodes
    MasterNode: "0x0000000000000000000000000000000000000000"
    
    #Enter the signers address.
    signers: 
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      
    #Set the number of blocks of each epoch (default 900).
    blockPerEpoch: 900
    
    #Set gap -How many blocks are needed to prepare a new masternodes set before checkpoint?)
    setGap: 5
    #foundation address in which you hold the private key
    foundationAddress: "0x0000000000000000000000000000000000000000"
    
    #accounts with which you control private keys to unlock the MultiSig wallet
    MultiSig-Address:
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
    
    #requires to confirm tx for multisig
    walletConfirmations: 2
    
    #Enter swap wallet address for fund 55 million XDC
    swapWallet: "0x0000000000000000000000000000000000000000"
    
    #Enter the address which needs to be pre-funded
    preFund:
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      
    #Enter the network ID - 72
    networkID: 72
    
    #add Nodes to subnet
    Nodes:
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"
      - "0x0000000000000000000000000000000000000000"

***Run script.sh:***

    cd /home/ubuntu/PrivateMasterNode_SetupScript/ && chmod +x setup.sh && ./setup.sh



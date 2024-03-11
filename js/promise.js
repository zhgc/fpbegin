print = (delay,message) => new Promise((resolve,reject)=>{
    setTimeout(()=>{
        if (message === "") reject();
        console.log(message);
        resolve();
    },delay);
});

print(1000,"First").
then(()=>print(4000,"Second")).
then(()=>print(3000,"Third"));

async function asyncfunciton(){
    await print(1000,"First");
    await print(4000,"Second");
    await print(3000,"Third");
    // await print(3000,"Fourth");
};

asyncfunciton();
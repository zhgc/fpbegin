/*
getJavascript :: String -> String
getJavascript [] = []
getJavascript str
    | h str p = p
    | otherwise = []
    where
        p = "javascript"
        h [] [] = True
        h [] _  = False
        h _  [] = True
        h (x:xs) (y:ys)
            | x == y    = h xs ys
            | otherwise = h xs p 
*/

function getJavascript(str,p){
    // let p = "j
    function h(xs,ys){
        if (xs === "" && ys === ""){
            return true;
        }else if (xs === "" && ys !== ""){
            return false;
        }else if (xs !== "" && ys === ""){
            return true;
        }else if(xs[0] === ys[0]){
            return h(xs.slice(1),ys.slice(1))
        }else {
            return h(xs.slice(1),p) 
        }
    }
    if (str === ""){
        return "";
    }else if (h(str,p)){
        return p;
    }else {
        return "";
    }
}

console.log(getJavascript("javacript is amazing"));
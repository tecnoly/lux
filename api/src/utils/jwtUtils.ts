import jwt, {SignOptions} from "jsonwebtoken";

const secret = process.env.SECRET || "default";

const generateToken = (payload: string | any | Buffer, options: SignOptions) => new Promise((resolve, reject) => {
    jwt.sign(payload, secret, options || { noTimestamp: true }, (err, token) => {
        if (err) {
            reject(err);
        } else {
            resolve(token);
        }
    });
});

const verifyToken = (token: string) => new Promise(((resolve, reject) => {
    jwt.verify(token, secret, (err: Error, decoded: any) => {
        if (err) {
            reject(err);
        } else {
            resolve(decoded);
        }
    });
}));
export {
    generateToken,
    verifyToken
};

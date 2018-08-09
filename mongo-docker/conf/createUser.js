db.createUser({
    user: "devuser",
    pwd: "dxfunddev",
    roles: [
        {
            role: "readWrite",
            db: "dxfunddev"
        }
    ]
})
db.createUser({
    user: "devuser",
    pwd: "dxfundtest",
    roles: [
        {
            role: "readWrite",
            db: "dxfundtest"
        }
    ]
})
db.createUser({
    user: "devuser",
    pwd: "dxfundpre",
    roles: [
        {
            role: "readWrite",
            db: "dxfundpre"
        }
    ]
})
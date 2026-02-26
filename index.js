const express = require('express');
const app = express();
const port = process.env.PORT || 8000;

app.get("/", (req, res) => {
    res.json({
        status:"success",
        message:"Hello World from express server!"
    });

});

app.listen(port, () => console.log(`listening on http://localhost:${port}`));


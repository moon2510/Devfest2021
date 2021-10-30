const express = require('express')
const app = express()
const port = 8080
app.use(express.json());
app.post('/api/webhook-event-handler', (req, res) => {
  let error = req.body.error;
  if (error != 0) {
    return;
  }

  let transactions = req.body.data;

  console.log(`Received ${transactions.length} transactions`);
  console.log(transactions);



  res.end("OK");
})
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
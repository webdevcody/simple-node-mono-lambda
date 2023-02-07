import { app } from "./app";

const PORT = process.env.PORT ?? 8080;

console.log(`Your server is running here: http://localhost:${PORT}`);
console.log(
  `    access the status endpoint here: http://localhost:${PORT}/status`
);

app.listen(8080);

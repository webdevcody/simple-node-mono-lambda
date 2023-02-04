import express from "express";
import type { Request, Response } from "express";

export const app = express();

app.use(express.json());

app.get("/status", async function (req: Request, res: Response) {
  res.send("ok");
});

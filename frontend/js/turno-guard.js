// turno-guard.js
import { db } from "./db.js";

document.addEventListener("DOMContentLoaded", async () => {
  const turnoAtivo = await db.turnos
    .orderBy("data")
    .reverse()
    .filter(t => !t.finalizadoEm)
    .first();

  if (!turnoAtivo) {
    alert("Não há turno ativo. Cadastre um novo turno.");
    window.location.href = "turno.html";
  }
});

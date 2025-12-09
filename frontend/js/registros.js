// registros.js
import { db } from "./db.js";

document.addEventListener("DOMContentLoaded", async () => {

  // Pega o turno mais recente salvo
  const ultimoTurno = await db.turnos.orderBy("data").last();

  if (!ultimoTurno) {
    alert("Você precisa cadastrar o turno antes de registrar imóveis!");
    window.location.href = "turno.html";
    return;
  }

  const form = document.getElementById("registroForm");

  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    const dados = Object.fromEntries(new FormData(form));

    await db.registros.add({
      ...dados,
      data_turno: ultimoTurno.data,
      criado_em: new Date().toISOString()
    });

    alert("Registro salvo!");
    form.reset();
  });
});

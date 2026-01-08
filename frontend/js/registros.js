// registros.js
import { db } from "./db.js";

document.addEventListener("DOMContentLoaded", async () => {

  const turnoAtivo = await db.turnos
    .orderBy("data")
    .reverse()
    .filter(t => !t.finalizadoEm)
    .first();

  if (!turnoAtivo) {
    alert("Não há turno ativo para registrar imóveis.");
    window.location.href = "turno.html";
    return;
  }

  const form = document.getElementById("registroForm");

  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    // 🔒 segurança extra
    if (turnoAtivo.finalizadoEm) {
      alert("Este turno já foi finalizado.");
      return;
    }

    const dados = Object.fromEntries(new FormData(form));

    await db.registros.add({
      ...dados,
      data_turno: turnoAtivo.data,
      criado_em: new Date().toISOString()
    });

    alert("Registro salvo com sucesso!");
    form.reset();
  });
});

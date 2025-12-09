// registros-new.js
import { db } from "../js/db.js";

document.addEventListener("DOMContentLoaded", async () => {
  console.log("📌 registros-new.js carregado");

  try {
    // 1) Busca o último turno salvo (independente da data do sistema)
    const ultimoTurno = await db.turnos.orderBy("data").last();
    console.log("🔎 ultimoTurno (orderBy('data').last()):", ultimoTurno);

    if (!ultimoTurno) {
      console.warn("⚠️ Nenhum turno encontrado no banco (ultimoTurno === null|undefined).");
      alert("Você precisa cadastrar um turno para registrar os imóveis.");
      window.location.href = "turno.html"; // ou "index.html" conforme sua navegação
      return;
    }

    // 2) Carrega só registros vinculados ao turno encontrado
    const dataTurno = ultimoTurno.data;
    console.log("✅ Usando turno com data:", dataTurno);

    // busca registros filtrando pelo campo data_turno (assumindo que esse campo existe nos registros)
    const registrosDoTurno = await db.registros.where("data_turno").equals(dataTurno).toArray();
    console.log(`📦 registrosDoTurno (total ${registrosDoTurno.length}):`, registrosDoTurno);

    // 3) Preenche a tabela
    const tabela = document.querySelector("#tabela-registros tbody");
    tabela.innerHTML = ""; // limpa linhas fixas

    if (!registrosDoTurno || registrosDoTurno.length === 0) {
      tabela.innerHTML = `
        <tr>
          <td colspan="25" style="text-align:center; color:#555;">
            Nenhum registro encontrado para o turno de ${dataTurno}.
          </td>
        </tr>
      `;
      return;
    }

    registrosDoTurno.forEach(reg => {
      const tr = document.createElement("tr");

      tr.innerHTML = `
        <td>${reg.data || dataTurno || "-"}</td>
        <td>${reg.quarteirao || "-"}</td>
        <td>${reg.lado || "-"}</td>
        <td>${reg.logradouro || "-"}</td>
        <td>${reg.numero || "-"}</td>
        <td>${reg.sequencia || "-"}</td>
        <td>${reg.complemento || "-"}</td>
        <td>${reg.tipo_imovel || reg.tipoImovel || "-"}</td>
        <td>${reg.horario_entrada || reg.horarioEntrada || "-"}</td>

        <td>${(reg.a1 || reg.A1) ? "✔" : "-"}</td>
        <td>${(reg.a2 || reg.A2) ? "✔" : "-"}</td>
        <td>${(reg.b  || reg.B)  ? "✔" : "-"}</td>
        <td>${(reg.c  || reg.C)  ? "✔" : "-"}</td>
        <td>${(reg.d1 || reg.D1) ? "✔" : "-"}</td>
        <td>${(reg.d2 || reg.D2) ? "✔" : "-"}</td>
        <td>${(reg.e  || reg.E)  ? "✔" : "-"}</td>

        <td>${reg.depositos_eliminados || reg.eliminado || "-"}</td>
        <td>${reg.insp_l1 || reg.imoveisL1 || "-"}</td>
        <td>${reg.amostra_inicial || reg.amostraInicial || "-"}</td>
        <td>${reg.amostra_final || reg.amostraFinal || "-"}</td>
        <td>${reg.qtd_tubitos || reg.tubitos || "-"}</td>
        <td>${reg.im_trat || reg.tratados || "-"}</td>
        <td>${reg.queda_gramas || reg.queda || "-"}</td>
        <td>${reg.qtd_dep_trat || reg.depTratados || "-"}</td>

        <td>${reg.informacao || reg.informações || "-"}</td>
      `;

      tabela.appendChild(tr);
    });

  } catch (err) {
    console.error("Erro geral em registros-new.js:", err);
    alert("Erro ao carregar registros. Veja o console para detalhes.");
  }
});

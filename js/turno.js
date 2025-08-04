document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('form-turno');

    const turnoSalvo = JSON.parse(localStorage.getItem('turnoDiario'));
    const hoje = new Date().toISOString().split('T')[0];

    if (turnoSalvo && turnoSalvo.data === hoje) {
      window.location.href = 'index.html';
    }

    form.addEventListener('submit', (e) => {
      e.preventDefault();

      const formData = new FormData(form);
      const dados = Object.fromEntries(formData.entries());

      // Armazena os dados do turno
      localStorage.setItem('turnoDiario', JSON.stringify(dados));

      window.location.href = 'index.html';
    });
  });
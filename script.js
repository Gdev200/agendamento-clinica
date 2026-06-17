
const horariosSimulados = ["08:00", "09:00", "10:00", "11:00", "14:00", "15:00", "16:00"];

const campoData = document.getElementById('data');
const campoHorario = document.getElementById('horario');
const form = document.getElementById('agendamentoForm');
const resumoDiv = document.getElementById('resumo');
const dadosResumo = document.getElementById('dadosResumo');

campoData.addEventListener('change', () => {
    campoHorario.innerHTML = '<option value="">Selecione um horário</option>';
    
    horariosSimulados.forEach(hora => {
        const option = document.createElement('option');
        option.value = hora;
        option.textContent = hora;
        campoHorario.appendChild(option);
    });

    campoHorario.disabled = false;
});

form.addEventListener('submit', (e) => {
    e.preventDefault();

    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const telefone = document.getElementById('telefone').value;
    const data = campoData.value;
    const horario = campoHorario.value;


    if (!nome || !email || !telefone || !data || !horario) {
        alert("Por favor, preencha todos os campos corretamente.");
        return;
    }

    form.classList.add('hidden');
    resumoDiv.classList.remove('hidden');

    dadosResumo.innerHTML = `
        <p><strong>Paciente:</strong> ${nome}</p>
        <p><strong>Contato:</strong> ${email} | ${telefone}</p>
        <p><strong>Data:</strong> ${data}</p>
        <p><strong>Horário:</strong> ${horario}</p>
        <p><em>Um lembrete foi enviado para o seu e-mail.</em></p>
    `;
});
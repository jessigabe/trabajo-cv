document.querySelectorAll('.details-toggle').forEach((button) => {
  button.addEventListener('click', () => {
    const target = document.getElementById(button.dataset.target);
    const expanded = button.getAttribute('aria-expanded') === 'true';

    button.setAttribute('aria-expanded', String(!expanded));
    target.classList.toggle('open', !expanded);
    button.textContent = expanded
      ? 'Ver responsabilidades'
      : 'Ocultar responsabilidades';
  });
});

document.querySelectorAll('.filter').forEach((button) => {
  button.addEventListener('click', () => {
    document.querySelectorAll('.filter')
      .forEach((item) => item.classList.remove('active'));

    button.classList.add('active');
    const selected = button.dataset.filter;

    document.querySelectorAll('.skill-card').forEach((card) => {
      const visible = selected === 'all' || card.dataset.category === selected;
      card.classList.toggle('hidden', !visible);
    });
  });
});

const form = document.getElementById('contactForm');
const formMessage = document.getElementById('formMessage');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  if (!form.checkValidity()) {
    formMessage.textContent = 'Completa correctamente todos los campos.';
    form.reportValidity();
    return;
  }

  formMessage.textContent =
    'Datos validados correctamente. Formulario demostrativo.';
  form.reset();
});

window.setThemeFromFlutter = (isDark) => {
  document.documentElement.classList.toggle('dark', Boolean(isDark));
};

window.scrollCvToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
};

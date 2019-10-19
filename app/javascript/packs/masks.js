function masks ($) {
  return {
    apply() {
      $('.date').mask('00/00/0000');
      $('.time').mask('00:00:00');
      $('.date_time').mask('00/00/0000 00:00:00');
      $('.cep').mask('00000-000');
      $('.phone').mask('0000-0000');
      $('.phone_with_ddd').mask('(00) 00000-0000');
      $('.cpf').mask('000.000.000-00', {reverse: true});
      $('.money').mask('000.000.000.000.000,00', {reverse: true});
    }
  }
}

module.exports = masks
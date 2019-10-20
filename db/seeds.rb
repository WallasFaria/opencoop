
Segment.create([
  { name: 'Agropecuário' },
  { name: 'Consumo' },
  { name: 'Educacional' },
  { name: 'Infraestrutura' },
  { name: 'Habitacional' },
  { name: 'Produção' },
  { name: 'Saúde' },
  { name: 'Turismo e Lazer' },
  { name: 'Transporte' }
])

User.create(
  email: 'anamaria@gmail.com',
  password: '123456',
  associate_attributes: {
    name: 'Ana Maria Quintanilha',
    cpf: '873.356.788-38',
    date_of_birth: '1991-15-08',
    marital_status: 'Casada',
    nationality: 'Brasileira',
    profession: 'Professora',
    telephone: '(11) 998765-4321',
    address_attributes: {
      street: 'Avenida Vieira Souto',
      number: '500',
      complement: 'apto 3',
      zipcode: '22420-002',
      neighborhood: 'Ipanema',
      city: 'Rio de Janeiro',
      state: 'Rio de Janeiro'
    }
  }
)

# Corporative.create(
#   name: '',
#   description: '',
#   short_description: '',
#   segment_id: '',
#   minimum_of_associates: '',
#   value_minimum_to_start: '',
#   indicators: '',
#   development_time_in_days: '',
#   cost_per_transaction: '',
#   share_capital: '',
#   video_url: '',
# )

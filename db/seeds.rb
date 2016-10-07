User.where(name: 'admin').first_or_create!(email: 'admin@example.com', is_admin: true, password: '1234qwer')

User.where(name: 'user').first_or_create!(email: 'user@example.com', password: '1234qwer')
User.where(name: 'user1').first_or_create!(email: 'user1@example.com', password: '1234qwer')

COMPONENTS_ATTRIBUTES = [
  {
    group: 'body',
    name: 'Седан',
    price: '213'
  },
  {
    group: 'body',
    name: 'Универсал',
    price: '213'
  },
  {
    group: 'body',
    name: 'Внедорожник',
    price: '532'
  },
  {
    group: 'engine',
    name: 'Бензиновый',
    price: '323'
  },
  {
    group: 'engine',
    name: 'Дизельный',
    price: '454'
  },
  {
    group: 'engine',
    name: 'Электрический',
    price: '676'
  },
  {
    group: 'transmission',
    name: 'Механическая',
    price: '422'
  },
  {
    group: 'transmission',
    name: 'Автоматизированная',
    price: '875'
  },
  {
    group: 'transmission',
    name: 'Вариаторная',
    price: '654'
  }
]

COMPONENTS_ATTRIBUTES.each do |component_attributes|
  Component.where(name: component_attributes[:name]).first_or_create! component_attributes
end
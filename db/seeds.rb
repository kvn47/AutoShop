User.where(name: 'admin').first_or_create!(email: 'admin@example.com', is_admin: true, password: '1234qwer')

User.where(name: 'user').first_or_create!(email: 'user@example.com', password: '1234qwer')
User.where(name: 'user1').first_or_create!(email: 'user1@example.com', password: '1234qwer')
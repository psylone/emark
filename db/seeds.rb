[ User, Subject, SubjectLine, Grade, Mark ].each{ |model| model.destroy_all }

grades = [
  { title: '7-Д' },
  { title: '11-Б' }
]
Grade.create! grades

teachers = [
  { fio: 'Светлоярова Анна Павловна',
    password: 'secret',
    password_confirmation: 'secret',
    email: 'svetloyarova@yandex.ru',
    is_teacher: true
  },
  { fio: 'Борисов Иван Петрович',
    password: 'secret',
    password_confirmation: 'secret',
    email: 'borisov@yandex.ru',
    is_teacher: true
  }
]
User.create! teachers

subjects = [
  {
    title: 'Русский язык',
    user_id: User.teachers.where(fio: 'Светлоярова Анна Павловна').first.id,
    grade_id: Grade.where(title: '7-Д').first.id
    },
  {
    title: 'Литература',
    user_id: User.teachers.where(fio: 'Светлоярова Анна Павловна').first.id,
    grade_id: Grade.where(title: '7-Д').first.id
    },
  {
    title: 'Математика',
    user_id: User.teachers.where(fio: 'Борисов Иван Петрович').first.id,
    grade_id: Grade.where(title: '11-Б').first.id
  }
]
Subject.create! subjects

students = [
  {
    fio: 'Винников Михаил Александрович',
    password: 'secret',
    password_confirmation: 'secret',
    email: 'vinnikov@yandex.ru',
    grade_id: Grade.where(title: '7-Д').first.id
  },
  {
    fio: 'Мичурина Светлана Игоревна',
    password: 'secret',
    password_confirmation: 'secret',
    email: 'michurina@yandex.ru',
    grade_id: Grade.where(title: '7-Д').first.id
  },
  {
    fio: 'Острова Мария Петровна',
    password: 'secret',
    password_confirmation: 'secret',
    email: 'ostrova@yandex.ru',
    grade_id: Grade.where(title: '11-Б').first.id
  }
]
User.create! students
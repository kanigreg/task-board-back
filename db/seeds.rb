seed_file = Rails.root.join('db', 'seeds', 'projects.yml')
config = YAML.load_file(seed_file)
Project.create!(config)

seed_file = Rails.root.join('db', 'seeds', 'todos.yml')
config = YAML.load_file(seed_file)
Todo.create!(config)

class RolifyCreateTeamRoles < ActiveRecord::Migration[5.1]
  def change
    create_table(:team_roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:teams_team_roles, :id => false) do |t|
      t.references :team
      t.references :team_role
    end
    
    add_index(:team_roles, :name)
    add_index(:team_roles, [ :name, :resource_type, :resource_id ])
    add_index(:teams_team_roles, [ :team_id, :team_role_id ])
  end
end

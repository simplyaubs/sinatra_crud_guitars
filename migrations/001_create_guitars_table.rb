Sequel.migration do
  up do
    create_table(:guitars) do
      primary_key :id
      String :maker, :null=>false
      String :type, :null=>false
      String :color, :null=>false
    end
  end

  down do
    drop_table(:guitars)
  end
end
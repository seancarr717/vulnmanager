class CreateVulns < ActiveRecord::Migration[7.0]
  def change
    create_table :vulns do |t|
      t.string :vuln_name
      t.string :vuln_type
      t.string :cve
      t.date :discovered

      t.timestamps
    end
  end
end

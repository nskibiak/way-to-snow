class AddColumnToWeatherReports < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_reports, :current, :boolean
  end
end

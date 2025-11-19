class ChangeAuditLogsPayloadAndRequestToJson < ActiveRecord::Migration[6.0]
  def up
    # Change payload and request columns from text to json type
    # Using CAST to convert existing JSON text data to native JSON type
    change_column :audit_logs, :payload, :json, using: 'payload::json'
    change_column :audit_logs, :request, :json, using: 'request::json'
  end

  def down
    # Rollback: change columns back to text type
    change_column :audit_logs, :payload, :text
    change_column :audit_logs, :request, :text
  end
end
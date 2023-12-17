json.extract! vuln, :id, :vuln_name, :vuln_type, :cve, :discovered, :created_at, :updated_at
json.url vuln_url(vuln, format: :json)

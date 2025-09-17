from odoo import models, fields, api
import base64
import io
import csv

class CraftingImportWizard(models.TransientModel):
    _name = 'crafting.import.wizard'
    _description = 'Wizard Import Items từ CSV'

    csv_file = fields.Binary('File CSV', required=True)
    file_name = fields.Char('Tên file')

    def action_import(self):
        self.ensure_one()
        if self.csv_file:
            try:
                # Decode file
                csv_data = base64.b64decode(self.csv_file)
                data = io.StringIO(csv_data.decode('utf-8'))
                reader = csv.DictReader(data)
                
                Item = self.env['crafting.item']
                imported_count = 0
                updated_count = 0
                
                for row in reader:
                    # Tìm hoặc tạo item mới
                    import_id = row.get('id', '').strip()
                    name = row.get('name', '').strip()
                    category = row.get('category', 'material').strip()
                    
                    if not name:
                        continue
                    
                    domain = [('name', '=', name)]
                    if import_id:
                        domain = ['|', ('import_id', '=', import_id)] + domain
                    
                    item = Item.search(domain, limit=1)
                    if item:
                        item.write({
                            'name': name,
                            'category': category,
                            'import_id': import_id,
                        })
                        updated_count += 1
                    else:
                        Item.create({
                            'import_id': import_id,
                            'name': name,
                            'category': category,
                        })
                        imported_count += 1
                
                # Hiển thị thông báo thành công
                message = f"Import thành công! {imported_count} items mới, {updated_count} items được cập nhật."
                return {
                    'type': 'ir.actions.client',
                    'tag': 'display_notification',
                    'params': {
                        'title': 'Thành công',
                        'message': message,
                        'type': 'success',
                        'sticky': False,
                    }
                }
                
            except Exception as e:
                # Hiển thị thông báo lỗi
                return {
                    'type': 'ir.actions.client',
                    'tag': 'display_notification',
                    'params': {
                        'title': 'Lỗi Import',
                        'message': f'Lỗi khi import: {str(e)}',
                        'type': 'danger',
                        'sticky': True,
                    }
                }
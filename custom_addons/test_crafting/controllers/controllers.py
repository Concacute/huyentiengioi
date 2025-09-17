# -*- coding: utf-8 -*-
# from odoo import http


# class TestCrafting(http.Controller):
#     @http.route('/test_crafting/test_crafting', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/test_crafting/test_crafting/objects', auth='public')
#     def list(self, **kw):
#         return http.request.render('test_crafting.listing', {
#             'root': '/test_crafting/test_crafting',
#             'objects': http.request.env['test_crafting.test_crafting'].search([]),
#         })

#     @http.route('/test_crafting/test_crafting/objects/<model("test_crafting.test_crafting"):obj>', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('test_crafting.object', {
#             'object': obj
#         })


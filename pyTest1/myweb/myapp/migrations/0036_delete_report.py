# Generated by Django 4.1.5 on 2023-01-10 22:54

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0035_hstate_notice_order_report"),
    ]

    operations = [
        migrations.DeleteModel(name="report",),
    ]

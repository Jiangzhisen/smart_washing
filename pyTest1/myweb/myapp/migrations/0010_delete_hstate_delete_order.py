# Generated by Django 4.1.5 on 2023-01-08 01:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0009_hstate"),
    ]

    operations = [
        migrations.DeleteModel(name="hstate",),
        migrations.DeleteModel(name="order",),
    ]
# Generated by Django 4.1.5 on 2023-01-08 03:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0015_lock"),
    ]

    operations = [
        migrations.DeleteModel(name="lock",),
    ]
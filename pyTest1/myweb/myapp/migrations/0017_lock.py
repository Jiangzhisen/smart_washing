# Generated by Django 4.1.5 on 2023-01-08 03:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0016_delete_lock"),
    ]

    operations = [
        migrations.CreateModel(
            name="lock",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "LOCKID",
                    models.CharField(default="", max_length=10, verbose_name="鎖櫃編號"),
                ),
                (
                    "ORDID",
                    models.CharField(default="", max_length=10, verbose_name="訂單編號"),
                ),
                (
                    "INDATE",
                    models.CharField(default="", max_length=50, verbose_name="進入時間"),
                ),
                (
                    "OUTDATE",
                    models.CharField(default="", max_length=50, verbose_name="出來時間"),
                ),
            ],
            options={"unique_together": {("LOCKID", "ORDID")},},
        ),
    ]

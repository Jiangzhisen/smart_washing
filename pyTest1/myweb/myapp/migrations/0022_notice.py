# Generated by Django 4.1.5 on 2023-01-09 19:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0021_delete_notice"),
    ]

    operations = [
        migrations.CreateModel(
            name="notice",
            fields=[
                (
                    "NID",
                    models.AutoField(
                        primary_key=True, serialize=False, verbose_name="通知編號"
                    ),
                ),
                (
                    "MEMID",
                    models.CharField(default="", max_length=10, verbose_name="使用者編號"),
                ),
                (
                    "NCONTENT",
                    models.CharField(default="", max_length=100, verbose_name="通知內容"),
                ),
                (
                    "NLINK",
                    models.CharField(default="", max_length=100, verbose_name="通知連接"),
                ),
                ("NTIME", models.DateTimeField(default="", verbose_name="通知時間")),
            ],
        ),
    ]

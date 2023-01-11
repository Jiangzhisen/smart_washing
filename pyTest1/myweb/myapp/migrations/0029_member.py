# Generated by Django 4.1.5 on 2023-01-10 06:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0028_delete_member"),
    ]

    operations = [
        migrations.CreateModel(
            name="member",
            fields=[
                (
                    "MEMID",
                    models.CharField(
                        default="",
                        max_length=36,
                        primary_key=True,
                        serialize=False,
                        verbose_name="使用者編號",
                    ),
                ),
                (
                    "PHONE",
                    models.CharField(default="", max_length=10, verbose_name="使用者電話號碼"),
                ),
                (
                    "ADDRESS",
                    models.CharField(default="", max_length=25, verbose_name="使用者地址"),
                ),
                (
                    "AUTHORIZATION",
                    models.BooleanField(default=False, verbose_name="授權"),
                ),
                (
                    "CARD1",
                    models.CharField(default="無", max_length=16, verbose_name="信用卡卡號1"),
                ),
                (
                    "CARD2",
                    models.CharField(default="無", max_length=16, verbose_name="信用卡卡號2"),
                ),
                (
                    "CARD3",
                    models.CharField(default="無", max_length=16, verbose_name="信用卡卡號3"),
                ),
                (
                    "CARD4",
                    models.CharField(default="無", max_length=16, verbose_name="信用卡卡號4"),
                ),
                (
                    "CARD5",
                    models.CharField(default="無", max_length=16, verbose_name="信用卡卡號5"),
                ),
                ("AC_CODE", models.CharField(max_length=43)),
            ],
        ),
    ]

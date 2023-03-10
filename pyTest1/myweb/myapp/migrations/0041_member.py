# Generated by Django 4.1.5 on 2023-01-11 02:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("myapp", "0040_delete_member"),
    ]

    operations = [
        migrations.CreateModel(
            name="member",
            fields=[
                (
                    "MEMID",
                    models.CharField(
                        default="",
                        max_length=43,
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
                ("AUTHORIZATION", models.CharField(max_length=1, verbose_name="授權")),
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
                (
                    "WPRE",
                    models.CharField(default="標準", max_length=15, verbose_name="洗衣偏好"),
                ),
                (
                    "DPRE",
                    models.CharField(default="日曬", max_length=15, verbose_name="烘衣偏好"),
                ),
                (
                    "FPRE",
                    models.CharField(default="不折", max_length=15, verbose_name="摺衣偏好"),
                ),
                (
                    "GPRE",
                    models.CharField(
                        default="自行送洗", max_length=15, verbose_name="送洗偏好"
                    ),
                ),
                (
                    "CPRE",
                    models.CharField(default="自取", max_length=15, verbose_name="領取偏好"),
                ),
            ],
        ),
    ]

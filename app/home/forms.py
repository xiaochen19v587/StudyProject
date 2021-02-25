# _*_ coding: utf-8 _*_
# sex功能添加_21   phone功能添加_29
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, FileField, TextAreaField, RadioField, IntegerField
from wtforms.validators import DataRequired, Email, Regexp, EqualTo, ValidationError
from app.models import User

class RegisterForm(FlaskForm):
    """
    用户注册表单
    """
    username = StringField(
        validators=[
            DataRequired("用户名不能为空！"),
        ],
        description="用户名",
        render_kw={
            "placeholder": "请输入用户名！",
        }
    )
    sex = RadioField(
        label="性别:",
        coerce=int,
        choices=[(0, '男'), (1, '女')], default=0,           # test
        description="性别",
    )
    phone = StringField(                 # test
        validators=[
            DataRequired("手机号不能为空！")
        ],
        description="手机号",
        render_kw={
            "placeholder": "请输入手机号！",
        }
    )
    email = StringField(
        validators=[
            DataRequired("邮箱不能为空！"),
            Email("邮箱格式不正确！")
        ],
        description="邮箱",
        render_kw={
            "type": "email",
            "placeholder": "请输入邮箱！",
        }
    )
    # st_number = IntegerField(
    #     validators=[
    #         DataRequired("学号/教工号不能为空")
    #     ],
    #     label="学号/教工号",
    #     render_kw={
    #         "placeholder": "请输入学号或者教工号！",
    #     }
    # )
    pwd = PasswordField(
        validators=[
            DataRequired("密码不能为空！")
        ],
        description="密码",
        render_kw={
            "placeholder": "请输入密码！",
        }
    )
    repwd = PasswordField(
        validators=[
            DataRequired("请输入确认密码！"),
            EqualTo('pwd', message="两次密码不一致！")
        ],
        description="确认密码",
        render_kw={
            "placeholder": "请输入确认密码！",
        }
    )
    submit = SubmitField(
        '注册',
        render_kw={
            "class": "btn btn-primary",
        }
    )

    def validate_email(self, field):
        """
        检测注册邮箱是否已经存在
        :param field: 字段名
        """
        email = field.data
        user = User.query.filter_by(email=email).count()
        if user == 1:
            raise ValidationError("邮箱已经存在！")


class LoginForm(FlaskForm):
    """
    登录功能
    """
    email = StringField(
        validators=[
            DataRequired("邮箱不能为空！")
        ],
        description="邮箱",
        render_kw={
            "type"       : "email",
            "placeholder": "请输入邮箱！",
        }
    )
    pwd = PasswordField(

        validators=[
            DataRequired("密码不能为空！")
        ],
        description="密码",
        render_kw={
            "type"       : "password",
            "placeholder": "请输入密码！",
        }
    )
    submit = SubmitField(
        '登录',
        render_kw={
            "class": "btn btn-primary",
        }
    )

class SuggetionForm(FlaskForm):
    """
    意见建议
    """
    name = StringField(
        label="姓名",
        validators=[
            DataRequired("姓名不能为空！")
        ],
        description="姓名",
        render_kw={
            "placeholder": "请输入姓名！",
            "class" : "form-control"
        }
    )
    email = StringField(
        label="邮箱",
        validators=[
            DataRequired("邮箱不能为空！")
        ],
        description="邮箱",
        render_kw={
            "type"       : "email",
            "placeholder": "请输入邮箱！",
            "class" : "form-control"
        }
    )
    content = TextAreaField(
        label="意见建议",
        validators=[
            DataRequired("内容不能为空！")
        ],
        description="意见建议",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入内容！",
            "rows" : 7
        }
    )
    submit = SubmitField(
        '发送消息',
        render_kw={
            "class": "btn-default btn-cf-submit",
        }
    )





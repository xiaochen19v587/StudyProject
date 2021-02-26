# _*_ coding: utf-8 _*_

from flask_wtf import FlaskForm
from flask_wtf.file import  FileAllowed
from wtforms import StringField, PasswordField, SubmitField, FileField, TextAreaField, RadioField,SelectField
from wtforms.validators import DataRequired, ValidationError
from app.models import Admin


class LoginForm(FlaskForm):
    """
    管理员登录表单
    """
    account = StringField(
        label="账号",
        validators=[
            DataRequired("账号不能为空")
        ],
        description="账号",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入账号！",
        }
    )
    pwd = PasswordField(
        label="密码",
        validators=[
            DataRequired("密码不能为空")
        ],
        description="密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入密码！",
        }
    )
    submit = SubmitField(
        '登录',
        render_kw={
            "class": "btn btn-primary btn-block btn-flat",
        }
    )

    # 验证账号，命名规则：validate_ + 字段名。如果要验证密码，则可以创建函数validate_pwd
    def validate_account(self, field):
        account = field.data
        admin = Admin.query.filter_by(name=account).count()
        if admin == 0:
            raise ValidationError("账号不存在! ")

class PwdForm(FlaskForm):
    old_pwd = PasswordField(
        label="旧密码",
        validators=[
            DataRequired("旧密码不能为空！")
        ],
        description="旧密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入旧密码！",
        }
    )
    new_pwd = PasswordField(
        label="新密码",
        validators=[
            DataRequired("新密码不能为空！")
        ],
        description="新密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入新密码！",
        }
    )
    submit = SubmitField(
        '保存',
        render_kw={
            "class": "btn btn-primary",
        }
    )

    def validate_old_pwd(self, field):
        from flask import session
        pwd = field.data
        name = session["admin"]
        admin = Admin.query.filter_by(
            name=name
        ).first()
        if not admin.check_pwd(pwd):
            raise ValidationError("旧密码错误！")

class AreaForm(FlaskForm):
    """添加/编辑学科的表单"""
    name = StringField(
        label="名称",
        validators=[
            DataRequired("学科名不能为空")
        ],
        description="学科",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入学科名称！"
        }
    )
    is_recommended = RadioField(
        label = '是否推荐',
        description="是否推荐",
        coerce = int,
        choices=[(0, '否'), (1,'是')], default=0, 
    )
    introduction = TextAreaField(
        label="简介",
        validators=[
            DataRequired("简介不能为空！")
        ],
        description="简介",
        render_kw={
            "class": "form-control",
            "rows": 5
        }
    )

    submit = SubmitField(
        '添加',
        render_kw={
            "class": "btn btn-primary",
        }
    )

class ScenicForm(FlaskForm):
    title = StringField(
        label="课程名称",
        validators=[
            DataRequired("课程名称不能为空！")
        ],
        description="课程名称",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入课程名称！"
        }
    )
    address = StringField(
        label="授课教师",
        validators=[
            DataRequired("授课教师不能为空！")
        ],
        description="授课教师",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入授课教师！"
        }
    )    
    star = SelectField(
        label="星级",
        validators=[
            DataRequired("请选择星级！")
        ],
        coerce=int,
        choices=[(1, "1星"), (2, "2星"), (3, "3星"), (4, "4星"), (5, "5星")],default=5,
        description="星级",
        render_kw={
            "class": "form-control",
        }
    )

    logo = FileField(
        label="封面",
        validators=[
            DataRequired("请上传封面！"),
            FileAllowed(['jpg', 'png'], '请上传jpg或png格式图片!')
        ],
        description="封面",
    )

    is_hot = RadioField(
        label = '是否热门',
        description="是否热门",
        coerce = int,
        choices=[(0, '否'), (1,'是')], default=0, 
    )
    is_recommended = RadioField(
        label = '是否推荐',
        description="是否推荐",
        coerce = int,
        choices=[(0, '否'), (1,'是')], default=0, 
    )    
    introduction = TextAreaField(
        label="课程简介",
        validators=[
            DataRequired("简介不能为空！")
        ],
        description="简介",
        render_kw={
            "class": "form-control",
            "rows": 5
        }
    )
    content = TextAreaField(
        label="课程内容",
        validators=[
            DataRequired("课程内容不能为空！")
        ],
        description="课程内容",
        render_kw={
            "class": "form-control ckeditor",
            "rows": 10
        }
    )
    area_id = SelectField(
        label="所属学科",
        validators=[
            DataRequired("请选择标签！")
        ],
        coerce=int,
        description="所属学科",
        render_kw={
            "class": "form-control",
        }
    )
    pdf = FileField(
        label="pdf文件上传",
        validators=[
            DataRequired("请上传pdf！"),
            FileAllowed(['pdf'], '请上传pdf格式文件!')
        ],
        description="pdf",
    )
    vedio_mp4 = FileField(
        label="视频上传",
        validators=[
            DataRequired("请上传视频！"),
            FileAllowed(['mp4'], '请上传mp4格式文件!')
        ],
        description="mp4",
    )
    submit = SubmitField(
        '添加',
        render_kw={
            "class": "btn btn-primary",
        }
    )        

class TravelsForm(FlaskForm):
    title = StringField(
        label="标题",
        validators=[
            DataRequired("标题不能为空！")
        ],
        description="标题",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入标题！"
        }
    )
    author = StringField(
        label="作者",
        validators=[
            DataRequired("作者不能为空！")
        ],
        description="作者",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入作者！"
        }
    )    
    content = TextAreaField(
        label="学习攻略内容",
        validators=[
            DataRequired("学习攻略内容不能为空！")
        ],
        description="攻略内容",
        render_kw={
            "class": "form-control ckeditor",
        }
    )
    scenic_id = SelectField(
        label="所属课程",
        validators=[
            DataRequired("请选择课程！")
        ],
        coerce=int,
        description="所属课程",
        render_kw={
            "class": "form-control",
        }
    )
    submit = SubmitField(
        '添加',
        render_kw={
            "class": "btn btn-primary",
        }
    )        


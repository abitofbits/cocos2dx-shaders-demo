Cocos2d-X Shaders Demo
===

This is a small demo collection of 20 shaders created while studying Cocos2d-X (from v. 3.10 to 3.17) to learn how to make iOS, Android and OSX games.

They can certainly be improved and optimized but I didn't care during the study phase.

This software is provided AS-IS and is to be considered for educational purposes only.

People are encouraged to use them as a starting point to write amazing and more complex shaders.

The first example of them (shaders 1 to 10) is available here:
https://www.youtube.com/watch?v=QwtsmFVCdqg


The second example of them (shaders 11 to 20) is available here:
https://www.youtube.com/watch?v=eX3eim1WB0c


Usage
---

Create background layer and a sprite for shaders (*HelloWorld.png* in this example):
```bash
[...]
Size visibleSize = Director::getInstance()->getVisibleSize();

auto bg = LayerColor::create(Color4B(120, 120, 80, 255));
this->addChild(bg);

//create the Sprite object for shaders
auto sprite = Sprite::create("img/HelloWorld.png");
sprite->setPosition(Vec2(visibleSize.width/2, visibleSize.height/2));
this->addChild(sprite);
[...]
```

Most of them (except #11, #17 and #19) are created this way (with *vertex-common.vsh*):
```
int number = 1;
auto shader = StringUtils::format("shaders/fragment-%d.fsh", number);
GLProgram* p = new GLProgram();
p->initWithFilenames("shaders/vertex-common.vsh", shader);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_POSITION, GLProgram::VERTEX_ATTRIB_POSITION);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_COLOR, GLProgram::VERTEX_ATTRIB_COLOR);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_TEX_COORD, GLProgram::VERTEX_ATTRIB_TEX_COORDS);
p->link();

CHECK_GL_ERROR_DEBUG();
p->updateUniforms();
CHECK_GL_ERROR_DEBUG();

sprite->setGLProgram(p);
```

**Shader #11** (it uses *vertex-specific.vsh*):
```
int number = 11;
auto shader = StringUtils::format("shaders/fragment-%d.fsh", number);
GLProgram *p = new GLProgram();
p->initWithFilenames("shaders/vertex-specific.vsh", shader);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_POSITION, GLProgram::VERTEX_ATTRIB_POSITION);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_COLOR, GLProgram::VERTEX_ATTRIB_COLOR);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_TEX_COORD, GLProgram::VERTEX_ATTRIB_TEX_COORDS);
p->link();

CHECK_GL_ERROR_DEBUG();
p->updateUniforms();
CHECK_GL_ERROR_DEBUG();

const Texture2D::TexParams params = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
Texture2D *caustic = Director::getInstance()->getTextureCache()->addImage("texture/cloth.png");
caustic->setTexParameters(params);
Texture2D *noise = Director::getInstance()->getTextureCache()->addImage("texture/bisection-noise.png");
noise->setTexParameters(params);

auto glprogramstate = GLProgramState::getOrCreateWithGLProgram(p);
sprite->setGLProgramState(glprogramstate);
glprogramstate->setUniformTexture("u_CausticTexture", caustic);
glprogramstate->setUniformTexture("u_NoiseTexture", noise);
```

**Shader #17** (it uses *vertex-specific.vsh*):
```
int number = 17;
auto shader = StringUtils::format("shaders/fragment-%d.fsh", number);
GLProgram *p = new GLProgram();
p->initWithFilenames("s<haders/vertex-specific.vsh", shader);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_POSITION, GLProgram::VERTEX_ATTRIB_POSITION);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_COLOR, GLProgram::VERTEX_ATTRIB_COLOR);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_TEX_COORD, GLProgram::VERTEX_ATTRIB_TEX_COORDS);
p->link();

CHECK_GL_ERROR_DEBUG();
p->updateUniforms();
CHECK_GL_ERROR_DEBUG();

const Texture2D::TexParams params = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
Texture2D *caustic = Director::getInstance()->getTextureCache()->addImage("texture/caustic.png");
caustic->setTexParameters(params);
Texture2D *noise = Director::getInstance()->getTextureCache()->addImage("texture/bisection-noise.png");
noise->setTexParameters(params);

auto glprogramstate = GLProgramState::getOrCreateWithGLProgram(p);
sprite->setGLProgramState(glprogramstate);
glprogramstate->setUniformTexture("u_CausticTexture", caustic);
glprogramstate->set>UniformTexture("u_NoiseTexture", noise);
```

**Shader #19** (it uses *vertex-specific.vsh*):
```
int number = 19;
auto shader = StringUtils::format("shaders/fragment-%d.fsh", number);
GLProgram *p = new GLProgram();
p->initWithFilenames("shaders/vertex-specific.vsh", shader);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_POSITION, GLProgram::VERTEX_ATTRIB_POSITION);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_COLOR, GLProgram::VERTEX_ATTRIB_COLOR);
p->bindAttribLocation(GLProgram::ATTRIBUTE_NAME_TEX_COORD, GLProgram::VERTEX_ATTRIB_TEX_COORDS);
p->link();

CHECK_GL_ERROR_DEBUG();
p->updateUniforms();
CHECK_GL_ERROR_DEBUG();

const Texture2D::TexParams params = {GL_LINEAR, GL_LINEAR, GL_REPEAT, GL_REPEAT};
Texture2D *caustic = Director::getInstance()->getTextureCache()->addImage("texture/circle.png");
caustic->setTexParameters(params);
Texture2D *noise = Director::getInstance()->getTextureCache()->addImage("texture/bisection-noise.png");
noise->setTexParameters(params);

auto glprogramstate = GLProgramState::getOrCreateWithGLProgram(p);
sprite->setGLProgramState(glprogramstate);
glprogramstate->setUniformTexture("u_CausticTexture", caustic);
glprogramstate->setUniformTexture("u_NoiseTexture", noise);
```


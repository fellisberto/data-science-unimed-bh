# Transfer Learning com VGG16

Este projeto demonstra como utilizar a técnica de aprendizado por transferência (Transfer Learning) com o modelo VGG16 pré-treinado para resolver um problema de classificação de imagens em um conjunto de dados personalizado.

## Descrição

O aprendizado por transferência permite reutilizar modelos previamente treinados, como o VGG16, e adaptá-los para novas tarefas. Neste projeto, as camadas superiores do modelo VGG16 são substituídas por camadas personalizadas, treinadas para classificar imagens de um conjunto de dados específico.

## Dependências

Certifique-se de ter os seguintes pacotes instalados:

- Python 3.x
- TensorFlow 2.x
- NumPy
- Matplotlib

Para instalar as dependências, utilize o comando:

```bash
pip install tensorflow numpy matplotlib

## Estrutura de Diretórios
Organize seu conjunto de dados no seguinte formato:

dataset/
├── treino/
│   ├── classe_1/
│   │   ├── imagem1.jpg
│   │   ├── imagem2.jpg
│   │   └── ...
│   ├── classe_2/
│   │   ├── imagem1.jpg
│   │   ├── imagem2.jpg
│   │   └── ...
│   └── ...


## Codigo:
(///')
import tensorflow as tf
from tensorflow.keras.applications import VGG16
from tensorflow.keras.layers import Dense, Flatten
from tensorflow.keras.models import Model
from tensorflow.keras.preprocessing.image import ImageDataGenerator

# Carregar o modelo VGG16 pré-treinado sem as camadas superiores
base_model = VGG16(weights='imagenet', include_top=False, input_shape=(224, 224, 3))

# Congelar os pesos das camadas do modelo base
for layer in base_model.layers:
    layer.trainable = False

# Adicionar novas camadas superiores para a nova tarefa
x = Flatten()(base_model.output)
x = Dense(1024, activation='relu')(x)
predictions = Dense(num_classes, activation='softmax')(x)

# Montar o novo modelo
model = Model(inputs=base_model.input, outputs=predictions)

# Compilar o modelo
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])

# Preparar o gerador de dados
train_datagen = ImageDataGenerator(rescale=1./255)
train_generator = train_datagen.flow_from_directory(
    'caminho/para/seu/dataset/treino',
    target_size=(224, 224),
    batch_size=32,
    class_mode='categorical')

# Treinar o modelo
model.fit(train_generator, steps_per_epoch=train_generator.n//train_generator.batch_size, epochs=5)

# Salvar o modelo treinado
model.save('meu_modelo_transfer_learning.h5')

(///)


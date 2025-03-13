# Apresentação do Projeto: Transfer Learning com VGG16

## Introdução

O aprendizado por transferência é uma abordagem poderosa no campo de inteligência artificial e aprendizado profundo, permitindo que modelos previamente treinados em grandes conjuntos de dados sejam aproveitados para resolver problemas específicos com conjuntos de dados menores. Este projeto utiliza o modelo **VGG16**, amplamente reconhecido por sua eficácia na classificação de imagens, para realizar a classificação em um conjunto de dados personalizado.

## Objetivo

O principal objetivo deste projeto é demonstrar como o modelo VGG16, treinado no conjunto de dados **ImageNet**, pode ser reutilizado para atender a diferentes necessidades de classificação de imagens. Através da adição de camadas personalizadas, o modelo será adaptado para classificar imagens em um contexto completamente novo.

## Metodologia

1. **Carregamento do Modelo Base:**  
   O modelo VGG16, previamente treinado, é carregado sem suas camadas superiores responsáveis pela classificação original (conjunto de dados ImageNet). Dessa forma, reutilizamos as camadas convolucionais que já possuem um conhecimento robusto sobre características visuais.

2. **Personalização do Modelo:**  
   Camadas densas personalizadas são adicionadas sobre o modelo base. Essas camadas são responsáveis por aprender as especificidades do novo conjunto de dados.

3. **Treinamento:**  
   Congelamos as camadas do modelo base, evitando que seus pesos sejam alterados. Apenas as camadas adicionadas são treinadas, garantindo uma adaptação eficiente ao novo conjunto de dados.

4. **Avaliação e Salvamento:**  
   O modelo é treinado utilizando o novo conjunto de dados e, ao final, o modelo treinado é salvo em um arquivo `.h5` para uso futuro.

## Benefícios do Projeto

- **Eficiência de Recursos:** Como o modelo base já foi treinado, há uma economia significativa de tempo e recursos computacionais no treinamento.
- **Desempenho Aprimorado:** O VGG16 traz consigo um aprendizado prévio robusto, o que tende a melhorar a performance em conjuntos de dados menores.
- **Flexibilidade:** O aprendizado por transferência permite aplicar técnicas de ponta a uma ampla variedade de problemas e contextos.

## Aplicações Potenciais

As aplicações do aprendizado por transferência são vastas. Este projeto pode ser usado como base para:
- Classificação de tipos de plantas ou animais.
- Diagnóstico médico a partir de imagens, como raios-X ou ressonâncias magnéticas.
- Classificação de produtos para comércio eletrônico.
- Identificação de objetos em fotos ou vídeos.

## Por que o VGG16?

O modelo **VGG16** é amplamente utilizado na comunidade de visão computacional devido à sua arquitetura simples e eficácia comprovada. Ele é composto por 16 camadas treináveis e foi projetado para capturar detalhes profundos das imagens, tornando-o ideal para aprendizado por transferência.

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

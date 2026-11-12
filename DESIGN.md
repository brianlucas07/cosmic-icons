# Diretrizes de Design & Filosofia Visual (COSMIC Custom)

Este documento estabelece os princípios visuais, estruturais e técnicos do tema **COSMIC Custom**.

---

## 1. Visão Geral: Formas Icônicas Modernas com Alma Cósmica

A identidade do tema une a **clareza semântica dos objetos clássicos** (a pasta, o documento com lápis, a janela de terminal, a sacola de aplicativos) ao acabamento moderno, polido e refinado do **COSMIC Desktop**.

- **Objetos Reais e Reconhecíveis**: Cada ícone é a representação direta e orgânica do que o aplicativo faz. Sem "caixas com telinhas" genéricas ou adereços artificiais.
- **A Alma Retro-Futurista**: Reside sutilmente na **paleta cósmica** (azul espacial profundo, ciano elétrico vibrante, toques em âmbar solar), nas sombras suaves de profundidade e nos **cantos generosamente arredondados** (*squircles*).
- **Sobriedade e Função**: Eliminação de ruídos visuais e enfeites excessivos em favor de formas puras, elegantes e legíveis tanto na dock quanto no launcher.

---

## 2. Princípios de Geometria & Proporção

1. **Cantos Bem Arredondados (*Gentle Squircles*)**:
   - Elementos principais adotam curvas suaves e contínuas (`rx="28"` na escala `256x256`).
   - Elementos internos (folhas, janelas, painéis) utilizam raios harmônicos entre `rx="14"` e `rx="20"`.
   - O arredondamento dialoga perfeitamente com as janelas, applets e a dock flutuante do COSMIC.
2. **Profundidade em Camadas (*Layered Depth*)**:
   - Luz natural com degradês direcionais suaves.
   - Sombras difusas e discretas (`feDropShadow dx="0" dy="6" stdDeviation="7" flood-opacity="0.24"`), criando volume ótico sem peso skeuomórfico.
   - Friso de luz contínuo (`stroke-width="2.5"`, opacidade moderada) na curvatura superior para destaque tátil.

---

## 3. Paleta de Cores e Iluminação

| Tom | Hexadecimal | Uso no Tema |
| :--- | :--- | :--- |
| **Azul Espacial Profundo** | `#075985` → `#0284c7` | Placas base, molduras de janelas e pranchetas |
| **Ciano Cósmico Vibrante** | `#0284c7` → `#38bdf8` | Abas frontais, corpos de sacolas, lápis e realces |
| **Branco Lunar / Papel** | `#ffffff` → `#f8fafc` | Folhas de notas e documentos internos |
| **Preto Espacial Profundo** | `#060e1c` → `#0b172a` | Interior de telas de terminal |
| **Âmbar Solar** | `#f59e0b` | Borrachas de lápis e detalhes pontuais de foco |

---

## 4. Família Fundamental de Aplicativos

- 📂 **Gerenciador de Arquivos (`COSMIC Files`)**: Pasta clássica com aba traseira curva, corpo frontal arredondado (`rx="28"`), folha de documento interna e friso de luz superior.
- 📝 **Editor de Texto (`COSMIC Edit`)**: Bloco de notas com cantos arredondados, linhas suaves de texto e um lápis moderno estilizado cruzando na frente com sombra projetada.
- 💻 **Terminal (`COSMIC Term`)**: Janela flutuante moderna com cantos arredondados, chassi em titânio escuro, barra de janela integrada e prompt cósmico `❯ _` em ciano neon.
- 🛍️ **Loja de Aplicativos (`COSMIC Store`)**: Caixa/embalagem de software com cantos arredondados (`rx="28"`), múltiplos cartões de aplicativos (teal, púrpura cósmico e âmbar solar) emergindo no topo e seta central de instalação com berço luminoso.
- ⚙️ **Configurações / Definições (`COSMIC Settings`)**: Chassi frontal squircle (`rx="28"`) em titânio espacial com friso superior de luz, cavidade usinada e engrenagem de precisão mecânica com o toggle switch de sintonia do COSMIC no núcleo.

---

## 5. Diretrizes para Ícones Simbólicos (`16x16`)

1. **Pixel-Perfect & Limpo**:
   - Desenhados na grade de `16x16` (`viewBox="0 0 16 16"`).
   - Silhuetas nítidas e desobstruídas que espelham diretamente o objeto colorido.
2. **Integração Dinâmica de Cores**:
   - Uso de `fill="currentColor"` para reagir dinamicamente ao tema escuro/claro e à cor de destaque (*accent color*) do COSMIC.

---

## 6. Fluxo de Instalação e Teste Local

```bash
# 1. Instalar os ícones atualizados na pasta local (~/.local/share/icons/Cosmic-Custom/)
just install-user

# 2. Atualizar o cache de ícones do usuário
gtk-update-icon-cache -f -t ~/.local/share/icons/Cosmic-Custom/

# 3. Recarregar painel, dock, biblioteca de apps e launcher
killall cosmic-panel cosmic-app-library cosmic-launcher
```

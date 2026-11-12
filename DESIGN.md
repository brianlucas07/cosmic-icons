# Diretrizes de Design & Filosofia Visual (COSMIC Custom)

Este documento estabelece os princípios visuais, estruturais e técnicos do tema **COSMIC Custom**.

---

## 1. Visão Geral: Retro-Futurismo Industrial & Sofisticado

A identidade do tema combina a herança da computação clássica e do design industrial aeroespacial (estética *Braun/Dieter Rams*, estações de trabalho de ficção científica sóbria) com a modernidade, elegância e fluidez do **COSMIC Desktop**.

- **Alma Retro-Futurista**: Presente nas proporções modulares, na iluminação de contraste, nos displays profundos e nos cantos generosamente arredondados.
- **Clareza Funcional e Sobriedade**: Cada ícone comunica diretamente o que o aplicativo faz. Sem adereços literais excessivos, faixas ou elementos decorativos que causem poluição visual.
- **Acabamento Profissional**: Formas icônicas fortes, fáceis de reconhecer instantaneamente na dock e no lançador.

---

## 2. Princípios de Geometria & Proporção

1. **Cantos Bem Arredondados (*Gentle Squircles*)**:
   - Elementos principais adotam curvas suaves e contínuas (`rx="28"` na escala `256x256`).
   - Elementos internos (telas, folhas de documentos, bandejas) utilizam raios harmônicos entre `rx="14"` e `rx="20"`.
   - O arredondamento dialoga perfeitamente com as janelas, applets e a dock flutuante do COSMIC.
2. **Profundidade sem Excesso**:
   - Construção limpa em camadas com contraste luminoso natural e sombras suaves (`feDropShadow` difusa de baixa opacidade).
   - Sem skeuomorfismo pesado: a elegância vem da precisão vetorial e da escolha de materiais (vidro escuro, chassi acetinado, destaques neon).

---

## 3. Paleta de Cores e Iluminação

| Tom | Hexadecimal | Uso no Tema |
| :--- | :--- | :--- |
| **Azul Espacial Profundo** | `#082f49` → `#0284c7` | Chassis principais, pastas e estruturas de destaque |
| **Display / Abismo Cósmico** | `#060e1c` → `#0f172a` | Superfícies internas, telas de terminal e fundos de código |
| **Ciano Luminoso** | `#38bdf8` | Glifos principais, prompts, realces de luz e foco |
| **Âmbar Solar** | `#f59e0b` | Destaques sutis pontuais de ação ou sintaxe |
| **Superfície Suave** | `#ffffff` / `#f1f5f9` | Folhas internas de documento e cursores |

- **Friso Superior de Luz**: Um traço suave (`stroke-width="2"`, opacidade moderada) acompanha a curvatura superior dos chassis, conferindo acabamento polido.

---

## 4. Diretrizes para Ícones Simbólicos (`16x16`)

1. **Pureza Geométrica**:
   - Desenhados na grade de `16x16` (`viewBox="0 0 16 16"`).
   - Linhas essenciais e silhueta desobstruída para máxima nitidez em painéis, títulos e menus.
2. **Integração Dinâmica de Cores**:
   - Uso de `fill="currentColor"` para reagir dinamicamente ao tema escuro/claro e à cor de destaque (*accent color*) configurada no COSMIC.

---

## 5. Fluxo de Instalação e Teste Local

```bash
# 1. Instalar os ícones atualizados na pasta local (~/.local/share/icons/Cosmic-Custom/)
just install-user

# 2. Recarregar painel, dock, biblioteca de apps e launcher
killall cosmic-panel cosmic-app-library cosmic-launcher
```

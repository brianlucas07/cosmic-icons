# Diretrizes de Design & Filosofia Visual (COSMIC Custom)

Este documento estabelece os princípios visuais, estruturais e técnicos que guiam o redesenho dos ícones do tema **COSMIC Custom**.

---

## 1. Visão Geral: Retro-Futurismo Espacial Modernizado

A identidade visual deste tema une a herança histórica do design aeroespacial e da ficção científica dos anos 70 e 80 (*Apollo*, *2001: Uma Odisseia no Espaço*, interfaces de terminais e missões espaciais) com o acabamento limpo, fluido e contemporâneo do **COSMIC Desktop**.

- **Retrô**: Metáforas de cartuchos modulares de dados, faixas de identificação de missão (*mission stripes*) e visores ópticos.
- **Futurista e Moderno**: Vetorização precisa, ausência de texturas ruidosas, degradês suaves e iluminação focada.

---

## 2. Princípios de Geometria & Curvatura

1. **Cantos Bem Arredondados (*Friendly Curves / Squircles*)**:
   - Evitar cantos retos ou ângulos afiados em componentes estruturais.
   - Na escala principal de aplicativos (`256x256`), adotar raios generosos (ex.: `rx="28"` no corpo frontal, `rx="14"` a `16"` em cartuchos internos).
   - O arredondamento harmoniza com a dock flutuante, applets e janelas do COSMIC.
2. **Profundidade em Camadas (*Layered Depth*)**:
   - Construir o objeto em 3 planos: placa base de fundo, conteúdo/cartucho interno e painel frontal saliente.
   - Uso de sombras suaves (`feDropShadow dx="0" dy="6" stdDeviation="7" flood-opacity="0.25"`), mantendo a leveza do flat design moderno.

---

## 3. Paleta de Cores e Iluminação

| Elemento | Tons Hexadecimais | Propósito Semântico |
| :--- | :--- | :--- |
| **Espaço Profundo** | `#0f172a` → `#075985` | Bases estruturais e placas traseiras |
| **Ciano Cósmico** | `#0284c7` → `#38bdf8` | Corrente principal de energia, abas e destaques |
| **Âmbar Solar** | `#f59e0b` / `#fb923c` | Faixas de missão retrô e alertas técnicos |
| **Cartucho / Dados** | `#f8fafc` → `#e2e8f0` | Folhas e cartuchos ópticos internos |

- **Borda de Luz Superior**: Um traço sutil com `stroke-width="2"` e opacidade moderada no topo das abas arredondadas confere presença tridimensional sem pesar.

---

## 4. Elementos Visuais Característicos

1. **Decalques de Missão (*Mission Stripes*)**:
   - Faixas horizontais compactas com pontas arredondadas (`rx="2.5"`).
   - Dupla clássica: Âmbar solar sobre Ciano cósmico.
2. **Painel / Visor de Identificação**:
   - Cápsula translúcida escura com LED óptico de status (`#38bdf8`) e indicador de dados.

---

## 5. Diretrizes para Ícones Simbólicos (`16x16`)

1. **Pixel-Perfect**:
   - Desenhados estritamente na grade de `16x16` para evitar anti-aliasing borrado em barras e menus.
2. **Dinâmica de Cores**:
   - Usar `fill="currentColor"` para que o ícone responda automaticamente à cor de destaque (*accent color*) e ao modo claro/escuro do COSMIC.
3. **Harmonia com a Versão Colorida**:
   - Reproduzir a mesma silhueta arredondada (`rx="2.5"`).
   - Detalhes internos (LED e faixas de missão) feitos com realces em `#ffffff` e opacidades entre `0.5` e `0.8`.

---

## 6. Fluxo de Instalação e Teste Local

Para aplicar e inspecionar alterações ao vivo no Arch Linux com COSMIC:

```bash
# 1. Instala os ícones na pasta do usuário (~/.local/share/icons/Cosmic-Custom/)
just install-user

# 2. Recarrega o painel, dock, biblioteca de apps e launcher
killall cosmic-panel cosmic-app-library cosmic-launcher
```

# Research Paper Question Answering System (RAG)

A Retrieval-Augmented Generation (RAG) application that lets users upload research papers (PDF) and ask natural-language questions about their contents. The system retrieves the most relevant sections of the paper and generates answers grounded strictly in that content, along with source page citations.

## Problem Statement

Build a RAG application that allows users to upload research papers and ask questions about their contents. The system answers questions such as:

- What is the objective of the paper?
- What methodology was used?
- What datasets were used?
- What are the major findings?
- What are the limitations?

## Features

- **PDF Ingestion** — Upload and load any research paper PDF
- **Text Extraction** — Extracts raw text page-by-page
- **Chunking** — Splits text into overlapping chunks for better semantic search
- **Semantic Retrieval** — Finds the most relevant chunks using vector similarity (FAISS)
- **Context-Grounded Generation** — LLM answers only from retrieved context (no hallucination)
- **Source Citation** — Every answer cites the exact page(s) it came from
- **Auto Q&A** — Automatically answers 5 standard research questions on load
- **Interactive Mode** — Ask free-form follow-up questions in a loop

## Tech Stack

| Component | Tool |
|---|---|
| Orchestration | LangChain |
| PDF Loading | PyPDFLoader |
| Chunking | RecursiveCharacterTextSplitter |
| Embeddings | HuggingFace `sentence-transformers/all-MiniLM-L6-v2` |
| Vector Store | FAISS |
| LLM | `Qwen/Qwen2.5-0.5B-Instruct` (local, free, no API key) |

## Architecture
PDF Upload → Text Extraction → Chunking → Embedding
↓
FAISS Vector Store → Retriever (Top-K)
↓
User Question → Retrieve Chunks → Grounded Prompt
↓
LLM Generation → Answer + Source Citation


## Configuration

| Parameter | Value | Why |
|---|---|---|
| Chunk Size | 1000 chars | Keeps chunks semantically focused while preserving full paragraphs |
| Chunk Overlap | 200 chars (20%) | Prevents answer-bearing sentences from being split across chunk boundaries |
| Retrieval Depth (Top-K) | 4 | Balances completeness (multi-section answers) vs. noise (irrelevant chunks) |

## How to Run

1. Install dependencies:
```bash
   pip install -qU langchain langchain-community langchain-google-genai huggingface_hub langchain-text-splitters pypdf sentence-transformers faiss-cpu pandas numpy langchain-huggingface transformers accelerate
```
2. Run the notebook/script in Google Colab or Jupyter.
3. Upload your research paper PDF when prompted.
4. The system automatically answers 5 standard questions (Objective, Methodology, Datasets, Findings, Limitations).
5. Continue asking your own questions in the interactive prompt. Type `exit` to stop.

## Why RAG instead of asking an LLM directly?

An LLM has no knowledge of a document it hasn't seen and will either refuse to answer or hallucinate a plausible-sounding but false response. RAG retrieves the actual relevant passages from the uploaded paper and forces the model to answer only from that content, grounding every answer in verifiable, citable source text.

## Author

**Arumalla Pradeep Sri Mani Teja Reddy**
Reg No: 231FA23020
Branch: ACSE-DS
Subject: Generative AI (24AM812)
Faculty: Abdul Rahman

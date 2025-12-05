# Task classifications

###  Machine Learning Tasks by Input & Output

## Image as Input
- **Output: label** → Image classification (e.g., cat vs dog)
- **Output: bounding-box, label** → Object detection
- **Output: pixel mask** → Semantic segmentation
- **Output: instance mask** → Instance segmentation
- **Output: keypoints** → Pose estimation
- **Output: caption (text)** → Image captioning
- **Output: embedding vector** → Image feature extraction
- **Output: another image** → Image-to-image translation (e.g., style transfer)
- **Output: depth map** → Monocular depth estimation
- **Output: 3D mesh/point cloud** → 3D reconstruction
- **Output: anomaly score** → Anomaly detection in images
- **Output: ranking** → Image retrieval / similarity search
- **Output: Image** → Image Super-resolution / Denoising
- **Output: 6-DOF pose** → Camera/Object Localization
- **Output: 3D bounding box** → 3D Object Detection from 2D Image

---

## Text as Input
- **Output: label** → Sentiment analysis, topic classification
- **Output: sequence of labels** → Named entity recognition (NER), POS tagging
- **Output: summary** → Text summarization
- **Output: translation** → Machine translation
- **Output: next word/sequence** → Language modeling, text generation
- **Output: question answer** → Question answering
- **Output: logical form / structured data** → Semantic parsing
- **Output: embedding vector** → Text representation learning
- **Output: similarity score** → Text similarity / entailment
- **Output: dialogue response** → Conversational AI / chatbots
- **Output: keywords** → Keyword extraction
- **Output: sentiment score** → Opinion mining
- **Output: anomaly score** → Spam detection, fake news detection
- **Output: structure/schema** → Information Extraction
- **Output: set of documents** → Document Retrieval
- **Output: fact triple** → Knowledge Graph Completion

---

##  Audio as Input
- **Output: text** → Speech recognition (ASR)
- **Output: label** → Audio classification (e.g., gunshot vs siren)
- **Output: speaker ID** → Speaker recognition
- **Output: emotion label** → Speech emotion recognition
- **Output: phoneme sequence** → Phoneme recognition
- **Output: embedding vector** → Audio representation learning
- **Output: another audio** → Speech synthesis (TTS), voice conversion
- **Output: event timestamps** → Sound event detection
- **Output: anomaly score** → Fault detection in machinery sounds

---

##  Video as Input
- **Output: label** → Action recognition
- **Output: bounding-box, label, time** → Spatio-temporal object detection
- **Output: caption (text)** → Video captioning
- **Output: summary (shortened video)** → Video summarization
- **Output: anomaly score** → Surveillance anomaly detection
- **Output: 3D skeleton** → Human motion capture
- **Output: embedding vector** → Video representation learning
- **Output: next frame** → Video prediction

---

## Tabular / Structured Data as Input
- **Output: label** → Classification (e.g., churn prediction)
- **Output: numeric value** → Regression (e.g., house price prediction)
- **Output: cluster ID** → Clustering
- **Output: anomaly score** → Fraud detection, anomaly detection
- **Output: ranking** → Recommendation systems
- **Output: probability distribution** → Probabilistic forecasting
- **Output: policy/action** → Reinforcement learning (decision-making)
- **Output: structure (e.g., graph)** → Graph Generation / Link Prediction
- **Output: synthetic data** → Data Synthesis (using Generative Models like GANs/VAEs)

---

## Generative Noise / Latent vector as Input

- **Output: New Data Instance** → Image/Music/text generation 

---

## Time Series as Input (Sequential Data)
- **Output: numeric value (for a future point)** → Time Series Forecasting (e.g., stock price, demand)
- **Output: sequence of numeric values (for future points)** → Multi-step Time Series Forecasting
- **Output: label** → Time Series Classification (e.g., distinguishing ECG patterns, classifying equipment failure type)
- **Output: anomaly score** → Time Series Anomaly Detection (e.g., detecting server outages, machine faults)
- **Output: pattern/rule** → Time Series Rule Discovery / Motif Finding (identifying recurring shapes)
- **Output: segmentation points** → Time Series Segmentation / Change Point Detection
- **Output: another time series** → Time Series Generation / Imputation (filling in missing data)
- **Output: embedding vector** → Time Series Representation Learning

--- 

## Multimodal Inputs
- **Image + Text → Text** → Visual question answering (VQA)
- **Image + Text → Label** → Multimodal sentiment analysis
- **Text + Audio → Label** → Emotion recognition
- **Image + Audio → Text** → Audio-visual speech recognition
- **Image + Text → Image** → Text-guided image generation (e.g., DALL·E)
- **Video + Text → Text** → Video question answering
- **Text + Tabular → Label** → Hybrid fraud detection

---

## Reinforcement Learning (RL)
- **Input: state (image, text, tabular, etc.)**
- **Output: action/policy**
- **Tasks:**
  - Game playing (e.g., Go, Chess, Atari)
  - Robotics control
  - Autonomous driving
  - Resource allocation
  - Recommendation optimization

---

### Clustering 
- **Input: Data Instance (Any Type)**
- **Output: Cluster ID / Latent Grouping**
- **Tasks**:
-  - K-Means / DBSCAN Clustering
-  - Dimensionality Reduction (e.g., PCA, t-SNE)
-  - Feature Learning (learning meaningful features without supervision)

## Similarity Tasks
These focus on learning a distance function.
- **Input: Two Data Instances**
- **Output: Similarity Score / Distance**
- **Tasks:**
- - One-Shot/Few-Shot Learning (e.g., Omniglot)
- - Face Verification (determining if two faces are the same)
- - Siamese Network Training

---
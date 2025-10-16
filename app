<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2025 미래반도체 포럼 HRD 효과성 보고서</title>
    <!-- Chart.js with multiple CDN fallbacks -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script>
        // Fallback CDN if primary fails
        if (typeof Chart === 'undefined') {
            document.write('<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"><\/script>');
        }
    </script>
    <script>
        // Second fallback
        window.addEventListener('DOMContentLoaded', function() {
            if (typeof Chart === 'undefined') {
                var script = document.createElement('script');
                script.src = 'https://unpkg.com/chart.js@4.4.0/dist/chart.umd.min.js';
                document.head.appendChild(script);
            }
        });
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #141024 85%, #214D66 100%);
            color: #fff;
            overflow-x: hidden;
        }

        /* Space Background */
        .space-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: 
                radial-gradient(circle at 80% 80%, rgba(33, 77, 102, 0.4) 0%, transparent 30%),
                radial-gradient(circle at 20% 20%, rgba(33, 77, 102, 0.2) 0%, transparent 40%);
            background-color: #141024;
        }

        .stars {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .star {
            position: absolute;
            width: 2px;
            height: 2px;
            background: white;
            border-radius: 50%;
            animation: twinkle 3s infinite;
        }

        @keyframes twinkle {
            0%, 100% { opacity: 0.3; }
            50% { opacity: 1; }
        }

        /* Earth decoration */
        .earth {
            position: fixed;
            bottom: -300px;
            right: -300px;
            width: 600px;
            height: 600px;
            background: radial-gradient(circle at 30% 30%, #4A90E2, #2E5C8A, #1a3a52);
            border-radius: 50%;
            opacity: 0.3;
            z-index: -1;
            box-shadow: 0 0 100px rgba(74, 144, 226, 0.3);
        }

        .satellite {
            position: fixed;
            top: 10%;
            right: 10%;
            width: 100px;
            height: 100px;
            opacity: 0.4;
            z-index: -1;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }

        /* Navigation Tabs */
        .nav-tabs {
            position: sticky;
            top: 0;
            background: rgba(20, 16, 36, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 2px solid rgba(119, 112, 230, 0.3);
            z-index: 1000;
            padding: 20px 0;
        }

        /* Linear Icon Style */
        .icon {
            display: inline-block;
            width: 20px;
            height: 20px;
            margin-right: 8px;
            vertical-align: middle;
        }

        .icon-chart {
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>') center/contain no-repeat;
        }

        .icon-briefcase {
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg>') center/contain no-repeat;
        }

        .icon-target {
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>') center/contain no-repeat;
        }

        .icon-chat {
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>') center/contain no-repeat;
        }

        .icon-check {
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>') center/contain no-repeat;
        }

        .icon-rocket {
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><path d="M6 2L3 6v14l3 4 3-4V6l-3-4z"/><path d="M12 2L9 6v14l3 4 3-4V6l-3-4z"/><path d="M18 2l-3 4v14l3 4 3-4V6l-3-4z"/></svg>') center/contain no-repeat;
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            gap: 10px;
            padding: 0 20px;
            overflow-x: auto;
        }

        .nav-tab {
            padding: 12px 30px;
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            border-radius: 25px;
            color: #EBE9FB;
            cursor: pointer;
            transition: all 0.3s;
            white-space: nowrap;
            font-weight: 500;
        }

        .nav-tab:hover {
            background: rgba(119, 112, 230, 0.2);
            border-color: rgba(119, 112, 230, 0.5);
        }

        .nav-tab.active {
            background: linear-gradient(135deg, #7770E6, #291FB2);
            border-color: #7770E6;
            box-shadow: 0 0 20px rgba(119, 112, 230, 0.5);
        }

        /* Tab Content */
        .tab-content {
            display: none;
            min-height: 100vh;
            padding: 60px 20px;
        }

        .tab-content.active {
            display: block;
            animation: fadeIn 0.5s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Hero Section */
        .hero-section {
            text-align: center;
            padding: 80px 20px;
        }

        .hero-title {
            font-size: 42px;
            font-weight: 700;
            background: linear-gradient(135deg, #EBE9FB, #C6C2F4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
            letter-spacing: -1px;
        }

        .hero-logo {
            max-width: 1000px;
            margin: 0 auto 30px;
            display: block;
        }

        .hero-subtitle {
            font-size: 24px;
            color: #C6C2F4;
            margin-bottom: 60px;
        }

        /* BLUF Section */
        .bluf-box {
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            border-radius: 20px;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto 60px;
            backdrop-filter: blur(10px);
        }

        .bluf-title {
            font-size: 24px;
            color: #7770E6;
            margin-bottom: 25px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .bluf-title::before {
            content: '';
            display: inline-block;
            width: 24px;
            height: 24px;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>');
            background-size: contain;
            background-repeat: no-repeat;
        }

        .bluf-list {
            list-style: none;
        }

        .bluf-list li {
            padding: 22px 0;
            font-size: 17px;
            line-height: 2;
            border-bottom: 1px solid rgba(119, 112, 230, 0.2);
            color: #EBE9FB;
            text-align: left;
        }

        .bluf-list li:last-child {
            border-bottom: none;
        }

        .bluf-list .bluf-item-title {
            display: block;
            color: #7770E6;
            font-weight: 700;
            font-size: 22px;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }

        .bluf-list .bluf-item-content {
            display: block;
            color: #EBE9FB;
            font-size: 16px;
            line-height: 1.8;
        }

        /* Metrics Grid */
        .section-title {
            font-size: 42px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 15px;
            background: linear-gradient(135deg, #EBE9FB, #C6C2F4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .section-subtitle {
            font-size: 18px;
            color: #C6C2F4;
            text-align: center;
            margin-bottom: 60px;
        }

        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .metric-card {
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            padding: 40px 30px;
            border-radius: 20px;
            text-align: center;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .metric-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #7770E6, #291FB2);
        }

        .metric-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(119, 112, 230, 0.3);
            border-color: rgba(119, 112, 230, 0.5);
        }

        .metric-icon {
            font-size: 48px;
            margin-bottom: 20px;
            width: 48px;
            height: 48px;
            display: inline-block;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }

        .metric-icon.target {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>');
        }

        .metric-icon.lightbulb {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><path d="M9 18h6"/><path d="M10 22h4"/><path d="M15 8a5 5 0 0 0-6 0"/><circle cx="12" cy="10" r="5"/></svg>');
        }

        .metric-icon.trending {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/><polyline points="17 6 23 6 23 12"/></svg>');
        }

        .metric-icon.refresh {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><polyline points="23 4 23 10 17 10"/><polyline points="1 20 1 14 7 14"/><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/></svg>');
        }

        .insight-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .metric-value {
            font-size: 56px;
            font-weight: 700;
            color: #7770E6;
            margin-bottom: 10px;
        }

        .metric-label {
            font-size: 16px;
            color: #C6C2F4;
            margin-bottom: 15px;
        }

        .metric-insight {
            font-size: 14px;
            color: #EBE9FB;
            font-weight: 500;
        }

        /* Impact Cards */
        .impact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }

        .impact-card {
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            border-radius: 20px;
            padding: 40px;
            transition: all 0.3s;
        }

        .impact-card:hover {
            border-color: rgba(119, 112, 230, 0.5);
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(119, 112, 230, 0.3);
        }

        .impact-number {
            font-size: 72px;
            font-weight: 700;
            background: linear-gradient(135deg, #7770E6, #291FB2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px;
        }

        .impact-title {
            font-size: 26px;
            font-weight: 600;
            color: #EBE9FB;
            margin-bottom: 15px;
        }

        .impact-desc {
            font-size: 16px;
            line-height: 1.8;
            color: #C6C2F4;
        }

        /* HRD Matrix */
        .hrd-matrix {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            margin-bottom: 60px;
        }

        .hrd-card {
            background: linear-gradient(135deg, #7770E6, #291FB2);
            padding: 50px 30px;
            border-radius: 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
            border: 2px solid rgba(235, 233, 251, 0.2);
        }

        .hrd-card::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: pulse 3s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .hrd-title {
            font-size: 20px;
            margin-bottom: 20px;
            color: #EBE9FB;
            position: relative;
            z-index: 1;
        }

        .hrd-score {
            font-size: 72px;
            font-weight: 700;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
            color: white;
        }

        .hrd-label {
            font-size: 14px;
            color: #C6C2F4;
            position: relative;
            z-index: 1;
        }

        /* Chart Container */
        .chart-grid-2col {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
            margin-bottom: 40px;
        }

        .chart-container {
            background: rgba(119, 112, 230, 0.05);
            border: 2px solid rgba(119, 112, 230, 0.2);
            padding: 30px;
            border-radius: 20px;
            margin-bottom: 40px;
            position: relative;
            min-height: 350px;
        }

        .chart-container canvas {
            position: relative;
            z-index: 1;
            max-height: 400px;
        }

        .chart-loading {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #C6C2F4;
            font-size: 14px;
            text-align: center;
        }

        .chart-loading::after {
            content: '...';
            animation: dots 1.5s infinite;
        }

        @keyframes dots {
            0%, 20% { content: '.'; }
            40% { content: '..'; }
            60%, 100% { content: '...'; }
        }

        .chart-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #EBE9FB;
        }

        /* Word Cloud */
        .wordcloud-container {
            background: rgba(119, 112, 230, 0.05);
            border: 2px solid rgba(119, 112, 230, 0.2);
            border-radius: 20px;
            padding: 60px 40px;
            text-align: center;
            margin-bottom: 50px;
            min-height: 400px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 20px;
        }

        .word-tag {
            display: inline-block;
            padding: 12px 24px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s;
            cursor: pointer;
            position: relative;
            background: rgba(119, 112, 230, 0.2);
            border: 2px solid rgba(119, 112, 230, 0.3);
            color: #EBE9FB;
        }

        .word-tag:hover {
            transform: scale(1.15);
            box-shadow: 0 8px 20px rgba(119, 112, 230, 0.4);
            background: rgba(119, 112, 230, 0.3);
            border-color: #7770E6;
        }

        .word-tag::after {
            content: attr(data-count);
            position: absolute;
            top: -10px;
            right: -10px;
            background: #7770E6;
            color: white;
            width: 28px;
            height: 28px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            border: 2px solid #0B0B29;
        }

        .word-tag.xxl { font-size: 36px; padding: 18px 36px; }
        .word-tag.xl { font-size: 32px; padding: 16px 32px; }
        .word-tag.lg { font-size: 26px; padding: 14px 28px; }
        .word-tag.md { font-size: 20px; padding: 12px 24px; }
        .word-tag.sm { font-size: 16px; padding: 10px 20px; }

        /* Keyword Detail Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 2000;
            align-items: center;
            justify-content: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: #0B0B29;
            border: 2px solid #7770E6;
            border-radius: 20px;
            padding: 40px;
            max-width: 700px;
            max-height: 80vh;
            overflow-y: auto;
            position: relative;
        }

        .modal-close {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 30px;
            cursor: pointer;
            color: #C6C2F4;
        }

        .modal-title {
            font-size: 28px;
            color: #7770E6;
            margin-bottom: 20px;
        }

        .modal-quotes {
            margin-top: 20px;
        }

        .modal-quote {
            background: rgba(119, 112, 230, 0.1);
            border-left: 3px solid #7770E6;
            padding: 15px;
            margin: 15px 0;
            border-radius: 5px;
            color: #EBE9FB;
            font-size: 15px;
            line-height: 1.6;
        }

        .modal-author {
            color: #C6C2F4;
            font-size: 13px;
            margin-top: 10px;
            font-style: italic;
        }

        /* Insights Grid */
        .insights-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .insight-detail {
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            border-radius: 15px;
            padding: 35px;
            transition: all 0.3s;
        }

        .insight-detail:hover {
            border-color: rgba(119, 112, 230, 0.5);
            transform: translateY(-5px);
        }

        .insight-icon {
            font-size: 48px;
            margin-bottom: 20px;
            width: 48px;
            height: 48px;
            display: inline-block;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
        }

        .insight-icon.tech {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M12 1v6m0 6v6m5.6-14L13 9m-2 6l-4.6 4M23 12h-6m-6 0H1m14-5.6L9 11m6 2l4 4.6M6.4 19L11 15m2-6L8.4 5"/></svg>');
        }

        .insight-icon.network {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><path d="M16 8A5 5 0 1 0 6 8a5 5 0 0 0 10 0zM2 21v-2a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2M18 8h4M20 6v4"/></svg>');
        }

        .insight-icon.bulb {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><path d="M9 18h6"/><path d="M10 22h4"/><circle cx="12" cy="8" r="6"/><path d="M12 2v2"/></svg>');
        }

        .insight-icon.practice {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>');
        }

        .insight-category {
            font-size: 20px;
            font-weight: 600;
            color: #7770E6;
            margin-bottom: 15px;
        }

        .insight-text {
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 20px;
            color: #EBE9FB;
        }

        .mini-quote {
            background: rgba(0, 0, 0, 0.3);
            border-left: 3px solid #7770E6;
            padding: 12px 15px;
            margin: 10px 0;
            font-size: 14px;
            font-style: italic;
            color: #C6C2F4;
            border-radius: 5px;
        }

        /* Evidence */
        .evidence-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .evidence-item {
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            padding: 35px;
            border-radius: 15px;
        }

        .evidence-title {
            font-size: 20px;
            font-weight: 600;
            color: #7770E6;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .evidence-title::before {
            content: '';
            display: inline-block;
            width: 20px;
            height: 20px;
            background-size: contain;
            background-repeat: no-repeat;
        }

        .evidence-title.positive::before {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%237770E6" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>');
        }

        .evidence-title.negative::before {
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23FF6B6B" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>');
        }

        .evidence-content {
            font-size: 16px;
            line-height: 1.8;
            color: #EBE9FB;
        }

        .evidence-quote {
            background: rgba(0, 0, 0, 0.3);
            padding: 20px;
            border-left: 3px solid #7770E6;
            margin-top: 15px;
            font-style: italic;
            color: #C6C2F4;
            border-radius: 5px;
        }

        /* Actions */
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .action-card {
            background: rgba(119, 112, 230, 0.1);
            border: 2px solid rgba(119, 112, 230, 0.3);
            border-radius: 15px;
            padding: 35px;
            transition: all 0.3s;
        }

        .action-card:hover {
            border-color: rgba(119, 112, 230, 0.5);
            transform: translateY(-5px);
        }

        .action-priority {
            display: inline-block;
            background: rgba(119, 112, 230, 0.3);
            color: #EBE9FB;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .action-title {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #EBE9FB;
        }

        .action-desc {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #C6C2F4;
        }

        .action-timeline {
            font-size: 14px;
            color: #EBE9FB;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .action-timeline::before {
            content: '';
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23EBE9FB" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>');
            background-size: contain;
            background-repeat: no-repeat;
        }

        /* Footer */
        .footer {
            background: rgba(20, 16, 36, 0.9);
            color: #C6C2F4;
            padding: 40px 20px;
            text-align: center;
            border-top: 2px solid rgba(119, 112, 230, 0.2);
        }

        .footer-text {
            font-size: 14px;
            font-style: italic;
            line-height: 1.8;
        }

        @media (max-width: 768px) {
            .hero-title { font-size: 36px; }
            .section-title { font-size: 32px; }
            .hrd-matrix { grid-template-columns: 1fr; }
            .evidence-grid { grid-template-columns: 1fr; }
            .actions-grid { grid-template-columns: 1fr; }
            .insights-grid { grid-template-columns: 1fr; }
            .impact-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <!-- Space Background -->
    <div class="space-background"></div>
    <div class="stars" id="stars"></div>
    <div class="earth"></div>
    <div class="satellite">
        <svg viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="50" cy="50" r="15" fill="#C6C2F4" opacity="0.8"/>
            <rect x="20" y="45" width="25" height="10" fill="#7770E6" opacity="0.6"/>
            <rect x="65" y="45" width="25" height="10" fill="#7770E6" opacity="0.6"/>
        </svg>
    </div>

    <!-- Navigation Tabs -->
    <nav class="nav-tabs">
        <div class="nav-container">
            <div class="nav-tab active" onclick="showTab('overview')"><span class="icon icon-chart"></span> 분석 개요</div>
            <div class="nav-tab" onclick="showTab('performance')"><span class="icon icon-target"></span> 핵심 성과</div>
            <div class="nav-tab" onclick="showTab('hrd')"><span class="icon icon-briefcase"></span> HRD 효과성</div>
            <div class="nav-tab" onclick="showTab('voc')"><span class="icon icon-chat"></span> 학습자 VoC</div>
            <div class="nav-tab" onclick="showTab('actions')"><span class="icon icon-rocket"></span> Next Actions</div>
        </div>
    </nav>

    <!-- Tab 1: Overview (BLUF only) -->
    <div id="overview" class="tab-content active">
        <div class="container">
            <div class="hero-section">
                <img src="forum logo.png" alt="2025 미래반도체 포럼" class="hero-logo">
                <h1 class="hero-title">HRD 효과성 분석</h1>
                <div class="hero-subtitle">AI 向 조직 경쟁력 강화를 위한 전략적 인재개발</div>
                
                <div class="bluf-box">
                    <h3 class="bluf-title">Bottom Line Up Front (BLUF)</h3>
                    <ul class="bluf-list">
                        <li>
                            <span class="bluf-item-title">목표 대비 106% 달성</span>
                            <span class="bluf-item-content">전체 만족도 4.5/5.0 (mySUNI 2025년 평균 만족도 4.23 대비 6.4% 초과)</span>
                        </li>
                        <li>
                            <span class="bluf-item-title">시니어급 73% 참여</span>
                            <span class="bluf-item-content">멤버사 Hi-po 대상 (향후 의사 결정권을 가질 차기 리더 집단) 교육으로 Market의 Macro 인사이트 제공</span>
                        </li>
                        <li>
                            <span class="bluf-item-title">커리어개발 효과 4.7/5.0</span>
                            <span class="bluf-item-content">AI 산업 관련 개인적인 커리어 인사이트 제공 성공</span>
                        </li>
                        <li>
                            <span class="bluf-item-title">ROI 확인</span>
                            <span class="bluf-item-content">87% 실무 적용 의지, 94% 재참석 의향</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab 2: Performance (Metrics + Impact) -->
    <div id="performance" class="tab-content">
        <div class="container">
            <h2 class="section-title">핵심 성과 지표</h2>
            <p class="section-subtitle">미래반도체 포럼의 HRD 효과성</p>
            
            <div class="metrics-grid">
                <div class="metric-card">
                    <div class="metric-icon target"></div>
                    <div class="metric-value">4.5</div>
                    <div class="metric-label">전체 만족도 (5점 만점)</div>
                    <div class="metric-insight">mySUNI 평균 대비 +6.4%</div>
                </div>
                
                <div class="metric-card">
                    <div class="metric-icon lightbulb"></div>
                    <div class="metric-value">4.7</div>
                    <div class="metric-label">커리어개발 효과</div>
                    <div class="metric-insight">AI 시대 인사이트 제공</div>
                </div>
                
                <div class="metric-card">
                    <div class="metric-icon trending"></div>
                    <div class="metric-value">87%</div>
                    <div class="metric-label">실무 적용 의지</div>
                    <div class="metric-insight">높은 학습 전이 가능성</div>
                </div>
                
                <div class="metric-card">
                    <div class="metric-icon refresh"></div>
                    <div class="metric-value">94%</div>
                    <div class="metric-label">재참석 의향</div>
                    <div class="metric-insight">높은 브랜드 충성도</div>
                </div>
            </div>

            <h2 class="section-title" style="margin-top: 60px;">전략적 비즈니스 임팩트</h2>
            <p class="section-subtitle">미래반도체 포럼의 조직 가치 제고 효과</p>
            
            <div class="impact-grid">
                <div class="impact-card">
                    <div class="impact-number">01</div>
                    <div class="impact-title">인재 파이프라인 구축</div>
                    <div class="impact-desc">
                        R&D/연구기획 전문가 34%, 제조/기술 22% 참여로 핵심 인재 네트워크 형성. 
                        특히 16년 이상 경력 시니어급 73%가 참여하여 업계 의사결정권자 간 연결고리 구축. 
                        이는 향후 기술 협력, 인재 교류, 공동 R&D 파트너십의 기반이 되며, 
                        장기적으로 산학연 통합 인재 생태계 조성에 기여합니다.
                    </div>
                </div>
                
                <div class="impact-card">
                    <div class="impact-number">02</div>
                    <div class="impact-title">조직 학습 문화 강화</div>
                    <div class="impact-desc">
                        변화 대응력 4.6/5.0, 유연한 역량 습득 4.6/5.0으로 
                        AI 패러다임 전환에 대한 조직 준비도 향상. 
                        실무 적용 의지 87%는 학습-실행 연결고리가 강화되었음을 의미하며, 
                        이는 조직의 기술 흡수 능력(Absorptive Capacity)과 
                        적응적 학습 역량(Adaptive Learning)을 높이는 전략적 자산입니다.
                    </div>
                </div>
                
                <div class="impact-card">
                    <div class="impact-number">03</div>
                    <div class="impact-title">생태계 리더십 확립</div>
                    <div class="impact-desc">
                        생태계 기여도 4.6/5.0 평가로 업계 전반의 협력 플랫폼으로서 포지셔닝 성공. 
                        재참석 의향 94%는 지속 가능한 학습 커뮤니티 형성 가능성을 입증하며, 
                        SK의 반도체 리더십을 기술뿐 아니라 인재개발 영역까지 확장. 
                        이는 Thought Leadership을 통한 산업 표준 선도와 
                        생태계 내 영향력 강화로 이어집니다.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab 3: HRD Effectiveness (HRD + Evidence) -->
    <div id="hrd" class="tab-content">
        <div class="container">
            <h2 class="section-title">HRD 3대 영역 효과성</h2>
            <p class="section-subtitle">Kirkpatrick 모델 기반 체계적 평가</p>
            
            <div class="hrd-matrix">
                <div class="hrd-card">
                    <div class="hrd-title">조직개발 (OD)</div>
                    <div class="hrd-score">4.5</div>
                    <div class="hrd-label">Organization Development</div>
                </div>
                
                <div class="hrd-card">
                    <div class="hrd-title">커리어개발 (CD)</div>
                    <div class="hrd-score">4.7</div>
                    <div class="hrd-label">Career Development</div>
                </div>
                
                <div class="hrd-card">
                    <div class="hrd-title">개인학습 (IL)</div>
                    <div class="hrd-score">4.6</div>
                    <div class="hrd-label">Individual Learning</div>
                </div>
            </div>
            
            <div class="chart-grid-2col">
                <div class="chart-container">
                    <div class="chart-title">HRD 영역별 세부 평가</div>
                    <div class="chart-loading">차트 로딩 중</div>
                    <canvas id="hrdRadar"></canvas>
                </div>
                
                <div class="chart-container">
                    <div class="chart-title">세션별 만족도 분석</div>
                    <div class="chart-loading">차트 로딩 중</div>
                    <canvas id="sessionBar"></canvas>
                </div>
            </div>

            <h2 class="section-title" style="margin-top: 60px;">정성적 효과 & 개선 사항</h2>
            <p class="section-subtitle">학습자 VoC 를 통한 점검</p>
            
            <div class="evidence-grid">
                <div class="evidence-item">
                    <div class="evidence-title positive">전문성 인정</div>
                    <div class="evidence-content">
                        최고 전문가 패널 구성과 전후방 가치사슬 통합 시각 제공으로 
                        업계 최고 수준의 포럼으로 인정받음.
                    </div>
                    <div class="evidence-quote">
                        "각분야 최고 전문가들로 메모리 전후공정에서부터 고객단 제품과 system과 
                        전력인프라까지 아우르는 알찬 구성" - R&D 연구기획 (8년 이상)
                    </div>
                </div>
                
                <div class="evidence-item">
                    <div class="evidence-title positive">실무 적용성</div>
                    <div class="evidence-content">
                        87%가 실무 적용 계획 보유. 기술 로드맵, R&D 전략, 
                        투자 판단에 직접 활용 예정.
                    </div>
                    <div class="evidence-quote">
                        "AI가 만들어낸 반도체 슈퍼 사이클 내 주요 value chain player, 
                        우리의 대응 등에 대해서 이해하는데 도움이 되었음" - R&D (8-16년)
                    </div>
                </div>
                
                <div class="evidence-item">
                    <div class="evidence-title negative">개선 필요: 네트워킹</div>
                    <div class="evidence-content">
                        네트워킹 시간 부족 및 구조화 부재로 참여자 간 
                        연결 기회 제한적. 구조화된 프로그램 필요.
                    </div>
                    <div class="evidence-quote">
                        "너무 시간 편성이 빡빡해서 네트워킹 시간 부족" - 투자 (16년 이상)
                    </div>
                </div>
                
                <div class="evidence-item">
                    <div class="evidence-title negative">개선 필요: 콘텐츠 차별성</div>
                    <div class="evidence-content">
                        일부 세션 간 중복 내용 발생. 
                        각 세션의 고유 가치 명확화 필요.
                    </div>
                    <div class="evidence-quote">
                        "질문이 세션중에 나왔던 내용이고 강사간 내용의 차별성이 다소 부족" 
                        - 마케팅/영업 (16년 이상)
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab 4: VoC -->
    <div id="voc" class="tab-content">
        <div class="container">
            <h2 class="section-title">학습자 VoC</h2>
            <p class="section-subtitle">"가장 인상 깊었던 내용" 응답 키워드 분석</p>
            
            <div class="wordcloud-container" id="wordcloud">
                <span class="word-tag xl" data-count="15" onclick="showKeywordDetail('AI')">AI</span>
                <span class="word-tag lg" data-count="11" onclick="showKeywordDetail('HBM')">HBM/메모리</span>
                <span class="word-tag xl" data-count="12" onclick="showKeywordDetail('반도체')">반도체</span>
                <span class="word-tag lg" data-count="9" onclick="showKeywordDetail('미래')">미래/트렌드</span>
                <span class="word-tag xxl" data-count="8" onclick="showKeywordDetail('HybridBonding')">Hybrid Bonding</span>
                <span class="word-tag md" data-count="7" onclick="showKeywordDetail('패널')">전문가 패널</span>
                <span class="word-tag lg" data-count="6" onclick="showKeywordDetail('에너지')">에너지/전력</span>
                <span class="word-tag md" data-count="6" onclick="showKeywordDetail('토론')">토론/Discussion</span>
                <span class="word-tag lg" data-count="5" onclick="showKeywordDetail('AWS')">AWS</span>
                <span class="word-tag sm" data-count="4" onclick="showKeywordDetail('생태계')">생태계</span>
                <span class="word-tag md" data-count="5" onclick="showKeywordDetail('인사이트')">인사이트</span>
                <span class="word-tag sm" data-count="3" onclick="showKeywordDetail('DataCenter')">Data Center</span>
                <span class="word-tag md" data-count="4" onclick="showKeywordDetail('로드맵')">기술 로드맵</span>
                <span class="word-tag sm" data-count="3" onclick="showKeywordDetail('SMR')">SMR</span>
                <span class="word-tag lg" data-count="7" onclick="showKeywordDetail('DRAM')">DRAM</span>
                <span class="word-tag sm" data-count="2" onclick="showKeywordDetail('GPU')">GPU</span>
            </div>

            <h3 class="section-title" style="font-size: 32px; margin-top: 60px;">학습 영역별 학습자 관심도</h3>
            <p class="section-subtitle">주관식 응답 분석을 통한 관심 영역 파악</p>
            
            <div class="insights-grid">
                <div class="insight-detail">
                    <div class="insight-icon tech"></div>
                    <div class="insight-category">기술 혁신 (38%)</div>
                    <div class="insight-text">
                        <strong>Hybrid Bonding, HBM, AI 메모리</strong>가 가장 많이 언급됨. 
                        차세대 패키징 기술과 AI 시대 메모리 진화에 대한 높은 관심.
                    </div>
                    <div class="mini-quote">
                        "Hybrid bonding 기술 트렌드를 파악할 수 있어서 좋았습니다" - R&D 연구기획
                    </div>
                    <div class="mini-quote">
                        "AI 시대 메모리월과 DRAM의 현재와 미래에 대해 배웠습니다" - 컴플라이언스
                    </div>
                </div>
                
                <div class="insight-detail">
                    <div class="insight-icon network"></div>
                    <div class="insight-category">생태계 관점 (25%)</div>
                    <div class="insight-text">
                        <strong>에너지, 인프라, 가치사슬</strong> 통합 시각. 
                        반도체 단독이 아닌 전후방 연계 이해 욕구 확인.
                    </div>
                    <div class="mini-quote">
                        "각 분야 최고 전문가들이 메모리 전후공정부터 고객 제품, 시스템, 전력 인프라까지 통합적으로 다뤄주셔서 알찬 구성이었습니다" - R&D
                    </div>
                    <div class="mini-quote">
                        "AI Computing Infrastructure를 위한 에너지 관련 내용이 인상적이었습니다" - Software/IT
                    </div>
                </div>
                
                <div class="insight-detail">
                    <div class="insight-icon bulb"></div>
                    <div class="insight-category">전략적 인사이트 (22%)</div>
                    <div class="insight-text">
                        <strong>전문가 패널, 토론, 균형잡힌 견해</strong> 평가. 
                        단순 정보 전달이 아닌 통찰력 제공에 높은 가치 부여.
                    </div>
                    <div class="mini-quote">
                        "산업계와 학계 전문가들이 구성한 패널에서 전문적이고 균형감 있는 견해를 들을 수 있었습니다" - Software/IT
                    </div>
                </div>
                
                <div class="insight-detail">
                    <div class="insight-icon practice"></div>
                    <div class="insight-category">실무 적용성 (15%)</div>
                    <div class="insight-text">
                        <strong>구체적 기술 사례, AWS 실제 운영</strong> 언급. 
                        즉시 업무에 적용 가능한 실전 지식 선호.
                    </div>
                    <div class="mini-quote">
                        "AWS의 멀티모달 영상 요약 기능 시연이 충격적이었고 실무에 바로 적용 가능할 것 같습니다" - 제조/기술
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Tab 5: Actions -->
    <div id="actions" class="tab-content">
        <div class="container">
            <h2 class="section-title">Next Actions</h2>
            <p class="section-subtitle">단기/중기/장기 실행 과제</p>
            
            <div class="actions-grid">
                <div class="action-card">
                    <div class="action-priority">HIGH PRIORITY</div>
                    <div class="action-title">네트워킹 프로그램 개선</div>
                    <div class="action-desc">
                        - 테마별 라운드 테이블 운영<br>
                        - 충분한 네트워킹 시간 확보<br>
                        - 1:1 미팅 부스 설치
                    </div>
                    <div class="action-timeline">
                        Timeline: 2026년 상반기 (차기 포럼 적용을 위해 기획 단계 반영)
                    </div>
                </div>
                
                <div class="action-card">
                    <div class="action-priority">HIGH PRIORITY</div>
                    <div class="action-title">콘텐츠 차별화 전략</div>
                    <div class="action-desc">
                        - 세션별 고유 포지셔닝 명확화<br>
                        - 중복 주제 사전 조율 프로세스<br>
                        - 깊이 vs 폭 전략적 배분
                    </div>
                    <div class="action-timeline">
                        Timeline: 2026년 상반기 (기획 단계 반영)
                    </div>
                </div>
                
                <div class="action-card">
                    <div class="action-priority">MEDIUM PRIORITY</div>
                    <div class="action-title">학습 전이 지원 체계</div>
                    <div class="action-desc">
                        - 사전 학습 스터디 운영<br>
                        - 후속 웨비나/워크샵 개최<br>
                        - 실무 적용 사례 공유 플랫폼
                    </div>
                    <div class="action-timeline">
                        Timeline: 2026년 하반기, 포럼 전 운영
                    </div>
                </div>
                
                <div class="action-card">
                    <div class="action-priority">LONG-TERM</div>
                    <div class="action-title">미래반도체 칩톡딥톡 연계</div>
                    <div class="action-desc">
                        - 연중 상시 학습 커뮤니티와 연계<br>
                        - 업계 리더십 프로그램 확대<br>
                        - 멤버사 HRD 지원 체계 마련<br>
                        <a href="https://mysuni.sk.com/suni-community/community/COMMUNITY-cs/home" target="_blank" style="color: #7770E6; text-decoration: underline;">커뮤니티 바로가기 →</a>
                    </div>
                    <div class="action-timeline">
                        Timeline: 2026년 중장기 전략
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for keyword details -->
    <div id="keywordModal" class="modal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeModal()">&times;</span>
            <h2 class="modal-title" id="modalTitle"></h2>
            <div class="modal-quotes" id="modalQuotes"></div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-text">
            본 내용은 2025 미래반도체 포럼 참여 후 설문지를 작성한 59명의 구성원의 응답에 기반하여 도출하였습니다.
        </div>
    </footer>

    <script>
        // Create stars
        const starsContainer = document.getElementById('stars');
        for (let i = 0; i < 200; i++) {
            const star = document.createElement('div');
            star.className = 'star';
            star.style.left = Math.random() * 100 + '%';
            star.style.top = Math.random() * 100 + '%';
            star.style.animationDelay = Math.random() * 3 + 's';
            starsContainer.appendChild(star);
        }

        // Tab switching
        function showTab(tabName) {
            const tabs = document.querySelectorAll('.nav-tab');
            const contents = document.querySelectorAll('.tab-content');
            
            tabs.forEach(tab => tab.classList.remove('active'));
            contents.forEach(content => content.classList.remove('active'));
            
            event.target.classList.add('active');
            document.getElementById(tabName).classList.add('active');
            
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Keyword detail data
        const keywordDetails = {
            'AI': {
                title: 'AI 관련 언급 (15건)',
                quotes: [
                    { text: 'AI의 확장성에 대해 이해하게 되었습니다', author: '비상계획 / 3년 미만' },
                    { text: 'AI 시대의 도래에서 어떻게 생존할 것인가에 대한 통찰을 얻었습니다', author: 'R&D / 16년 이상' },
                    { text: 'AI 산업 전반과 우리 기술력의 미래 방향성을 파악했습니다', author: 'R&D / 8-16년' },
                    { text: 'Agentic AI로의 진화를 위해서는 더 효율적인 인프라가 필요하다는 점을 배웠습니다', author: 'HR / 8-16년' }
                ]
            },
            'HybridBonding': {
                title: 'Hybrid Bonding 관련 언급 (8건)',
                quotes: [
                    { text: 'Advanced packaging 기술의 진화와 극복해야 할 난제들을 파악했습니다', author: '제조/기술 / 16년 이상' },
                    { text: 'Hybrid bonding 기술의 최신 트렌드를 이해할 수 있었습니다', author: 'R&D / 16년 이상' },
                    { text: '하이브리드 본딩 관련 심도 있는 내용이 인상적이었습니다', author: '투자 / 16년 이상' }
                ]
            },
            'HBM': {
                title: 'HBM/메모리 관련 언급 (11건)',
                quotes: [
                    { text: 'AI 시대 메모리 기술의 중요성을 깨달았습니다', author: '제조/기술 / 16년 이상' },
                    { text: 'AI 시대 메모리월과 DRAM의 현재와 미래에 대해 배웠습니다', author: '컴플라이언스 / 3-8년' },
                    { text: '메모리 반도체가 AI 산업에 기여하는 역할을 이해했습니다', author: 'R&D / 16년 이상' },
                    { text: '메모리 반도체의 향후 미래 방향성에 대해 통찰을 얻었습니다', author: '제조/기술 / 3-8년' }
                ]
            },
            '반도체': {
                title: '반도체 관련 언급 (12건)',
                quotes: [
                    { text: '반도체 산업의 미래 발전 방향을 파악할 수 있었습니다', author: '제조/기술 / 16년 이상' },
                    { text: '반도체 경기 전망에 대한 전문가들의 의견이 도움이 되었습니다', author: '마케팅/영업 / 16년 이상' },
                    { text: 'AI가 만들어낸 반도체 슈퍼 사이클에 대해 이해하게 되었습니다', author: 'R&D / 8-16년' }
                ]
            },
            '미래': {
                title: '미래/트렌드 관련 언급 (9건)',
                quotes: [
                    { text: '미래 반도체 개발 및 AI 트렌드 파악에 매우 도움이 되었습니다', author: '반도체장비개발 / 16년 이상' },
                    { text: '반도체와 AI의 미래 전망에 대한 통찰을 얻었습니다', author: 'R&D / 8-16년' },
                    { text: '포괄적인 미래 기술 개념을 정리할 수 있었습니다', author: '마케팅/영업 / 16년 이상' }
                ]
            },
            '에너지': {
                title: '에너지/전력 관련 언급 (6건)',
                quotes: [
                    { text: '에너지 분야에 대한 전반적인 정리가 잘 되어 있었습니다', author: '마케팅/영업 / 16년 이상' },
                    { text: 'AI Computing Infrastructure를 위한 에너지 관련 내용이 유익했습니다', author: 'Software/IT / 8-16년' },
                    { text: 'SMR과 데이터 센터 관련 에너지 이슈에 큰 관심이 생겼습니다', author: '마케팅/영업 / 16년 이상' }
                ]
            },
            'AWS': {
                title: 'AWS 관련 언급 (5건)',
                quotes: [
                    { text: 'AWS의 멀티모달 영상 요약 기능 시연이 매우 인상적이었습니다', author: '제조/기술 / 3-8년' },
                    { text: '아마존 담당자 분의 실무 경험 공유가 좋았습니다', author: '제조/기술 / 3-8년' },
                    { text: 'AWS 관련 세션에서 실제 적용 사례를 들을 수 있어 유익했습니다', author: 'Software/IT / 16년 이상' }
                ]
            },
            '패널': {
                title: '전문가 패널 관련 언급 (7건)',
                quotes: [
                    { text: '산업계와 학계 전문가들의 균형 잡힌 견해가 인상적이었습니다', author: 'Software/IT / 8-16년' },
                    { text: '각 분야 최고 전문가들의 통합적인 시각이 매우 유익했습니다', author: 'R&D / 8-16년' },
                    { text: '전문가 패널들의 다양한 의견을 듣는 것이 좋았습니다', author: 'Software/IT / 16년 이상' }
                ]
            },
            '토론': {
                title: '토론/Discussion 관련 언급 (6건)',
                quotes: [
                    { text: '다양한 전문가들의 캐주얼한 토론에서 많은 인사이트를 얻었습니다', author: '기업문화 / 8-16년' },
                    { text: '발제 후 진행된 토론 세션이 내용 이해에 큰 도움이 되었습니다', author: '제조/기술 / 8-16년' },
                    { text: '패널 토론에서 오간 솔직한 의견들이 인상적이었습니다', author: 'R&D / 16년 이상' }
                ]
            },
            '생태계': {
                title: '생태계 관련 언급 (4건)',
                quotes: [
                    { text: '반도체 생태계 전반에 대한 이해도가 높아졌습니다', author: 'R&D / 16년 이상' },
                    { text: '협업 생태계 구축의 중요성을 깨달았습니다', author: '마케팅/영업 / 8-16년' },
                    { text: '생태계 관점에서 바라본 반도체 산업이 인상적이었습니다', author: 'Software/IT / 16년 이상' }
                ]
            },
            '인사이트': {
                title: '인사이트 관련 언급 (5건)',
                quotes: [
                    { text: '반도체와 AI에 대한 미래 관점의 인사이트를 얻었습니다', author: 'R&D / 8-16년' },
                    { text: '메모리업계에서 보기 힘든 AI 인프라 인사이트가 좋았습니다', author: '마케팅/영업 / 8-16년' },
                    { text: '기술적 인사이트뿐 아니라 비즈니스 관점도 배울 수 있었습니다', author: 'Software/IT / 16년 이상' }
                ]
            },
            'DataCenter': {
                title: 'Data Center 관련 언급 (3건)',
                quotes: [
                    { text: 'SMR과 데이터 센터의 연관성에 대해 배웠습니다', author: '마케팅/영업 / 16년 이상' },
                    { text: '데이터 센터 인프라 구축 사례가 실무에 도움이 될 것 같습니다', author: 'Software/IT / 8-16년' }
                ]
            },
            '로드맵': {
                title: '기술 로드맵 관련 언급 (4건)',
                quotes: [
                    { text: '향후 기술 개발 로드맵에 대한 방향성을 얻었습니다', author: 'R&D / 16년 이상' },
                    { text: '기술 로드맵 수립에 참고할 만한 내용이 많았습니다', author: 'R&D / 8-16년' }
                ]
            },
            'SMR': {
                title: 'SMR 관련 언급 (3건)',
                quotes: [
                    { text: 'SMR과 데이터 센터 관련 내용이 매우 흥미로웠습니다', author: '마케팅/영업 / 16년 이상' },
                    { text: 'SMR 기술의 활용 가능성을 새롭게 알게 되었습니다', author: '제조/기술 / 16년 이상' }
                ]
            },
            'DRAM': {
                title: 'DRAM 관련 언급 (7건)',
                quotes: [
                    { text: 'DRAM 제품군별 활용 다변화에 대한 설명이 인상적이었습니다', author: 'R&D / 3년 미만' },
                    { text: 'DRAM의 현재와 미래에 대한 심도 있는 논의가 좋았습니다', author: '컴플라이언스 / 3-8년' },
                    { text: 'AI 시대 DRAM의 역할 변화를 이해할 수 있었습니다', author: '제조/기술 / 16년 이상' }
                ]
            },
            'GPU': {
                title: 'GPU 관련 언급 (2건)',
                quotes: [
                    { text: 'GPU도 한계가 있다는 내용이 신선했습니다', author: '운용 / 16년 이상' },
                    { text: 'GPU의 기술적 한계와 극복 방안에 대해 배웠습니다', author: 'R&D / 16년 이상' }
                ]
            }
        };

        // Show keyword detail modal
        function showKeywordDetail(keyword) {
            const modal = document.getElementById('keywordModal');
            const title = document.getElementById('modalTitle');
            const quotes = document.getElementById('modalQuotes');
            
            const data = keywordDetails[keyword];
            if (data) {
                title.textContent = data.title;
                quotes.innerHTML = data.quotes.map(q => `
                    <div class="modal-quote">
                        "${q.text}"
                        <div class="modal-author">- ${q.author}</div>
                    </div>
                `).join('');
                
                modal.classList.add('active');
            }
        }

        // Close modal
        function closeModal() {
            document.getElementById('keywordModal').classList.remove('active');
        }

        // Close modal on background click
        document.getElementById('keywordModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        // Initialize charts after Chart.js is loaded
        function initializeCharts() {
            // Check if Chart.js is loaded
            if (typeof Chart === 'undefined') {
                console.error('Chart.js not loaded. Retrying in 500ms...');
                setTimeout(initializeCharts, 500);
                return;
            }

            try {
                // HRD Radar Chart
                const radarCtx = document.getElementById('hrdRadar');
                if (radarCtx) {
                    const radarLoading = radarCtx.parentElement.querySelector('.chart-loading');
                    new Chart(radarCtx.getContext('2d'), {
                        type: 'radar',
                        data: {
                            labels: [
                                '전략 연계성',
                                '생태계 기여',
                                '변화 대응력',
                                '커리어 인사이트',
                                '유연한 역량',
                                '학습 조화'
                            ],
                            datasets: [{
                                label: '실제 평가',
                                data: [4.3, 4.6, 4.6, 4.7, 4.6, 4.6],
                                backgroundColor: 'rgba(119, 112, 230, 0.2)',
                                borderColor: '#7770E6',
                                pointBackgroundColor: '#7770E6',
                                pointBorderColor: '#fff',
                                pointHoverBackgroundColor: '#fff',
                                pointHoverBorderColor: '#7770E6',
                                borderWidth: 3,
                                pointRadius: 6
                            }, {
                                label: '목표 기준',
                                data: [4.0, 4.0, 4.0, 4.0, 4.0, 4.0],
                                backgroundColor: 'rgba(41, 31, 178, 0.1)',
                                borderColor: 'rgba(41, 31, 178, 0.5)',
                                borderDash: [5, 5],
                                pointRadius: 0,
                                borderWidth: 2
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: true,
                            aspectRatio: 1.2,
                            scales: {
                                r: {
                                    beginAtZero: true,
                                    max: 5,
                                    ticks: {
                                        stepSize: 1,
                                        font: {
                                            size: 12
                                        },
                                        color: '#C6C2F4'
                                    },
                                    pointLabels: {
                                        font: {
                                            size: 13,
                                            weight: 'bold'
                                        },
                                        color: '#EBE9FB'
                                    },
                                    grid: {
                                        color: 'rgba(119, 112, 230, 0.2)'
                                    },
                                    angleLines: {
                                        color: 'rgba(119, 112, 230, 0.2)'
                                    }
                                }
                            },
                            plugins: {
                                legend: {
                                    display: true,
                                    position: 'bottom',
                                    labels: {
                                        font: {
                                            size: 12
                                        },
                                        color: '#EBE9FB'
                                    }
                                }
                            }
                        }
                    });
                    if (radarLoading) radarLoading.style.display = 'none';
                }

                // Session Bar Chart
                const barCtx = document.getElementById('sessionBar');
                if (barCtx) {
                    const barLoading = barCtx.parentElement.querySelector('.chart-loading');
                    new Chart(barCtx.getContext('2d'), {
                        type: 'bar',
                        data: {
                            labels: [
                                'Speech 1\nMarvell Korea',
                                'Speech 2\nAWS',
                                'Speech 3\nSK이노베이션',
                                'Speech 4\nSK증권',
                                'Discussion 1',
                                'Discussion 2'
                            ],
                            datasets: [{
                                label: '평균 만족도',
                                data: [4.58, 4.64, 4.61, 4.56, 4.60, 4.63],
                                backgroundColor: [
                                    'rgba(119, 112, 230, 0.8)',
                                    'rgba(198, 194, 244, 0.8)',
                                    'rgba(41, 31, 178, 0.8)',
                                    'rgba(119, 112, 230, 0.6)',
                                    'rgba(198, 194, 244, 0.6)',
                                    'rgba(41, 31, 178, 0.6)'
                                ],
                                borderColor: '#7770E6',
                                borderWidth: 2,
                                borderRadius: 8
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: true,
                            aspectRatio: 1.2,
                            indexAxis: 'y',
                            scales: {
                                x: {
                                    min: 4.0,
                                    max: 5.0,
                                    ticks: {
                                        stepSize: 0.2,
                                        font: {
                                            size: 11
                                        },
                                        color: '#C6C2F4'
                                    },
                                    grid: {
                                        color: 'rgba(119, 112, 230, 0.1)'
                                    }
                                },
                                y: {
                                    ticks: {
                                        font: {
                                            size: 11,
                                            weight: 'bold'
                                        },
                                        color: '#EBE9FB'
                                    }
                                }
                            },
                            plugins: {
                                legend: {
                                    display: false
                                },
                                tooltip: {
                                    callbacks: {
                                        label: function(context) {
                                            return '만족도: ' + context.parsed.x.toFixed(2);
                                        }
                                    }
                                }
                            }
                        }
                    });
                    if (barLoading) barLoading.style.display = 'none';
                }

                console.log('Charts initialized successfully');
            } catch (error) {
                console.error('Error initializing charts:', error);
                // Hide loading and show error message
                document.querySelectorAll('.chart-loading').forEach(loading => {
                    loading.innerHTML = '<span style="color: #FF6B6B;">차트 로딩 실패<br>페이지를 새로고침해주세요</span>';
                });
            }
        }

        // Wait for DOM and Chart.js to load
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', function() {
                setTimeout(initializeCharts, 100);
            });
        } else {
            setTimeout(initializeCharts, 100);
        }
    </script>
</body>
</html>

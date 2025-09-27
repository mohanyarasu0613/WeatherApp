<!DOCTYPE html>
<html>
<head>
    <title>Weather Application</title>
    <style>
        /* ---------- Variables ---------- */
        :root{
          --bg-1: #0f172a;
          --bg-2: #0b3a5b;
          --card: rgba(255,255,255,0.06);
          --accent: #61dafb;
          --muted: rgba(255,255,255,0.75);
          --glass: rgba(255,255,255,0.04);
          --radius: 14px;
          --shadow: 0 8px 28px rgba(2,6,23,0.6);
          --glass-border: rgba(255,255,255,0.06);
          --max-width: 720px;
          --gap: 14px;
          --transition: 200ms cubic-bezier(.2,.9,.3,1);
          font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
        }

        /* ---------- Page background & layout ---------- */
        * { box-sizing: border-box; }
        html,body {
          height: 100%;
          margin: 0;
          background: linear-gradient(135deg, var(--bg-1) 0%, var(--bg-2) 100%);
          -webkit-font-smoothing:antialiased;
          -moz-osx-font-smoothing:grayscale;
          color: white;
          font-size: 16px;
          line-height: 1.45;
        }

        body {
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 48px 20px;
        }

        .weather-card {
          width: 100%;
          max-width: var(--max-width);
          background: linear-gradient(180deg, rgba(255,255,255,0.03), rgba(255,255,255,0.02));
          border-radius: var(--radius);
          box-shadow: var(--shadow);
          border: 1px solid var(--glass-border);
          padding: 28px;
          backdrop-filter: blur(6px) saturate(120%);
          -webkit-backdrop-filter: blur(6px) saturate(120%);
        }

        h1 {
          text-align: center;
          margin-bottom: 24px;
          font-size: 32px;
          color: var(--accent);
        }

        form {
          display: flex;
          gap: var(--gap);
          align-items: center;
          margin-top: 8px;
          flex-wrap: wrap;
          justify-content: center;
        }

        input[type="text"]{
          flex: 1 1 320px;
          min-width: 180px;
          padding: 12px 14px;
          border-radius: 10px;
          border: 1px solid rgba(255,255,255,0.06);
          background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
          color: white;
          outline: none;
          box-shadow: inset 0 -1px 0 rgba(0,0,0,0.25);
          transition: box-shadow var(--transition), transform var(--transition), border-color var(--transition);
          font-size: 15px;
        }

        input::placeholder { color: rgba(255,255,255,0.45); }

        input:focus{
          border-color: rgba(97,218,251,0.9);
          box-shadow: 0 6px 18px rgba(3,8,20,0.45), 0 0 0 6px rgba(97,218,251,0.06);
          transform: translateY(-1px);
        }

        button[type="submit"]{
          padding: 10px 18px;
          border-radius: 10px;
          border: none;
          background: linear-gradient(90deg, rgba(97,218,251,0.14), rgba(97,218,251,0.12));
          color: white;
          font-weight: 600;
          cursor: pointer;
          min-width: 120px;
          transition: transform var(--transition), box-shadow var(--transition), opacity var(--transition);
          box-shadow: 0 6px 18px rgba(5,50,70,0.35);
          backdrop-filter: blur(4px);
        }

        button[type="submit"]:hover{
          transform: translateY(-3px);
          box-shadow: 0 14px 30px rgba(5,50,70,0.45);
          opacity: 0.98;
        }
        button[type="submit"]:active{
          transform: translateY(-1px) scale(0.997);
        }

        @media (max-width: 520px){
          input[type="text"] { flex-basis: 100%; }
          form { flex-direction: column; align-items: stretch; }
        }
    </style>
</head>
<body>
    <div class="weather-card">
        <h1>Weather Application</h1>

        <form action="/current" method="get">
            <input type="text" id="city" name="city" placeholder="Enter city..." />
            <button type="submit">Get Weather</button>
        </form>
    </div>
</body>
</html>

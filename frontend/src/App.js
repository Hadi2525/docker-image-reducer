import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    fetch('/api/hello')
      .then(response => response.json())
      .then(data => setMessage(data.message))
      .catch(error => console.error('Error:', error));
  }, []);

  return (
    <div style={{ textAlign: 'center', padding: '50px' }}>
      <h1>Welcome to the React + FastAPI App</h1>
      <p>Message from backend: {message}</p>
    </div>
  );
}

export default App;
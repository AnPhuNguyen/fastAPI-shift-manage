function parseJwt(token) {
    var base64Url = token.split('.')[1];
    var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));
    return JSON.parse(jsonPayload);
};

document.addEventListener('DOMContentLoaded', async () => {
    // Redirect to login page if not logged in
    if (!localStorage.getItem('access_token')) {
        window.location.href = '/';
    }

    // Logout button clears token and redirects to login
    const logoutBtn = document.getElementById('logoutBtn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            localStorage.removeItem('access_token');
            window.location.href = '/';
        });
    }

    const decoded = parseJwt(localStorage.getItem('access_token'));
    const infoHolder = document.getElementById('userInfo');
    const username = decoded.user_name;
    const password = decoded.password;
    try {
        // console.log("\ndang gui request get\n")
        const response = await fetch('/me', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ user_name: username, password: password })
        });
        // console.log('\n de xem co ket qua:\n')
        if (!response.ok){
            // console.log("\nrequest NOT ok\n")
            infoHolder.textContent = "chưa lấy thông tin người dùng được..."
        }
        else{
            // console.log("\nrequest ok\n")
            const info = await response.json()
            infoHolder.textContent=`
                ${info.memberID}  |  ${info.ten}  |  ${info.vi_tri}
            `
        }

    } catch (error) {
        console.error('Error:', error);
        infoHolder.textContent = "chưa lấy thông tin người dùng được..."
    }

    const accessRight = decoded.access_right;
    const chatBtn = document.getElementById('chatBtn');
    if (chatBtn) {
        if (accessRight === 'admin') {
            chatBtn.addEventListener('click', () => {
                window.location.href = '/admin/chatroom';
            });
        }
        else if (accessRight === "staff"){
            chatBtn.addEventListener('click', () => {
                window.location.href = '/staff/chatroom';
            });
        }

    }
});

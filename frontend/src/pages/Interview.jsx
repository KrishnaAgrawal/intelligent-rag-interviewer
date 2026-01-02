import React, { useState } from "react";
import { WebcamLogin } from "../components/WebcamLogin";
import { ChatBox } from "../components/ChatBox";


export default function Interview() {
    const [auth, setAuth] = useState(false);
    return auth ? <ChatBox /> : <WebcamLogin onSuccess={() => setAuth(true)} />;
}
// components/SpotInfoChat.js

import Script from 'next/script';

const SpotInfoChat = () => {
  return (
    <>
      {/* 
        This Script component from Next.js will load the chat widget script.
        - `src`: Path to the script in the `public` folder.
        - `strategy="beforeInteractive"`: Ensures the script loads before the page becomes interactive,
          so the custom <spotinfo-chat> element is defined when React tries to render it.
      */}
      <Script 
        src="https://www.spotinfo.ai/js/widget.umd.js"
        strategy="beforeInteractive" 
      />


      {/* 
        This is your custom element. React can render custom elements.
        - Note that attributes with hyphens (like primary-color) are perfectly valid in JSX.
        - We pass all the properties exactly as you specified.
      */}
      <spotinfo-chat
        primary-color="#000aaa"
        width="400px"
        height="550px"
        message-font-size="12px"
        api-key="siak9oxzzfsh7kkk8rqj"
      ></spotinfo-chat>
    </>
  );
};

export default SpotInfoChat;
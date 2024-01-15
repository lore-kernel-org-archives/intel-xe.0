Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB226C3DA79
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jan 2024 07:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B5410E204;
	Mon, 15 Jan 2024 07:09:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7110E210;
 Mon, 15 Jan 2024 07:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705302538; x=1736838538;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Vl2A+p+f7Ngkc1O4wFcFt4QOH8THeA/5XhtkWvP3Gu8=;
 b=LYAiqJ4t39llgT7bhjT6v7Di3RMx4CbdyytcGBqsBhPTcGTHX6rfLLa+
 QrBx1AijbPanxRrYREUmGN1HB421TEnI9TPobigVX3p6icosV/B7NVgYS
 Pv0Q/Xmw3OlCfybXkqExWKDKCGT9K8AulcI/LIunPpTbGPTElKxjXcDHN
 xbkYyMysXoHUEumgQ3c398PkE2iTkMeUzJRDFapg5khMumFOUC6KPPCm5
 SUHZE60oB3cntPbCkA3aa0nNiqNYgH506LX1VNblhpgYD4FEEe6kRapA7
 QZn/qQR/4APK60ZggerN5ubcgYCK0JMCu3TO/xsdfixpjEWVs5sbRHOCJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="389998575"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
 d="scan'208,217";a="389998575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208,217";a="18066904"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2024 23:08:58 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.33.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 79E97580D94;
 Sun, 14 Jan 2024 23:08:57 -0800 (PST)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rPI1f-004gBv-0v;
 Mon, 15 Jan 2024 08:08:55 +0100
Content-Type: multipart/alternative;
 boundary="------------gaIuI3Vx5iBBPb12CDUDuDOK"
Message-ID: <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
Date: Mon, 15 Jan 2024 08:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------gaIuI3Vx5iBBPb12CDUDuDOK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/24 15:29, Lucas De Marchi wrote:
>> On such case, you should document kunit_debugfs at Documentation/ABI.
>
> debugfs is not part of ABI.

That's arguable. Check Documentation/ABI and you'll see several debugfs 
nodes documented there.

$ ./scripts/get_abi.pl rest|grep debugfs|wc -l
162

Regards,
Mauro


--------------gaIuI3Vx5iBBPb12CDUDuDOK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/12/24 15:29, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h">
      <blockquote type="cite" style="color: #007cff;">On such case, you
        should document kunit_debugfs at Documentation/ABI.
        <br>
      </blockquote>
      <br>
      debugfs is not part of ABI. <br>
    </blockquote>
    <p>That's arguable. Check Documentation/ABI and you'll see several
      debugfs nodes documented there.</p>
    <p>$ ./scripts/get_abi.pl rest|grep debugfs|wc -l<br>
      162<br>
      <br>
    </p>
    <p>Regards,<br>
      Mauro<br>
    </p>
    <br>
  </body>
</html>

--------------gaIuI3Vx5iBBPb12CDUDuDOK--

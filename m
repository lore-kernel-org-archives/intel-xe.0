Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505FAFD8FD7
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396510E99B;
	Thu, 26 Feb 2026 16:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="YrPNh/1M";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43C210E99B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772124126;
 bh=8ZGvrf+bQND9Wsk+fejOgdf8bV2VY9vO++Xkj9ZQ5+g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YrPNh/1Mym6m/4ndJCtdQThCUqvsHIujZ6Vx44ZXFyRQ2OeJGOc/loN0FGGqbZqaa
 S43qftupnNKR71+TxW9teXHFfAspoRA8mWi3cOCImuSJ3ODF9xeTGkfZIEzncNQWRZ
 dYgfeyQNAu3nVCO31Qxl1Lkd15Z/1DrzmnttZOXlHXc397GQDv5nS576/b/TuQKQSq
 FLiWlD0djOwQSaN9hBtk8Kr+dbxDbWURJ/Z03UE0++zl3P/Anqy3mN/lkmdRl0S7we
 5ySRoIxeXKzFEyZHJnE72zvbj0D75nRu5cbJdxgyIAFjk+q8LMdl/voBEqkdNiP7Kf
 wSceNovz13U3Q==
Content-Type: multipart/alternative;
 boundary="------------T4IzMhrwCFUaWTK8VLN60xfU"
Message-ID: <38ac79bb-0d22-4f3f-b80b-9763aeb227eb@lankhorst.se>
Date: Thu, 26 Feb 2026 17:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <20260224102618.3105171-7-raag.jadav@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20260224102618.3105171-7-raag.jadav@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------T4IzMhrwCFUaWTK8VLN60xfU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey,

Den 2026-02-24 kl. 11:25, skrev Raag Jadav:
> With all the pieces in place, we can finally introduce PCIe FLR handling
> which reloads hardware state without the need for reloading the driver
> from userspace. Memory contents are also wiped along with hardware state,
> so user still needs to recreate buffers and reload context after FLR.
>
This probably needs some more help to support display.
I tried using only FLR to tear down the driver during shutdown,
but that ran into some issues unfortunately and was reverted.

Kind regards,
~Maarten Lankhorst
--------------T4IzMhrwCFUaWTK8VLN60xfU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Hey,</font><br>
    <br>
    <div class="moz-cite-prefix">Den 2026-02-24 kl. 11:25, skrev Raag
      Jadav:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20260224102618.3105171-7-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">With all the pieces in place, we can finally introduce PCIe FLR handling
which reloads hardware state without the need for reloading the driver
from userspace. Memory contents are also wiped along with hardware state,
so user still needs to recreate buffers and reload context after FLR.

</pre>
    </blockquote>
    This probably needs some more help to support display.<br>
    I tried using only FLR to tear down the driver during shutdown,<br>
    but that ran into some issues unfortunately and was reverted.<br>
    <br>
    Kind regards,<br>
    ~Maarten Lankhorst
  </body>
</html>

--------------T4IzMhrwCFUaWTK8VLN60xfU--

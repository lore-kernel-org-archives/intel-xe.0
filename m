Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE99CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 09:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C51510E057;
	Thu,  1 Oct 2026 09:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpVCmtXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A4A10E057
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790848247; x=1822384247;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to;
 bh=9P2oSVKPX/omzIqyyjKhe9IosYcB7cjGivikuJ0J3y0=;
 b=kpVCmtXOwgu0UkFvmMpOe57XHoKs/gwG/dc/oSmoxODiQdSibzujcm/D
 DKSjCHKP5CoNWKRq+y550/W80L07zLh7tq5DEICIh1WzTaWV5YtuVOXnk
 ipL90si+W6eHhCiWz1yu/4DMM68yS0+iBzqzbZYhDQPSFNbp5+Fxjb1eI
 P2GePX/vwa+cyHnbyvNf21BMlZzgqpVlL2FJzcBPY9K3+1ywPOt+NYBid
 UDCRu7GYsvpwOvAgk5lLz4xd8wU2z5PB7lTy3/Vv/MxZq3/OE6MZui3w0
 aeV3FmE+72Rht4hHzouL0cZcHyt4QfbSd5KcaK1v8O2lAyK7kPWZVxMip A==;
X-CSE-ConnectionGUID: 9CRQd0HITl6LCtjZaprasw==
X-CSE-MsgGUID: 23Nb7BeQRTqJV98qmmIpwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101759821"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="101759821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:50:46 -0700
X-CSE-ConnectionGUID: 0zHr5su3Qqin0+Pd9n/qPg==
X-CSE-MsgGUID: Q9a9CH8pQn690lfo2uw/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="303887387"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.66.117.203])
 ([10.66.117.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:50:44 -0700
Content-Type: multipart/alternative;
 boundary="------------lt2TyqtK9LnmMs9J5pJig8o1"
Message-ID: <66523a3f-4515-4655-a368-5be7c1ab4a22@Intel.com>
Date: Thu, 1 Oct 2026 15:20:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Subject: Re: [PATCH v4 04/12] drm/xe/mmio: Report BAR mapping errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
Organization: intel
In-Reply-To: <20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com>
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
--------------lt2TyqtK9LnmMs9J5pJig8o1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace xe_err() calls with xe_log_err() and xe_log_err_fatal() using

nit: hmm, Remove xe_log_err macro, we used only xe_log_err_fatal right?

Sure thanks Mallesh,

Dnyaneshwar,

> the REGS component tag for MMIO BAR probe failures
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7fa18dfcb5a2..890146b8836b 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,6 +15,7 @@
>   #include "regs/xe_bars.h"
>   #include "xe_device.h"
>   #include "xe_gt_sriov_vf.h"
> +#include "xe_log.h"
>   #include "xe_printk.h"
>   #include "xe_sriov.h"
>   #include "xe_tile_printk.h"
> @@ -71,8 +72,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   		return 0;
>   
>   	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
> -		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
> -		       xe->info.tile_count, xe->mmio.size);
> +		xe_log_err_fatal(xe, REGS, -EIO, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
> +				 xe->info.tile_count, xe->mmio.size);
>   		return -EIO;
>   	}
>   
> @@ -105,13 +106,16 @@ int xe_mmio_probe_early(struct xe_device *xe)
>   
>   	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>   	if (!xe->mmio.regs) {
> -		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
> +		xe_log_err_fatal(xe, REGS, -EIO,
> +				 "Failed to map GTTMMADR_BAR\n");
>   		return -EIO;
>   	}
>   
>   	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>   	if (xe->mmio.size < SZ_16M) {
> -		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
> +		xe_log_err_fatal(xe, REGS, -EIO,
> +				 "GTTMMADR_BAR is too small: %zu\n",
> +				 xe->mmio.size);
>   		return -EIO;
>   	}
>   
--------------lt2TyqtK9LnmMs9J5pJig8o1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-09-2026 02:51 pm, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace xe_err() calls with xe_log_err() and xe_log_err_fatal() using</pre>
    </blockquote>
    <p> nit: hmm, Remove <span style="white-space: pre-wrap">xe_log_err macro, we used only </span><span
      style="white-space: pre-wrap">xe_log_err_fatal</span> right?</p>
    <p>Sure thanks Mallesh, </p>
    <p>Dnyaneshwar,</p>
    <blockquote type="cite"
      cite="mid:20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">the REGS component tag for MMIO BAR probe failures

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E"
      href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E"
      href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20260928092114.1610203-5-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7fa18dfcb5a2..890146b8836b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,6 +15,7 @@
 #include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_log.h"
 #include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_tile_printk.h"
@@ -71,8 +72,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 		return 0;
 
 	if (xe-&gt;mmio.size &lt; xe-&gt;info.tile_count * tile_mmio_size) {
-		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
-		       xe-&gt;info.tile_count, xe-&gt;mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
+				 xe-&gt;info.tile_count, xe-&gt;mmio.size);
 		return -EIO;
 	}
 
@@ -105,13 +106,16 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	xe-&gt;mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe-&gt;mmio.regs) {
-		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
 	xe-&gt;mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	if (xe-&gt;mmio.size &lt; SZ_16M) {
-		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe-&gt;mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 "GTTMMADR_BAR is too small: %zu\n",
+				 xe-&gt;mmio.size);
 		return -EIO;
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------lt2TyqtK9LnmMs9J5pJig8o1--

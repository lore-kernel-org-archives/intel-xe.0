Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1802CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AF510E614;
	Mon, 22 Jun 2026 15:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLvswOvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45010E614
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782142995; x=1813678995;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MEYecZV/WZeIqHKilsyvKQ1Rrb5VuHp7hfqw0owraWg=;
 b=NLvswOvpZ2rXiOOdeKVegVpXN1cWD2yyOCCVtC2Zw2ftV7cF1Vhgv8q1
 nABi9YxzwHuZ3xsMTlFiRMsvVr9XbLcj+J/j6hQrhCRGnQ6UhErFzh3O/
 zu1qr6vULq1LPOihEthr8QlSCC1fwri8WSdwev1yFYdXmkPyxTDUhBwOz
 I2LA5Cs9wbTxruxGyqHUl/csbMwhD7td3xJ0Gw3CxDwMQOBOD2xKaFCy3
 2slDprH0dRrKKDcAVJnDSuipxVqvi1GepoXYjmWt3sUidF1G17Wi3xT2R
 YAWJUURQbxf7C01xDdYtuNQYCigXia53DVmD94VW4mVxuIuv50noGCdu9 w==;
X-CSE-ConnectionGUID: /yFTfh8RQeitAN2/Vzo7Iw==
X-CSE-MsgGUID: nZG5qoNHTiKXBUBBxxq3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="70393005"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="70393005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:43:15 -0700
X-CSE-ConnectionGUID: yysU0HvHR9qsiNH7q2Gi0w==
X-CSE-MsgGUID: 608Awy+YRJS+rpASq/ujLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="246335730"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:43:14 -0700
Message-ID: <d7ea96de-ed98-4447-90c8-cd4d878a9d14@intel.com>
Date: Mon, 22 Jun 2026 16:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
 <20260622132342.19600-3-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622132342.19600-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22/06/2026 14:23, Michal Wajdeczko wrote:
> This will allow us to simplify our custom release action where we
> will keep only zeroing of the xe->mmio.regs as we still rely on it
> all checks during all xe_mmio operations. While around, add missing
> kernel-doc for the function and update the error message.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
> v2: keep fini action to zero xe->mmio.regs (Matthew)
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7e0cefcd16bd..fce890b6410c 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -16,6 +16,7 @@
>   #include "regs/xe_bars.h"
>   #include "xe_device.h"
>   #include "xe_gt_sriov_vf.h"
> +#include "xe_printk.h"
>   #include "xe_sriov.h"
>   #include "xe_tile_printk.h"
>   #include "xe_trace.h"
> @@ -80,27 +81,30 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   static void mmio_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>   
> -	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>   	xe->mmio.regs = NULL;
> -	root_tile->mmio.regs = NULL;
>   }
>   
> +/**
> + * xe_mmio_probe_early() - Probe and initialize device's MMIO
> + * @xe: the &xe_device
> + *
> + * Map the entire GTTMMADR_BAR and initialize the first tile's MMIO instance.
> + *
> + * The first 16MB of the GTTMMADR_BAR always belongs to the root tile, and
> + * includes: registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
>   int xe_mmio_probe_early(struct xe_device *xe)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> -	/*
> -	 * Map the entire BAR.
> -	 * The first 16MB of the BAR, belong to the root tile, and include:
> -	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
> -	 */
>   	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
> -	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
> +	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>   	if (!xe->mmio.regs) {
> -		drm_err(&xe->drm, "failed to map registers\n");
> +		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
>   		return -EIO;
>   	}
>   


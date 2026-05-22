Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC60CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE16810E215;
	Fri, 22 May 2026 14:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd5A+0gF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE1910E215
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779461884; x=1810997884;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=u2Dm/R1V1RyI+mEDwD1eXhzCfEanimOIlB21jTmBUq0=;
 b=gd5A+0gF9kRqSzu6GmKodWPPrJUW1QmrZAK2NQBHo3d12neb/+WhLawV
 00WRl7hK64B8VmucV72psWG+bw7YfiWqCzsTLEzkS6ENeJmPPGlQOTj/L
 rzrdWKUi9UyugOFz4b18Dg2K5mgpbJ1o1eVP2PWM1uWOgFgjn3SoYPqSB
 MkBZ1g6CpBUm2op1x1aIHc+03PqY5dcfowtqMJBzlf6QMxoNwyby4mJmm
 W+jZB1uENDKJ/C4DnE71LI++ZH1Bks+3paIJArmN8Zc9M4j7cH2aoA0r6
 +SIaJ9VXZjIvC1Rp9U8X7q9t8yM//PD/IvVCKZBfF4oz3mXDkXEBZsz0w g==;
X-CSE-ConnectionGUID: THk0csTcST+ioqARGpmxcQ==
X-CSE-MsgGUID: y7ed6AO2TKaXwGlWXcQJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84010890"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84010890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:58:04 -0700
X-CSE-ConnectionGUID: x40BtGCrQiKpHHL+818IeQ==
X-CSE-MsgGUID: Nn8abspxRiGh4bnhinLKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="236498738"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:58:03 -0700
Message-ID: <3c622ff9-565b-4b99-ada5-23306d4733e1@intel.com>
Date: Fri, 22 May 2026 15:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-2-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260522143112.10643-2-michal.wajdeczko@intel.com>
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

On 22/05/2026 15:31, Michal Wajdeczko wrote:
> This will allow us to drop our custom release action. Note that
> pointer zeroing is not required, as there should be no active
> code running during a driver unwind. While around, add missing
> kernel-doc for the function and update error message.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 33 +++++++++++++++------------------
>   1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 78adb303b663..f4086b9ae38f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -16,6 +16,7 @@
>   #include "regs/xe_bars.h"
>   #include "xe_device.h"
>   #include "xe_gt_sriov_vf.h"
> +#include "xe_printk.h"
>   #include "xe_sriov.h"
>   #include "xe_trace.h"
>   #include "xe_wa.h"
> @@ -76,37 +77,33 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>   }
>   
> -static void mmio_fini(void *arg)
> -{
> -	struct xe_device *xe = arg;
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -
> -	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> -	xe->mmio.regs = NULL;
> -	root_tile->mmio.regs = NULL;

This was intentional, since on pci unplug this get nuked, but driver 
instance is still alive. So, by setting to NULL, we can more easily 
catch misbehaving code, still trying to touch the hw post unplug. Any 
chance we can keep the NULL part?

> -}
> -
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
>   	/* Setup first tile; other tiles (if present) will be setup later. */
>   	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>   
> -	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
> +	return 0;
>   }
>   ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
>   


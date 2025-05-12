Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF9C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 08:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD4310E30D;
	Mon, 12 May 2025 08:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lx2kX9rk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BFB10E15F
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747037906; x=1778573906;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RkbjEFxFUWBV5GoKfBxVUshqd7EN8rXMZz0bn2VIaVI=;
 b=lx2kX9rkPovuW6m8dh7vIja45o5+uRZw393HMxi5Gurp/GFjXfECoX7p
 TXdtfKrpGRKDSS4n+yjZFRFZXt5eCTsVgQBLzZlmOUdvzUG7F3TfyXs/R
 dgwNzSqp8LusIQcMLsN44DA4QelPUmEc4sOdoTcrq8EsFSDcHJqUxh9bv
 seV72r7egivLmmHNVZl4QwCTfZShPbp7eT/KXY3DEu1+oO/UqugpeEO4F
 G+swjnU881oRkPoqqQ954+bbajrfIQ3YAPsVt6oCugoCYm2nr1lITotSN
 +phTHGOGXbZp8iFoMZfiPtN2aMygvj4/5I5l53iMALyBuzibC93F2QyDw w==;
X-CSE-ConnectionGUID: CX1Wftr3Rsq8vB2XMtBUtQ==
X-CSE-MsgGUID: 73Hg8sMCTqKXEOLZnG/obA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48988815"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48988815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:18:26 -0700
X-CSE-ConnectionGUID: Zzj39XZ2QU2jzmUCOVoriA==
X-CSE-MsgGUID: q4Yjg3DpT+ugUpe80SiCBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137805348"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 12 May 2025 01:18:24 -0700
Received: from [10.245.96.179] (unknown [10.245.96.179])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8589533BDC;
 Mon, 12 May 2025 09:18:23 +0100 (IST)
Message-ID: <c2623b6a-f0fd-4db2-9ca1-cd3964641f55@intel.com>
Date: Mon, 12 May 2025 10:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Validate wedged_mode modparam input
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250424143043.937-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 24.04.2025 16:30, Lukasz Laguna wrote:
> Check correctness of the wedged_mode module parameter input. If the
> value is out of the expected range (>2), set the default (1) and log a
> debug message.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c      | 7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  drivers/gpu/drm/xe/xe_module.c      | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..d2de6936cc20 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,7 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	if (xe_modparam.wedged_mode > 2) {
> +		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");

maybe: "wedged_mode: ignoring invalid value (%u), using default (%u)"

> +		xe->wedged.mode = 1; /* default */
> +	} else {
> +		xe->wedged.mode = xe_modparam.wedged_mode;
> +	}

and instead of magic 1 and 2 and default please add proper definitions
near struct xe_modparam in xe_module.h

>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 859a3ba91be5..a471cf55ad8d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1856,7 +1856,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	if (xe->wedged.mode == 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..b1b9bb2056ae 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -71,7 +71,7 @@ MODULE_PARM_DESC(max_vfs,
>  		 "(0 = no VFs [default]; N = allow up to N VFs)");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);

don't forget to change types in

	struct xe_device.wedged.mode
	struct xe_modparam.wedged_mode

>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>  

and likely this patch should be first in the series


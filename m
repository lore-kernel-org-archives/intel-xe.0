Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA2EC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 10:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE88510E1A9;
	Mon, 12 Aug 2024 10:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEKxl54o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023AA10E1A9
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723459272; x=1754995272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FWJWzVENJTGRTbVqdyOfrA65z5R9Ihx2W0Ixucm0rWA=;
 b=gEKxl54oOExyQpb5faBfufnZjMLKDVLrF2wx0bdF5D6jl4a8wQSF+M7c
 7GGJmOGaMEVeVfVt+XZTqRYNQt8fmLnLppvJN3nsLairXpT/7rtkugXtG
 Y2VNA6gz8yme7WTLxK/yZNojA7WJmeC2on4WDKqTLuRL4C3PpNh9leRfU
 DJXA/ygWN9KlJ1ayYdmNU8BQ7NAZ8fQWb1NkDwVnz4InWyd+Q3HoLQSp5
 QG+62SR6EorOiWBy5qjNKi3FFniWEpsBanhgOykAHzBPgYQJWbggaRtWN
 0/ZkJqHPH3o8v63AmWdQfDPOOKCgX+ugI6F+Xco8cj8Rgcazqzgp8Cloc g==;
X-CSE-ConnectionGUID: J0u7lmZRTFK0ny7KXWftPA==
X-CSE-MsgGUID: y2XZLfWNRi+zP4veCxwrYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32138827"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32138827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:41:10 -0700
X-CSE-ConnectionGUID: BFjFIBv/RXegSjfK7Qzy/Q==
X-CSE-MsgGUID: 35+hz8lBSpWotr6O54inVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62619937"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.46])
 ([10.245.244.46])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:41:09 -0700
Message-ID: <d1758683-cc9f-4a6f-96dd-6180e91133a8@intel.com>
Date: Mon, 12 Aug 2024 11:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: use devm instead of drmm for managed bo
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
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

On 10/08/2024 00:12, Daniele Ceraolo Spurio wrote:
> The BO cleanup touches the GGTT and therefore requires the HW to be
> available, so we need to use devm instead of drmm.

In the BO ggtt cleanup we have drm_dev_enter() to mark the critical 
sections that needs HW interaction vs the bits that just touch SW stuff, 
but looks like this only works once we have marked the device as 
unplugged. If something blows up during the probe, then the mmio stuff 
is still unmapped and set to NULL (mmio_fini or something IIRC), but the 
dev_enter() still sees the device as attached as part of the later drmm 
and we blow up.

It might make sense to tweak the driver to call the dev unplug() in the 
error unwind during the probe sequence, that way the drm_dev_enter() 
will catch this (I think). If we error out during probe, then device can 
be considered unplugged at the end. Or perhaps we should anyway make 
this change regardless of this patch?

My thinking with not converting xe_managed_* over to drmm was that we 
anyway have to deal with userspace objects existing after the HW is 
removed, and there we might also have to consider ggtt, like with 
display surfaces. Also the BO is largely just software state and can be 
tied to life cycle of the driver state, but I guess here this is 
internal and closely tied to the operation of the HW.

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

If calling unplug doesn't make sense, or is considered orthogonal and 
only makes sense for other drmm users:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3295bc92d7aa..45652d7e6fa6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>   	return bo;
>   }
>   
> -static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void *arg)
> +static void __xe_bo_unpin_map_no_vm(void *arg)
>   {
>   	xe_bo_unpin_map_no_vm(arg);
>   }
> @@ -1591,7 +1591,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>   	if (IS_ERR(bo))
>   		return bo;
>   
> -	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_unpin_map_no_vm, bo);
> +	ret = devm_add_action_or_reset(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> @@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> -	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
> +	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
>   	*src = bo;
>   
>   	return 0;

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02325C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB8D10E0CA;
	Mon, 13 May 2024 07:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsiIWidZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA4A10E0CA
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715584574; x=1747120574;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6iO4bIPOAIOZhR4fJJGSjOZBXP9I9JhGZpGvFti1MjM=;
 b=HsiIWidZ1fhQ4Gz1Nz4fh80Rkcwo/ikujVWqNBscUBVTSy6lZy4xQVOD
 j1+oqz8413Adk4iQJSLAK15+GuNi0iQUkGGFVRmNV0FgA7IqFUgPQBJ4y
 FENL8h1sCMhRibBiU1IE5UOt0oG5z5QBCSJ/Eb8cB/Rb36KfuWEATGNlM
 piR1z+wuIY3W83p9CkI1t8loObfdHsT9+S2mDqfAtxZUelwy1Vs+tQCYf
 W83NP3fimkvFFyN48e7BCs89CjM/cebLMw7Jl303jJQw0XL11l6p1UthE
 kxPhlyPZnRI9w+1PiZZbhTjF9SmonqHSGthE/AsmnD19HhFaclzHfzeMe w==;
X-CSE-ConnectionGUID: T9CAgE5STOG+MTqQ/c3xPw==
X-CSE-MsgGUID: Srx6e2ROQVGXMCirWf9wBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11721650"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11721650"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:16:14 -0700
X-CSE-ConnectionGUID: m7tGhmdVTZ6BkBH3LKEsKg==
X-CSE-MsgGUID: kOPf7CVyROWbltVzuXKI6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30092020"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:16:12 -0700
Message-ID: <9826728b-2549-4abe-b2a7-41562077e022@intel.com>
Date: Mon, 13 May 2024 09:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] drm/xe/ggtt: use drm_dev_enter to mark device
 section
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-27-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-27-matthew.auld@intel.com>
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

On 10.05.2024 20:12, Matthew Auld wrote:
> Device can be hotunplugged before we start destroying gem objects. In
> such a case don't touch the GGTT entries, trigger any invalidations or
> mess around with rpm.  This should already be taken care of when
> removing the device, we just need to take care of dealing with the
> software state, like removing the mm node.
> 
> v2: (Andrzej)
>    - Avoid some duplication by tracking the bound status and checking
>      that instead.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0d541f55b4fc..17e5066763db 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -8,6 +8,7 @@
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/sizes.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   #include <drm/i915_drm.h>
>   
> @@ -433,18 +434,29 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   			 bool invalidate)
>   {
> -	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	bool bound;
> +	int idx;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +	if (bound)
> +		xe_pm_runtime_get_noresume(xe);
>   
>   	mutex_lock(&ggtt->lock);
> -	xe_ggtt_clear(ggtt, node->start, node->size);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->start, node->size);
>   	drm_mm_remove_node(node);
>   	node->size = 0;
>   	mutex_unlock(&ggtt->lock);
>   
> +	if (!bound)
> +		return;
> +
>   	if (invalidate)
>   		xe_ggtt_invalidate(ggtt);
>   
> -	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
>   }
>   
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)


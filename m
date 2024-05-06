Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1E6C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 08:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F6C10E903;
	Mon,  6 May 2024 08:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TM+QbpO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF52010E903
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714984981; x=1746520981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FydTvpiKS+G4PS0ZyAaikITAYC3gA+zxgXOaVseZUP0=;
 b=TM+QbpO8sBvPv8rtmhdwv86+fgZccHQoEuP/i9wVuaiCCR4QGCMMpzrp
 YLIAWwHZ2xMGDP6clrhNsjbspE5+vJNbae3Z1n/jsCGDacTVjMAiMYvEp
 L6CbkHmirtGJH5E8ydI2vVg+lY6DeUIlAWihPC6BuQTEF6eJd2mrz/y/Y
 naZLZgJc7OzlGzrAWzPB2S/kKyJLT+nnzQRNfBXk2Qdp6DUoRDPiwu+Hu
 D1HyifBSzdJDZInRTGuWVBCIYP+HYnxcfYRFDkK6wUGNwuHtQrCrz4Ozh
 FLYiZH0jNGoMT9EfKXIoDk0pYuSrsC4WJtfwiDCrQpwg70j4zHB2j82Dx g==;
X-CSE-ConnectionGUID: /529GDKJRG6AkTztXSnWxg==
X-CSE-MsgGUID: 7u+GRttmRp+5sbEyGM36hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10562927"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="10562927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:43:00 -0700
X-CSE-ConnectionGUID: 0wZRiP3OT8GSGzi6ortlPQ==
X-CSE-MsgGUID: Y/iF6JidTa6eqR/QEJaRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28111056"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:42:59 -0700
Message-ID: <527c33d2-68e5-42de-a8e1-15a84137146f@intel.com>
Date: Mon, 6 May 2024 10:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/xe/ggtt: use drm_dev_enter to mark device section
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-11-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-11-matthew.auld@intel.com>
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Device can be hotunplugged before we start destroying gem objects. In
> such a case don't touch the GGTT entries, trigger any invalidations or
> mess around with rpm.  This should already be taken care of when
> removing the device, we just need to take care of dealing with the
> software state, like removing the mm node.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0d541f55b4fc..7c05d3f7e1a4 100644
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
> @@ -433,18 +434,27 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   			 bool invalidate)
>   {
> -	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
> -
> -	mutex_lock(&ggtt->lock);
> -	xe_ggtt_clear(ggtt, node->start, node->size);
> -	drm_mm_remove_node(node);
> -	node->size = 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (invalidate)
> -		xe_ggtt_invalidate(ggtt);
> -
> -	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	int idx;
> +
> +	if (drm_dev_enter(&xe->drm, &idx)) {
> +		xe_pm_runtime_get_noresume(xe);
> +		mutex_lock(&ggtt->lock);
> +		xe_ggtt_clear(ggtt, node->start, node->size);
> +		drm_mm_remove_node(node);
> +		node->size = 0;
> +		mutex_unlock(&ggtt->lock);
> +
> +		if (invalidate)
> +			xe_ggtt_invalidate(ggtt);
> +		xe_pm_runtime_put(xe);
> +		drm_dev_exit(idx);
> +	} else {
> +		mutex_lock(&ggtt->lock);
> +		drm_mm_remove_node(node);
> +		node->size = 0;
> +		mutex_unlock(&ggtt->lock);
> +	}


There is little redundancy between both 'if' branches, I wonder
it it wouldn't be better to do sth like:
	bool driver_bound = drm_dev_enter(&xe->drm, &idx);

	if (driver_bound)
		xe_pm_runtime_get_noresume(xe);
	mutex_lock(&ggtt->lock);
	if (driver_bound)
		xe_ggtt_clear(ggtt, node->start, node->size);
	drm_mm_remove_node(node);
	node->size = 0;
	mutex_unlock(&ggtt->lock);
	if (!driver_bound)
		return;

	if (invalidate)
		xe_ggtt_invalidate(ggtt);
	xe_pm_runtime_put(xe);
	drm_dev_exit(idx);

No big feelings.

One related thing: drm_dev_unplug is called from 
xe_device_remove_display, sounds slightly misleading as drm_dev is not 
only about display. Maybe xe_device_remove_display should be 
incorporated into xe_device_remove to make it more clear, and more 
symmetric with drm_dev_register called from xe_device_probe.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   }
>   
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)


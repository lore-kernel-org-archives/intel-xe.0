Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9855FC71141
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 18:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C30410E708;
	Wed, 11 Jun 2025 18:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpxC6K4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8D310E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749666795; x=1781202795;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rBy12rTV4nRDg6YQoXqscWICMVMwpyTnTgGMxQmLvx0=;
 b=MpxC6K4UqsKvxXjBXNHb0I9ilvaDlSV7rctLvGfeMHH5g7t8giTnVs3s
 WJEtfia7Y4dcmrNv9r77m/mScaz2FPIOTWTRbA63lAcEg+YlQNcWwj83j
 jTYjuAe5zgUDMtOQH1pVdLflSDC/RGwdIg48qy4yzoKPVUnK0L0j9Y2V9
 wIJVp+tW4Mjtp+OZW4OOI33SSDoEtXILyH8un/GJoRQehHVwr92lQUDDq
 jZg6cYWwwwoPfArpUH6TguJuwY/kTiyWYHOGiPWcXapsBEZ6IUeMJD2Vk
 3UcbeKHnMfummWuf5QYNQ9MswALh1ZiqzRhZU882a4C3BcAxJq1k+0ldW g==;
X-CSE-ConnectionGUID: iiOiM3IaQWOp90GAy8vC/g==
X-CSE-MsgGUID: ppQayqtGTyCAIoX7bZlOOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51688436"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="51688436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:33:14 -0700
X-CSE-ConnectionGUID: 1RoLQluMRf2FkSkv3ob0kg==
X-CSE-MsgGUID: LHcPJxUNRNCU0jpbVw629w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="178224552"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.245.201])
 ([10.245.245.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:33:12 -0700
Message-ID: <a5b76810-6476-49e1-82c2-7e6d3f81b240@linux.intel.com>
Date: Wed, 11 Jun 2025 20:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use WRITE_ONCE for range->tile_invalidated update
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
References: <20250604234712.2441130-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250604234712.2441130-1-matthew.brost@intel.com>
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

Reviewed-by: Maarten Lankhrost <maarten.lankhorst@linux.intel.com>

On 2025-06-05 01:47, Matthew Brost wrote:
> Updating range->tile_invalidated should be done with WRITE_ONCE to pair
> with READ_ONCE in opportunistic checks.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 83c63fd7b481..7df0bcea65fc 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -141,7 +141,9 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
>  	for_each_tile(tile, xe, id)
>  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
>  			tile_mask |= BIT(id);
> -			range->tile_invalidated |= BIT(id);
> +			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
> +			WRITE_ONCE(range->tile_invalidated,
> +				   range->tile_invalidated | BIT(id));
>  		}
>  
>  	return tile_mask;
> @@ -644,7 +646,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  {
>  	/*
>  	 * Advisory only check whether the range currently has a valid mapping,
> -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> +	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c,
> +	 * xe_svm_range_notifier_event_begin
>  	 */
>  	return ((READ_ONCE(range->tile_present) &
>  		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&


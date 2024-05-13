Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93441C25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 07:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5859F10E4AD;
	Mon, 13 May 2024 07:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXm1vPYH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648810E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715587100; x=1747123100;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b8gje2kaDxuKzzX8OjllGkliIYu6Rwu0c1ey105Xu74=;
 b=EXm1vPYHsYu3W1J63HAPxQ5q/TA5dw+/D1PbdLL48k38i9at+mgxUZEk
 Ow7/D2znrkwOPR+FkvKV8wWumPTpmLOOHccOsf2Zj1ZKHP3E6poP7kPRI
 ECrq+jzqHjAmVBVoDmaTUhS7nb0iKfh/w50vlyZW7ynr71K6k5GW0pKRR
 ZtJIvVX84+s6sKx8Yh6xj8Pv5zSBuNTlfGvjZddQRbtG2tczsJ8RdJpcO
 wYsZ2Xr5OGJmXA1Z3DI1gIei3kDU0yQDxzuGDeTzt/4uL2vUpmWfPGm5r
 xilNkecQrcxNZWMRsyRzFE0cjGQCiRZv8vrgjn1Fg6fc7apwCrm1bssOL w==;
X-CSE-ConnectionGUID: BD0GP1ZMRLiBA2SuCwaNlw==
X-CSE-MsgGUID: yihdTbEMTjCuU6Qnd7Fy4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11330555"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11330555"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:58:20 -0700
X-CSE-ConnectionGUID: gSTkVgOOTSm3ZXmxoNPwPQ==
X-CSE-MsgGUID: ///JJXEhS+SOr0qE7Zjoqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="34771383"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.99.210])
 ([10.245.99.210])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:58:18 -0700
Message-ID: <47f3889e-1e64-405e-90e0-74f3795a92d8@intel.com>
Date: Mon, 13 May 2024 09:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] drm/xe: make gt_remove use devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-37-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240510181212.264622-37-matthew.auld@intel.com>
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
> No need to hand roll the onion unwind here, just move gt_remove over to
> devm which will already have the correct ordering.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_device.c | 22 ++--------------------
>   drivers/gpu/drm/xe/xe_gt.c     |  9 ++++-----
>   drivers/gpu/drm/xe/xe_gt.h     |  1 -
>   3 files changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e4c30030fc40..40983ad66e3c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -537,7 +537,6 @@ int xe_device_probe(struct xe_device *xe)
>   	struct xe_tile *tile;
>   	struct xe_gt *gt;
>   	int err;
> -	u8 last_gt;
>   	u8 id;
>   
>   	xe_pat_init_early(xe);
> @@ -631,18 +630,16 @@ int xe_device_probe(struct xe_device *xe)
>   		goto err_irq_shutdown;
>   
>   	for_each_gt(gt, xe, id) {
> -		last_gt = id;
> -
>   		err = xe_gt_init(gt);
>   		if (err)
> -			goto err_fini_gt;
> +			goto err_irq_shutdown;
>   	}
>   
>   	xe_heci_gsc_init(xe);
>   
>   	err = xe_display_init(xe);
>   	if (err)
> -		goto err_fini_gt;
> +		goto err_irq_shutdown;
>   
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
> @@ -658,15 +655,6 @@ int xe_device_probe(struct xe_device *xe)
>   
>   err_fini_display:
>   	xe_display_driver_remove(xe);
> -
> -err_fini_gt:
> -	for_each_gt(gt, xe, id) {
> -		if (id < last_gt)
> -			xe_gt_remove(gt);
> -		else
> -			break;
> -	}
> -
>   err_irq_shutdown:
>   	xe_irq_shutdown(xe);
>   err:
> @@ -684,18 +672,12 @@ static void xe_device_remove_display(struct xe_device *xe)
>   
>   void xe_device_remove(struct xe_device *xe)
>   {
> -	struct xe_gt *gt;
> -	u8 id;
> -
>   	xe_device_remove_display(xe);
>   
>   	xe_display_fini(xe);
>   
>   	xe_heci_gsc_fini(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_remove(gt);
> -
>   	xe_irq_shutdown(xe);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3f1826b783ad..00dbb84828ff 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -92,16 +92,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
>   	gt->uc.guc.submission_state.enabled = false;
>   }
>   
> -/**
> - * xe_gt_remove() - Clean up the GT structures before driver removal
> - * @gt: the GT object
> - *
> +/*
>    * This function should only act on objects/structures that must be cleaned
>    * before the driver removal callback is complete and therefore can't be
>    * deferred to a drmm action.
>    */
> -void xe_gt_remove(struct xe_gt *gt)
> +static void gt_remove(void *arg)
>   {
> +	struct xe_gt *gt = arg;
>   	int i;
>   
>   	xe_uc_remove(&gt->uc);
> @@ -573,6 +571,7 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_remove, gt);
>   }
>   
>   static int do_gt_reset(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 8474c50b1b30..866a49037d58 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -43,7 +43,6 @@ int xe_gt_suspend(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
> -void xe_gt_remove(struct xe_gt *gt);
>   
>   /**
>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the


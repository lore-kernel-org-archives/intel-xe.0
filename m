Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140B8CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 10:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94CC10E02D;
	Wed, 22 Oct 2025 10:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esySoNG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D205710E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761127421; x=1792663421;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sDaUHCu+dy20hjw3Hf3Gd0N09vs3G3UjAWodIN+TU0o=;
 b=esySoNG/+tsSVI2S5g4UwIrGQZgVV0IlSy5i8wb4eh/o562WxXIdE5QG
 I/rOlP2T+N/ygEySBrxHpB5R18ld0OCV9SDBX+gzv5scBEfVwk81G368j
 Vb0Up2Y3Todv5OSX2pgezmOpr9+707ORQKTgxlgYqgibfKzi8sifhsMpL
 V2xEqWszKiwNgIU3rdoD3EtgPMf5e0aN//MqSc5mnZV9vTyyr3inZVUC3
 Wbb2s86MHqpR0udHLoQwBZbUOEXXtNq7gbiZ/0HUQ3Y//pxdzcob7TyLv
 swuknVD6ncrAg6yMjuCh+5oAaGtTNMsOPP5/3YyEm2OQTPR7KRK6BoN0G Q==;
X-CSE-ConnectionGUID: or0bebxtRMure8yj70qw4Q==
X-CSE-MsgGUID: HHGCLxk2SmS7gobPfZRIow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63418285"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63418285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:03:41 -0700
X-CSE-ConnectionGUID: vmV1JOs9Q8CltzSWV9+FQw==
X-CSE-MsgGUID: qoZYXNbiSDO3/lGtZYDRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187870674"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.63])
 ([10.245.244.63])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:03:41 -0700
Message-ID: <ff2a8329-3c4d-4e58-b146-82242c4d549c@intel.com>
Date: Wed, 22 Oct 2025 11:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Do not wake device during a GT reset
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20251022005538.828980-1-matthew.brost@intel.com>
 <20251022005538.828980-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251022005538.828980-3-matthew.brost@intel.com>
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

On 22/10/2025 01:55, Matthew Brost wrote:
> Waking the device during a GT reset can lead to unintended memory
> allocation, which is not allowed since GT resets occur in the reclaim
> path. Prevent this by holding a PM reference while a reset is in flight.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_gt.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d8e94fb8b9bd..89808b33d0a8 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -818,17 +818,19 @@ static int gt_reset(struct xe_gt *gt)
>   	unsigned int fw_ref;
>   	int err;
>   
> -	if (xe_device_wedged(gt_to_xe(gt)))
> -		return -ECANCELED;
> +	if (xe_device_wedged(gt_to_xe(gt))) {
> +		err = -ECANCELED;
> +		goto err_pm_put;
> +	}
>   
>   	/* We only support GT resets with GuC submission */
> -	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> -		return -ENODEV;
> +	if (!xe_device_uc_enabled(gt_to_xe(gt))) {
> +		err = -ENODEV;
> +		goto err_pm_put;
> +	}
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -
>   	if (xe_fault_inject_gt_reset()) {
>   		err = -ECANCELED;
>   		goto err_fail;
> @@ -875,6 +877,7 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
>   	xe_device_declare_wedged(gt_to_xe(gt));
> +err_pm_put:
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	return err;
> @@ -896,7 +899,9 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   		return;
>   
>   	xe_gt_info(gt, "reset queued\n");
> -	queue_work(gt->ordered_wq, &gt->reset.worker);
> +	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
> +		xe_pm_runtime_put(gt_to_xe(gt));
>   }
>   
>   void xe_gt_suspend_prepare(struct xe_gt *gt)


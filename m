Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBFFCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 08:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1B010E870;
	Wed, 10 Apr 2024 08:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nu4hxBdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F133910F4E1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712737226; x=1744273226;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=or0aRqLeFf9PNKqml1e8VoXpfpiSmQQiJhoCBlgwj2c=;
 b=Nu4hxBdSd8Jiy7OKdp0kWiwmOUohnW84G8l1lI1j/9IXkzXAg/XAx/57
 igNJo1ZvLK+crw4b1al8bSmvv7xvCUWpCobEXUeAMjNFeX/AP5lin7keZ
 TwUrrLJiOUhRXm8f5HRcvHJ3rWe6psM6QWEYtYmI09y/KV969AoxI/q+f
 wI0+zvGsOndAdM1msz4AFze+kzBP7POYo+DGzck0TGiLmwd7iZVx/V9nk
 DIDGv0HmBl9fZxdXLEpuW6Sa/gw4BFWgNxFpSfghSlhAgknbik+PwLNgd
 iDV/a8U7dryujD6udkLUHR383MZA/lGUzbQlgLp93ZWil4Q2RRgFLrzkq Q==;
X-CSE-ConnectionGUID: 4iv8MqdrRJe0vorEqXryxQ==
X-CSE-MsgGUID: JdyHsqrVQqW1ZEL1pXdqNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8211078"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8211078"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:20:23 -0700
X-CSE-ConnectionGUID: ZPHo6su1SiGT3n9SMs6mLg==
X-CSE-MsgGUID: 5X3KerBEQx2yLnlEOYgLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20433645"
Received: from unknown (HELO [10.245.245.250]) ([10.245.245.250])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:20:22 -0700
Message-ID: <ba5ee69d-1e23-495b-8da2-7063d46835e4@intel.com>
Date: Wed, 10 Apr 2024 09:20:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/xe: Introduce xe_pm_runtime_get_noresume for
 inner callers
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
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

On 10/04/2024 02:58, Rodrigo Vivi wrote:
> Let's ensure that we have an option for inner callers that will
> raise WARN if device is not active and not protected by outer callers.
> 
> Make this also a void function forcing every caller to unconditionally
> put the reference back afterwards.
> 
> This will be very important for cases where we want to hold the
> reference before scheduling a work in a queue. Then the work job
> will be responsible for putting it back.
> 
> While at this, already convert a case from mem_access_get_ongoing where
> it is not checking for the reference and put it back, what would
> cause the underflow.
> 
> v2: Fix identation.
> v3: Convert equivalent missing put from mem_access towards pm_runtime.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

r-b still applies to v3.

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c |  4 ++--
>   drivers/gpu/drm/xe/xe_pm.c         | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h         |  1 +
>   3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 71bd52dfebcf..50ec661116a2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -128,7 +128,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   	 * already grabbed the rpm ref outside any sensitive locks.
>   	 */
>   	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> +		xe_pm_runtime_get_noresume(xe);
>   
>   	return 0;
>   
> @@ -217,7 +217,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   	for (i = 0; i < q->width; ++i)
>   		xe_lrc_finish(q->lrc + i);
>   	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> -		xe_device_mem_access_put(gt_to_xe(q->gt));
> +		xe_pm_runtime_put(gt_to_xe(q->gt));
>   	__xe_exec_queue_free(q);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9ef03f23a2d7..1692cf08e950 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -489,6 +489,26 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
>   	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
>   }
>   
> +/**
> + * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
> + * @xe: xe device instance
> + *
> + * This function should be used in inner places where it is surely already
> + * protected by outer-bound callers of `xe_pm_runtime_get`.
> + * It will warn if not protected.
> + * The reference should be put back after this function regardless, since it
> + * will always bump the usage counter, regardless.
> + */
> +void xe_pm_runtime_get_noresume(struct xe_device *xe)
> +{
> +	bool ref;
> +
> +	ref = xe_pm_runtime_get_if_in_use(xe);
> +
> +	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> +		pm_runtime_get_noresume(xe->drm.dev);
> +}
> +
>   /**
>    * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 0cb38ca244fe..119b630ad1d1 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
>   void xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> +void xe_pm_runtime_get_noresume(struct xe_device *xe);
>   bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);

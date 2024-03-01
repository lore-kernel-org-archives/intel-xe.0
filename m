Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184F1C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 17:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDA710E094;
	Fri,  1 Mar 2024 17:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbfhBuLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9180A10E094
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709315527; x=1740851527;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9j9NHsagMPxWz+RqZa5uIv7wjEiBrK1XgqIqdOAbZAQ=;
 b=IbfhBuLPEg7Q/e40F3fvNBmd4FALXyrO7N/9hSu5LqRrePQI9rXqKfRK
 PJ+1V5mN85MqB2EgoRMLaD89BXxSIGr+rgeyl3VOlb7xC45kVsfGmpgp1
 LkyXu/uQl7bVTuXgIJs+c7e0hDxaU2O0WtCm5CzoPcoBFF0Hy8BmGHotw
 7AqunObcb0ePYakAN9ghR+jtid5tQqxsPEMsIqxUq/+ZtQji9hrWYtDco
 Ts6EaKK4mcKW+2w9m/M2j1Hpc/Ot0uLBiR6JP3jZ1+RnaL3Vil2gQL8rs
 vclGFYm7j+lioEhmWO2gS3WoSGwWXyi+uimMECN6xUw7QaZYJL7GWs9fl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="29285344"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="29285344"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="39287514"
Received: from knomani-mobl.ger.corp.intel.com (HELO [10.252.3.163])
 ([10.252.3.163])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:52:05 -0800
Message-ID: <c64bab22-516e-4a9a-a3bf-e08dcef536e0@intel.com>
Date: Fri, 1 Mar 2024 17:52:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Convert xe_pm_runtime_{get,put} to void and
 protect from recursion
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240227183533.505053-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240227183533.505053-1-rodrigo.vivi@intel.com>
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

On 27/02/2024 18:35, Rodrigo Vivi wrote:
> With mem_access going away and pm_runtime getting called instead,
> we need to protect these against recursions.
> 
> For D3cold, the TTM migration helpers will call for the job execution.
> Jobs execution will be protected by direct runtime_pm calls, but they
> cannot be called again if we are already at a runtime suspend/resume
> transaction when evicting/restoring memory for D3Cold. So, we will check
> for the xe_pm_read_callback_task.
> 
> The put is asynchronous so there's no need to block it. However, for a
> proper balance, we need to ensure that the references are taken and
> restored regardless of the flow. So, let's convert them all to void and
> use some direct linux/pm_runtime functions.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 25 ++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_pm.h |  4 ++--
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b5511e3c3153..3664480b21ba 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -408,26 +408,29 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   /**
>    * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
>    * @xe: xe device instance
> - *
> - * Returns: Any number greater than or equal to 0 for success, negative error
> - * code otherwise.
>    */
> -int xe_pm_runtime_get(struct xe_device *xe)
> +void xe_pm_runtime_get(struct xe_device *xe)

Actually there is still the caller in intel_runtime_pm_get() compat. 
What is the correct patch order here? It's kind of hard to follow.

>   {
> -	return pm_runtime_get_sync(xe->drm.dev);
> +	pm_runtime_get_noresume(xe->drm.dev);
> +
> +	if (xe_pm_read_callback_task(xe) == current)
> +		return;
> +
> +	pm_runtime_resume(xe->drm.dev);
>   }
>   
>   /**
>    * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
>    * @xe: xe device instance
> - *
> - * Returns: Any number greater than or equal to 0 for success, negative error
> - * code otherwise.
>    */
> -int xe_pm_runtime_put(struct xe_device *xe)
> +void xe_pm_runtime_put(struct xe_device *xe)
>   {
> -	pm_runtime_mark_last_busy(xe->drm.dev);
> -	return pm_runtime_put(xe->drm.dev);
> +	if (xe_pm_read_callback_task(xe) == current) {
> +		pm_runtime_put_noidle(xe->drm.dev);
> +	} else {
> +		pm_runtime_mark_last_busy(xe->drm.dev);
> +		pm_runtime_put(xe->drm.dev);
> +	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 7f5884babb29..fdc2a49c1a1f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -26,9 +26,9 @@ void xe_pm_runtime_fini(struct xe_device *xe);
>   bool xe_pm_runtime_suspended(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
> -int xe_pm_runtime_get(struct xe_device *xe);
> +void xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_get_ioctl(struct xe_device *xe);
> -int xe_pm_runtime_put(struct xe_device *xe);
> +void xe_pm_runtime_put(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);

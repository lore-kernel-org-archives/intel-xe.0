Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5273ED15D89
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 12:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E70210E4CD;
	Mon, 21 Oct 2024 12:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYYC19ks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CA310E4C4
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 12:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729513965; x=1761049965;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W4Z8HZkrXaM8eq3lid1rGGV0UFQA/2vlXg8ugoA0tbg=;
 b=XYYC19ksq10dixXYp8KYU5/5dNfv5PrLkHjmqrml4+WbKsZnVbZrQpGG
 f/f+LUs8411+f1/INRqxFBprxG7hEph+8T6V/CxHZnUa+uerhXqWEIgZf
 1ja+MaegpKKph0OWSGnh0sUvGEw4c9tlAeQeQSn7+kcBYH7d8RnQCJf1c
 gfvHdvyVJCVDJtQabg+TnxlbNbR1pI0qjIpXaPMxaktfUPq5io8txHrJh
 e3QxUEIUj7/CmXZCxqNLxedxhjZ1tTp0VftBkkYYCdVB7SpGUffKwmcJs
 LAzX8u/0LteSWUQhVcySHicvfW1yoIz8c7h2dCBIHqqgUE8QjACdH49vg w==;
X-CSE-ConnectionGUID: 4CWIFu/wQVKS56BAzLMSgQ==
X-CSE-MsgGUID: XgxDgLoQTAKlZ0NsHPzJQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51541412"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51541412"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 05:32:44 -0700
X-CSE-ConnectionGUID: 0kbijT5KSHiJ51sZOT8RFA==
X-CSE-MsgGUID: PXjDxrciSPq6u2nQl52cJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79460065"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.222])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 05:32:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/ufence: Kick ufence immediately when possible
In-Reply-To: <20241017094237.279327-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241017094237.279327-1-nirmoy.das@intel.com>
Date: Mon, 21 Oct 2024 15:32:39 +0300
Message-ID: <87zfmxy6u0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 17 Oct 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
> If the backing fence is signaled then signal ufence soon with
> system_wq. This should reduce load from the xe ordered_wq and also
> won't block signaling a ufence which doesn't require any serialization.
>
> v2: fix system_wq typo
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Auld <matthew.auld@intel.com>
> gc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index c6cf227ead40..1a7907293088 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -89,10 +89,14 @@ static void user_fence_worker(struct work_struct *w)
>  	user_fence_put(ufence);
>  }
>  
> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
> +			bool signaled)
>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
> -	queue_work(ufence->xe->ordered_wq, &ufence->worker);
> +	if (signaled)
> +		queue_work(system_wq, &ufence->worker);

Just sayin, that's the same as schedule_work(&ufence->worker);

> +	else
> +		queue_work(ufence->xe->ordered_wq, &ufence->worker);
>  	dma_fence_put(fence);
>  }
>  
> @@ -100,7 +104,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  {
>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>  
> -	kick_ufence(ufence, fence);
> +	kick_ufence(ufence, fence, false);
>  }
>  
>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> @@ -236,7 +240,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>  					     user_fence_cb);
>  		if (err == -ENOENT) {
> -			kick_ufence(sync->ufence, fence);
> +			kick_ufence(sync->ufence, fence, true);
>  		} else if (err) {
>  			XE_WARN_ON("failed to add user fence");
>  			user_fence_put(sync->ufence);

-- 
Jani Nikula, Intel

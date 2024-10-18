Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8CD30013
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 14:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBE710E93C;
	Fri, 18 Oct 2024 14:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wg9bdZnk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B1710E93C
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729261416; x=1760797416;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ma8sXnVcyNbxbnZf1xA/lXhy2IPfW4RRlnmGAhK/zdc=;
 b=Wg9bdZnkeGbGZ9kQf2l450XYL0uZlXvToX292faNgnNeT+rc34R0KIxQ
 T4ZrxhlU+qEpkfgdIx9EUq2s5CCmRi9xq46QCCsdQ5+YzKmVwr2bhIdKb
 e9uPyIHZFRfiSTnk7cBHRb79hgxA48FZi2JQPadzSXYWND+amAcnfnLGO
 mF3f+rwDtyTlbUIPm1+EV+KVZrgvYMvz0ETH0ZlNrspNMeoAcnxK1GOmE
 Jkoyim0xJ+AkN3+aw8X/4YsYlI0gJqfyJ3Acymu27gDAUL+QkeRmZvqrK
 v+J0ULp1t0hvH9WauRBsESBbGnqxgYpkdi0Wl1AI0aO7wlaleWVp5btAn w==;
X-CSE-ConnectionGUID: rJ+yx15uQlmnxXOYFthXfA==
X-CSE-MsgGUID: vrY3Mak8QSKM1ErR9W6ZCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="32590991"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="32590991"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:23:36 -0700
X-CSE-ConnectionGUID: ge+TNWwjQLGOSKauCoM0YA==
X-CSE-MsgGUID: Pkz0M2JcRWyn+nv79Ce7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="79225316"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.226])
 ([10.245.244.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:23:35 -0700
Message-ID: <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
Date: Fri, 18 Oct 2024 15:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241018124710.1536948-1-nirmoy.das@intel.com>
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

On 18/10/2024 13:47, Nirmoy Das wrote:
> If the backing fence is signaled then signal ufence immediately.
> This should reduce load from the xe ordered_wq and also won't block
> signaling a ufence which doesn't require any serialization.
> 
> v2: fix system_wq typo
> v3: signal immediately instead of queuing in system_wq (Matt B)
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Auld <matthew.auld@intel.com>
> gc: Matthew Brost <matthew.brost@intel.com>

s/gc/Cc

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index c6cf227ead40..069c1e4ebea5 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>   	return ufence;
>   }
>   
> -static void user_fence_worker(struct work_struct *w)
> +static void signal_user_fence(struct xe_user_fence *ufence)
>   {
> -	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
> -
>   	if (mmget_not_zero(ufence->mm)) {
>   		kthread_use_mm(ufence->mm);
>   		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))

This can end up in a CPU fault handler? There might be some locking 
issues if caller is say holding dma-resv. For example the caller in 
xe_exec which is holding dma-resv. If it can indeed hit this path, then 
we might get some splats/deadlocks, I think.

> @@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
>   	user_fence_put(ufence);
>   }
>   
> +static void user_fence_worker(struct work_struct *w)
> +{
> +	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
> +						    worker);
> +
> +	signal_user_fence(ufence);
> +}
> +
>   static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>   {
>   	INIT_WORK(&ufence->worker, user_fence_worker);
> @@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>   		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>   					     user_fence_cb);
>   		if (err == -ENOENT) {
> -			kick_ufence(sync->ufence, fence);
> +			/* signal the ufence immediately if fence is already signalled */
> +			signal_user_fence(sync->ufence);
>   		} else if (err) {
>   			XE_WARN_ON("failed to add user fence");
>   			user_fence_put(sync->ufence);

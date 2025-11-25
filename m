Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076ECCFD377
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 10:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC70D10E3A2;
	Tue, 25 Nov 2025 10:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nu0XghGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C85C10E3A2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764065861; x=1795601861;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=y3wPOX7T+Wmecic26RX6iTMHKlonx19JjPNG6ZZ+xwQ=;
 b=nu0XghGnVuYDMFuEEzHg8qwoyfcR/ty5OCnYMqRl9id2CletVjd5K58L
 gMbSPowCg0JePPNzKZpwzY5il7GA514YlmZj5vmb3tKqiLkcqMsDBaYvh
 Z59+wOIESHx4EPJBHnk8+T95H9qA/rG37DugYbilaFiwNy4I0/xYHHg1W
 0OtCauXvpVCUBjn8xzp8bTyK0Fd1ksq5tT1RYmhe1H9xL2/Ea7xAGDsyG
 fYaMxBjDYhV+ejmIsqe5L0/uoQDwzN3Syj2ohZseLVLoXC03RMguFWISQ
 KKAg847y4J4guGm0eyrwi2t7WoF0b5gkTC2ls/r0fo1l4m0+Lrc1N4TKy A==;
X-CSE-ConnectionGUID: fRLri692S/mNwKOf8p2X0w==
X-CSE-MsgGUID: qpKhEvw6TFSzGQAG29LMHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66114665"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66114665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:17:41 -0800
X-CSE-ConnectionGUID: CLGhE8XXQsitOH17p5Sfzg==
X-CSE-MsgGUID: 11DDiKbkScivCtpI/g7T3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196903680"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.244.230])
 ([10.245.244.230])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:17:40 -0800
Message-ID: <59c3e7ea-f79f-49b9-834b-766c2f394b14@intel.com>
Date: Tue, 25 Nov 2025 10:17:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines
 manually
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 intel-xe@lists.freedesktop.org, "Souza, Jose" <jose.souza@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
 <20251125094335.12028-2-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251125094335.12028-2-tejas.upadhyay@intel.com>
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

On 25/11/2025 09:43, Tejas Upadhyay wrote:
> Starting NVL, HW will flush cachelines marked with XA only

I think would be good to give basic overview of what XA is?

> when media is off. We have few cases where kernel will have
> non-XA cachelines which needs manual flush as we postpone
> the invalidation. Flush asap from correctness POV to ensure
> non accelerated CPU copy to swap/shmem file will see coherent
> view of memory, but also from security POV where later flush
> can't corrupt the next user of those pages.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
>   drivers/gpu/drm/xe/xe_device.c  | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.h  |  1 +
>   drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
>   4 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 465cf9fc7ce9..97e1e9d40e96 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   
>   		if (!xe_vm_in_fault_mode(vm)) {
>   			drm_gpuvm_bo_evict(vm_bo, true);
> -			continue;
> +			if (!xe_device_needs_cache_flush(xe))
> +				continue;
>   		}
>   
>   		if (!idle) {
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 92f883dd8877..6e8335b493e8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1079,6 +1079,26 @@ void xe_device_l2_flush(struct xe_device *xe)
>   	spin_unlock(&gt->global_invl_lock);
>   }
>   
> +/**
> + * xe_device_needs_cache_flush - Whether the cache needs to be flushed
> + * @xe: The device to check.
> + *
> + * Return: true if the device needs cache flush, false otherwise.
> + */
> +bool xe_device_needs_cache_flush(struct xe_device *xe)
> +{
> +	/*
> +	 * Starting NVL, HW will flush cachelines marked with XA only when media is off. We have

I think the wording could be improved here (same for commit message). XA 
is *always* flushed, like at the end-of-submssion (and maybe other 
places), just that internally as an optimisation hw doesn't need to make 
that a full flush (which will also include XA) when Media is 
off/powergated, since it doesn't need to worry about GT caches vs Media 
coherency, and only CPU vs GPU coherency, so can make that flush a 
targeted XA flush, since stuff tagged with XA now means it's shared with 
the CPU.

> +	 * few cases where kernel will have non-XA cachelines which needs manual flush and this is
> +	 * one of them as we postpone the invalidation. Flush asap from correctness POV to ensure
> +	 * non accelerated CPU copy to swap/shmem file will see coherent view of memory, but also
> +	 * from security POV where later flush can't corrupt the next user of those pages.
> +	 */
> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe))
> +		return true;
> +	return false;
> +}
> +
>   /**
>    * xe_device_td_flush() - Flush transient L3 cache entries
>    * @xe: The device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f6..15e67db44b56 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -179,6 +179,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>   u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>   u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>   
> +bool xe_device_needs_cache_flush(struct xe_device *xe);
>   void xe_device_td_flush(struct xe_device *xe);
>   void xe_device_l2_flush(struct xe_device *xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 0d9130b1958a..a93c7e887cca 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>   				    false, MAX_SCHEDULE_TIMEOUT);
>   	XE_WARN_ON(err <= 0);
>   
> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> +	if ((xe_vm_in_fault_mode(vm) || xe_device_needs_cache_flush(vm->xe)) &&

Other option is to ban non-XA or non-2WAY at the uAPI level on such 
platforms, but I guess also depends on what UMD wants here?

Jose, I assume Mesa is just going to use XA or 2WAY for userptr on such 
hw? Or do you see a usecase for being more flexible?

> +	    userptr->initial_bind) {
>   		err = xe_vm_invalidate_vma(vma);
>   		XE_WARN_ON(err);
>   	}


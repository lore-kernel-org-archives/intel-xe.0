Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FC8C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 15:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3FD10E5E9;
	Tue,  9 Jul 2024 15:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXLjw4wP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3DD10E59C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720540653; x=1752076653;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jivObDpSWZc1Z/9mB4OJ9tkmkXaJhwej6P9I9j8TnM8=;
 b=PXLjw4wPyV+M3DFEWxAQCJZHHeHA341S1YLZigZo4dJi6/PJwz/66ft1
 NmjPFOzoHK29He3uvXqIvkpcrdcA+X+GZ5+TtTH2wIb4v870/9wGCYkh8
 Xp0J1FLtMZFm+1tQ3YXePVj3v3hsySf7YX87QREWg+HLIY/blu5rBvFZm
 sfjNIxmrNhzJz1OoMJw0O9KicM6+cP6S7e46BKi8G4bWw5dPM5F0mTAsD
 S91kFLcoBgH8YtsaLyKPBZz5CFvvqd8al9RkRJpRahN6D/h8z5Pg4eYgk
 WqPsZGZ2cEJaFMk50ICsb8aY8WCv6TzoTA1/GDDarZnh5obia8DuvkAZ1 A==;
X-CSE-ConnectionGUID: vY515qF5Rv+HDnA7IghrBA==
X-CSE-MsgGUID: yRCf8RXoQZm9We9aXGbFaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12455061"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="12455061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:57:33 -0700
X-CSE-ConnectionGUID: fHIp2JvJSUSnX/xAECVZmQ==
X-CSE-MsgGUID: /cEbFBrBSM2Pvb4nDJh+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52842140"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:57:31 -0700
Message-ID: <77017413-852e-41bb-a37c-ed7b379f65ac@linux.intel.com>
Date: Tue, 9 Jul 2024 17:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/xe: Drop xe_gt_tlb_invalidation_wait
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <20240708040331.766264-3-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240708040331.766264-3-matthew.brost@intel.com>
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


On 7/8/2024 6:03 AM, Matthew Brost wrote:
> Having two methods to wait on GT TLB invalidations is not ideal. Remove
> xe_gt_tlb_invalidation_wait and only use GT TLB invalidation fences.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 101 ++++++--------------
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   7 +-
>   drivers/gpu/drm/xe/xe_vm.c                  |  28 +++---
>   3 files changed, 49 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 92a18a0e4acd..687214d07ac7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -111,7 +111,6 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
>   void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>   {
>   	struct xe_gt_tlb_invalidation_fence *fence, *next;
> -	struct xe_guc *guc = &gt->uc.guc;
>   	int pending_seqno;
>   
>   	/*
> @@ -134,7 +133,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>   	else
>   		pending_seqno = gt->tlb_invalidation.seqno - 1;
>   	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, pending_seqno);
> -	wake_up_all(&guc->ct.wq);
>   
>   	list_for_each_entry_safe(fence, next,
>   				 &gt->tlb_invalidation.pending_fences, link)
> @@ -165,6 +163,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   	int seqno;
>   	int ret;
>   
> +	xe_gt_assert(gt, fence);
> +
>   	/*
>   	 * XXX: The seqno algorithm relies on TLB invalidation being processed
>   	 * in order which they currently are, if that changes the algorithm will
> @@ -173,10 +173,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   
>   	mutex_lock(&guc->ct.lock);
>   	seqno = gt->tlb_invalidation.seqno;
> -	if (fence) {
> -		fence->seqno = seqno;
> -		trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
> -	}
> +	fence->seqno = seqno;
> +	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
>   	action[1] = seqno;
>   	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>   				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> @@ -209,7 +207,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   			TLB_INVALIDATION_SEQNO_MAX;
>   		if (!gt->tlb_invalidation.seqno)
>   			gt->tlb_invalidation.seqno = 1;
> -		ret = seqno;
>   	}
>   	mutex_unlock(&guc->ct.lock);
>   
> @@ -223,14 +220,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>   /**
>    * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
>    * @gt: graphics tile
> + * @fence: invalidation fence which will be signal on TLB invalidation
> + * completion
>    *
>    * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
> - * caller can use seqno + xe_gt_tlb_invalidation_wait to wait for completion.
> + * caller can use the invalidation fence to wait for completion.
>    *
> - * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> - * negative error code on error.
> + * Return: 0 on success, negative error code on error
>    */
> -static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
> +static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
> +				      struct xe_gt_tlb_invalidation_fence *fence)
>   {
>   	u32 action[] = {
>   		XE_GUC_ACTION_TLB_INVALIDATION,
> @@ -238,7 +237,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
>   		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
>   	};
>   
> -	return send_tlb_invalidation(&gt->uc.guc, NULL, action,
> +	return send_tlb_invalidation(&gt->uc.guc, fence, action,
>   				     ARRAY_SIZE(action));
>   }
>   
> @@ -257,13 +256,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   
>   	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>   	    gt->uc.guc.submission_state.enabled) {
> -		int seqno;
> +		struct xe_gt_tlb_invalidation_fence fence;
> +		int ret;
>   
> -		seqno = xe_gt_tlb_invalidation_guc(gt);
> -		if (seqno <= 0)
> -			return seqno;
> +		xe_gt_tlb_invalidation_fence_init(gt, &fence);
> +		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> +		if (ret < 0)
> +			return ret;
>   
> -		xe_gt_tlb_invalidation_wait(gt, seqno);
> +		xe_gt_tlb_invalidation_fence_wait(&fence);
>   	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>   		if (IS_SRIOV_VF(xe))
>   			return 0;
> @@ -290,18 +291,16 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>    *
>    * @gt: graphics tile
>    * @fence: invalidation fence which will be signal on TLB invalidation
> - * completion, can be NULL
> + * completion
>    * @start: start address
>    * @end: end address
>    * @asid: address space id
>    *
>    * Issue a range based TLB invalidation if supported, if not fallback to a full
> - * TLB invalidation. Completion of TLB is asynchronous and caller can either use
> - * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
> - * completion.
> + * TLB invalidation. Completion of TLB is asynchronous and caller can use
> + * the invalidation fence to wait for completion.
>    *
> - * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> - * negative error code on error.
> + * Return: Negative error code on error, 0 on success
>    */
>   int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>   				 struct xe_gt_tlb_invalidation_fence *fence,
> @@ -312,11 +311,11 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>   	u32 action[MAX_TLB_INVALIDATION_LEN];
>   	int len = 0;
>   
> +	xe_gt_assert(gt, fence);
> +
>   	/* Execlists not supported */
>   	if (gt_to_xe(gt)->info.force_execlist) {
> -		if (fence)
> -			__invalidation_fence_signal(xe, fence);
> -
> +		__invalidation_fence_signal(xe, fence);
>   		return 0;
>   	}
>   
> @@ -382,12 +381,10 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>    * @vma: VMA to invalidate
>    *
>    * Issue a range based TLB invalidation if supported, if not fallback to a full
> - * TLB invalidation. Completion of TLB is asynchronous and caller can either use
> - * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
> - * completion.
> + * TLB invalidation. Completion of TLB is asynchronous and caller can use
> + * the invalidation fence to wait for completion.
>    *
> - * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
> - * negative error code on error.
> + * Return: Negative error code on error, 0 on success
>    */
>   int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   			       struct xe_gt_tlb_invalidation_fence *fence,
> @@ -400,43 +397,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   					    xe_vma_vm(vma)->usm.asid);
>   }
>   
> -/**
> - * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
> - * @gt: graphics tile
> - * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
> - *
> - * Wait for tlb_timeout_jiffies() for a TLB invalidation to complete.
> - *
> - * Return: 0 on success, -ETIME on TLB invalidation timeout
> - */
> -int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> -{
> -	struct xe_guc *guc = &gt->uc.guc;
> -	int ret;
> -
> -	/* Execlists not supported */
> -	if (gt_to_xe(gt)->info.force_execlist)
> -		return 0;
> -
> -	/*
> -	 * XXX: See above, this algorithm only works if seqno are always in
> -	 * order
> -	 */
> -	ret = wait_event_timeout(guc->ct.wq,
> -				 tlb_invalidation_seqno_past(gt, seqno),
> -				 tlb_timeout_jiffies(gt));
> -	if (!ret) {
> -		struct drm_printer p = xe_gt_err_printer(gt);
> -
> -		xe_gt_err(gt, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
> -			  seqno, gt->tlb_invalidation.seqno_recv);
> -		xe_guc_ct_print(&guc->ct, &p, true);
> -		return -ETIME;
> -	}
> -
> -	return 0;
> -}
> -
>   /**
>    * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
>    * @guc: guc
> @@ -480,12 +440,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   		return 0;
>   	}
>   
> -	/*
> -	 * wake_up_all() and wait_event_timeout() already have the correct
> -	 * barriers.
> -	 */
>   	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
> -	wake_up_all(&guc->ct.wq);
>   
>   	list_for_each_entry_safe(fence, next,
>   				 &gt->tlb_invalidation.pending_fences, link) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index 948f4a2f5214..cbf49b3d0265 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -23,10 +23,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>   				 struct xe_gt_tlb_invalidation_fence *fence,
>   				 u64 start, u64 end, u32 asid);
> -int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
>   int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   
>   void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>   				       struct xe_gt_tlb_invalidation_fence *fence);
>   
> +static inline void
> +xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	dma_fence_wait(&fence->base, false);
> +}
> +
>   #endif	/* _XE_GT_TLB_INVALIDATION_ */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cf3aea5d8cdc..478932fb7718 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3176,8 +3176,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   {
>   	struct xe_device *xe = xe_vma_vm(vma)->xe;
>   	struct xe_tile *tile;
> +	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
>   	u32 tile_needs_invalidate = 0;
> -	int seqno[XE_MAX_TILES_PER_DEVICE];
>   	u8 id;
>   	int ret;
>   
> @@ -3204,29 +3204,31 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   
>   	for_each_tile(tile, xe, id) {
>   		if (xe_pt_zap_ptes(tile, vma)) {
> -			tile_needs_invalidate |= BIT(id);
>   			xe_device_wmb(xe);
> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> +							  &fence[id]);
> +
>   			/*
>   			 * FIXME: We potentially need to invalidate multiple
>   			 * GTs within the tile
>   			 */
> -			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
> -			if (seqno[id] < 0)
> -				return seqno[id];
> -		}
> -	}
> -
> -	for_each_tile(tile, xe, id) {
> -		if (tile_needs_invalidate & BIT(id)) {
> -			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
> +			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> +							 &fence[id], vma);
>   			if (ret < 0)
> -				return ret;
> +				goto wait;
> +
> +			tile_needs_invalidate |= BIT(id);
>   		}
>   	}
>   
> +wait:
> +	for_each_tile(tile, xe, id)
> +		if (tile_needs_invalidate & BIT(id))
> +			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +
>   	vma->tile_invalidated = vma->tile_mask;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   struct xe_vm_snapshot {

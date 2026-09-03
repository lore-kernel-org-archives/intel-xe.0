Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE5C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 17:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB97A10E150;
	Thu,  3 Sep 2026 17:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DfEV/GL0";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD5010E150
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 17:46:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2CA8F60120;
 Thu,  3 Sep 2026 17:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF921F000E9;
 Thu,  3 Sep 2026 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788457617;
 bh=j2NmdCT5szMdFrU50CwO/nc3txEOeTiPehHzR47yRlo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DfEV/GL0yx0jxvpDh1VqDbZT0TzWnyJn9hZCM7QQCSrzMjerH0YnEu/rAccDozJoj
 wXBq494FsynASrStvS8yerbZNCJ5bls3vdxu2Ey4vXTj2JHlDupi3nLCdyTfJjPAlR
 nEAZ61gUIznHVLBHQlvGyV2EJ+1B6jDoWiedtmozOyqXWICc3uHOb2vLASBUczHgRi
 +6jqlseWNyWazsskIcGfa2HOvIU2beTJ1/YI4cKi1y3rwAVnkx9xdFIN6MfGtis2Kq
 6U/Y0MEXmdpbECKaoSYV94aZSU3cfmiEMZ1JiKE9ZxDntC5b4I/0Ar00fiAUHwn9nQ
 tc3+TBADcLIhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V21 14/15] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903161553.528932-31-tejas.upadhyay@intel.com>
References: <20260903161553.528932-17-tejas.upadhyay@intel.com>
 <20260903161553.528932-31-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 17:46:57 +0000
Message-Id: <20260903174657.ABF921F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing memory barriers when updating and checking ban_reason an=
d queue state allow race conditions where the wrong ban reason is reported.
- [Low] The GPU_HANG ban reason is erroneously appended to non-LR queues th=
at time out as a consequence of a VM ban (e.g., from page offline).
- [Low] The PAGE_OFFLINE ban reason is not recorded for non-LR exec queues =
on platforms without context-based TLB invalidations.
--

commit 67aaa673382d33c9ca0db014fb3ae57c32097a8e
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN

This commit extends DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask=
=20
indicating the reason for a queue ban instead of a simple boolean. It adds=
=20
a ban_reason field to xe_exec_queue, updates the VRAM purge and TDR paths=20
to populate this field, and modifies the reset_status op to expose it.

> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -1599,6 +1600,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *=
drm_job)
>  	else
>  		wedged =3D xe_device_wedged(xe);
> =20
> +	/*
> +	 * Only tag as GPU hang if this is the original timeout, not a
> +	 * consequence of a prior kill (e.g., page-offline).
> +	 */
> +	if (!exec_queue_killed(q))
> +		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);

[Severity: Medium]
Does this sequence require an smp_wmb() before set_exec_queue_banned(q)?

atomic_or() is a relaxed operation. Without a write barrier, the queue's
BANNED state update might become visible to concurrent readers before the
ban_reason update is visible. This could allow a userspace query to see
the banned state but get the wrong (default) reason.

[Severity: Low]
Could this erroneously tag non-LR queues with the GPU_HANG reason after a
VM ban?

The commit message states this guard avoids masking the page-offline
reason. However, xe_vm_kill() only kills LR queues. As a result,
exec_queue_killed(q) remains false for non-LR queues, causing them to
incorrectly receive both the PAGE_OFFLINE and GPU_HANG bits when they
eventually time out due to the unmapped memory.

>  	set_exec_queue_banned(q);
> =20
>  	/* Kick job / queue off hardware */
[ ... ]
> @@ -2580,13 +2590,29 @@ static void guc_exec_queue_multi_queue_drop_suspe=
nd(struct xe_exec_queue *q)
>  	}
>  }
> =20
> -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> -	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> -		return true;
> +	/* TODO: In case of multiqueue, if a secondary queue is banned due to
> +	 * page offlining, checking only the primary queue's GuC reset status
> +	 * may mask the true reason or race with it.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		u64 status =3D guc_exec_queue_reset_status(xe_exec_queue_multi_queue_p=
rimary(q));
> =20
> -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
> +		if (status)
> +			return status;
> +	}
> +
> +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> +		u64 reason =3D atomic_read_acquire(&q->ban_reason);

[Severity: Medium]
Is an smp_rmb() needed here, or an acquire barrier on the state check?

While atomic_read_acquire() prevents subsequent loads from being reordered
before this point, the relaxed reads inside
exec_queue_killed_or_banned_or_wedged(q) (e.g., checking q->guc->state)
could be reordered with the read of q->ban_reason because control
dependencies do not order subsequent loads. This could result in loading a
stale ban_reason before the state check is fully verified.

> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason =3D DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> +		return reason;
> +	}
> +
> +	return 0;
>  }
[ ... ]
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -639,7 +641,30 @@ static int xe_ttm_vram_purge_page(struct xe_device *=
xe, struct xe_bo *bo)
>  	xe_bo_unlock(bo);
>  	/*  Ban VM if BO is PPGTT */
>  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct xe_exec_queue *eq;
> +		int id;
> +
>  		down_write(&vm->lock);
> +		if (xe->info.has_ctx_tlb_inval) {
> +			/*
> +			 * Must be the write lock: send_tlb_inval_ctx_ppgtt()
> +			 * mutates this list (list_move_tail() onto an on-stack
> +			 * head) while holding only the read lock, relying on
> +			 * tlb_inval->seqno_lock to keep itself the sole
> +			 * mutator. Traversing it under down_read() would let
> +			 * this walk follow entries onto that stack list.
> +			 */
> +			down_write(&vm->exec_queues.lock);
> +			for (id =3D 0; id < ARRAY_SIZE(vm->exec_queues.list); id++)
> +				list_for_each_entry(eq, &vm->exec_queues.list[id],
> +						    vm_exec_queue_link)
> +					atomic_or(q_flag, &eq->ban_reason);
> +			up_write(&vm->exec_queues.lock);
> +		} else {
> +			list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> +				atomic_or(q_flag, &eq->ban_reason);

[Severity: Low]
Does this fallback path properly handle non-LR queues on older platforms?

When has_ctx_tlb_inval is false, this iteration loops over
vm->preempt.exec_queues, which exclusively contains LR queues. Since
non-LR queues aren't tracked in this list, they will miss the PAGE_OFFLINE
tag during a VRAM purge and will only report a generic GPU_HANG when they
eventually time out.

> +		}
> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM=
 */
>  		xe_vm_kill(vm, true);
>  		up_write(&vm->lock);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903161553.5289=
32-17-tejas.upadhyay@intel.com?part=3D14

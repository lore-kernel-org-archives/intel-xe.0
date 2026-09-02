Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C2DC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC2110E362;
	Wed,  2 Sep 2026 17:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E3Fn5XZU";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FF810E362
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:11:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 24B5540244;
 Wed,  2 Sep 2026 17:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF28F1F000E9;
 Wed,  2 Sep 2026 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788369060;
 bh=aeWrMUcqApAkMyHwtqqwnIzNZq14yKXCL4sXZg7QOZY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E3Fn5XZU1yXEvUrXAD+mquua1NYa85oiwm7i98l1iFtQrQwFrzHewy42OYfDLDUsd
 STBLB6XvY4s8R7sDvHiq0QUhjBdWvYihVI5KvfvzUKXjPammUeLd7PWfHSYmZXCl4B
 K6dblNQlSHdqAizsYaC4SwbNrWnTTQ0OkWSiv+cRkT/sQWwGn11xf665S+vY1RYb3Q
 +EjQ/bSIsFOVGKyOchYLvxk/muTRRmaut9q70XjhpPD6K06KZVLLHhJ9Se6KXpdzF7
 xHhSqGPnfLCjhEmHE9qB1bvE5TJpRYMmTypbRsD6cp05dIskXHDg2S10bV9ZfglBoh
 1VNf76itWaBxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 14/15] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902145343.465686-31-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
 <20260902145343.465686-31-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:10:59 +0000
Message-Id: <20260902171059.CF28F1F000E9@smtp.kernel.org>
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
- [High] Incomplete and inconsistent queue tagging for `PAGE_OFFLINE` ban r=
eason due to mutually exclusive list iteration in `xe_ttm_vram_purge_page()=
`.
- [Medium] Missing read memory barrier (`smp_rmb`) in `guc_exec_queue_reset=
_status()` allows speculative loads to mask the `PAGE_OFFLINE` ban reason.
- [Medium] Multi-queue primary status check in `guc_exec_queue_reset_status=
()` unconditionally masks the `PAGE_OFFLINE` reason for secondary queues.
--

commit 461fac78c1238596fc6141993bb5f0e31fd92773
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN

This commit extends the queue ban property UAPI to return a bitmask of ban
reasons rather than a boolean. It introduces GPU_HANG and PAGE_OFFLINE=20
reasons, tracking these via a new ban_reason atomic variable in xe_exec_que=
ue.

> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
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

[Severity: Medium]
When querying a secondary queue that was individually purged and killed
due to page offlining, won't this check unconditionally return the primary
queue's default status (GPU_HANG)? Because the primary queue wasn't explici=
tly
tagged by the purge, the secondary queue's PAGE_OFFLINE reason gets masked.

> +
> +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> +		u64 reason =3D atomic_read_acquire(&q->ban_reason);
> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason =3D DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;

[Severity: Medium]
Is a read memory barrier (smp_rmb) missing here?

In xe_ttm_vram_purge_page() located in drivers/gpu/drm/xe/xe_ttm_vram_mgr.c,
ban_reason is updated and then smp_wmb() is called before killing the VM
or queue. Concurrently, guc_exec_queue_reset_status() reads the state with
a relaxed load in exec_queue_killed_or_banned_or_wedged() and conditionally
reads ban_reason with an acquire load.=20

Without an smp_rmb() between the state load and the ban_reason load, the CPU
could speculatively load the old ban_reason (0) before observing the killed
state, resulting in userspace receiving a false GPU_HANG.

> +		return reason;
> +	}
> +
> +	return 0;
>  }

> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -637,7 +639,30 @@ static int xe_ttm_vram_purge_page(struct xe_device *=
xe, struct xe_bo *bo)
>  	xe_bo_unlock(bo);
>  	/*  Ban VM if BO is PPGTT */
>  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct xe_exec_queue *eq;
> +		int id;
> =20
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
> +		}

[Severity: High]
Does this mutually exclusive check cause PAGE_OFFLINE to be missed for cert=
ain
queues?

The lists vm->exec_queues.list and vm->preempt.exec_queues contain disjoint=
 sets
of queues. VM_BIND queues are explicitly excluded from vm->exec_queues.list=
, and
standard short-running queues are not in vm->preempt.exec_queues.

By iterating only one list based on the unrelated has_ctx_tlb_inval hardware
feature, the driver selectively tags only a subset of queues, leaving the
remaining offlined queues to falsely report a GPU_HANG.

> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM=
 */
>  		xe_vm_kill(vm, true);
>  		up_write(&vm->lock);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902145343.4656=
86-17-tejas.upadhyay@intel.com?part=3D14

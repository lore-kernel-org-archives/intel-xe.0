Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD47C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4A910E7B3;
	Mon, 31 Aug 2026 09:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aO17h5HZ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F1F10E7B3
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:40:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9615860120;
 Mon, 31 Aug 2026 09:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE3A1F000E9;
 Mon, 31 Aug 2026 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788169244;
 bh=6C/lJHc69WuKKjDD65ruKUiwpIdWdySJZt2EW9UH9o4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aO17h5HZgu7RqTHy+zGHhsSDobWRbbJKdm4J8DP5NxQL1g1S6xA8nLoczI1v66Blc
 nVQ66Tg6rn/Q3ZkQiOT8BXhwU+ZG+2kT0vE9qf7fffmurc/MO2vHu+I2UlRGSNZMzf
 JPMQjs4hi0RYzfyg6F9Zq5blSKu5z4wR61yVaEVQePE9FXfFKaGD/Vn4J2ssusPK72
 dTogG7tzwpsDiW3xeqxsqb1SrvyJmUmPoVqJb+bMCrXMWDOa6qg3Wxkvc//yh2/qRI
 wwdMTQSqvJ6ekmuMGTMTZBk+1CkID+Of8aia0rH7Q8g/aZfyA50BWL0zwzshr7XPCi
 /uMCdEPL+7WiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 14/15] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831064942.315720-31-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-31-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:40:43 +0000
Message-Id: <20260831094044.1EE3A1F000E9@smtp.kernel.org>
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
- [Critical] Concurrent iteration and modification of `vm->exec_queues.list=
` without proper mutual exclusion causes stack-out-of-bounds access and inf=
inite loops.
- [Medium] Missing smp_rmb() in guc_exec_queue_reset_status() allows load/s=
tore reordering, exposing an incorrect ban reason to userspace.
- [Medium] Non-LR queues are not killed synchronously by xe_vm_kill(), brea=
king the !exec_queue_killed() guard in the TDR and incorrectly tagging them=
 with GPU_HANG.
--

commit 2529eb6ad7ebee39de0f89892053dcc6cfd7d3f5
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN

This commit extends the DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN query to return a
bitmask indicating the reason for the queue ban. It adds a ban_reason field=
 to
the queue state, updating it on GPU hang timeouts or when backing VRAM pages
are taken offline.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..0a6e2b81b5a53 100644
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
Since xe_vm_kill() only synchronously kills LR queues by iterating over
vm->preempt.exec_queues, non-LR queues continue running after a page offline
event until they eventually hang. When the TDR executes for these non-LR
queues, won't this check evaluate to true because they were never formally
killed by xe_vm_kill()?

If so, this seems to incorrectly tag consequence timeouts on non-LR queues
as DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, contradicting the intent of this
guard.

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
Is an smp_rmb() missing before this atomic_read_acquire()?

The writer side in xe_ttm_vram_purge_page() uses an smp_wmb() after setting
the ban_reason and before triggering the state change. However, on this
reader side, the relaxed reads in exec_queue_killed_or_banned_or_wedged() o=
nly
provide a control dependency, which does not guarantee load-load ordering.
Because atomic_read_acquire() does not prevent prior loads from being
reordered after it, couldn't the CPU speculatively read ban_reason before
checking the queue state?

If this reordering occurs, the reader would see a ban_reason of 0 and
incorrectly default to GPU_HANG, masking the PAGE_OFFLINE reason.

> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason =3D DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> +		return reason;
> +	}
> +
> +	return 0;
>  }
> =20
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 456ea78a31e2a..ca97fa8291c43 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
[ ... ]
> @@ -597,7 +599,22 @@ static int xe_ttm_vram_purge_page(struct xe_device *=
xe, struct xe_bo *bo)
>  	xe_bo_unlock(bo);
>  	/*  Ban VM if BO is PPGTT */
>  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct xe_exec_queue *eq;
> +		int id;
> +
>  		down_write(&vm->lock);
> +		if (xe->info.has_ctx_tlb_inval) {
> +			down_read(&vm->exec_queues.lock);
> +			for (id =3D 0; id < ARRAY_SIZE(vm->exec_queues.list); id++)
> +				list_for_each_entry(eq, &vm->exec_queues.list[id],
> +						    vm_exec_queue_link)
> +					atomic_or(q_flag, &eq->ban_reason);
> +			up_read(&vm->exec_queues.lock);

[Severity: Critical]
Is it safe to iterate vm->exec_queues.list while holding only a read lock on
vm->exec_queues.lock?

It appears send_tlb_inval_ctx_ppgtt() also acquires only a read lock on
vm->exec_queues.lock, but it actively mutates this same list by temporarily
using list_move_tail() to move items to a stack-allocated list.

If xe_ttm_vram_purge_page() traverses the list under down_read() while
send_tlb_inval_ctx_ppgtt() is moving elements, could the traversal pointer
follow elements into the stack frame of send_tlb_inval_ctx_ppgtt(), causing
an out-of-bounds access or an infinite loop? Should this use down_write()
instead?

> +		} else {
> +			list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> +				atomic_or(q_flag, &eq->ban_reason);
> +		}
> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM=
 */
>  		xe_vm_kill(vm, true);
>  		up_write(&vm->lock);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831064942.3157=
20-17-tejas.upadhyay@intel.com?part=3D14

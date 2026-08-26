Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F9FC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 14:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D153A10E2A0;
	Wed, 26 Aug 2026 14:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZK8uQY/f";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1FC10E27F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 14:20:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A09E8600C4;
 Wed, 26 Aug 2026 14:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D951F000E9;
 Wed, 26 Aug 2026 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787754001;
 bh=dYtNz+C0MTeVrJazfKg2QlS1vpqoIhYPGNYYYe1rqgo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZK8uQY/fsy/NjJHhFU0+mq9YIGdSdockP6PhDLELA7sPcOM+JyCFahWCY/y22V0ik
 NAlcGPKGGOn4nw211KLIfnKrIwqdXOolrl0g+eRbX2F1A0WwBotq3xLSdRT7D6X8zJ
 D/bCqwUW9WyY2FIe0asqRsOaSQpGSZwwMO5VYe3aPLhDjiUO/R2O1ilg5oh5xgbbCA
 AdidpBkxm2cPi/n97Ct8ln25302q7mL0z4gM3cYv1P0eknYu2cZzioVGSqREhvmgot
 2rYodOlmNVZfsfZRp752Tf1gG6eeLqQ/kzNZPEW4VWTyfNiYugvs6Ry/qzLR/qFfSS
 P9Kx/1CNWy6mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 13/14] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260826135136.204044-29-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-29-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 14:20:00 +0000
Message-Id: <20260826142001.03D951F000E9@smtp.kernel.org>
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
- [Critical] Concurrent iteration and mutation of `vm->exec_queues.list` us=
ing only `down_read` causes list and kernel stack corruption.
- [Medium] The PAGE_OFFLINE ban reason is hidden for non-LR queues until TD=
R fires, defeating the logic to prevent GPU_HANG masking.
- [Medium] Missing read memory barrier before checking `ban_reason` allows =
speculative out-of-order execution, causing the UAPI to report a stale stat=
us.
--

commit f03e51ea5f032e49889009d1894c9441c7fe6525
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN

Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask indicating
the reason for the ban, rather than a simple boolean. This allows
userspace to distinguish between different ban causes.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 99d8c807ff056..0a6e2b81b5a53 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
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
Will this properly mask the GPU_HANG bit for non-LR (legacy) queues?

When xe_ttm_vram_purge_page() sets PAGE_OFFLINE on non-LR queues, it calls
xe_vm_kill(). However, xe_vm_kill() only explicitly iterates and kills LR
queues (those in &vm->preempt.exec_queues).=20

Since non-LR queues are not explicitly marked as killed, wouldn't this check
evaluate to true and still incorrectly append the GPU_HANG reason when the
doomed non-LR queue eventually times out?

>  	set_exec_queue_banned(q);
> =20
>  	/* Kick job / queue off hardware */
[ ... ]
> @@ -2580,13 +2590,29 @@ static void guc_exec_queue_multi_queue_drop_suspe=
nd(struct xe_exec_queue *q)
[ ... ]
> -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
[ ... ]
> -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
> +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> +		u64 reason =3D atomic_read_acquire(&q->ban_reason);
> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason =3D DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> +		return reason;
> +	}

[Severity: Medium]
Does this sequence allow for a stale or speculative status read?

Because the condition (exec_queue_killed_or_banned_or_wedged) is evaluated
using a relaxed atomic read, there is only a control dependency before
atomic_read_acquire() on q->ban_reason.

On weakly-ordered architectures, the CPU can speculatively load q->ban_reas=
on
before the state check. If the speculative read happens right as
xe_ttm_vram_purge_page() is updating the status, couldn't reason evaluate t=
o 0
and spuriously default to GPU_HANG instead of PAGE_OFFLINE? Would an smp_rm=
b()
be required here to properly order the reads?

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index af9e1fa868d7f..8f583f1631bf4 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -596,7 +598,22 @@ static int xe_ttm_vram_purge_page(struct xe_device *=
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
Is it safe to iterate vm->exec_queues.list while holding only the lock in
read mode?

Currently, the MMU notifier paths like xe_svm_invalidate() submit TLB
invalidations by calling send_tlb_inval_ctx_ppgtt(). That function also tak=
es
down_read(&vm->exec_queues.lock) but then it mutates the list, moving items
using list_move_tail(&q->vm_exec_queue_link, &tlb_inval_list) onto a local
stack variable.

If the shrinker triggers this purge_page path concurrently with the MMU
notifier, both will execute concurrently because they both hold the lock us=
ing
down_read().

Could the list_for_each_entry() iterator here follow pointers into the stack
frame of send_tlb_inval_ctx_ppgtt(), resulting in list/kernel stack
corruption and arbitrary memory writes when atomic_or() is called?

> +		} else {
> +			list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> +				atomic_or(q_flag, &eq->ban_reason);
> +		}
> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM=
 */
>  		xe_vm_kill(vm, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826135136.2040=
44-16-tejas.upadhyay@intel.com?part=3D13

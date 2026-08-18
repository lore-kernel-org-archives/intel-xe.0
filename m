Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE648C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C2310E4A4;
	Tue, 18 Aug 2026 10:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+r+AERO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F6A10E4A4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:58:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C062643C50;
 Tue, 18 Aug 2026 10:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8482E1F000E9;
 Tue, 18 Aug 2026 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787050704;
 bh=P0dEufqmAY9A+SdtVYmzp1u/0WyAd2JYJXkv9w4Sc7w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=V+r+AERObIDSXKevWsEyj79H8oTf/Z2xeZkWPwLzVQSUxwlvJNXxEabbmvr5tA2FW
 FG5N40XiOiUZg9VPrZHoeP8cfNJb4t2lAlJATEBV9Fu8i9PaPv82m/dPEbVxK16fk6
 BqfLPiaUTLv60n4RaJ8s5kPHdvmc3HBcFyQLYbYJgArT5vkUXllcAInfSkALHh2NRp
 B0i6E0VQJas2CdyHYxagta03GVIPC1Ec4qMylCPW3i9rtgA/OYsMFiKlWC0mVzZwuY
 oNMavEAjc+ZhQ4GXzFBI7Th5+vtwJAvzkhefP2RMEUFIZYmgFxYajHkL/5hWnq3tKg
 5O+k32/Cvb5pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V17 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260818104055.3833974-25-tejas.upadhyay@intel.com>
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
 <20260818104055.3833974-25-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:58:24 +0000
Message-Id: <20260818105824.8482E1F000E9@smtp.kernel.org>
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
- [Medium] Missing memory barrier in guc_exec_queue_reset_status allows spe=
culative reads to mask PAGE_OFFLINE reason.
- [Medium] Non-LR (traditional) exec queues fail to inherit the PAGE_OFFLIN=
E ban reason when a VM page table is purged.
- [Medium] The PAGE_OFFLINE ban reason is masked and lost for multi-queue s=
etups if a secondary queue's LRC BO is purged.
--

--- Patch [11]: [PATCH V17 11/12] drm/xe/uapi: Expose ban reason in EXEC_QU=
EUE_GET_PROPERTY_BAN ---
commit 45e4d4a3182723f090e735c94ca31b96821f9856
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>

drm/xe/uapi: Expose ban reason in EXEC_QUEUE_GET_PROPERTY_BAN

Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask indicating
the reason for the ban, rather than a simple boolean.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2570,13 +2580,25 @@ static void guc_exec_queue_multi_queue_drop_suspe=
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
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		u64 status =3D guc_exec_queue_reset_status(xe_exec_queue_multi_queue_p=
rimary(q));
> +
> +		if (status)
> +			return status;
> +	}

[Severity: Medium]
If a secondary queue's LRC BO is purged, xe_ttm_vram_purge_page() will tag
the secondary queue with the PAGE_OFFLINE ban reason. However, since this
delegates to the primary queue here, won't this mask the secondary queue's
specific reason if the primary queue defaults to GPU_HANG?

> +
> +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> +		u64 reason =3D atomic_read_acquire(&q->ban_reason);

[Severity: Medium]
Is a memory barrier needed here before reading the ban reason?

When a CPU reads the queue status in guc_exec_queue_reset_status()
concurrently with xe_ttm_vram_purge_page() updating it, there is a control
dependency (the if block) before using atomic_read_acquire() on the ban
reason.

Since control dependencies do not order subsequent reads against preceding
reads, could the CPU speculatively execute the ban_reason read before the
state read resolves?

If it observes a 0, it would incorrectly default to GPU_HANG instead of
PAGE_OFFLINE. Should we add an smp_rmb() before reading the ban_reason?

> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason =3D DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> +		return reason;
> +	}
> +
> +	return 0;
>  }

> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -596,7 +597,12 @@ static int xe_ttm_vram_purge_page(struct xe_device *=
xe, struct xe_bo *bo)
>  	xe_bo_unlock(bo);
>  	/*  Ban VM if BO is PPGTT */
>  	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct xe_exec_queue *eq;
> +
>  		down_write(&vm->lock);
> +		list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> +			atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &eq->ban_reason);

[Severity: Medium]
Does this loop miss non-LR (traditional) exec queues sharing the same VM?

This iterates strictly over vm->preempt.exec_queues, which only contains LR
queues. If a non-LR queue is associated with a purged VM, it seems it will
fail to inherit the PAGE_OFFLINE ban reason.

It would then eventually time out, trigger the TDR, and be tagged with the
default GPU_HANG reason, which might provide misleading information to
userspace.

> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM=
 */
>  		xe_vm_kill(vm, true);
>  		up_write(&vm->lock);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818104055.3833=
974-14-tejas.upadhyay@intel.com?part=3D11

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D99C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2635910F13F;
	Wed,  9 Sep 2026 12:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nM1zjYC0";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A210F13F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:58:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E411B60211;
 Wed,  9 Sep 2026 12:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7901A1F00A3A;
 Wed,  9 Sep 2026 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958688;
 bh=RLil/2RkUDkj9sEhyDrXPqQl2k1pFl/RNdW8mjyrx2w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nM1zjYC0NjLriZ1NR0uXRdkqW7QxjmA1pfHAYcX2WUINdT5LX1RD0W1deSFrrkl6P
 +F/qYZhTePRPq9Tk3KnEI+lCCAJwUOvMLVnDpuRwyOcMXl8HWALERgKgmdBBfE37C9
 RODewZIEvtAGHGcHWu7sGgzsVUlyOOuYGmv8oGObYn5FEzVE1yC47WFxsyq0e5V6Sx
 6dKMGLBv7DhhHC52hDal+uXL6bYLtNbpNrwrlXZAYVYHSHlYLkcspJDhtwpwc+pP2t
 eF5XK4B2X/v0LBgHEp7sU/Cm6Ai7b26IpArc3oiOkqh7bXmcchRTZz9wLttCGOnaDF
 +aB8sXC/0L89w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 04/21] drm/xe: Implement xe_access_counter_handler
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-27-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-27-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:58:08 +0000
Message-Id: <20260909125808.7901A1F00A3A@smtp.kernel.org>
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
- [High] Missing guard for USM disabled state or uninitialized queue in `xe=
_access_counter_handler` causes division by zero, uninitialized spinlock us=
age, and NULL pointer dereference.
- [High] Use-after-free of `pagefault_wq` when queuing access counter work =
during device teardown or unbind.
- [Medium] Unconditional `drm_warn` when the access counter queue is full c=
auses kernel log flooding.
--

commit 4068a8bc69a082a892fb80bc8c9a526e108c2eb2
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Implement xe_access_counter_handler

This commit implements the access counter handler to process G2H
notifications from the GuC. It pushes access counter events into a queue
and schedules a worker on the pagefault workqueue to process them.

> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/=
xe_access_counter.c
> index ae939576b72da..6920e52cf1543 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c

[ ... ]

> @@ -90,6 +96,22 @@ int xe_access_counter_init(struct xe_device *xe)
>   */
>  int xe_access_counter_handler(struct xe_device *xe, struct xe_access_cou=
nter *ac)
>  {
> -	/* Stub implementation - to be filled in */
> -	return 0;
> +	struct xe_usm_queue *ac_queue =3D &xe->usm.ac_queue;
> +	int idx;
> +	unsigned long flags;
> +	bool full;
> +
> +	spin_lock_irqsave(&ac_queue->lock, flags);

[Severity: High]
What happens in xe_access_counter_handler() if the USM subsystem is disable=
d?

If xe->info.has_usm is false, xe_access_counter_init() will exit early with=
out
allocating ac_queue->data, setting ac_queue->size, or initializing the
spinlock.

If the hardware or GuC firmware sends a G2H notification anyway (due to an
unexpected state or buggy firmware), will this unconditionally acquire an
uninitialized lock?

Furthermore, xe_usm_queue_full() will evaluate to false due to underflow,
causing xe_usm_queue_push() to perform a modulo by zero on q->size and a
memcpy() to a NULL ac_queue->data pointer. Is an early return guard needed
here to verify USM is fully initialized?

> +	idx =3D xe_access_counter_work_index(xe);
> +	full =3D xe_usm_queue_full(ac_queue);
> +	if (!full) {
> +		xe_usm_queue_push(ac_queue, ac);
> +		queue_work(xe->usm.pagefault_wq, &xe->usm.ac_workers[idx].work);

[Severity: High]
During device unbind or driver removal, can xe->usm.pagefault_wq be used
after it is freed?

Because devres executes cleanup actions in reverse order of registration,
xe_pagefault_fini() destroys pagefault_wq before the GuC is stopped and
IRQs are uninstalled (which were registered earlier in probe).

If an access counter notification arrives during this teardown window,
could we queue work to a destroyed workqueue?

> +	} else {
> +		drm_warn(&xe->drm,
> +			 "AccessCounter Queue full, shouldn't be possible\n");

[Severity: Medium]
Could this unconditional warning flood the kernel log?

If the consumer worker is delayed, or if the hardware generates access
counter notifications at a high rate, the queue will fill up.

Once full, this handler will unconditionally print the warning for every
subsequent event, which bypasses rate-limiting. Would drm_warn_ratelimited()
be safer to use here?

> +	}
> +	spin_unlock_irqrestore(&ac_queue->lock, flags);
> +
> +	return full ? -ENOSPC : 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D4

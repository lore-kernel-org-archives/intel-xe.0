Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3215C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40D610F68B;
	Thu,  3 Sep 2026 15:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VVcijMUR";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF69910E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:20:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E581A60A57;
 Thu,  3 Sep 2026 15:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A2091F00A3A;
 Thu,  3 Sep 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788448806;
 bh=LwGF/Z2ehKKmVJk5Z+qwMmQZ6g+kBIgRi75/7bUG1ak=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VVcijMURqdOeB7nW1vrbDF+qqVZVYaXCleaSJqrqs4JXagBkQwt8zDm9DFVJWOqm8
 3Lzg8ui5FJBk0wA0q67iRG8l+DZrLVDAwskcrrkx5gL2M2tdJHmliRD5o1RKkcFid2
 jGU6tosYY8EIV5gQCICdW5THmI20BN0SsidPCyT669UREo/9R1hWC39/1uAIABXbnM
 L05qz7lWX36FtNWb8Ta2giivurSK56tFgWt+s4/2VHgE7iQXdfKQMszygzL4YgotAh
 RqOoSOShQA94yKDy1Df+PAcULJ34CPyFG28J4FU6ZGhiezRZnDKB8XitEgAjPjlOFc
 KFmBHAnGor1Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/27] drm/xe/eudebug: Add ufence events with acks
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-12-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-12-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:20:06 +0000
Message-Id: <20260903152006.7A2091F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] A race condition in `xe_eudebug_ufence_track` during debugger deta=
chment leaves `ufence->eudebug.bind_ref_seqno` uncleared, triggering a `XE_=
WARN_ON` during ufence destruction.
- [High] Unbounded non-accounted kernel memory allocation in `xe_eudebug_tr=
ack_ufence` allows a malicious debugger to exhaust system memory (DoS).
--

commit a5714f9c14ecadc50ce9b02c008c2b316e1293f6
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>

drm/xe/eudebug: Add ufence events with acks

This commit introduces ufence event tracking for the Xe eudebug interface.
It allows the debugger to intercept workloads and stall the delivery of
ufence signals until the debugger explicitly acknowledges the ufence via a
new ioctl.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> index fe3b2ae06a31f..a1f07db6ad817 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
[ ... ]
> @@ -1038,11 +1155,169 @@ static int vm_bind_op(struct xe_eudebug *d, stru=
ct xe_vm *vm,
[ ... ]
> +void xe_eudebug_ufence_fini(struct xe_user_fence *ufence)
> +{
> +	struct xe_eudebug *d;
> +
> +	XE_WARN_ON(READ_ONCE(ufence->eudebug.bind_ref_seqno));
> +
> +	d =3D READ_ONCE(ufence->eudebug.debugger);
> +	if (!d)
> +		return;
> +
> +	/* last ref */
> +	ufence->eudebug.debugger =3D NULL;
> +
> +	xe_eudebug_put(d);
> +}
> +
> +static int xe_eudebug_track_ufence(struct xe_eudebug *d,
> +				   struct xe_user_fence *f,
> +				   u64 seqno)
> +{
> +	struct xe_eudebug_ack *ack;
> +	struct rb_node *old;
> +
> +	ack =3D kzalloc_obj(*ack, GFP_KERNEL);
> +	if (!ack) {
> +		eu_dbg(d, "ack allocation fail");
> +		return -ENOMEM;
> +	}

[Severity: High]
Can this unbounded allocation be exploited by a malicious debugger to exhau=
st
kernel memory?

The allocation here uses GFP_KERNEL without __GFP_ACCOUNT (which would char=
ge
it to the memory cgroup). A debugger could continuously read events via
DRM_XE_EUDEBUG_IOCTL_READ_EVENT to clear the FIFO, but never acknowledge th=
em
using DRM_XE_EUDEBUG_IOCTL_ACK_EVENT.

Because the ACKs and their associated ufences are only freed when explicitly
acknowledged by userspace, a target process looping VM_BINDs with ufences
could cause d->acks.tree to grow indefinitely until a system-wide
Out-Of-Memory (OOM) panic occurs.

> +
> +	ack->seqno =3D seqno;
> +	ack->ts_insert =3D ktime_get();
[ ... ]
> +bool xe_eudebug_ufence_track(struct xe_user_fence *ufence)
> +{
> +	struct xe_eudebug *d;
> +	bool tracked =3D false;
> +	int ret;
> +
> +	spin_lock(&ufence->eudebug.lock);
> +	d =3D ufence->eudebug.debugger;
> +	if (d && !kref_get_unless_zero(&d->ref))
> +		d =3D NULL;
> +
> +	if (!d || xe_eudebug_detached(d)) {
> +		ufence->eudebug.bind_ref_seqno =3D 0;
> +		ufence->eudebug.signalled_seqno =3D 0;
> +	}
> +	spin_unlock(&ufence->eudebug.lock);
> +
> +	if (!d)
> +		return false;
> +
> +	if (xe_eudebug_detached(d)) {
> +		xe_eudebug_put(d);
> +		return false;
> +	}

[Severity: High]
Is there a race condition here if the debugger detaches right after the lock
is released?

If xe_eudebug_detached(d) becomes true immediately after
spin_unlock(&ufence->eudebug.lock), this check will evaluate to true and
return false without clearing ufence->eudebug.bind_ref_seqno and
signalled_seqno.

Since false is returned, the caller user_fence_worker() will signal and
release the ufence. When the ufence is subsequently destroyed,
xe_eudebug_ufence_fini() will hit the
XE_WARN_ON(READ_ONCE(ufence->eudebug.bind_ref_seqno)) assertion because the
field was never cleared.

> +
> +	ret =3D track_ufence(d, ufence, &tracked);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D11

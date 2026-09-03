Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6207C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6E610F682;
	Thu,  3 Sep 2026 15:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dkQfHPZe";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6010F680
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:16:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AD6A9601EF;
 Thu,  3 Sep 2026 15:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383F21F000E9;
 Thu,  3 Sep 2026 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788448589;
 bh=jB+eV9RTMWuixGGagaAwZ7ZrSYorTJwpNUtC/UxD1Pc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dkQfHPZe0Gm5U0WJIfenQNidDenWMnSTj8WzSSsBlo6k7++45qXYjIWUlzCfm1HbT
 wXNaa1RjlvgTvSDMNmifBvzDiRc1TxPHVXeKPfLjyDrxRq4qYyweWo2FLHrpYfHc2u
 46d7HVRSHDkcj1XkcpEZjCGrfMxHGi0cURnfuEI5bWZYceUiibFsNvpu9ZgUUC2Uhd
 EewVEkR4z7ZtbmnDVZAjWgIE7Zo1r+wlf3YCRUjtOdAR93pm2GVs1QmxLufYs0Tdq8
 wgcMDoh/A2agcFv9Qk2cJoVqk8IZ7mnMLUv7Z2jVXGnOgwE30Azlgy0+zRshR53UfX
 oDML6oBwbfang==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/27] drm/xe/eudebug: Introduce eudebug interface
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-2-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-2-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:16:28 +0000
Message-Id: <20260903151629.383F21F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Pending events are inaccessible to the debugger after the target i=
s detached, violating the UAPI contract because the event queue is not drai=
ned.
--

commit 048c5c077c45df4be0f59a215d2b70b35b5c5301
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: drm/xe/eudebug: Introduce eudebug interface

This commit introduces the eudebug interface for the Xe driver. It allows=20
user-space debuggers to connect, track GPU resources, and listen for resour=
ce=20
creation and destruction events via a file descriptor.

> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> new file mode 100644
> index 0000000000000..9fe073f606801
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
[ ... ]
> +static int event_fifo_pending(struct xe_eudebug *d,
> +			      struct drm_xe_eudebug_event **pending)
> +{
> +	struct drm_xe_eudebug_event *e =3D d->events.pending;
> +	unsigned int len, copied;
> +
> +	lockdep_assert_held(&d->events.lock);
> +
> +	*pending =3D NULL;
> +
> +	if (xe_eudebug_detached(d))
> +		return -ENOTCONN;

[Severity: High]
If the target DRM client closes its file descriptor and detaches the debugg=
er=20
while there are still unread events in the kfifo (such as VM destruction=20
events), does this check prevent the debugger from reading them?

The UAPI documentation explicitly guarantees that -ENOTCONN is returned if =
the=20
debug target is gone and the queue has been drained. Should we allow the qu=
eue=20
to be drained before returning -ENOTCONN?

> +
> +	if (d->events.pending_occupied) {
> +		*pending =3D e;
> +		return 0;
> +	}
[ ... ]
> +static long xe_eudebug_read_event(struct xe_eudebug *d,
> +				  const u64 arg,
> +				  const bool wait)
> +{
> +	struct xe_device *xe =3D d->xe;
> +	struct drm_xe_eudebug_event __user * const user_orig =3D
> +		u64_to_user_ptr(arg);
> +	struct xe_eudebug *reader __free(reader_active) =3D NULL;
> +	struct drm_xe_eudebug_event *event_out __free(kvfree) =3D NULL;
> +	struct drm_xe_eudebug_event user_event;
> +	struct drm_xe_eudebug_event *pending;
> +	long ret =3D 0;
> +	int pending_len =3D 0;
> +	int fifo_ret;
> +
> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user=
_event))))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.type !=3D DRM_XE_EUDEBUG_EVENT_READ))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.len < sizeof(*user_orig)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.flags))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.seqno))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.reserved))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
> +		return -ENOTCONN;

[Severity: High]
Similarly, this short-circuits the read ioctl entirely if the target is=20
detached. Can this be modified to check if the queue is empty first, ensuri=
ng=20
the debugger can pull any pending events leading up to the target's termina=
tion?

> +
> +	if (test_and_set_bit_lock(XE_EUDEBUG_READER_ACTIVE, &d->flags))
> +		return -EBUSY;
> +
> +	reader =3D d;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D1

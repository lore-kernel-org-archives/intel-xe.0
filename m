Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB5C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F75210F687;
	Thu,  3 Sep 2026 15:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TtYLlXRM";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381510F687
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:22:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0097643D2E;
 Thu,  3 Sep 2026 15:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD48C1F00A3F;
 Thu,  3 Sep 2026 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788448944;
 bh=TV++4x1mtF63EZPQeU3Pd7lrT4ybDrIzXVkX0Cu7rw8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TtYLlXRMIgMLedlOslkxVvBklgyBpO4SieWurGIdG2qppYwIPK1ggm0u1Q2vQWLdY
 pQbZKJp//lw0B+UQRX6uwA2bE9yYd3F2whxKShw0l+bL7vEHxh7dISX3Ql9C615D30
 gu7NL3t8PVO6EIzE5EKl0vONhzffXzQEPrM2Ba+nhWt6bhAmceQsKE76GAorsSSTyc
 5yiMbntON3bPu581WZ50grohJfqaz6f3ZGDu7WW5mR+PiYrkdeDHTR4k1qbgvX1ZSp
 Sb3UPehortucpQOGA1jaJ3CztgixEXp770JjqPsF/l9eBHx22oG5pI+94v4ETz3Hax
 KMkhvc09QLxjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/27] drm/xe/eudebug: Introduce discovery for
 resources
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:22:23 +0000
Message-Id: <20260903152224.AD48C1F00A3F@smtp.kernel.org>
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
- [High] Global ordered workqueue stall via copy_from_user block while hold=
ing ioctl_lock.
- [Medium] Event sequence numbers (seqno) can be queued out-of-order in the=
 event stream due to a race between seqno generation and event queuing.
--

commit e2061e72d8e954a17bde35e9c970ee41bc2db0ad
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>

    drm/xe/eudebug: Introduce discovery for resources

This commit introduces a resource discovery mechanism for debugger connecti=
ons.
When a debugger connects, all existing resources for the target client are
relayed as events via an ordered workqueue, and DRM ioctls are blocked using
an rw_semaphore until discovery is complete.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 032a7ec5fbc8d..f10959b898297 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> @@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsigned=
 int cmd, unsigned long arg)
> =20
>  	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>  	ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
> -	if (ret >=3D 0)
> +	if (ret >=3D 0) {
> +		bool lock =3D xe_eudebug_discovery_lock(file, cmd);
>  		ret =3D drm_ioctl(file, cmd, arg);

[Severity: High]
Does holding the discovery lock across drm_ioctl() create a vector for a
workqueue stall?=20

If an unprivileged user maps the ioctl argument pointer to a blocking FUSE
or userfaultfd region, drm_ioctl() can be stalled indefinitely during
copy_from_user() while holding xef->eudebug.ioctl_lock for read.

> +		if (lock)
> +			xe_eudebug_discovery_unlock(file, cmd);
> +	}
> =20
>  	return ret;
>  }
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eude=
bug.c
> index 835dbd7309af5..7a5b14346e059 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
[ ... ]
> @@ -659,6 +705,87 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, stru=
ct xe_vm *vm)
>  	xe_eudebug_put(d);
>  }
> =20
> +static struct xe_file *xe_eudebug_target_get(struct xe_eudebug *d)
> +{
[ ... ]
> +static void discover_client(struct xe_eudebug *d)
> +{
> +	struct xe_file *xef;
> +	struct xe_vm *vm;
> +	unsigned long i;
> +	unsigned int vm_count =3D 0;
> +	int err =3D 0;
> +
> +	xef =3D xe_eudebug_target_get(d);
> +	if (!xef) {
> +		complete_all(&d->discovery);
> +		return;
> +	}
> +
> +	/*
> +	 * An xe_eudebug ref is taken for the discovery worker, which holds a
> +	 * ref to the target xe_file; the xe_file in turn holds the vm and
> +	 * exec_queue refs.
> +	 *
> +	 * All the relevant ioctls that manipulate the xe_file resources eudebug
> +	 * cares about are gated behind down_read(&xef->eudebug.ioctl_lock).
> +	 * Thus taking the write lock excludes all those ioctls, which lets us
> +	 * peek into the resource lists without taking their individual locks.
> +	 */
> +	down_write(&xef->eudebug.ioctl_lock);

[Severity: High]
If the target process is blocked in copy_from_user() inside drm_ioctl()
while holding the read lock, will this down_write() block indefinitely?

Because discovery runs on a global ordered workqueue (configured below in
xe_eudebug_init), this single blocked work item could stall all eudebug
discovery operations system-wide, causing a Denial of Service for all
debugger connections.

> +
> +	if (xe_eudebug_detached(d))
> +		goto out;
[ ... ]
> @@ -1126,12 +1266,20 @@ void xe_eudebug_init_early(struct xe_device *xe)
>  void xe_eudebug_init(struct xe_device *xe)
>  {
>  	struct drm_device *dev =3D &xe->drm;
> +	struct workqueue_struct *wq;
>  	int err;
> =20
>  	/* early init failed */
>  	if (xe->eudebug.cap_state =3D=3D XE_EUDEBUG_CAP_NOT_SUPPORTED)
>  		return;
> =20
> +	wq =3D drmm_alloc_ordered_workqueue(dev, "xe-eudebug-discovery", 0);

[Severity: High]
This allocates the workqueue as ordered (max_active=3D1), which means a sin=
gle
stalled work item blocks all other discovery work.

Can the workqueue be allocated differently, or can the ioctl_lock be managed
to avoid wrapping the copy_from_user() operations in drm_ioctl()?

> +	if (IS_ERR(wq)) {
> +		err =3D PTR_ERR(wq);
> +		goto out_err;
> +	}
> +	xe->eudebug.discovery_wq =3D wq;
> +
>  	err =3D sysfs_create_file(&dev->dev->kobj,
>  				&dev_attr_enable_eudebug.attr);
>  	if (err)
[ ... ]

[Severity: Medium]
Can sequence numbers be queued out-of-order in the event stream?

Looking at send_vm_bind_event() in xe_eudebug.c:

	*seqno =3D atomic_long_inc_return(&d->events.seqno);

	spin_lock(&d->events.lock);
	event =3D xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND,
					 *seqno, base_flags, sz);

Since the sequence number is incremented atomically outside of the FIFO
spinlock, could two threads acquire sequence numbers N and N+1, but acquire
the FIFO lock in reverse order?

This same pattern appears in _xe_eudebug_add_handle(). Pushing N+1 before
N would break the expected monotonicity of the event stream and could cause
the debugger to drop events.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903145952.8480=
51-1-mika.kuoppala@linux.intel.com?part=3D4

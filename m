Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DDFC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D71A10E69A;
	Mon,  7 Sep 2026 13:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J90wU9Eq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32110E69A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788787486; x=1820323486;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=jXcUem++54xjhIYdXSyZ4JYYIyEfiX3kBtjmOOIvrAI=;
 b=J90wU9EqAd3RGsG45Q8TmKuYtb6SQkDYncLe7zmF7Zuv3vvs9DDpj3pa
 vKpR/xa+T4cBhD4uu8XqOn5cGm2O5O0UFOJIMqm7Cct7seH8AwmxQhh+Q
 dmkUZRFcDtct9CeTouXvyM/4ScdzFADJd6OuI66SvdsTHU1Ci0rhE0z8x
 czSTDGfZs73vAj0d7U8PFIFjJoVKK40521gSlGYzThd8aWqB6HPjhcFPl
 B08Z/UgNtRtkw/3xcPXTb8X6lRCc1/pER48iOZiiWVRp4bet3fTCpiGyf
 EcC0s61jpN60BGO12K9ZDoD1RK0MwFAQ2JBNaq9m5EsCSk26Hbx13kMPO A==;
X-CSE-ConnectionGUID: 94lR5Lg1SYu/zSecduvkqg==
X-CSE-MsgGUID: unwH/kUzRdaiek5yeEg2xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100712402"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100712402"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:24:45 -0700
X-CSE-ConnectionGUID: wA33RQEMSwinpFLzwJLb/A==
X-CSE-MsgGUID: oUfhni57TIauRg2+3Gxl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="294186705"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.184])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:24:44 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260903152224.AD48C1F00A3F@smtp.kernel.org>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
 <20260903152224.AD48C1F00A3F@smtp.kernel.org>
Subject: Re: [PATCH v10 04/27] drm/xe/eudebug: Introduce discovery for
 resources
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev
Date: Mon, 07 Sep 2026 16:24:40 +0300
Message-ID: <178878748003.179185.16833574173741290547@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Quoting sashiko-bot@kernel.org (2026-09-03 18:22:23)
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Global ordered workqueue stall via copy_from_user block while ho=
lding ioctl_lock.
> - [Medium] Event sequence numbers (seqno) can be queued out-of-order in t=
he event stream due to a race between seqno generation and event queuing.
> --
>=20
> commit e2061e72d8e954a17bde35e9c970ee41bc2db0ad
> Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>=20
>     drm/xe/eudebug: Introduce discovery for resources
>=20
> This commit introduces a resource discovery mechanism for debugger connec=
tions.
> When a debugger connects, all existing resources for the target client are
> relayed as events via an ordered workqueue, and DRM ioctls are blocked us=
ing
> an rw_semaphore until discovery is complete.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_dev=
ice.c
> > index 032a7ec5fbc8d..f10959b898297 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
> > @@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsign=
ed int cmd, unsigned long arg)
> > =20
> >       ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> >       ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
> > -     if (ret >=3D 0)
> > +     if (ret >=3D 0) {
> > +             bool lock =3D xe_eudebug_discovery_lock(file, cmd);
> >               ret =3D drm_ioctl(file, cmd, arg);
>=20
> [Severity: High]
> Does holding the discovery lock across drm_ioctl() create a vector for a
> workqueue stall?=20
>=20
> If an unprivileged user maps the ioctl argument pointer to a blocking FUSE
> or userfaultfd region, drm_ioctl() can be stalled indefinitely during
> copy_from_user() while holding xef->eudebug.ioctl_lock for read.

Don't think this is a very realistic vector to address, as it would
also extend to every other copy_from_user() and also to userptr across
all drivers.

Having a malfunctioning FUSE driver and getting a malfunctioning system
as a result is probably somewhat expected.

<SNIP>

> > +     if (IS_ERR(wq)) {
> > +             err =3D PTR_ERR(wq);
> > +             goto out_err;
> > +     }
> > +     xe->eudebug.discovery_wq =3D wq;
> > +
> >       err =3D sysfs_create_file(&dev->dev->kobj,
> >                               &dev_attr_enable_eudebug.attr);
> >       if (err)
> [ ... ]
>=20
> [Severity: Medium]
> Can sequence numbers be queued out-of-order in the event stream?
>=20
> Looking at send_vm_bind_event() in xe_eudebug.c:
>=20
>         *seqno =3D atomic_long_inc_return(&d->events.seqno);
>=20
>         spin_lock(&d->events.lock);
>         event =3D xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIN=
D,
>                                          *seqno, base_flags, sz);
>=20
> Since the sequence number is incremented atomically outside of the FIFO
> spinlock, could two threads acquire sequence numbers N and N+1, but acqui=
re
> the FIFO lock in reverse order?
>=20
> This same pattern appears in _xe_eudebug_add_handle(). Pushing N+1 before
> N would break the expected monotonicity of the event stream and could cau=
se
> the debugger to drop events.

There is no expected monotonicity of the event stream, the seqno exists
exactly to address the non-linear nature of the event stream. It's up to
userspace to queue events and re-order them.

We should probably try to add this to kerneldoc to avoid false positives
in future.

Regards, Joonas

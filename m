Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF27C52D7B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 12:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6510E329;
	Tue, 13 Aug 2024 12:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h97GeE40";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8797710E329
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551871; x=1755087871;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3P1TSfr9aGqs8QKrceYruoWY5wOzR7IJ0z6UCEhI36E=;
 b=h97GeE40zGU1ASX0pg/GxbHOSe/k0+mBed3TD2+dgyxPWdkRY3QU/9Kn
 VNjCiE//JNikoPiVqogH2BUz491qRZEt1i0XYpT5dZ7Hp4pgPrXQepGTY
 xvB5Q8kmLmIale4cEnl9sLI/ajSXfr35KgHOlmXAEHfq92pEEMBcGkv7O
 4UEh1tpsSwd7nQaeXM2CK2Kbb7FxeMmKDYKyG0A/eY03oMiMLkq0e78NA
 QWl9VDmAWKM+5JfwiL3EhwawvSs30Vs+ilpGcDHKmaoxvtfXcDtikbHtr
 i68gfCSpVWv9jwnCk9yi+1GFAemrwE1o7lZcCXQL7vLwG8cpJKkhA/JH4 w==;
X-CSE-ConnectionGUID: OVNycMx7ScOje+RbMALQDw==
X-CSE-MsgGUID: CIWbIPpBReyk92pWh7R3KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25576564"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25576564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:24:31 -0700
X-CSE-ConnectionGUID: RwbtyHpRRt2BWp1Cillsyg==
X-CSE-MsgGUID: ytLXwo0PRIu0LrK7YBS5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58614417"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.169])
 ([10.245.244.169])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:24:29 -0700
Message-ID: <3ea93f190b62c3f320abe150d00d06eeada07b25.camel@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 14:24:27 +0200
In-Reply-To: <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
 <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Wed, 2024-07-17 at 20:09 +0000, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> > Add helpers to safely add and delete the exec queues attached to a
> > hw
> > engine group, and make use them at the time of creation and
> > destruction
> > of the exec queues. Keeping track of them is required to control
> > the
> > execution mode of the hw engine group.
> >=20
>=20
> Missed a few more things...
>=20
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c |=C2=A0 7 +++++
> > =C2=A0drivers/gpu/drm/xe/xe_hw_engine.c=C2=A0 | 45
> > ++++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_hw_engine.h=C2=A0 |=C2=A0 4 +++
> > =C2=A03 files changed, 56 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 0ba37835849b..645423a63434 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> > =C2=A0			xe_exec_queue_put(eq);
> > =C2=A0	}
> > =C2=A0
> > +	if (q->vm)
>=20
> I think this code path can be called GSC exec queues which don't have
> a
> q->hwe->hw_engine_group. So I think:
>=20
> if (q->vm && q->hwe->hw_engine_group)
> 	xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group,
> q);
>=20
> > +		xe_hw_engine_group_del_exec_queue(q->hwe-
> > >hw_engine_group, q);
> > +
> > =C2=A0	q->ops->fini(q);
> > =C2=A0}
> > =C2=A0
> > @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct
> > drm_device *dev, void *data,
> > =C2=A0			if (XE_IOCTL_DBG(xe, err))
> > =C2=A0				goto put_exec_queue;
> > =C2=A0		}
> > +
> > +		err =3D xe_hw_engine_group_add_exec_queue(q->hwe-
> > >hw_engine_group, q);
>=20
> So this only called on non-VM bind exec queues. I think techincally
> this
> wrong as VM bind exec queues can use dma-fences plus the copy engine.
> I
> plan dropping the copy engine for these [1] and I don't think it
> worth
> fixing VM bind path with mode switching if we only are going to drop
> this requirement soon. Let me just respin [1] and hopefully we can
> prioritize though reviews so these two series land at roughly the
> same
> time.=20
>=20
> [1]
> https://patchwork.freedesktop.org/patch/582003/?series=3D125608&rev=3D5


Matt, Francois

I have expressed concerns a couple of times about ripping out the
capability of gpu binding, mainly for two reasons.

1) I think a pretty common use-case for a bo is
a) clearing/readback
b) binding

If we can have those executed by the same exec_queue then the binding's
dependencies are implicitly resolved and no latency incurred. If
executed by the cpu, we have to add the latency of signalling the
clearing fence and waking up the executing thread.

2) Considering using page-table bos out of non-mappable VRAM.

It's entirely possible these concerns were considered non-valid at some
point but in case they weren't, just a reminder.

How difficult would it be to perform the switching also on these VM
binds?

/Thomas

>=20
> > +		if (err)
> > +			goto put_exec_queue;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	mutex_lock(&xef->exec_queue.lock);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index f8df85d25617..4dcc885a55c8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct
> > xe_hw_engine *hwe)
> > =C2=A0{
> > =C2=A0	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe-
> > >mmio_base));
> > =C2=A0}
> > +
> > +/**
> > + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw
> > engine group
> > + * @group: The hw engine group
> > + * @q: The exec_queue
> > + *
> > + * Return: 0 on success,
> > + *	=C2=A0=C2=A0=C2=A0 -EINTR if the lock could not be acquired
> > + */
> > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group
> > *group, struct xe_exec_queue *q)
> > +{
> > +	int err;
> > +
>=20
> Also assert here this is not a VM bind queue (e.g. EXEC_QUEUE_FLAG_VM
> is
> clear).
>=20
> > +	err =3D down_write_killable(&group->mode_sem);
> > +	if (err)
> > +		return err;
> > +
> > +	list_add(&q->hw_engine_group_link, &group-
> > >exec_queue_list);
>=20
> I don't see where INIT_LIST_HEAD is called on group->exec_queue_list.
> I
> think that should unconditionally be done in __xe_exec_queue_alloc.
>=20
> Matt
>=20
> > +	up_write(&group->mode_sem);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from
> > a hw engine group
> > + * @group: The hw engine group
> > + * @q: The exec_queue
> > + *
> > + * Return: 0 on success,
> > + *	=C2=A0=C2=A0=C2=A0 -EINTR if the lock could not be acquired
> > + */
> > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group
> > *group, struct xe_exec_queue *q)
> > +{
> > +	int err;
> > +
> > +	err =3D down_write_killable(&group->mode_sem);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!list_empty(&group->exec_queue_list))
> > +		list_del(&q->hw_engine_group_link);
> > +	up_write(&group->mode_sem);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
> > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > index 7f2d27c0ba1a..ce59d83a75ad 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > @@ -9,6 +9,7 @@
> > =C2=A0#include "xe_hw_engine_types.h"
> > =C2=A0
> > =C2=A0struct drm_printer;
> > +struct xe_exec_queue;
> > =C2=A0
> > =C2=A0#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > =C2=A0#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MI=
N
> > @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct
> > xe_hw_engine *hwe)
> > =C2=A0const char *xe_hw_engine_class_to_str(enum xe_engine_class class)=
;
> > =C2=A0u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> > =C2=A0
> > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group
> > *group, struct xe_exec_queue *q);
> > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group
> > *group, struct xe_exec_queue *q);
> > +
> > =C2=A0#endif
> > --=20
> > 2.43.0
> >=20


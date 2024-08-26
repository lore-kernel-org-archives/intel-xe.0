Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A79C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 07:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D7B10E102;
	Mon, 26 Aug 2024 07:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3A6Ycbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3BC10E102
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724658915; x=1756194915;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zrp6T4ltPHMU0LbVOAULv3fju/H4b2ZvFzh9iS5k5ns=;
 b=l3A6Ycbcph3qyhFjdapY4vJwrv4YBwSnAGElcfZyLrLxIkO7c5U08KBS
 0/pmRpXnQwKLvtbKqXdkPtMrLzngYw1EzgYpNrsR3sf0nUVL/TLqy2FTp
 tqr97Wr+dzxNOtKPi4l4U6FzSeKTNo1nVJRoNTknroAKJ+YbOhUkAU3ow
 +M0StYBB7oWePrRi88OwdSPLaGqJBd7Pm5CyjbkPhoYwVVxcNf149WRVd
 MDNtctq/neYPG3sgU1buH+j+w4H+UmwFB3OWXomxGPKv6AVR5kYqB8Tut
 MBgepZSbQEVFFwlilN5MjbGQY/m52z3ENGIJLGD/8TynZF520JIyG/UvJ Q==;
X-CSE-ConnectionGUID: ctuDVdcmRua09NyKr3n4oQ==
X-CSE-MsgGUID: hW+Sc4RLSuCFacVkTGeqMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="40534551"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="40534551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 00:55:14 -0700
X-CSE-ConnectionGUID: Rd58QS7DROmSjCg3hJK7sQ==
X-CSE-MsgGUID: 6AlIrt3OT4aOzH95bELDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62736414"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.245.160]) ([10.245.245.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 00:55:14 -0700
Message-ID: <7b34d08162204dd0de5babf6243d8f0f3bdc01c0.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Date: Mon, 26 Aug 2024 09:54:56 +0200
In-Reply-To: <c518fb6b-ab55-4b5f-b1d4-f503bb9f051c@intel.com>
References: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
 <c518fb6b-ab55-4b5f-b1d4-f503bb9f051c@intel.com>
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

Hi, Matthew, Thanks for reviewing.

On Fri, 2024-08-23 at 18:13 +0100, Matthew Auld wrote:
> On 23/08/2024 17:58, Thomas Hellstr=C3=B6m wrote:
> > For non-d3cold-capable devices we'd like to be able to wake up the
> > device from reclaim. In particular, for Lunar Lake we'd like to be
> > able to blit CCS metadata to system at shrink time; at least from
> > kswapd where it's reasonable OK to wait for rpm resume and a
> > preceding rpm suspend.
> >=20
> > Therefore use a separate lockdep map for such devices and prime it
> > reclaim-tainted.
> >=20
> > v2:
> > - Rename lockmap acquire- and release functions. (Rodrigo Vivi).
> > - Reinstate the old xe_pm_runtime_lockdep_prime() function and
> > =C2=A0=C2=A0 rename it to xe_rpm_might_enter_cb(). (Matthew Auld).
> > - Introduce a separate xe_pm_runtime_lockdep_prime function
> > =C2=A0=C2=A0 called from module init for known required locking orders.
> >=20
> > Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
> > Cc: "Auld, Matthew" <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_pm.c | 79 +++++++++++++++++++++++++++++++-=
-
> > -----
> > =C2=A0 drivers/gpu/drm/xe/xe_pm.h |=C2=A0 1 +
> > =C2=A0 2 files changed, 66 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > b/drivers/gpu/drm/xe/xe_pm.c
> > index 9f3c14fd9f33..747fb96453d3 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -70,11 +70,29 @@
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > =C2=A0 #ifdef CONFIG_LOCKDEP
> > -static struct lockdep_map xe_pm_runtime_lockdep_map =3D {
> > -	.name =3D "xe_pm_runtime_lockdep_map"
> > +static struct lockdep_map xe_pm_runtime_d3cold_map =3D {
> > +	.name =3D "xe_rpm_d3cold_map"
> > +};
> > +
> > +static struct lockdep_map xe_pm_runtime_nod3cold_map =3D {
> > +	.name =3D "xe_rpm_nod3cold_map"
> > =C2=A0 };
> > =C2=A0 #endif
> > =C2=A0=20
> > +static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
> > +{
> > +	lock_map_acquire(xe->d3cold.capable ?
> > +			 &xe_pm_runtime_d3cold_map :
> > +			 &xe_pm_runtime_nod3cold_map);
> > +}
> > +
> > +static void xe_rpm_lockmap_release(const struct xe_device *xe)
> > +{
> > +	lock_map_release(xe->d3cold.capable ?
> > +			 &xe_pm_runtime_d3cold_map :
> > +			 &xe_pm_runtime_nod3cold_map);
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 /=
 S0-
> > >S2idle
> > =C2=A0=C2=A0 * @xe: xe device instance
> > @@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > =C2=A0=C2=A0	 * annotation here and in xe_pm_runtime_get() lockdep will
> > see
> > =C2=A0=C2=A0	 * the potential lock inversion and give us a nice splat.
> > =C2=A0=C2=A0	 */
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_acquire(xe);
> > =C2=A0=20
> > =C2=A0=C2=A0	/*
> > =C2=A0=C2=A0	 * Applying lock for entire list op as xe_ttm_bo_destroy
> > and xe_bo_move_notify
> > @@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > =C2=A0 out:
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		xe_display_pm_resume(xe, true);
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_release(xe);
> > =C2=A0=C2=A0	xe_pm_write_callback_task(xe, NULL);
> > =C2=A0=C2=A0	return err;
> > =C2=A0 }
> > @@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > =C2=A0=C2=A0	/* Disable access_ongoing asserts and prevent recursive pm
> > calls */
> > =C2=A0=C2=A0	xe_pm_write_callback_task(xe, current);
> > =C2=A0=20
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_acquire(xe);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (xe->d3cold.allowed) {
> > =C2=A0=C2=A0		err =3D xe_pcode_ready(xe, true);
> > @@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > =C2=A0=C2=A0			goto out;
> > =C2=A0=C2=A0	}
> > =C2=A0 out:
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_release(xe);
> > =C2=A0=C2=A0	xe_pm_write_callback_task(xe, NULL);
> > =C2=A0=C2=A0	return err;
> > =C2=A0 }
> > @@ -451,15 +469,37 @@ int xe_pm_runtime_resume(struct xe_device
> > *xe)
> > =C2=A0=C2=A0 * stuff that can happen inside the runtime_resume callback=
 by
> > acquiring
> > =C2=A0=C2=A0 * a dummy lock (it doesn't protect anything and gets compi=
led
> > out on
> > =C2=A0=C2=A0 * non-debug builds).=C2=A0 Lockdep then only needs to see =
the
> > - * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and
> > then can
> > - * hopefully validate all the (callers_locks) ->
> > xe_pm_runtime_lockdep_map.
> > + * xe_pm_runtime_xxx_map -> runtime_resume callback once, and then
> > can
> > + * hopefully validate all the (callers_locks) ->
> > xe_pm_runtime_xxx_map.
> > =C2=A0=C2=A0 * For example if the (callers_locks) are ever grabbed in t=
he
> > =C2=A0=C2=A0 * runtime_resume callback, lockdep should give us a nice s=
plat.
> > =C2=A0=C2=A0 */
> > -static void pm_runtime_lockdep_prime(void)
> > +static void xe_rpm_might_enter_cb(const struct xe_device *xe)
> > +{
> > +	xe_rpm_lockmap_acquire(xe);
> > +	xe_rpm_lockmap_release(xe);
> > +}
> > +
> > +/*
> > + * Prime the lockdep maps for known locking orders that need to
> > + * be supported but that may not always occur on all systems.
> > + */
> > +static void xe_pm_runtime_lockdep_prime(void)
> > =C2=A0 {
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > +	struct dma_resv lockdep_resv;
> > +
> > +	dma_resv_init(&lockdep_resv);
> > +	lock_map_acquire(&xe_pm_runtime_d3cold_map);
> > +	/* D3Cold takes the dma_resv locks to evict bos */
> > +	dma_resv_lock(&lockdep_resv, NULL);
> > +	dma_resv_unlock(&lockdep_resv);
> > +	lock_map_release(&xe_pm_runtime_d3cold_map);
> > +
> > +	/* Shrinkers might like to wake up the device under
> > reclaim. */
> > +	fs_reclaim_acquire(GFP_KERNEL);
> > +	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
> > +	lock_map_release(&xe_pm_runtime_nod3cold_map);
> > +	fs_reclaim_release(GFP_KERNEL);
>=20
> Would it make sense to also prime the d3cold wrt reclaim, but with
> the=20
> opposite ordering?

As Matt Brost pointed out that's already implied by the ordering wrt
dma-resv.

>=20
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks. I sen't out a v3, somehow the change that hooked up the module
init function got lost. Please indicate if that part is R-B:d as well.

Thanks,
Thomas


>=20
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -474,7 +514,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
> > =C2=A0=C2=A0	if (xe_pm_read_callback_task(xe) =3D=3D current)
> > =C2=A0=C2=A0		return;
> > =C2=A0=20
> > -	pm_runtime_lockdep_prime();
> > +	xe_rpm_might_enter_cb(xe);
> > =C2=A0=C2=A0	pm_runtime_resume(xe->drm.dev);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -506,7 +546,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device
> > *xe)
> > =C2=A0=C2=A0	if (WARN_ON(xe_pm_read_callback_task(xe) =3D=3D current))
> > =C2=A0=C2=A0		return -ELOOP;
> > =C2=A0=20
> > -	pm_runtime_lockdep_prime();
> > +	xe_rpm_might_enter_cb(xe);
> > =C2=A0=C2=A0	return pm_runtime_get_sync(xe->drm.dev);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -574,7 +614,7 @@ bool xe_pm_runtime_resume_and_get(struct
> > xe_device *xe)
> > =C2=A0=C2=A0		return true;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	pm_runtime_lockdep_prime();
> > +	xe_rpm_might_enter_cb(xe);
> > =C2=A0=C2=A0	return pm_runtime_resume_and_get(xe->drm.dev) >=3D 0;
> > =C2=A0 }
> > =C2=A0=20
> > @@ -666,3 +706,14 @@ void xe_pm_d3cold_allowed_toggle(struct
> > xe_device *xe)
> > =C2=A0=C2=A0	drm_dbg(&xe->drm,
> > =C2=A0=C2=A0		"d3cold: allowed=3D%s\n", str_yes_no(xe-
> > >d3cold.allowed));
> > =C2=A0 }
> > +
> > +/**
> > + * xe_pm_module_init() - Perform xe_pm specific module
> > initialization.
> > + *
> > + * Return: 0 on success. Currently doesn't fail.
> > + */
> > +int __init xe_pm_module_init(void)
> > +{
> > +	xe_pm_runtime_lockdep_prime();
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h
> > b/drivers/gpu/drm/xe/xe_pm.h
> > index 104a21ae6dfd..9aef673b1c8a 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -32,5 +32,6 @@ void xe_pm_assert_unbounded_bridge(struct
> > xe_device *xe);
> > =C2=A0 int xe_pm_set_vram_threshold(struct xe_device *xe, u32
> > threshold);
> > =C2=A0 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> > =C2=A0 struct task_struct *xe_pm_read_callback_task(struct xe_device
> > *xe);
> > +int xe_pm_module_init(void);
> > =C2=A0=20
> > =C2=A0 #endif


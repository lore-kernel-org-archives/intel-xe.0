Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8FBD10F21
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 10:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032CB10E5A4;
	Wed, 26 Nov 2025 10:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiYuOSZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252B710E565
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152794; x=1795688794;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=d64my1S+L4MIZKKGnj8r922bcBD5bHhBaZXrEZxv7PY=;
 b=kiYuOSZ3F4U9Hxy5st2L2bV/Or5iT9LJonf6zMp57DIMBUfGh5UrODja
 BOfmpOGwxbMxCmQkxsjVOQ/9yS1vIFEdEQ4j9NY3YvOxFVsvncytJ4wqs
 mThgIbtFTUXnBdyiHjtXoXh8VN6kKksN1lv+UY7fbc2FSqg80Tn/ryvTI
 FtO2IX/NzpCqZABMycEMmojuyrGfpNRgjsIWZpAMcS/XjkGZd86qtCpL8
 Rle/TWUAL+PZ/ephCCEaVuASikiot7po8nDD7aXGLQ1Dp0LAAfw3ao6Q8
 eoL23z4V8zPOZPtwFBbC4PAu/svxP49UBukYrAeIFj8Cp9yHzGtDWUA5l A==;
X-CSE-ConnectionGUID: 7uG6GKTFQASSFOsGdVPgmg==
X-CSE-MsgGUID: Bct0XYORSvKcr/FNVCnt7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65374724"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="65374724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:26:34 -0800
X-CSE-ConnectionGUID: tflEgKOXRjCyH9d5YZTFgg==
X-CSE-MsgGUID: gSQOoAGiTQO8Efx+gb7ZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="198012961"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.127])
 ([10.245.245.127])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:26:32 -0800
Message-ID: <9019924acd3218bf679a2f96fcc05c9e5c8a704c.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, 
 "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Auld, Matthew" <matthew.auld@intel.com>
Date: Wed, 26 Nov 2025 11:26:12 +0100
In-Reply-To: <DS7PR11MB6197137365666F3474A80D0881D1A@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
 <20251125094335.12028-2-tejas.upadhyay@intel.com>
 <e3b54213adab24d5620241ec9e701ced2c1f4f85.camel@linux.intel.com>
 <DS7PR11MB6197137365666F3474A80D0881D1A@DS7PR11MB6197.namprd11.prod.outlook.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-11-25 at 15:31 +0000, Upadhyay, Tejas wrote:
>=20
>=20
> > -----Original Message-----
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Sent: 25 November 2025 20:37
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: Auld, Matthew <matthew.auld@intel.com>
> > Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
> > cachelines manually
> >=20
> > Hi.
> >=20
> >=20
> > On Tue, 2025-11-25 at 15:13 +0530, Tejas Upadhyay wrote:
> > > Starting NVL, HW will flush cachelines marked with XA only when
> > > media
> > > is off. We have few cases where kernel will have non-XA
> > > cachelines
> > > which needs manual flush as we postpone the invalidation. Flush
> > > asap
> > > from correctness POV to ensure non accelerated CPU copy to
> > > swap/shmem
> > > file will see coherent view of memory, but also from security POV
> > > where later flush can't corrupt the next user of those pages.
> > >=20
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >=20
> > I had a number of concerns last time this patch was sent to the
> > list, none of
> > which seems to have been addressed?
>=20
> Sorry for missing to address your comments.
>=20
> >=20
> > https://lore.kernel.org/intel-
> > xe/d2517d66f571e11a760cb143981b7ca238f5cd58.camel@linux.intel.com/
> >=20
> > The main concern is that the code indicates that not all GPU caches
> > are flushed
> > when all fences are signalled (bo / userptr idle)?
>=20
> Xe3p is introducing feature that when media is off, only XA marked BO
> will be flushed not whole cache. From UMD perspective we might have
> non-XA buffers created which we would like to flush before
> buffer/user goes away during media off.=20

So for non-XA buffers, how would coherency be maintained for
gpu_write() -> cpu_read() from UMD's perspective? For dma-buf?

Also flushing in move_notify() can't be done unless the bo is idle
first, and that would force us to unnecessarily synchronize.

/Thomas


>=20
> Tejas
> =C2=A0
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
> > > =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0 | 20 ++++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_device.h=C2=A0 |=C2=A0 1 +
> > > =C2=A0drivers/gpu/drm/xe/xe_userptr.c |=C2=A0 3 ++-
> > > =C2=A04 files changed, 25 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 465cf9fc7ce9..97e1e9d40e96 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -689,7 +689,8 @@ static int xe_bo_trigger_rebind(struct
> > > xe_device
> > > *xe, struct xe_bo *bo,
> > >=20
> > > =C2=A0		if (!xe_vm_in_fault_mode(vm)) {
> > > =C2=A0			drm_gpuvm_bo_evict(vm_bo, true);
> > > -			continue;
> > > +			if (!xe_device_needs_cache_flush(xe))
> > > +				continue;
> > > =C2=A0		}
> > >=20
> > > =C2=A0		if (!idle) {
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c index 92f883dd8877..6e8335b493e8
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1079,6 +1079,26 @@ void xe_device_l2_flush(struct xe_device
> > > *xe)
> > > =C2=A0	spin_unlock(&gt->global_invl_lock);
> > > =C2=A0}
> > >=20
> > > +/**
> > > + * xe_device_needs_cache_flush - Whether the cache needs to be
> > > flushed
> > > + * @xe: The device to check.
> > > + *
> > > + * Return: true if the device needs cache flush, false
> > > otherwise.
> > > + */
> > > +bool xe_device_needs_cache_flush(struct xe_device *xe) {
> > > +	/*
> > > +	 * Starting NVL, HW will flush cachelines marked with XA
> > > only when media is off. We have
> > > +	 * few cases where kernel will have non-XA cachelines
> > > which
> > > needs manual flush and this is
> > > +	 * one of them as we postpone the invalidation. Flush
> > > asap
> > > from correctness POV to ensure
> > > +	 * non accelerated CPU copy to swap/shmem file will see
> > > coherent view of memory, but also
> > > +	 * from security POV where later flush can't corrupt the
> > > next user of those pages.
> > > +	 */
> > > +	if (GRAPHICS_VER(xe) >=3D 35 && !IS_DGFX(xe))
> > > +		return true;
> > > +	return false;
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * xe_device_td_flush() - Flush transient L3 cache entries
> > > =C2=A0 * @xe: The device
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > > b/drivers/gpu/drm/xe/xe_device.h index 32cc6323b7f6..15e67db44b56
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -179,6 +179,7 @@ void xe_device_snapshot_print(struct
> > > xe_device
> > > *xe, struct drm_printer *p);
> > > =C2=A0u64 xe_device_canonicalize_addr(struct xe_device *xe, u64
> > > address);
> > > =C2=A0u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
> > > address);
> > >=20
> > > +bool xe_device_needs_cache_flush(struct xe_device *xe);
> > > =C2=A0void xe_device_td_flush(struct xe_device *xe);
> > > =C2=A0void xe_device_l2_flush(struct xe_device *xe);
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > b/drivers/gpu/drm/xe/xe_userptr.c index
> > > 0d9130b1958a..a93c7e887cca
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > @@ -114,7 +114,8 @@ static void __vma_userptr_invalidate(struct
> > > xe_vm
> > > *vm, struct xe_userptr_vma *uv
> > > =C2=A0				=C2=A0=C2=A0=C2=A0 false,
> > > MAX_SCHEDULE_TIMEOUT);
> > > =C2=A0	XE_WARN_ON(err <=3D 0);
> > >=20
> > > -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > > +	if ((xe_vm_in_fault_mode(vm) ||
> > > xe_device_needs_cache_flush(vm->xe)) &&
> > > +	=C2=A0=C2=A0=C2=A0 userptr->initial_bind) {
> > > =C2=A0		err =3D xe_vm_invalidate_vma(vma);
> > > =C2=A0		XE_WARN_ON(err);
> > > =C2=A0	}
>=20


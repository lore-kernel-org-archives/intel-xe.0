Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C234C3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 13:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8D310E095;
	Thu,  8 May 2025 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnmnerfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512AC10E095
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746710715; x=1778246715;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=REK1nwahW0CyM1EF/1l2jo2p6Vb5m954ezPdDAmN8Uo=;
 b=jnmnerfu9k/AM594E6yxu+up6Ni3IrvXKgUQYNzP8OhN1Lf/TUm3oRI2
 bmCcekP7XUWvnl9kYS4lKzcpaSEqyURIp0uCJhsR2a2Pa/xmnG5f9n9yS
 1zVa3j7aUDkinuY4t/ls2EBRUFO2kNRZm/Tm2FOFdyJSkumqihzE/V4jI
 FXKvimxpkqHjSwYguEK7dwS3WHa3GArjIwA3wTgkRGn2h3asNTa4hyDQF
 /fFW/KXh15lT1wHoLXup4UiWeakeZzbne2Qj2wvOh+EXeROt8YfVspOyZ
 IaY7sezfriq6BcHW7SsSHelodnsRyys6y7p3q/c6JcADiGTmcMsMvD4IY A==;
X-CSE-ConnectionGUID: z0OOl5gISNey6mxDSzftxA==
X-CSE-MsgGUID: yYcYzk3TRT+kcqMNwl3qPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51154620"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="51154620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:25:14 -0700
X-CSE-ConnectionGUID: Ue11/2EBR5GKvc7dc3rbJw==
X-CSE-MsgGUID: Ot3LYgGGTyeV8hHkRU+qwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="167230457"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO [10.124.222.207])
 ([10.124.222.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 06:25:11 -0700
Message-ID: <d7e534756f4700d5c20895aca9df9bebf8c303fd.camel@linux.intel.com>
Subject: Re: [PATCH v6 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com
Date: Thu, 08 May 2025 15:25:08 +0200
In-Reply-To: <aBt/QzswRYhm8wgx@lstrano-desk.jf.intel.com>
References: <20250506230132.1188732-1-matthew.brost@intel.com>
 <20250506230132.1188732-3-matthew.brost@intel.com>
 <7a7385b2d2a81961963e4df4a34ad4c55bd49bfb.camel@linux.intel.com>
 <aBt/QzswRYhm8wgx@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi, Matthew.

On Wed, 2025-05-07 at 08:41 -0700, Matthew Brost wrote:
> On Wed, May 07, 2025 at 02:01:56PM +0200, Thomas Hellstr=C3=B6m wrote:
> >=20
> > This is v7, right? (Says v6 in the subject).
> >=20
>=20
> Yea, I somehow mismatched version in change log and patches sent.
>=20
> Ok, getting a little bogged down on comments, let try fix them inline
> in
> this reply to make sure they look good before sending next rev.

So since we're not adhering to the drm locking guidelines, I want to
ensure that what we ask to PULL is at least properly documented. So
what I've been asking here is two things.

1) If the intended usage of a function is advisory / opportunistic,
please document that at the function header rather than as a comment
within the function definition.

2) Document what a barrier / READ_ONCE / WRITE_ONCE pairs with. Ideally
pointing to the specific function.

In particular for 1) I've mentioned it a couple of times without it
beeing addressed or commented on so that's why I'm bringing it up again
in case it was missed.

So let's check.

>=20
> > On Tue, 2025-05-06 at 16:01 -0700, Matthew Brost wrote:
> > > Mixing GPU and CPU atomics does not work unless a strict
> > > migration
> > > policy of GPU atomics must be device memory. Enforce a policy of
> > > must
> > > be
> > > in VRAM with a retry loop of 3 attempts, if retry loop fails
> > > abort
> > > fault.
> > >=20
> > > Removing always_migrate_to_vram modparam as we now have real
> > > migration
> > > policy.
> > >=20
> > > v2:
> > > =C2=A0- Only retry migration on atomics
> > > =C2=A0- Drop alway migrate modparam
> > > v3:
> > > =C2=A0- Only set vram_only on DGFX (Himal)
> > > =C2=A0- Bail on get_pages failure if vram_only and retry count
> > > exceeded
> > > (Himal)
> > > =C2=A0- s/vram_only/devmem_only
> > > =C2=A0- Update xe_svm_range_is_valid to accept devmem_only argument
> > > v4:
> > > =C2=A0- Fix logic bug get_pages failure
> > > v5:
> > > =C2=A0- Fix commit message (Himal)
> > > =C2=A0- Mention removing always_migrate_to_vram in commit message
> > > (Lucas)
> > > =C2=A0- Fix xe_svm_range_is_valid to check for devmem pages
> > > =C2=A0- Bail on devmem_only && !migrate_devmem (Thomas)
> > > v6:
> > > =C2=A0- Add READ_ONCE barriers for opportunistic checks (Thomas)
> > > v7:
> > > =C2=A0- Pair READ_ONCE with WRITE_ONCE (Thomas)
> > >=20
> > > Fixes: 2f118c949160 ("drm/xe: Add SVM VRAM migration")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0 |=C2=A0 23 +++++--
> > > =C2=A0drivers/gpu/drm/xe/xe_module.c |=C2=A0=C2=A0 3 -
> > > =C2=A0drivers/gpu/drm/xe/xe_module.h |=C2=A0=C2=A0 1 -
> > > =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +=
+++-
> > > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0 | 109 +++++++++++=
++++++++++++++--
> > > ----
> > > --
> > > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 -=
-
> > > =C2=A0include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 40 +++++++-----
> > > =C2=A07 files changed, 138 insertions(+), 57 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > index a58d03e6cac2..41f6616bcf76 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -1118,6 +1118,10 @@ static void
> > > __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > =C2=A0	lockdep_assert_held(&gpusvm->notifier_lock);
> > > =C2=A0
> > > =C2=A0	if (range->flags.has_dma_mapping) {
> > > +		struct drm_gpusvm_range_flags flags =3D {
> > > +			.__flags =3D range->flags.__flags,
> > > +		};
> > > +
> > > =C2=A0		for (i =3D 0, j =3D 0; i < npages; j++) {
> > > =C2=A0			struct drm_pagemap_device_addr *addr =3D
> > > &range->dma_addr[j];
> > > =C2=A0
> > > @@ -1131,8 +1135,12 @@ static void
> > > __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > =C2=A0							=C2=A0=C2=A0=C2=A0 dev,
> > > *addr);
> > > =C2=A0			i +=3D 1 << addr->order;
> > > =C2=A0		}
> > > -		range->flags.has_devmem_pages =3D false;
> > > -		range->flags.has_dma_mapping =3D false;
> > > +
> > > +		/* WRITE_ONCE pairs with READ_ONCE for
> > > opportunistic
> > > checks */
>=20
> Is this one ok? Can't really quote driver side here...

Yeah makes sense.

>=20
> > > +		flags.has_devmem_pages =3D false;
> > > +		flags.has_dma_mapping =3D false;
> > > +		WRITE_ONCE(range->flags.__flags, flags.__flags);
> > > +
> > > =C2=A0		range->dpagemap =3D NULL;
> > > =C2=A0	}
> > > =C2=A0}
> > > @@ -1334,6 +1342,7 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0	int err =3D 0;
> > > =C2=A0	struct dev_pagemap *pagemap;
> > > =C2=A0	struct drm_pagemap *dpagemap;
> > > +	struct drm_gpusvm_range_flags flags;
> > > =C2=A0
> > > =C2=A0retry:
> > > =C2=A0	hmm_range.notifier_seq =3D
> > > mmu_interval_read_begin(notifier);
> > > @@ -1378,7 +1387,8 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0	 */
> > > =C2=A0	drm_gpusvm_notifier_lock(gpusvm);
> > > =C2=A0
> > > -	if (range->flags.unmapped) {
> > > +	flags.__flags =3D range->flags.__flags;
> > > +	if (flags.unmapped) {
> > > =C2=A0		drm_gpusvm_notifier_unlock(gpusvm);
> > > =C2=A0		err =3D -EFAULT;
> > > =C2=A0		goto err_free;
> > > @@ -1474,14 +1484,17 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0		}
> > > =C2=A0		i +=3D 1 << order;
> > > =C2=A0		num_dma_mapped =3D i;
> > > -		range->flags.has_dma_mapping =3D true;
> > > +		flags.has_dma_mapping =3D true;
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	if (zdd) {
> > > -		range->flags.has_devmem_pages =3D true;
> > > +		flags.has_devmem_pages =3D true;
> > > =C2=A0		range->dpagemap =3D dpagemap;
> > > =C2=A0	}
> > > =C2=A0
> > > +	/* WRITE_ONCE pairs with READ_ONCE for opportunistic
> > > checks
> > > */
>=20
> Same as above.

Makes sense.



>=20
> > > +	WRITE_ONCE(range->flags.__flags, flags.__flags);
> > > +
> > > =C2=A0	drm_gpusvm_notifier_unlock(gpusvm);
> > > =C2=A0	kvfree(pfns);
> > > =C2=A0set_seqno:
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > b/drivers/gpu/drm/xe/xe_module.c
> > > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam =3D {
> > > =C2=A0module_param_named(svm_notifier_size,
> > > xe_modparam.svm_notifier_size,
> > > uint, 0600);
> > > =C2=A0MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier
> > > size(in
> > > MiB), must be power of 2");
> > > =C2=A0
> > > -module_param_named(always_migrate_to_vram,
> > > xe_modparam.always_migrate_to_vram, bool, 0444);
> > > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM
> > > on
> > > GPU fault");
> > > -
> > > =C2=A0module_param_named_unsafe(force_execlist,
> > > xe_modparam.force_execlist, bool, 0444);
> > > =C2=A0MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > b/drivers/gpu/drm/xe/xe_module.h
> > > index 84339e509c80..5a3bfea8b7b4 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -12,7 +12,6 @@
> > > =C2=A0struct xe_modparam {
> > > =C2=A0	bool force_execlist;
> > > =C2=A0	bool probe_display;
> > > -	bool always_migrate_to_vram;
> > > =C2=A0	u32 force_vram_bar_size;
> > > =C2=A0	int guc_log_level;
> > > =C2=A0	char *guc_firmware_path;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index b42cf5d1b20c..b487e094178d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -2270,11 +2270,19 @@ static void op_commit(struct xe_vm *vm,
> > > =C2=A0	}
> > > =C2=A0	case DRM_GPUVA_OP_DRIVER:
> > > =C2=A0	{
> > > +		/* WRITE_ONCE pairs with READ_ONCE opportunistic
> > > checks */
> > > +
>=20
> /* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */

Fine.

>=20
> > > =C2=A0		if (op->subop =3D=3D XE_VMA_SUBOP_MAP_RANGE) {
> > > -			op->map_range.range->tile_present |=3D
> > > BIT(tile->id);
> > > -			op->map_range.range->tile_invalidated &=3D
> > > ~BIT(tile->id);
> > > +			WRITE_ONCE(op->map_range.range-
> > > > tile_present,
> > > +				=C2=A0=C2=A0 op->map_range.range-
> > > >tile_present
> > > >=20
> > > +				=C2=A0=C2=A0 BIT(tile->id));
> > > +			WRITE_ONCE(op->map_range.range-
> > > > tile_invalidated,
> > > +				=C2=A0=C2=A0 op->map_range.range-
> > > > tile_invalidated &
> > > +				=C2=A0=C2=A0 ~BIT(tile->id));
> > > =C2=A0		} else if (op->subop =3D=3D
> > > XE_VMA_SUBOP_UNMAP_RANGE) {
> > > -			op->unmap_range.range->tile_present &=3D
> > > ~BIT(tile->id);
> > > +			WRITE_ONCE(op->unmap_range.range-
> > > > tile_present,
> > > +				=C2=A0=C2=A0 op->unmap_range.range-
> > > > tile_present &
> > > +				=C2=A0=C2=A0 ~BIT(tile->id));
> > > =C2=A0		}
> > > =C2=A0		break;
> > > =C2=A0	}
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 890f6b2f40e9..8c0ef55cfd57 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -16,8 +16,15 @@
> > > =C2=A0
> >=20
> > So what I meant in the review comments is something along
> >=20
> > /* Advisory only check whether the range is currently backed by
> > VRAM
> > memory. */
> >=20
> > (As said we shouldn need to look at the function implementation to
> > understand that it's opportunistic).
> >=20
> > > =C2=A0static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> > > =C2=A0{
> > > -	/* Not reliable without notifier lock */
> > > -	return range->base.flags.has_devmem_pages;
> > > +	/*
> > > +	 * Not reliable without notifier lock, opportunistic
> > > only,
> > > pairs with
> > > +	 * WRITE_ONCE
> >=20
> > So if we assume that this function should is never be called with
> > the
> > notifier lock held, we can leave that comment out, just
> >=20
> > /* Pairs with WRITE_ONCE() in xe_pt.c */=20
> >=20
> >=20
> > And similar for the other places.
> >=20
> > Thanks,
> > Thomas
> >=20
> > > +	 */
>=20
> /*
> =C2=A0* Advisory only check whether the range is currently backed by VRAM
> =C2=A0* memory, READ_ONCE pairs with WRITE_ONCE in drm_gpusvm.c
> =C2=A0*/
>=20

Here I'd put the READ_ONCE part of the comment where it's actually
used.

> > > +	struct drm_gpusvm_range_flags flags =3D {
/* Pairs with WRITE_ONCE() in drm_gpusvm.c */
> > > +		.__flags =3D READ_ONCE(range->base.flags.__flags),
> > > +	};
> > > +
> > > +	return flags.has_devmem_pages;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static bool xe_svm_range_has_vram_binding(struct xe_svm_range
> > > *range)
> > > @@ -650,9 +657,16 @@ void xe_svm_fini(struct xe_vm *vm)
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > -				=C2=A0 struct xe_tile *tile)
> > > +				=C2=A0 struct xe_tile *tile,
> > > +				=C2=A0 bool devmem_only)
> > > =C2=A0{
> > > -	return (range->tile_present & ~range->tile_invalidated)
> > > &
> > > BIT(tile->id);
> > > +	/*
> > > +	 * Not reliable without notifier lock, opportunistic
> > > only,
> > > pairs with
> > > +	 * WRITE_ONCE
> > > +	 */
>=20
> /*
> =C2=A0* Advisory only check whether the range currently has a valid
> mapping,
> =C2=A0* READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> =C2=A0*/
>=20
> > > +	return ((READ_ONCE(range->tile_present) &
> > > +		 ~READ_ONCE(range->tile_invalidated)) &
> > > BIT(tile-
> > > > id)) &&
> > > +		(!devmem_only || xe_svm_range_in_vram(range));
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > @@ -726,6 +740,36 @@ static int xe_svm_alloc_vram(struct xe_vm
> > > *vm,static bool supports_4K_migration(struct xe_device *xe)
> > > +{
> > > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static bool xe_svm_range_needs_migrate_to_vram(struct
> > > xe_svm_range
> > > *range,
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma
> > > *vma)
> > > +{
> > > +	struct xe_vm *vm =3D range_to_vm(&range->base);
> > > +	u64 range_size =3D xe_svm_range_size(range);
> > > +
> > > +	if (!range->base.flags.migrate_devmem)
> > > +		return false;
> > > +
> > > +	/* Not reliable without notifier lock, opportunistic
> > > only */
>=20
> Drop this one as xe_svm_range_in_vram has a comment.
Yes,

Thanks,
Thomas


>=20
> Matt
>=20
> > > +	if (xe_svm_range_in_vram(range)) {
> > > +		drm_dbg(&vm->xe->drm, "Range is already in
> > > VRAM\n");
> > > +		return false;
> > > +	}
> > > +
> > > +	if (range_size <=3D SZ_64K && !supports_4K_migration(vm-
> > > >xe))
> > > {
> > > +		drm_dbg(&vm->xe->drm, "Platform doesn't support
> > > SZ_4K range migration\n");
> > > +		return false;
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > =C2=A0
> > > =C2=A0/**
> > > =C2=A0 * xe_svm_handle_pagefault() - SVM handle page fault
> > > @@ -750,12 +794,15 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > =C2=A0		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > > =C2=A0			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > ?
> > > SZ_64K : 0,
> > > +		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > =C2=A0	};
> > > =C2=A0	struct xe_svm_range *range;
> > > =C2=A0	struct drm_gpusvm_range *r;
> > > =C2=A0	struct drm_exec exec;
> > > =C2=A0	struct dma_fence *fence;
> > > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > > +	int migrate_try_count =3D ctx.devmem_only ? 3 : 1;
> > > =C2=A0	ktime_t end =3D 0;
> > > =C2=A0	int err;
> > > =C2=A0
> > > @@ -776,24 +823,30 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0	if (IS_ERR(r))
> > > =C2=A0		return PTR_ERR(r);
> > > =C2=A0
> > > +	if (ctx.devmem_only && !r->flags.migrate_devmem)
> > > +		return -EACCES;
> > > +
> > > =C2=A0	range =3D to_xe_range(r);
> > > -	if (xe_svm_range_is_valid(range, tile))
> > > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> > > =C2=A0		return 0;
> > > =C2=A0
> > > =C2=A0	range_debug(range, "PAGE FAULT");
> > > =C2=A0
> > > -	/* XXX: Add migration policy, for now migrate range once
> > > */
> > > -	if (!range->skip_migrate && range-
> > > >base.flags.migrate_devmem
> > > &&
> > > -	=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range) >=3D SZ_64K) {
> > > -		range->skip_migrate =3D true;
> > > -
> > > +	if (--migrate_try_count >=3D 0 &&
> > > +	=C2=A0=C2=A0=C2=A0 xe_svm_range_needs_migrate_to_vram(range, vma)) =
{
> > > =C2=A0		err =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > =C2=A0		if (err) {
> > > -			drm_dbg(&vm->xe->drm,
> > > -				"VRAM allocation failed, falling
> > > back to "
> > > -				"retrying fault, asid=3D%u,
> > > errno=3D%pe\n",
> > > -				vm->usm.asid, ERR_PTR(err));
> > > -			goto retry;
> > > +			if (migrate_try_count ||
> > > !ctx.devmem_only) {
> > > +				drm_dbg(&vm->xe->drm,
> > > +					"VRAM allocation failed,
> > > falling back to retrying fault, asid=3D%u, errno=3D%pe\n",
> > > +					vm->usm.asid,
> > > ERR_PTR(err));
> > > +				goto retry;
> > > +			} else {
> > > +				drm_err(&vm->xe->drm,
> > > +					"VRAM allocation failed,
> > > retry count exceeded, asid=3D%u, errno=3D%pe\n",
> > > +					vm->usm.asid,
> > > ERR_PTR(err));
> > > +				return err;
> > > +			}
> > > =C2=A0		}
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -801,15 +854,22 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm,
> > > struct xe_vma *vma,
> > > =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r,
> > > &ctx);
> > > =C2=A0	/* Corner where CPU mappings have changed */
> > > =C2=A0	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D=
 -
> > > EPERM) {
> > > -		if (err =3D=3D -EOPNOTSUPP) {
> > > -			range_debug(range, "PAGE FAULT - EVICT
> > > PAGES");
> > > -			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > > &range->base);
> > > +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > > +			if (err =3D=3D -EOPNOTSUPP) {
> > > +				range_debug(range, "PAGE FAULT -
> > > EVICT PAGES");
> > > +				drm_gpusvm_range_evict(&vm-
> > > > svm.gpusvm,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &range-
> > > > base);
> > > +			}
> > > +			drm_dbg(&vm->xe->drm,
> > > +				"Get pages failed, falling back
> > > to
> > > retrying, asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > +			range_debug(range, "PAGE FAULT - RETRY
> > > PAGES");
> > > +			goto retry;
> > > +		} else {
> > > +			drm_err(&vm->xe->drm,
> > > +				"Get pages failed, retry count
> > > exceeded, asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> > > +				vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > =C2=A0		}
> > > -		drm_dbg(&vm->xe->drm,
> > > -			"Get pages failed, falling back to
> > > retrying,
> > > asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> > > -			vm->usm.asid, &vm->svm.gpusvm,
> > > ERR_PTR(err));
> > > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > -		goto retry;
> > > =C2=A0	}
> > > =C2=A0	if (err) {
> > > =C2=A0		range_debug(range, "PAGE FAULT - FAIL PAGE
> > > COLLECT");
> > > @@ -843,9 +903,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > > =C2=A0	}
> > > =C2=A0	drm_exec_fini(&exec);
> > > =C2=A0
> > > -	if (xe_modparam.always_migrate_to_vram)
> > > -		range->skip_migrate =3D false;
> > > -
> > > =C2=A0	dma_fence_wait(fence, false);
> > > =C2=A0	dma_fence_put(fence);
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > index 3d441eb1f7ea..0e1f376a7471 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -39,11 +39,6 @@ struct xe_svm_range {
> > > =C2=A0	 * range. Protected by GPU SVM notifier lock.
> > > =C2=A0	 */
> > > =C2=A0	u8 tile_invalidated;
> > > -	/**
> > > -	 * @skip_migrate: Skip migration to VRAM, protected by
> > > GPU
> > > fault handler
> > > -	 * locking.
> > > -	 */
> > > -	u8 skip_migrate	:1;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/**
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 9fd25fc880a4..653d48dbe1c1 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -185,6 +185,31 @@ struct drm_gpusvm_notifier {
> > > =C2=A0	} flags;
> > > =C2=A0};
> > > =C2=A0
> > > +/**
> > > + * struct drm_gpusvm_range_flags - Structure representing a GPU
> > > SVM
> > > range flags
> > > + *
> > > + * @migrate_devmem: Flag indicating whether the range can be
> > > migrated to device memory
> > > + * @unmapped: Flag indicating if the range has been unmapped
> > > + * @partial_unmap: Flag indicating if the range has been
> > > partially
> > > unmapped
> > > + * @has_devmem_pages: Flag indicating if the range has devmem
> > > pages
> > > + * @has_dma_mapping: Flag indicating if the range has a DMA
> > > mapping
> > > + * @__flags: Flags for range in u16 form (used for READ_ONCE)
> > > + */
> > > +struct drm_gpusvm_range_flags {
> > > +	union {
> > > +		struct {
> > > +			/* All flags below must be set upon
> > > creation
> > > */
> > > +			u16 migrate_devmem : 1;
> > > +			/* All flags below must be set / cleared
> > > under notifier lock */
> > > +			u16 unmapped : 1;
> > > +			u16 partial_unmap : 1;
> > > +			u16 has_devmem_pages : 1;
> > > +			u16 has_dma_mapping : 1;
> > > +		};
> > > +		u16 __flags;
> > > +	};
> > > +};
> > > +
> > > =C2=A0/**
> > > =C2=A0 * struct drm_gpusvm_range - Structure representing a GPU SVM
> > > range
> > > =C2=A0 *
> > > @@ -198,11 +223,6 @@ struct drm_gpusvm_notifier {
> > > =C2=A0 * @dpagemap: The struct drm_pagemap of the device pages we're
> > > dma-
> > > mapping.
> > > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Note this is assuming only one drm_pagemap per
> > > range
> > > is allowed.
> > > =C2=A0 * @flags: Flags for range
> > > - * @flags.migrate_devmem: Flag indicating whether the range can
> > > be
> > > migrated to device memory
> > > - * @flags.unmapped: Flag indicating if the range has been
> > > unmapped
> > > - * @flags.partial_unmap: Flag indicating if the range has been
> > > partially unmapped
> > > - * @flags.has_devmem_pages: Flag indicating if the range has
> > > devmem
> > > pages
> > > - * @flags.has_dma_mapping: Flag indicating if the range has a
> > > DMA
> > > mapping
> > > =C2=A0 *
> > > =C2=A0 * This structure represents a GPU SVM range used for tracking
> > > memory ranges
> > > =C2=A0 * mapped in a DRM device.
> > > @@ -216,15 +236,7 @@ struct drm_gpusvm_range {
> > > =C2=A0	unsigned long notifier_seq;
> > > =C2=A0	struct drm_pagemap_device_addr *dma_addr;
> > > =C2=A0	struct drm_pagemap *dpagemap;
> > > -	struct {
> > > -		/* All flags below must be set upon creation */
> > > -		u16 migrate_devmem : 1;
> > > -		/* All flags below must be set / cleared under
> > > notifier lock */
> > > -		u16 unmapped : 1;
> > > -		u16 partial_unmap : 1;
> > > -		u16 has_devmem_pages : 1;
> > > -		u16 has_dma_mapping : 1;
> > > -	} flags;
> > > +	struct drm_gpusvm_range_flags flags;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/**
> >=20


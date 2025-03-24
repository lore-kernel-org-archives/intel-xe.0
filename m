Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6148DC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 15:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1EF10E494;
	Mon, 24 Mar 2025 15:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0hl/fxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F96A10E494
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742831352; x=1774367352;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ti7PiVL5/Wk1MmIgkMj0Nqy7fAdQ3nTmha2zq1x36pc=;
 b=N0hl/fxGMIWcc10I8XS/VesEGMC+hI0c3BMO0KMyAJDloFBSvqLyzkQv
 mTwEKJsEcbVtRfQvPSWoXqIz6p275RS4jHfCsfYar/iWXUGr5gW6X1WpO
 E5fvJV5Dtm9z4I/fY9f7u6I3dEJvRNTAhMPi6obgJxCr1jYK2JoiLu6TO
 mdrjcHS9auvBp3Dh4Iv3PWxiANAzXsr9k8jReP9JSN3X9514K7X4YUkSH
 zx7ELb+Lr7w8fmJ4x3DCTy6T1V2Nd7+1QjZ3kLE3m/2lrz4to58TvMbpn
 jQnN+NA49ym2iBNkl1qy4DqzY76KIp/O15FBfBRHFhT9A1sYDS7S/GSzl A==;
X-CSE-ConnectionGUID: fkF6EwKVR1mwGMWWMWB3YA==
X-CSE-MsgGUID: CDJAgMKZSvidhm7K6ptuSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55421023"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55421023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:49:10 -0700
X-CSE-ConnectionGUID: gjZBGAgwQp+NxVMI3PJFnA==
X-CSE-MsgGUID: vBhxNSYmTmG8SLxsIxTQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129278067"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.77])
 ([10.245.246.77])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:49:09 -0700
Message-ID: <004a02b4877fe6a1e2d2e033c27db34ad01c582b.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/bo: Add a bo remove callback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
Date: Mon, 24 Mar 2025 16:48:56 +0100
In-Reply-To: <9b68e406-21b1-4500-ae3e-662c3109fe89@intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
 <20250321163416.45217-4-thomas.hellstrom@linux.intel.com>
 <9b68e406-21b1-4500-ae3e-662c3109fe89@intel.com>
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

On Mon, 2025-03-24 at 14:41 +0000, Matthew Auld wrote:
> On 21/03/2025 16:34, Thomas Hellstr=C3=B6m wrote:
> > On device unbind, migrate exported bos, including pagemap bos to
> > system. This allows importers to take proper action without
> > disruption. In particular, SVM clients on remote devices may
> > continue as if nothing happened, and can chose a different
> > placement.
> >=20
> > The evict_flags() placement is chosen in such a way that bos that
> > aren't exported are purged.
> >=20
> > For pinned bos, we unmap DMA, but their pages are not freed yet
> > since we can't be 100% sure they are not accessed.
> >=20
> > v2:
> > - Address review comments. (Matthew Auld).
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 54 ++++++++++++++++++++---
> > -
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > =C2=A0 drivers/gpu/drm/xe/xe_bo_evict.c=C2=A0=C2=A0=C2=A0=C2=A0 | 62
> > ++++++++++++++++++++++++++--
> > =C2=A0 drivers/gpu/drm/xe/xe_bo_evict.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> > =C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 ++-
> > =C2=A0 drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 6 ++-
> > =C2=A0 6 files changed, 117 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 64f9c936eea0..9d043d2c30fd 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -55,6 +55,8 @@ static struct ttm_placement sys_placement =3D {
> > =C2=A0=C2=A0	.placement =3D &sys_placement_flags,
> > =C2=A0 };
> > =C2=A0=20
> > +static struct ttm_placement purge_placement;
> > +
> > =C2=A0 static const struct ttm_place tt_placement_flags[] =3D {
> > =C2=A0=C2=A0	{
> > =C2=A0=C2=A0		.fpfn =3D 0,
> > @@ -281,6 +283,8 @@ int xe_bo_placement_for_flags(struct xe_device
> > *xe, struct xe_bo *bo,
> > =C2=A0 static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > =C2=A0=C2=A0			=C2=A0=C2=A0 struct ttm_placement *placement)
> > =C2=A0 {
> > +	struct xe_device *xe =3D container_of(tbo->bdev,
> > typeof(*xe), ttm);
> > +	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> > =C2=A0=C2=A0	struct xe_bo *bo;
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!xe_bo_is_xe_bo(tbo)) {
> > @@ -290,7 +294,7 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> > =C2=A0=C2=A0			return;
> > =C2=A0=C2=A0		}
> > =C2=A0=20
> > -		*placement =3D sys_placement;
> > +		*placement =3D device_unplugged ? purge_placement :
> > sys_placement;
> > =C2=A0=C2=A0		return;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > @@ -300,6 +304,11 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> > =C2=A0=C2=A0		return;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > +	if (device_unplugged && !tbo->base.dma_buf) {
> > +		*placement =3D purge_placement;
> > +		return;
> > +	}
> > +
> > =C2=A0=C2=A0	/*
> > =C2=A0=C2=A0	 * For xe, sg bos that are evicted to system just triggers
> > a
> > =C2=A0=C2=A0	 * rebind of the sg list upon subsequent validation to
> > XE_PL_TT.
> > @@ -657,11 +666,20 @@ static int xe_bo_move_dmabuf(struct
> > ttm_buffer_object *ttm_bo,
> > =C2=A0=C2=A0	struct xe_ttm_tt *xe_tt =3D container_of(ttm_bo->ttm, stru=
ct
> > xe_ttm_tt,
> > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm);
> > =C2=A0=C2=A0	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> > +	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> > =C2=A0=C2=A0	struct sg_table *sg;
> > =C2=A0=20
> > =C2=A0=C2=A0	xe_assert(xe, attach);
> > =C2=A0=C2=A0	xe_assert(xe, ttm_bo->ttm);
> > =C2=A0=20
> > +	if (device_unplugged && new_res->mem_type =3D=3D XE_PL_SYSTEM
> > &&
> > +	=C2=A0=C2=A0=C2=A0 ttm_bo->sg) {
> > +		dma_resv_wait_timeout(ttm_bo->base.resv,
> > DMA_RESV_USAGE_BOOKKEEP,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> > MAX_SCHEDULE_TIMEOUT);
> > +		dma_buf_unmap_attachment(attach, ttm_bo->sg,
> > DMA_BIDIRECTIONAL);
> > +		ttm_bo->sg =3D NULL;
> > +	}
> > +
> > =C2=A0=C2=A0	if (new_res->mem_type =3D=3D XE_PL_SYSTEM)
> > =C2=A0=C2=A0		goto out;
> > =C2=A0=20
> > @@ -1224,6 +1242,31 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> > =C2=A0=C2=A0	return ret;
> > =C2=A0 }
> > =C2=A0=20
> > +int xe_bo_dma_unmap_pinned(struct xe_bo *bo)
> > +{
> > +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> > +	struct ttm_tt *tt =3D ttm_bo->ttm;
> > +
> > +	if (tt) {
> > +		struct xe_ttm_tt *xe_tt =3D container_of(tt,
> > typeof(*xe_tt), ttm);
> > +
> > +		if (ttm_bo->type =3D=3D ttm_bo_type_sg && ttm_bo->sg)
> > {
> > +			dma_buf_unmap_attachment(ttm_bo-
> > >base.import_attach,
> > +						 ttm_bo->sg,
> > +					=09
> > DMA_BIDIRECTIONAL);
> > +			ttm_bo->sg =3D NULL;
> > +			xe_tt->sg =3D NULL;
> > +		} else if (xe_tt->sg) {
> > +			dma_unmap_sgtable(xe_tt->xe->drm.dev,
> > xe_tt->sg,
> > +					=C2=A0 DMA_BIDIRECTIONAL, 0);
> > +			sg_free_table(xe_tt->sg);
> > +			xe_tt->sg =3D NULL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > =C2=A0 static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object
> > *ttm_bo,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long page=
_offset)
> > =C2=A0 {
> > @@ -2102,12 +2145,9 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > =C2=A0=C2=A0		if (err)
> > =C2=A0=C2=A0			return err;
> > =C2=A0=20
> > -		if (xe_bo_is_vram(bo)) {
> > -			spin_lock(&xe->pinned.lock);
> > -			list_add_tail(&bo->pinned_link,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram);
> > -			spin_unlock(&xe->pinned.lock);
> > -		}
> > +		spin_lock(&xe->pinned.lock);
> > +		list_add_tail(&bo->pinned_link, &xe-
> > >pinned.external);
> > +		spin_unlock(&xe->pinned.lock);
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	ttm_bo_pin(&bo->ttm);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index ec3e4446d027..05479240bf75 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -276,6 +276,8 @@ int xe_bo_evict(struct xe_bo *bo, bool
> > force_alloc);
> > =C2=A0 int xe_bo_evict_pinned(struct xe_bo *bo);
> > =C2=A0 int xe_bo_restore_pinned(struct xe_bo *bo);
> > =C2=A0=20
> > +int xe_bo_dma_unmap_pinned(struct xe_bo *bo);
> > +
> > =C2=A0 extern const struct ttm_device_funcs xe_ttm_funcs;
> > =C2=A0 extern const char *const xe_mem_type_to_name[];
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > index 1eeb3910450b..ba0260900868 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > @@ -93,8 +93,8 @@ int xe_bo_evict_all(struct xe_device *xe)
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
> > -				=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram,
> > +	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.external,
> > +				=C2=A0=C2=A0=C2=A0 &xe->pinned.external_evicted,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 xe_bo_evict_pinned);
>=20
> Just one question here. Do you know if this changes the existing=20
> behaviour during suspend-resume for such buffers? Say we have pinned
> tt=20
> that was exported to another driver (not dynamic), will this now move
> it=20
> from tt -> system? If so, is that correct? Does it make sense to skip
> this entirely for suspend-resume for the external pinned case? I'm=20
> assuming it can't be in VRAM for this case, so seems like we don't
> need=20
> to do anything here?

Currently xe_bo_evict_pinned() doesn't do anything for !vram bos, and
we currently don't allow pinning bos in VRAM, so yes as a consequence
we could probably remove the above.

I was a bit hesitant to include the introduction of the
external_evicted list in this patch, since that's really a separate
change, so perhaps the best choice here is to remove the introduction
of external_evicted() and we could then remove the suspend / resume
iteration over pinned dma-buf entirely in a separate patch. I was about
to send out a v3 anyway so I'll restrict this patch to only the
"remove" callback addition and then we could add another patch to deal
with the possibly unnecessary iteration at suspend / resume time.

Thanks,
Thomas


>=20
> Otherwise looks good.
>=20
> > =C2=A0=20
> > =C2=A0=C2=A0	/*
> > @@ -181,8 +181,8 @@ int xe_bo_restore_user(struct xe_device *xe)
> > =C2=A0=C2=A0		return 0;
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Pinned user memory in VRAM should be validated on
> > resume */
> > -	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
> > -				=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram,
> > +	ret =3D xe_bo_apply_to_pinned(xe, &xe-
> > >pinned.external_evicted,
> > +				=C2=A0=C2=A0=C2=A0 &xe->pinned.external,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 xe_bo_restore_pinned);
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Wait for restore to complete */
> > @@ -191,3 +191,57 @@ int xe_bo_restore_user(struct xe_device *xe)
> > =C2=A0=20
> > =C2=A0=C2=A0	return ret;
> > =C2=A0 }
> > +
> > +static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
> > +{
> > +	struct xe_tile *tile;
> > +	unsigned int id;
> > +
> > +	(void) xe_bo_apply_to_pinned(xe, &xe->pinned.external,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 &xe->pinned.external,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_dma_unmap_pinned);
> > +	for_each_tile(tile, xe, id)
> > +		xe_tile_migrate_wait(tile);
> > +
> > +	(void) xe_bo_apply_to_pinned(xe, &xe-
> > >pinned.kernel_bo_present,
> > +				=C2=A0=C2=A0=C2=A0 &xe->pinned.kernel_bo_present,
> > +				=C2=A0=C2=A0=C2=A0 xe_bo_dma_unmap_pinned);
> > +
> > +}
> > +
> > +
> > +
> > +/**
> > + * xe_bo_pci_dev_remove_all() - Handle bos when the pci_device is
> > about to be removed
> > + * @xe: The xe device.
> > + *
> > + * On pci_device removal we need to drop all dma mappings and move
> > + * the data of exported bos out to system. This includes SVM bos
> > and
> > + * exported dma-buf bos. This is done by evicting all bos, but
> > + * the evict placement in xe_evict_flags() is chosen such that all
> > + * bos except those mentioned are purged, and thus their memory
> > + * is released.
> > + *
> > + * For pinned bos, we're unmapping dma.
> > + */
> > +void xe_bo_pci_dev_remove_all(struct xe_device *xe)
> > +{
> > +	unsigned int mem_type;
> > +
> > +	/*
> > +	 * Move pagemap bos and exported dma-buf to system, and
> > +	 * purge everything else.
> > +	 */
> > +	for (mem_type =3D XE_PL_VRAM1; mem_type >=3D XE_PL_TT; --
> > mem_type) {
> > +		struct ttm_resource_manager *man =3D
> > +			ttm_manager_type(&xe->ttm, mem_type);
> > +
> > +		if (man) {
> > +			int ret =3D
> > ttm_resource_manager_evict_all(&xe->ttm, man);
> > +
> > +			drm_WARN_ON(&xe->drm, ret);
> > +		}
> > +	}
> > +
> > +	xe_bo_pci_dev_remove_pinned(xe);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h
> > b/drivers/gpu/drm/xe/xe_bo_evict.h
> > index 746894798852..0f06140163d6 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_evict.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_evict.h
> > @@ -12,4 +12,5 @@ int xe_bo_evict_all(struct xe_device *xe);
> > =C2=A0 int xe_bo_restore_kernel(struct xe_device *xe);
> > =C2=A0 int xe_bo_restore_user(struct xe_device *xe);
> > =C2=A0=20
> > +void xe_bo_pci_dev_remove_all(struct xe_device *xe);
> > =C2=A0 #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index b2f656b2a563..739861edcd30 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -23,6 +23,7 @@
> > =C2=A0 #include "regs/xe_gt_regs.h"
> > =C2=A0 #include "regs/xe_regs.h"
> > =C2=A0 #include "xe_bo.h"
> > +#include "xe_bo_evict.h"
> > =C2=A0 #include "xe_debugfs.h"
> > =C2=A0 #include "xe_devcoredump.h"
> > =C2=A0 #include "xe_dma_buf.h"
> > @@ -468,8 +469,9 @@ struct xe_device *xe_device_create(struct
> > pci_dev *pdev,
> > =C2=A0=20
> > =C2=A0=C2=A0	spin_lock_init(&xe->pinned.lock);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
> > -	INIT_LIST_HEAD(&xe->pinned.external_vram);
> > +	INIT_LIST_HEAD(&xe->pinned.external);
> > =C2=A0=C2=A0	INIT_LIST_HEAD(&xe->pinned.evicted);
> > +	INIT_LIST_HEAD(&xe->pinned.external_evicted);
> > =C2=A0=20
> > =C2=A0=C2=A0	xe->preempt_fence_wq =3D alloc_ordered_workqueue("xe-
> > preempt-fence-wq",
> > =C2=A0=C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > WQ_MEM_RECLAIM);
> > @@ -925,6 +927,8 @@ void xe_device_remove(struct xe_device *xe)
> > =C2=A0=C2=A0	xe_display_unregister(xe);
> > =C2=A0=20
> > =C2=A0=C2=A0	drm_dev_unplug(&xe->drm);
> > +
> > +	xe_bo_pci_dev_remove_all(xe);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 void xe_device_shutdown(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 4472bf849f2b..aa83ba414301 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -426,8 +426,10 @@ struct xe_device {
> > =C2=A0=C2=A0		struct list_head kernel_bo_present;
> > =C2=A0=C2=A0		/** @pinned.evicted: pinned BO that have been
> > evicted */
> > =C2=A0=C2=A0		struct list_head evicted;
> > -		/** @pinned.external_vram: pinned external BO in
> > vram*/
> > -		struct list_head external_vram;
> > +		/** @pinned.external: pinned external and dma-buf.
> > */
> > +		struct list_head external;
> > +		/** @pinned.external: evicted pinned external and
> > dma-buf. */
> > +		struct list_head external_evicted;
> > =C2=A0=C2=A0	} pinned;
> > =C2=A0=20
> > =C2=A0=C2=A0	/** @ufence_wq: user fence wait queue */
>=20


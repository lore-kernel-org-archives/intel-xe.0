Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D1310ED659
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1603310ECF7;
	Fri, 27 Mar 2026 11:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcsobBTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4D510ECF7
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774609588; x=1806145588;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=L5ClUyWVsbO0BJs6Sxdr/ZedKCtiLYVd8gpVydyfrjA=;
 b=FcsobBTI+ntcopQ1mlpz7e+NpNRcvMJa484VVqkvbt+eTkTpXS8tnsCv
 uKtIDg05fTcV9f9KQ7ba0s6W7LAIiIYC04CzVMcwln2uk4ZZ63YqvvLlp
 w5FjWrC4LcLQKJXHYMAdcQl72Jz63k3e6Dzw96gn3eapvRpnYvbGCbTh+
 IgWh8oEuAWUKMGzF/GL5d2GfyhO9qAHbrpEn2yi3UyxL5Yy7BdL5X9SWT
 AjP+lMOM25nO651SMHrq776qn5h4ig0QGERcYcM6VJMTVDq7N4ZPDxgBO
 c9YAZqmKuda8WQ5+RxYDF7bHob54uQQ2sNWVGQ5T27K2SyfPdfZ7R10Co w==;
X-CSE-ConnectionGUID: KXotmW2wRsSKKj492RYqWw==
X-CSE-MsgGUID: +WQjyO57TkSnshLtiOvXdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75561370"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75561370"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:06:27 -0700
X-CSE-ConnectionGUID: 5J1OulHTTdCO6RURmyjtIA==
X-CSE-MsgGUID: 7v7Ga6hlSS60qIT0KRYcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="221956278"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.146])
 ([10.245.244.146])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:06:25 -0700
Message-ID: <a1cc476e605e291762178b297a705ca0423949f1.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/mm: add XE DRM MM manager with shadow support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
Date: Fri, 27 Mar 2026 12:06:21 +0100
In-Reply-To: <6ad46836-1b19-4a06-81ad-ab835f3d91d7@intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
 <94b2be9125929696f64c1637c2eb160a578a0a6d.camel@linux.intel.com>
 <6ad46836-1b19-4a06-81ad-ab835f3d91d7@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-03-27 at 11:54 +0100, Michal Wajdeczko wrote:
>=20
>=20
> On 3/26/2026 8:57 PM, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2026-03-20 at 12:12 +0000, Satyanarayana K V P wrote:
> > > Add a xe_drm_mm manager to allocate sub-ranges from a BO-backed
> > > pool
> > > using drm_mm.
> >=20
> > Just a comment on the naming. xe_drm_mm sounds like this is yet
> > another
> > specialized range manager implementation.
>=20
> well, in fact it looks like *very* specialized MM, not much reusable
> elsewhere

True, what I meant was it's not *implementing* a new range manager,
like drm_mm, but rather using an existing.

>=20
> >=20
> > Could we invent a better name?=20
> >=20
> > xe_mm_suballoc? Something even better?
>=20
> xe_shadow_pool ?

I noticed a new patch was sent out renaming to xe_mm_suballoc but=20
xe_shadow_pool sounds much better.

Thanks,
Thomas



>=20
> or if we split this MM into "plain pool" and "shadow pool":
>=20
> xe_pool		--> like xe_sa but works without fences (can be
> reused in xe_guc_buf)
> xe_shadow_pool	--> built on top of plain, with shadow logic
>=20
>=20
> more comments below
>=20
> >=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > >=20
> > > Signed-off-by: Satyanarayana K V P
> > > <satyanarayana.k.v.p@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0drivers/gpu/drm/xe/xe_drm_mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 200
> > > +++++++++++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_drm_mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 55 ++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_drm_mm_types.h |=C2=A0 42 ++++++
> > > =C2=A04 files changed, 298 insertions(+)
> > > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
> > > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
> > > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index dab979287a96..6ab4e2392df1 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -41,6 +41,7 @@ xe-y +=3D xe_bb.o \
> > > =C2=A0	xe_device_sysfs.o \
> > > =C2=A0	xe_dma_buf.o \
> > > =C2=A0	xe_drm_client.o \
> > > +	xe_drm_mm.o \
> > > =C2=A0	xe_drm_ras.o \
> > > =C2=A0	xe_eu_stall.o \
> > > =C2=A0	xe_exec.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_drm_mm.c
> > > b/drivers/gpu/drm/xe/xe_drm_mm.c
> > > new file mode 100644
> > > index 000000000000..c5b1766fa75a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_drm_mm.c
> > > @@ -0,0 +1,200 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright =C2=A9 2026 Intel Corporation
> > > + */
> > > +
> > > +#include <drm/drm_managed.h>
>=20
> nit: <linux> headers go first
>=20
> > > +#include <linux/kernel.h>
> > > +
> > > +#include "xe_device_types.h"
> > > +#include "xe_drm_mm_types.h"
> > > +#include "xe_drm_mm.h"
> > > +#include "xe_map.h"
> > > +
> > > +static void xe_drm_mm_manager_fini(struct drm_device *drm, void
> > > *arg)
> > > +{
> > > +	struct xe_drm_mm_manager *drm_mm_manager =3D arg;
> > > +	struct xe_bo *bo =3D drm_mm_manager->bo;
> > > +
> > > +	if (!bo) {
>=20
> not needed, we shouldn't be here if we failed to allocate a bo
>=20
> > > +		drm_err(drm, "no bo for drm mm manager\n");
>=20
> btw, our MM seems to be 'tile' oriented, so we should use
> xe_tile_err()=20
>=20
> > > +		return;
> > > +	}
> > > +
> > > +	drm_mm_takedown(&drm_mm_manager->base);
> > > +
> > > +	if (drm_mm_manager->is_iomem)
> > > +		kvfree(drm_mm_manager->cpu_addr);
> > > +
> > > +	drm_mm_manager->bo =3D NULL;
> > > +	drm_mm_manager->shadow =3D NULL;
> > > +}
> > > +
> > > +/**
> > > + * xe_drm_mm_manager_init() - Create and initialize the DRM MM
> > > manager.
> > > + * @tile: the &xe_tile where allocate.
> > > + * @size: number of bytes to allocate
> > > + * @guard: number of bytes to exclude from allocation for guard
> > > region
>=20
> do we really need this guard ? it was already questionable on the
> xe_sa
>=20
> > > + * @flags: additional flags for configuring the DRM MM manager.
> > > + *
> > > + * Initializes a DRM MM manager for managing memory allocations
> > > on a
> > > specific
> > > + * XE tile. The function allocates a buffer object to back the
> > > memory region
> > > + * managed by the DRM MM manager.
> > > + *
> > > + * Return: a pointer to the &xe_drm_mm_manager, or an error
> > > pointer
> > > on failure.
> > > + */
> > > +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> > > *tile, u32 size,
> > > +						 u32 guard, u32
> > > flags)
> > > +{
> > > +	struct xe_device *xe =3D tile_to_xe(tile);
> > > +	struct xe_drm_mm_manager *drm_mm_manager;
> > > +	u64 managed_size;
> > > +	struct xe_bo *bo;
> > > +	int ret;
> > > +
> > > +	xe_tile_assert(tile, size > guard);
> > > +	managed_size =3D size - guard;
> > > +
> > > +	drm_mm_manager =3D drmm_kzalloc(&xe->drm,
> > > sizeof(*drm_mm_manager), GFP_KERNEL);
> > > +	if (!drm_mm_manager)
> > > +		return ERR_PTR(-ENOMEM);
>=20
> can't we make this manager a member of the tile and then use
> container_of to get parent tile pointer?
>=20
> I guess we will have exactly one this MM per tile, no?
>=20
> > > +
> > > +	bo =3D xe_managed_bo_create_pin_map(xe, tile, size,
> > > +					=C2=A0
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +					=C2=A0 XE_BO_FLAG_GGTT |
> > > +					=C2=A0
> > > XE_BO_FLAG_GGTT_INVALIDATE
> > > >=20
> > > +					=C2=A0
> > > XE_BO_FLAG_PINNED_NORESTORE);
> > > +	if (IS_ERR(bo)) {
> > > +		drm_err(&xe->drm, "Failed to prepare %uKiB BO
> > > for
>=20
> xe_tile_err(tile, ...
>=20
> but maybe nicer solution would be to add such error to the
> xe_managed_bo_create_pin_map() to avoid duplicating this diag
> messages in all callers
>=20
> > > DRM MM manager (%pe)\n",
> > > +			size / SZ_1K, bo);
> > > +		return ERR_CAST(bo);
> > > +	}
> > > +	drm_mm_manager->bo =3D bo;
> > > +	drm_mm_manager->is_iomem =3D bo->vmap.is_iomem;
>=20
> do we need to cache this?
>=20
> > > +
> > > +	if (bo->vmap.is_iomem) {
> > > +		drm_mm_manager->cpu_addr =3D
> > > kvzalloc(managed_size,
> > > GFP_KERNEL);
> > > +		if (!drm_mm_manager->cpu_addr)
> > > +			return ERR_PTR(-ENOMEM);
> > > +	} else {
> > > +		drm_mm_manager->cpu_addr =3D bo->vmap.vaddr;
> > > +		memset(drm_mm_manager->cpu_addr, 0, bo-
> > > > ttm.base.size);
>=20
> btw, maybe we should consider adding XE_BO_FLAG_ZERO and let
> the xe_create_bo do initial clear for us?
>=20
> @Matt @Thomas ?
>=20
> > > +	}
> > > +
> > > +	if (flags & XE_DRM_MM_BO_MANAGER_FLAG_SHADOW) {
>=20
> hmm, so this is not a main feature of this MM?
> then maybe we should have two components:
>=20
> 	* xe_pool (plain MM, like xe_sa but without fences)
> 	* xe_shadow (adds shadow BO on top of plain MM)
>=20
> > > +		struct xe_bo *shadow;
> > > +
> > > +		ret =3D drmm_mutex_init(&xe->drm, &drm_mm_manager-
> > > > swap_guard);
> > > +		if (ret)
> > > +			return ERR_PTR(ret);
> > > +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > > +			fs_reclaim_acquire(GFP_KERNEL);
> > > +			might_lock(&drm_mm_manager->swap_guard);
> > > +			fs_reclaim_release(GFP_KERNEL);
> > > +		}
> > > +
> > > +		shadow =3D xe_managed_bo_create_pin_map(xe, tile,
> > > size,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > XE_BO_FLAG_GGTT |
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > XE_BO_FLAG_GGTT_INVALIDATE |
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > XE_BO_FLAG_PINNED_NORESTORE);
> > > +		if (IS_ERR(shadow)) {
> > > +			drm_err(&xe->drm,
> > > +				"Failed to prepare %uKiB shadow
> > > BO
> > > for DRM MM manager (%pe)\n",
> > > +				size / SZ_1K, shadow);
> > > +			return ERR_CAST(shadow);
> > > +		}
> > > +		drm_mm_manager->shadow =3D shadow;
> > > +	}
> > > +
> > > +	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
> > > +	ret =3D drmm_add_action_or_reset(&xe->drm,
> > > xe_drm_mm_manager_fini, drm_mm_manager);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	return drm_mm_manager;
> > > +}
> > > +
> > > +/**
> > > + * xe_drm_mm_bo_swap_shadow() - Swap the primary BO with the
> > > shadow
> > > BO.
>=20
> do we need _bo_ in the function name here?
>=20
> > > + * @drm_mm_manager: the DRM MM manager containing the primary
> > > and
> > > shadow BOs.
> > > + *
> > > + * Swaps the primary buffer object with the shadow buffer object
> > > in
> > > the DRM MM
> > > + * manager.
>=20
> say a word about required swap_guard mutex
>=20
> and/or add the _locked suffix to the function name
>=20
> > > + *
> > > + * Return: None.
> > > + */
> > > +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> > > *drm_mm_manager)
> > > +{
> > > +	struct xe_device *xe =3D tile_to_xe(drm_mm_manager->bo-
> > > >tile);
> > > +
> > > +	xe_assert(xe, drm_mm_manager->shadow);
>=20
> use xe_tile_assert
>=20
> > > +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> > > +
> > > +	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
> > > +	if (!drm_mm_manager->bo->vmap.is_iomem)
> > > +		drm_mm_manager->cpu_addr =3D drm_mm_manager->bo-
> > > > vmap.vaddr;
> > > +}
> > > +
> > > +/**
> > > + * xe_drm_mm_sync_shadow() - Synchronize the shadow BO with the
> > > primary BO.
> > > + * @drm_mm_manager: the DRM MM manager containing the primary
> > > and
> > > shadow BOs.
> > > + * @node: the DRM MM node representing the region to
> > > synchronize.
> > > + *
> > > + * Copies the contents of the specified region from the primary
> > > buffer object to
> > > + * the shadow buffer object in the DRM MM manager.
> > > + *
> > > + * Return: None.
> > > + */
> > > +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager
> > > *drm_mm_manager,
> > > +			=C2=A0=C2=A0 struct drm_mm_node *node)
> > > +{
> > > +	struct xe_device *xe =3D tile_to_xe(drm_mm_manager->bo-
> > > >tile);
> > > +
> > > +	xe_assert(xe, drm_mm_manager->shadow);
> > > +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> > > +
> > > +	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
> > > +			 node->start,
> > > +			 drm_mm_manager->cpu_addr + node->start,
> > > +			 node->size);
>=20
> maybe I'm missing something, but if primary BO.is_iomem=3D=3Dtrue then
> who/when updates the actual primary BO memory? or is it unused by
> design and only shadow has the data ...
>=20
> maybe some DOC section with theory-of-operation will help here?
>=20
> > > +}
> > > +
> > > +/**
> > > + * xe_drm_mm_insert_node() - Insert a node into the DRM MM
> > > manager.
> > > + * @drm_mm_manager: the DRM MM manager to insert the node into.
> > > + * @node: the DRM MM node to insert.
>=20
> in recent changes to xe_ggtt we finally hidden the implementation
> details
> of the MM used by the xe_ggtt
>=20
> why here we start again exposing impl detail as part of the API?
> if we can't allocate xe_drm_mm_node here, maybe at least take it
> as a parameter and update in place
>=20
> > > + * @size: the size of the node to insert.
> > > + *
> > > + * Inserts a node into the DRM MM manager and clears the
> > > corresponding memory region
> > > + * in both the primary and shadow buffer objects.
> > > + *
> > > + * Return: 0 on success, or a negative error code on failure.
> > > + */
> > > +int xe_drm_mm_insert_node(struct xe_drm_mm_manager
> > > *drm_mm_manager,
> > > +			=C2=A0 struct drm_mm_node *node, u32 size)
> > > +{
> > > +	struct drm_mm *mm =3D &drm_mm_manager->base;
> > > +	int ret;
> > > +
> > > +	ret =3D drm_mm_insert_node(mm, node, size);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	memset((void *)drm_mm_manager->bo->vmap.vaddr + node-
> > > >start,
> > > 0, node->size);
>=20
> iosys_map_memset(bo->vmap, start, 0, size) ?
>=20
> > > +	if (drm_mm_manager->shadow)
> > > +		memset((void *)drm_mm_manager->shadow-
> > > >vmap.vaddr +
> > > node->start, 0,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->size);
>=20
> what about clearing the drm_mm_manager->cpu_addr ?
>=20
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_drm_mm_remove_node() - Remove a node from the DRM MM
> > > manager.
> > > + * @node: the DRM MM node to remove.
> > > + *
> > > + * Return: None.
> > > + */
> > > +void xe_drm_mm_remove_node(struct drm_mm_node *node)
> > > +{
> > > +	return drm_mm_remove_node(node);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_drm_mm.h
> > > b/drivers/gpu/drm/xe/xe_drm_mm.h
> > > new file mode 100644
> > > index 000000000000..aeb7cab92d0b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_drm_mm.h
> > > @@ -0,0 +1,55 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright =C2=A9 2026 Intel Corporation
> > > + */
> > > +#ifndef _XE_DRM_MM_H_
> > > +#define _XE_DRM_MM_H_
> > > +
> > > +#include <linux/sizes.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include "xe_bo.h"
> > > +#include "xe_drm_mm_types.h"
> > > +
> > > +struct dma_fence;
>=20
> do we need this?
>=20
> > > +struct xe_tile;
> > > +
> > > +#define XE_DRM_MM_BO_MANAGER_FLAG_SHADOW=C2=A0=C2=A0=C2=A0 BIT(0)
> > > +
> > > +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> > > *tile, u32 size,
> > > +						 u32 guard, u32
> > > flags);
> > > +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> > > *drm_mm_manager);
> > > +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager
> > > *drm_mm_manager,
> > > +			=C2=A0=C2=A0 struct drm_mm_node *node);
> > > +int xe_drm_mm_insert_node(struct xe_drm_mm_manager
> > > *drm_mm_manager,
> > > +			=C2=A0 struct drm_mm_node *node, u32 size);
> > > +void xe_drm_mm_remove_node(struct drm_mm_node *node);
> > > +
> > > +/**
> > > + * xe_drm_mm_manager_gpu_addr() - Retrieve GPU address of a back
> > > storage BO
> > > + * within a memory manager.
> > > + * @drm_mm_manager: The DRM MM memory manager.
> > > + *
> > > + * Returns: GGTT address of the back storage BO
> > > + */
> > > +static inline u64 xe_drm_mm_manager_gpu_addr(struct
> > > xe_drm_mm_manager
> > > +					=C2=A0=C2=A0=C2=A0=C2=A0 *drm_mm_manager)
> > > +{
> > > +	return xe_bo_ggtt_addr(drm_mm_manager->bo);
> > > +}
> > > +
> > > +/**
> > > + * xe_drm_mm_bo_swap_guard() - Retrieve the mutex used to guard
> > > swap
> > > operations
>=20
> hmm, do we need the _bo_ here?
>=20
> > > + * on a memory manager.
> > > + * @drm_mm_manager: The DRM MM memory manager.
> > > + *
> > > + * Returns: Swap guard mutex.
> > > + */
> > > +static inline struct mutex *xe_drm_mm_bo_swap_guard(struct
> > > xe_drm_mm_manager
> > > +						=C2=A0=C2=A0=C2=A0
> > > *drm_mm_manager)
> > > +{
> > > +	return &drm_mm_manager->swap_guard;
> > > +}
> > > +
> > > +#endif
> > > +
> > > diff --git a/drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > new file mode 100644
> > > index 000000000000..69e0937dd8de
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> > > @@ -0,0 +1,42 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright =C2=A9 2026 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_DRM_MM_TYPES_H_
> > > +#define _XE_DRM_MM_TYPES_H_
> > > +
> > > +#include <drm/drm_mm.h>
> > > +
> > > +struct xe_bo;
> > > +
>=20
> without kernel-doc for the struct itself, below kernel-docs for the
> members are currently not recognized by the tool
>=20
> > > +struct xe_drm_mm_manager {
> > > +	/** @base: Range allocator over [0, @size) in bytes */
> > > +	struct drm_mm base;
> > > +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> > > +	struct xe_bo *bo;
> > > +	/** @shadow: Shadow BO for atomic command updates. */
> > > +	struct xe_bo *shadow;
> > > +	/** @swap_guard: Timeline guard updating @bo and @shadow
> > > */
> > > +	struct mutex swap_guard;
> > > +	/** @cpu_addr: CPU virtual address of the active BO. */
> > > +	void *cpu_addr;
> > > +	/** @size: Total size of the managed address space. */
> > > +	u64 size;
> > > +	/** @is_iomem: Whether the managed address space is I/O
> > > memory. */
> > > +	bool is_iomem;
> > > +};
> > > +
>=20
> ditto
>=20
> > > +struct xe_drm_mm_bb {
> > > +	/** @node: Range node for this batch buffer. */
> > > +	struct drm_mm_node node;
> > > +	/** @manager: Manager this batch buffer belongs to. */
> > > +	struct xe_drm_mm_manager *manager;
> > > +	/** @cs: Command stream for this batch buffer. */
> > > +	u32 *cs;
> > > +	/** @len: Length of the CS in dwords. */
> > > +	u32 len;
> > > +};
>=20
> but we are not using this struct yet in this patch, correct?
>=20
> > > +
> > > +#endif
> > > +

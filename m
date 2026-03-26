Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728C510AB810
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 19:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E82610E23A;
	Thu, 26 Mar 2026 19:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMwr4pc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBDB10E23A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774555060; x=1806091060;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cas9m5qBjdtIysx9NwlIaEaCxgP2IS5In+QLxSSo0Ng=;
 b=eMwr4pc5TPT41L+V74Zb8wZB3ejRdYe85dJ7IZFeb0L/ZlToy3XGL/6E
 xzmUv4AiI5Sz6lYqqo8FTL/+496cbJlImtkjXm4H6pO7ea8zcbpfEIK9d
 fpYLjyIchytkhBUWhvLQSHkomLhFnAbvDcO6Evi6yFLU/x/5huUEpR8uF
 PTgQaaOAalz9LC+hux2MDzxZWIZ6O/I9eZfE0JuycfNf+KsmlIsV93A6W
 TKGon3Qz+qmXFIPs/tiu7UMGk0nzJ38utr7e9TbKXFxle5U2vCV/hWtPa
 XhS4tEp7yLQ9TfH3hMdDfhy5rnKXYwnb97SsJoeO97N8KPx8GAAmtnYVl w==;
X-CSE-ConnectionGUID: fkGqhp/+R7CBHnwsf9Bzxw==
X-CSE-MsgGUID: /x3+J1FaSQO75Pi0ONykLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78223391"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78223391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:57:40 -0700
X-CSE-ConnectionGUID: R43nnMRkTjatcwGRXr5DtQ==
X-CSE-MsgGUID: WpUOMqiqRfKA9dCfKHz0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="263016986"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.251])
 ([10.245.245.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:57:38 -0700
Message-ID: <94b2be9125929696f64c1637c2eb160a578a0a6d.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/mm: add XE DRM MM manager with shadow support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Date: Thu, 26 Mar 2026 20:57:36 +0100
In-Reply-To: <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
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

On Fri, 2026-03-20 at 12:12 +0000, Satyanarayana K V P wrote:
> Add a xe_drm_mm manager to allocate sub-ranges from a BO-backed pool
> using drm_mm.

Just a comment on the naming. xe_drm_mm sounds like this is yet another
specialized range manager implementation.

Could we invent a better name?=20

xe_mm_suballoc? Something even better?


Thanks,
Thomas



>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_drm_mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 200
> +++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_drm_mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 55 ++++++++
> =C2=A0drivers/gpu/drm/xe/xe_drm_mm_types.h |=C2=A0 42 ++++++
> =C2=A04 files changed, 298 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index dab979287a96..6ab4e2392df1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -41,6 +41,7 @@ xe-y +=3D xe_bb.o \
> =C2=A0	xe_device_sysfs.o \
> =C2=A0	xe_dma_buf.o \
> =C2=A0	xe_drm_client.o \
> +	xe_drm_mm.o \
> =C2=A0	xe_drm_ras.o \
> =C2=A0	xe_eu_stall.o \
> =C2=A0	xe_exec.o \
> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.c
> b/drivers/gpu/drm/xe/xe_drm_mm.c
> new file mode 100644
> index 000000000000..c5b1766fa75a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_mm.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kernel.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_drm_mm_types.h"
> +#include "xe_drm_mm.h"
> +#include "xe_map.h"
> +
> +static void xe_drm_mm_manager_fini(struct drm_device *drm, void
> *arg)
> +{
> +	struct xe_drm_mm_manager *drm_mm_manager =3D arg;
> +	struct xe_bo *bo =3D drm_mm_manager->bo;
> +
> +	if (!bo) {
> +		drm_err(drm, "no bo for drm mm manager\n");
> +		return;
> +	}
> +
> +	drm_mm_takedown(&drm_mm_manager->base);
> +
> +	if (drm_mm_manager->is_iomem)
> +		kvfree(drm_mm_manager->cpu_addr);
> +
> +	drm_mm_manager->bo =3D NULL;
> +	drm_mm_manager->shadow =3D NULL;
> +}
> +
> +/**
> + * xe_drm_mm_manager_init() - Create and initialize the DRM MM
> manager.
> + * @tile: the &xe_tile where allocate.
> + * @size: number of bytes to allocate
> + * @guard: number of bytes to exclude from allocation for guard
> region
> + * @flags: additional flags for configuring the DRM MM manager.
> + *
> + * Initializes a DRM MM manager for managing memory allocations on a
> specific
> + * XE tile. The function allocates a buffer object to back the
> memory region
> + * managed by the DRM MM manager.
> + *
> + * Return: a pointer to the &xe_drm_mm_manager, or an error pointer
> on failure.
> + */
> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> *tile, u32 size,
> +						 u32 guard, u32
> flags)
> +{
> +	struct xe_device *xe =3D tile_to_xe(tile);
> +	struct xe_drm_mm_manager *drm_mm_manager;
> +	u64 managed_size;
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	xe_tile_assert(tile, size > guard);
> +	managed_size =3D size - guard;
> +
> +	drm_mm_manager =3D drmm_kzalloc(&xe->drm,
> sizeof(*drm_mm_manager), GFP_KERNEL);
> +	if (!drm_mm_manager)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bo =3D xe_managed_bo_create_pin_map(xe, tile, size,
> +					=C2=A0
> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					=C2=A0 XE_BO_FLAG_GGTT |
> +					=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE
> |
> +					=C2=A0
> XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for
> DRM MM manager (%pe)\n",
> +			size / SZ_1K, bo);
> +		return ERR_CAST(bo);
> +	}
> +	drm_mm_manager->bo =3D bo;
> +	drm_mm_manager->is_iomem =3D bo->vmap.is_iomem;
> +
> +	if (bo->vmap.is_iomem) {
> +		drm_mm_manager->cpu_addr =3D kvzalloc(managed_size,
> GFP_KERNEL);
> +		if (!drm_mm_manager->cpu_addr)
> +			return ERR_PTR(-ENOMEM);
> +	} else {
> +		drm_mm_manager->cpu_addr =3D bo->vmap.vaddr;
> +		memset(drm_mm_manager->cpu_addr, 0, bo-
> >ttm.base.size);
> +	}
> +
> +	if (flags & XE_DRM_MM_BO_MANAGER_FLAG_SHADOW) {
> +		struct xe_bo *shadow;
> +
> +		ret =3D drmm_mutex_init(&xe->drm, &drm_mm_manager-
> >swap_guard);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +			fs_reclaim_acquire(GFP_KERNEL);
> +			might_lock(&drm_mm_manager->swap_guard);
> +			fs_reclaim_release(GFP_KERNEL);
> +		}
> +
> +		shadow =3D xe_managed_bo_create_pin_map(xe, tile,
> size,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_GGTT |
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_GGTT_INVALIDATE |
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> XE_BO_FLAG_PINNED_NORESTORE);
> +		if (IS_ERR(shadow)) {
> +			drm_err(&xe->drm,
> +				"Failed to prepare %uKiB shadow BO
> for DRM MM manager (%pe)\n",
> +				size / SZ_1K, shadow);
> +			return ERR_CAST(shadow);
> +		}
> +		drm_mm_manager->shadow =3D shadow;
> +	}
> +
> +	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
> +	ret =3D drmm_add_action_or_reset(&xe->drm,
> xe_drm_mm_manager_fini, drm_mm_manager);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return drm_mm_manager;
> +}
> +
> +/**
> + * xe_drm_mm_bo_swap_shadow() - Swap the primary BO with the shadow
> BO.
> + * @drm_mm_manager: the DRM MM manager containing the primary and
> shadow BOs.
> + *
> + * Swaps the primary buffer object with the shadow buffer object in
> the DRM MM
> + * manager.
> + *
> + * Return: None.
> + */
> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> *drm_mm_manager)
> +{
> +	struct xe_device *xe =3D tile_to_xe(drm_mm_manager->bo->tile);
> +
> +	xe_assert(xe, drm_mm_manager->shadow);
> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> +
> +	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
> +	if (!drm_mm_manager->bo->vmap.is_iomem)
> +		drm_mm_manager->cpu_addr =3D drm_mm_manager->bo-
> >vmap.vaddr;
> +}
> +
> +/**
> + * xe_drm_mm_sync_shadow() - Synchronize the shadow BO with the
> primary BO.
> + * @drm_mm_manager: the DRM MM manager containing the primary and
> shadow BOs.
> + * @node: the DRM MM node representing the region to synchronize.
> + *
> + * Copies the contents of the specified region from the primary
> buffer object to
> + * the shadow buffer object in the DRM MM manager.
> + *
> + * Return: None.
> + */
> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
> +			=C2=A0=C2=A0 struct drm_mm_node *node)
> +{
> +	struct xe_device *xe =3D tile_to_xe(drm_mm_manager->bo->tile);
> +
> +	xe_assert(xe, drm_mm_manager->shadow);
> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
> +			 node->start,
> +			 drm_mm_manager->cpu_addr + node->start,
> +			 node->size);
> +}
> +
> +/**
> + * xe_drm_mm_insert_node() - Insert a node into the DRM MM manager.
> + * @drm_mm_manager: the DRM MM manager to insert the node into.
> + * @node: the DRM MM node to insert.
> + * @size: the size of the node to insert.
> + *
> + * Inserts a node into the DRM MM manager and clears the
> corresponding memory region
> + * in both the primary and shadow buffer objects.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
> +			=C2=A0 struct drm_mm_node *node, u32 size)
> +{
> +	struct drm_mm *mm =3D &drm_mm_manager->base;
> +	int ret;
> +
> +	ret =3D drm_mm_insert_node(mm, node, size);
> +	if (ret)
> +		return ret;
> +
> +	memset((void *)drm_mm_manager->bo->vmap.vaddr + node->start,
> 0, node->size);
> +	if (drm_mm_manager->shadow)
> +		memset((void *)drm_mm_manager->shadow->vmap.vaddr +
> node->start, 0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 node->size);
> +	return 0;
> +}
> +
> +/**
> + * xe_drm_mm_remove_node() - Remove a node from the DRM MM manager.
> + * @node: the DRM MM node to remove.
> + *
> + * Return: None.
> + */
> +void xe_drm_mm_remove_node(struct drm_mm_node *node)
> +{
> +	return drm_mm_remove_node(node);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.h
> b/drivers/gpu/drm/xe/xe_drm_mm.h
> new file mode 100644
> index 000000000000..aeb7cab92d0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_mm.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +#ifndef _XE_DRM_MM_H_
> +#define _XE_DRM_MM_H_
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include "xe_bo.h"
> +#include "xe_drm_mm_types.h"
> +
> +struct dma_fence;
> +struct xe_tile;
> +
> +#define XE_DRM_MM_BO_MANAGER_FLAG_SHADOW=C2=A0=C2=A0=C2=A0 BIT(0)
> +
> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile
> *tile, u32 size,
> +						 u32 guard, u32
> flags);
> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager
> *drm_mm_manager);
> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
> +			=C2=A0=C2=A0 struct drm_mm_node *node);
> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
> +			=C2=A0 struct drm_mm_node *node, u32 size);
> +void xe_drm_mm_remove_node(struct drm_mm_node *node);
> +
> +/**
> + * xe_drm_mm_manager_gpu_addr() - Retrieve GPU address of a back
> storage BO
> + * within a memory manager.
> + * @drm_mm_manager: The DRM MM memory manager.
> + *
> + * Returns: GGTT address of the back storage BO
> + */
> +static inline u64 xe_drm_mm_manager_gpu_addr(struct
> xe_drm_mm_manager
> +					=C2=A0=C2=A0=C2=A0=C2=A0 *drm_mm_manager)
> +{
> +	return xe_bo_ggtt_addr(drm_mm_manager->bo);
> +}
> +
> +/**
> + * xe_drm_mm_bo_swap_guard() - Retrieve the mutex used to guard swap
> operations
> + * on a memory manager.
> + * @drm_mm_manager: The DRM MM memory manager.
> + *
> + * Returns: Swap guard mutex.
> + */
> +static inline struct mutex *xe_drm_mm_bo_swap_guard(struct
> xe_drm_mm_manager
> +						=C2=A0=C2=A0=C2=A0 *drm_mm_manager)
> +{
> +	return &drm_mm_manager->swap_guard;
> +}
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_drm_mm_types.h
> b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> new file mode 100644
> index 000000000000..69e0937dd8de
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_DRM_MM_TYPES_H_
> +#define _XE_DRM_MM_TYPES_H_
> +
> +#include <drm/drm_mm.h>
> +
> +struct xe_bo;
> +
> +struct xe_drm_mm_manager {
> +	/** @base: Range allocator over [0, @size) in bytes */
> +	struct drm_mm base;
> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> +	struct xe_bo *bo;
> +	/** @shadow: Shadow BO for atomic command updates. */
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
> +	/** @cpu_addr: CPU virtual address of the active BO. */
> +	void *cpu_addr;
> +	/** @size: Total size of the managed address space. */
> +	u64 size;
> +	/** @is_iomem: Whether the managed address space is I/O
> memory. */
> +	bool is_iomem;
> +};
> +
> +struct xe_drm_mm_bb {
> +	/** @node: Range node for this batch buffer. */
> +	struct drm_mm_node node;
> +	/** @manager: Manager this batch buffer belongs to. */
> +	struct xe_drm_mm_manager *manager;
> +	/** @cs: Command stream for this batch buffer. */
> +	u32 *cs;
> +	/** @len: Length of the CS in dwords. */
> +	u32 len;
> +};
> +
> +#endif
> +

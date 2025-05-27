Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1209C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 08:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4B410E3F7;
	Tue, 27 May 2025 08:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9hgke4M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC9010E3F7
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748332939; x=1779868939;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qQ2N4bTD9zuEgtv8IpM3UTRk4zrL37xzWCaiBaUdB74=;
 b=S9hgke4MTegBKCcUTUkmG/71gKPSyCSIGYVFzpnIhMO76cPjWBismCM5
 aaiqKOtfoiwTRZ/b3YoQJ3FQmjvVFldsnzwPo6idkH9XBM5Ee+OaOMKri
 iySP7f+lre8WgIgSqCUjT+xLTNu6Ipw4kbM8XJlfovGGzy0vyrInvq+Cy
 qmPkIxFyAjDedQgN5k4AjOMuGspZlA3FF3olf1S48gPBpXaxEt8fuQTC/
 kfLZcjDsA3RAg6DjD2t/1pNpMtkSamXNpZr0zwWqIdTkvfhxOWP1rh5m7
 mr6H0GFZcvwztStV7lM7M83DMQXNqcBN7+rEVm9br9EYWsXkMcFfrN3ze w==;
X-CSE-ConnectionGUID: gf1R4t8oTYGtWJaVXmALVA==
X-CSE-MsgGUID: ula5/a14TraITN86psCNEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53965381"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="53965381"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 01:02:18 -0700
X-CSE-ConnectionGUID: ueeuHE6nRymOje9Pf5QwVw==
X-CSE-MsgGUID: 1B2CPcSHRny5cOf7VpBeHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="143678317"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.119])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 01:02:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Stuart
 Summers <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Unify the initialization of VRAM regions
In-Reply-To: <20250526145647.1958756-3-piotr.piorkowski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250526145647.1958756-1-piotr.piorkowski@intel.com>
 <20250526145647.1958756-3-piotr.piorkowski@intel.com>
Date: Tue, 27 May 2025 11:02:13 +0300
Message-ID: <8adad3b429092cad3263660b674a6d78ab4467b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 26 May 2025, Pi=C3=B3rkowski, Piotr <piotr.piorkowski@intel.com> wr=
ote:
> From: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
>
> Currently in the drivers we have defined VRAM regions per device and per
> tile. Initialization of these regions is done in two completely different
> ways. To simplify the logic of the code and make it easier to add new
> regions in the future, let's unify the way we initialize VRAM regions.
>
> Signed-off-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h |   8 ++
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |   4 +-
>  drivers/gpu/drm/xe/xe_query.c        |   2 +-
>  drivers/gpu/drm/xe/xe_tile.c         |  30 +----
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
>  drivers/gpu/drm/xe/xe_vram.c         | 175 ++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_vram.h         |   5 +
>  9 files changed, 154 insertions(+), 93 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index a80e892d6959..9793f1a6dab8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -862,6 +862,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20=20
> +	err =3D xe_vram_init_regions_managers(xe);
> +	if (err)
> +		return err;
> +
>  	for_each_tile(tile, xe, id) {
>  		err =3D xe_tile_init_noalloc(tile);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 911afac994bc..2c2c47997029 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -25,6 +25,7 @@
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> +#include "xe_vram.h"

Unnecessary include. Please avoid including headers from headers.

>=20=20
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -78,6 +79,11 @@ struct xe_pxp;
>  struct xe_vram_region {
>  	/** @tile: Backpointer to tile */
>  	struct xe_tile *tile;
> +	/** @id: VRAM region instance id
> +	 *
> +	 * The value should be unique for VRAM region.
> +	 */
> +	u8 id;
>  	/** @io_start: IO start address of this VRAM instance */
>  	resource_size_t io_start;
>  	/**
> @@ -110,6 +116,8 @@ struct xe_vram_region {
>  	void __iomem *mapping;
>  	/** @ttm: VRAM TTM manager */
>  	struct xe_ttm_vram_mgr ttm;
> +	/** @placement: TTM placement dedicated for this region */
> +	u32 placement;
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>  	struct dev_pagemap pagemap;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe=
_gt_pagefault.c
> index 7a8f87709e39..51d88cdb693e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -138,7 +138,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, str=
uct xe_vma *vma,
>  	/* Lock VM and BOs dma-resv */
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		err =3D xe_pf_begin(&exec, vma, atomic, tile->id);
> +		err =3D xe_pf_begin(&exec, vma, atomic, (tile->mem.vram) ? tile->mem.v=
ram->id : 0);
>  		drm_exec_retry_on_contention(&exec);
>  		if (xe_vm_validate_should_retry(&exec, err, &end))
>  			err =3D -EAGAIN;
> @@ -575,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *a=
cc)
>  	/* Lock VM and BOs dma-resv */
>  	drm_exec_init(&exec, 0, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		ret =3D xe_pf_begin(&exec, vma, true, tile->id);
> +		ret =3D xe_pf_begin(&exec, vma, true, (tile->mem.vram) ? tile->mem.vra=
m->id : 0);
>  		drm_exec_retry_on_contention(&exec);
>  		if (ret)
>  			break;
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 99189d15d4a5..a3b59949e31e 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -409,7 +409,7 @@ static int query_gt_list(struct xe_device *xe, struct=
 drm_xe_device_query *query
>  			gt_list->gt_list[id].near_mem_regions =3D 0x1;
>  		else
>  			gt_list->gt_list[id].near_mem_regions =3D
> -				BIT(gt_to_tile(gt)->id) << 1;
> +				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
>  		gt_list->gt_list[id].far_mem_regions =3D xe->info.mem_region_mask ^
>  			gt_list->gt_list[id].near_mem_regions;
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 8303ebd90099..7beb87124f3b 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -7,6 +7,7 @@
>=20=20
>  #include <drm/drm_managed.h>
>=20=20
> +#include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> @@ -18,6 +19,7 @@
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
> +#include "xe_vram.h"
>=20=20
>  /**
>   * DOC: Multi-tile Design
> @@ -115,11 +117,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
>  	if (!IS_DGFX(xe))
>  		return 0;
>=20=20
> -	vram =3D drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> -	if (!vram)
> -		return -ENOMEM;
> -
> -	vram->tile =3D tile;
> +	vram =3D xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
> +	if (IS_ERR(vram))
> +		return PTR_ERR(vram);
>  	tile->mem.vram =3D vram;
>=20=20
>  	return 0;
> @@ -157,21 +157,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct =
xe_device *xe, u8 id)
>  }
>  ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() =
*/
>=20=20
> -static int tile_ttm_mgr_init(struct xe_tile *tile)
> -{
> -	struct xe_device *xe =3D tile_to_xe(tile);
> -	int err;
> -
> -	if (tile->mem.vram->usable_size) {
> -		err =3D xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
> -		if (err)
> -			return err;
> -		xe->info.mem_region_mask |=3D BIT(tile->id) << 1;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * xe_tile_init_noalloc - Init tile up to the point where allocations ca=
n happen.
>   * @tile: The tile to initialize.
> @@ -189,11 +174,6 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>  int xe_tile_init_noalloc(struct xe_tile *tile)
>  {
>  	struct xe_device *xe =3D tile_to_xe(tile);
> -	int err;
> -
> -	err =3D tile_ttm_mgr_init(tile);
> -	if (err)
> -		return err;
>=20=20
>  	xe_wa_apply_tile_workarounds(tile);
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index d9afe0e22071..3a9780d39c65 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -337,12 +337,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, st=
ruct xe_ttm_vram_mgr *mgr,
>  	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
>  }
>=20=20
> -int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *m=
gr)
> +/**
> + * xe_ttm_vram_mgr_init - initialize TTM VRAM region
> + * @xe: pointer to Xe device
> + * @vram: pointer to xe_vram_region that contains the memory region attr=
ibutes
> + *
> + * Initialize the Xe TTM for given @vram region using the given paramete=
rs.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vr=
am)
>  {
> -	struct xe_device *xe =3D tile_to_xe(tile);
> -	struct xe_vram_region *vram =3D tile->mem.vram;
> -
> -	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> +	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
>  				      vram->usable_size, vram->io_size,
>  				      PAGE_SIZE);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.h
> index cc76050e376d..47422873c324 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_TTM_VRAM_MGR_H_
>  #define _XE_TTM_VRAM_MGR_H_
>=20=20
> +#include "xe_device_types.h"

Unnecessary include. Please prefer forward declarations over includes in
headers.

>  #include "xe_ttm_vram_mgr_types.h"
>=20=20
>  enum dma_data_direction;
> @@ -15,7 +16,7 @@ struct xe_tile;
>  int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr =
*mgr,
>  			   u32 mem_type, u64 size, u64 io_size,
>  			   u64 default_page_size);
> -int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *m=
gr);
> +int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vr=
am);
>  int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  			      struct ttm_resource *res,
>  			      u64 offset, u64 length,
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 18124a5fb291..5f68fe4d414a 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -19,6 +19,7 @@
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
> +#include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>=20=20
>  #define BAR_SIZE_SHIFT 20
> @@ -136,7 +137,7 @@ static bool resource_is_valid(struct pci_dev *pdev, i=
nt bar)
>  	return true;
>  }
>=20=20
> -static int determine_lmem_bar_size(struct xe_device *xe)
> +static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_=
region *lmem_bar)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>=20=20
> @@ -147,16 +148,16 @@ static int determine_lmem_bar_size(struct xe_device=
 *xe)
>=20=20
>  	resize_vram_bar(xe);
>=20=20
> -	xe->mem.vram->io_start =3D pci_resource_start(pdev, LMEM_BAR);
> -	xe->mem.vram->io_size =3D pci_resource_len(pdev, LMEM_BAR);
> -	if (!xe->mem.vram->io_size)
> +	lmem_bar->io_start =3D pci_resource_start(pdev, LMEM_BAR);
> +	lmem_bar->io_size =3D pci_resource_len(pdev, LMEM_BAR);
> +	if (!lmem_bar->io_size)
>  		return -EIO;
>=20=20
>  	/* XXX: Need to change when xe link code is ready */
> -	xe->mem.vram->dpa_base =3D 0;
> +	lmem_bar->dpa_base =3D 0;
>=20=20
>  	/* set up a map to the total memory area. */
> -	xe->mem.vram->mapping =3D ioremap_wc(xe->mem.vram->io_start, xe->mem.vr=
am->io_size);
> +	lmem_bar->mapping =3D ioremap_wc(lmem_bar->io_start, lmem_bar->io_size);
>=20=20
>  	return 0;
>  }
> @@ -287,6 +288,92 @@ static void vram_fini(void *arg)
>  		tile->mem.vram->mapping =3D NULL;
>  }
>=20=20
> +struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id,=
 u32 placement)
> +{
> +	struct xe_vram_region *vram;
> +	struct drm_device *drm =3D &xe->drm;
> +
> +	xe_assert(xe, id < xe->info.tile_count);
> +
> +	vram =3D drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
> +	if (!vram)
> +		return NULL;
> +
> +	vram->id =3D id;
> +	vram->placement =3D placement;
> +	vram->tile =3D &xe->tiles[id];
> +
> +	return vram;
> +}
> +
> +static void print_vram_region_info(struct xe_device *xe, struct xe_vram_=
region *vram)
> +{
> +	struct drm_device *drm =3D &xe->drm;
> +
> +	if (vram->io_size < vram->usable_size)
> +		drm_info(drm, "Small BAR device\n");
> +
> +	drm_info(drm,
> +		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, =
CPU accessible size %pa\n",
> +		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_=
size);
> +	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> +		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physica=
l_size,
> +		 &vram->io_start, vram->io_start + (u64)vram->io_size);
> +}
> +
> +static int vram_region_init(struct xe_device *xe, struct xe_vram_region =
*vram,
> +			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
> +			    u64 region_size, resource_size_t remain_io_size)
> +{
> +	/* Check if VRAM region is already initialized */
> +	if (vram->mapping)
> +		return 0;
> +
> +	vram->actual_physical_size =3D region_size;
> +	vram->io_start =3D lmem_bar->io_start + offset;
> +	vram->io_size =3D min_t(u64, usable_size, remain_io_size);
> +
> +	if (!vram->io_size) {
> +		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +		return -ENODEV;
> +	}
> +
> +	vram->dpa_base =3D lmem_bar->dpa_base + offset;
> +	vram->mapping =3D lmem_bar->mapping + offset;
> +	vram->usable_size =3D usable_size;
> +
> +	print_vram_region_info(xe, vram);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vram_init_regions_managers - Init all VRAM TTM managers.
> + * @xe: the &xe_device
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_vram_init_regions_managers(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, id) {
> +		if (!ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
> +			err =3D xe_ttm_vram_mgr_init(xe, tile->mem.vram);
> +			if (err)
> +				return err;
> +			xe->info.mem_region_mask |=3D BIT(tile->mem.vram->id) << 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_vram_probe() - Probe VRAM configuration
>   * @xe: the &xe_device
> @@ -298,82 +385,52 @@ static void vram_fini(void *arg)
>  int xe_vram_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> -	resource_size_t io_size;
> +	struct xe_vram_region lmem_bar;
> +	resource_size_t remain_io_size;
>  	u64 available_size =3D 0;
>  	u64 total_size =3D 0;
> -	u64 tile_offset;
> -	u64 tile_size;
> -	u64 vram_size;
>  	int err;
>  	u8 id;
>=20=20
>  	if (!IS_DGFX(xe))
>  		return 0;
>=20=20
> -	/* Get the size of the root tile's vram for later accessibility compari=
son */
> -	tile =3D xe_device_get_root_tile(xe);
> -	err =3D tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +	err =3D determine_lmem_bar_size(xe, &lmem_bar);
>  	if (err)
>  		return err;
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lme=
m_bar.io_size);
>=20=20
> -	err =3D determine_lmem_bar_size(xe);
> -	if (err)
> -		return err;
> +	remain_io_size =3D lmem_bar.io_size;
>=20=20
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> -		 &xe->mem.vram->io_size);
> -
> -	io_size =3D xe->mem.vram->io_size;
> -
> -	/* tile specific ranges */
>  	for_each_tile(tile, xe, id) {
> -		err =3D tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +		u64 region_size;
> +		u64 usable_size;
> +		u64 tile_offset;
> +
> +		err =3D tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
>  		if (err)
>  			return err;
>=20=20
> -		tile->mem.vram->actual_physical_size =3D tile_size;
> -		tile->mem.vram->io_start =3D xe->mem.vram->io_start + tile_offset;
> -		tile->mem.vram->io_size =3D min_t(u64, vram_size, io_size);
> +		total_size +=3D region_size;
> +		available_size +=3D usable_size;
>=20=20
> -		if (!tile->mem.vram->io_size) {
> -			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> -			return -ENODEV;
> -		}
> +		err =3D vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, u=
sable_size,
> +				       region_size, remain_io_size);
> +		if (err)
> +			return err;
>=20=20
> -		tile->mem.vram->dpa_base =3D xe->mem.vram->dpa_base + tile_offset;
> -		tile->mem.vram->usable_size =3D vram_size;
> -		tile->mem.vram->mapping =3D xe->mem.vram->mapping + tile_offset;
> -
> -		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
> -			drm_info(&xe->drm, "Small BAR device\n");
> -		drm_info(&xe->drm,
> -			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen =
%pa, CPU accessible size %pa\n",
> -			 id, tile->id, &tile->mem.vram->actual_physical_size,
> -			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
> -		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%p=
a-%llx]\n",
> -			 id, tile->id, &tile->mem.vram->dpa_base,
> -			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
> -			 &tile->mem.vram->io_start,
> -			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
> -
> -		/* calculate total size using tile size to get the correct HW sizing */
> -		total_size +=3D tile_size;
> -		available_size +=3D vram_size;
> -
> -		if (total_size > xe->mem.vram->io_size) {
> +		if (total_size > lmem_bar.io_size) {
>  			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &xe->mem.vram->io_size);
> +				 &total_size, &lmem_bar.io_size);
>  		}
>=20=20
> -		io_size -=3D min_t(u64, tile_size, io_size);
> +		remain_io_size -=3D min_t(u64, tile->mem.vram->actual_physical_size, r=
emain_io_size);
>  	}
>=20=20
> -	xe->mem.vram->actual_physical_size =3D total_size;
> -
> -	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> -		 &xe->mem.vram->actual_physical_size);
> -	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_star=
t,
> -		 &available_size);
> +	err =3D vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size=
, total_size,
> +			       lmem_bar.io_size);
> +	if (err)
> +		return err;
>=20=20
>  	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index e31cc04ec0db..4453d2ecc249 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -6,8 +6,13 @@
>  #ifndef _XE_VRAM_H_
>  #define _XE_VRAM_H_
>=20=20
> +#include <linux/types.h>
> +
>  struct xe_device;
> +struct xe_vram_region;
>=20=20
> +struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id,=
 u32 placement);
> +int xe_vram_init_regions_managers(struct xe_device *xe);
>  int xe_vram_probe(struct xe_device *xe);
>=20=20
>  #endif

--=20
Jani Nikula, Intel

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FFAC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECB7892CA;
	Tue, 24 Jun 2025 09:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch5XawSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDA2892CA
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750758830; x=1782294830;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GsjmADyjr2sZ/6dxJkwW1rWCWjoky+Qrn+UxXi/ctak=;
 b=ch5XawSOI84ifi6nQr885egtkirV4QORNtA6GoGm7PBI5mZW7pTHSZqi
 2/Gq8f1d3m7K3ANqjCjNbYaOq/9IMOlSVsU2IQujhWONBCKXpiQhJ7kS/
 4Dg4KmDpRP2xaxSFo/AjLhM1hLZM7hfeQeMEZ9txBwDt38IGQufBnKFGD
 R3/MaNdY3GL88hFHYYSmg4AOAG6nR/KOVdantu6JIgAdHSA1YiiE/hy2n
 B4lzgZt46qYTBAbGP2He1hdBk8lHQdFIuPHdFowWJgF90U6fzgLMgczTE
 yR8/lb/XwEiNaqTNYpKj9gukz82PMnMScmB0V0ajdwo8QrBvMfqTZPaPO A==;
X-CSE-ConnectionGUID: ev8fOUm0TEuOzhdkQD2o0Q==
X-CSE-MsgGUID: SCjuUzQHQbeskiDmdhGcuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63593532"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="63593532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:53:50 -0700
X-CSE-ConnectionGUID: JSoLjdpvRt6USISPh5ba2A==
X-CSE-MsgGUID: 2X8w54w7SUWR6pJ/OcddkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="156164227"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:53:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Stuart
 Summers <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe: Use dynamic allocation for tile and
 device VRAM region structures
In-Reply-To: <20250624092213.2876711-2-piotr.piorkowski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
 <20250624092213.2876711-2-piotr.piorkowski@intel.com>
Date: Tue, 24 Jun 2025 12:53:43 +0300
Message-ID: <b98080297ab2b64180f6a5f0c4828cf9f8f11f15@intel.com>
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

On Tue, 24 Jun 2025, Pi=C3=B3rkowski, Piotr <piotr.piorkowski@intel.com> wr=
ote:
> From: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
>
> In future platforms, we will need to represent the device and tile
> VRAM regions in a more dynamic way, so let's abandon the static
> allocation of these structures and start use a dynamic allocation.
>
> Signed-off-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
>  drivers/gpu/drm/xe/xe_assert.h                |  2 +-
>  drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
>  drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c               | 18 ++---
>  drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
>  drivers/gpu/drm/xe/xe_query.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_svm.c                   | 17 ++---
>  drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
>  drivers/gpu/drm/xe/xe_tile.h                  |  2 +
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
>  drivers/gpu/drm/xe/xe_vram.c                  | 66 ++++++++++---------
>  15 files changed, 121 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 6b362695d6b6..733c17c945bf 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -294,7 +294,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct =
intel_framebuffer *fb,
>  		 * accessible.  This is important on small-bar systems where
>  		 * only some subset of VRAM is CPU accessible.
>  		 */
> -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
> +		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
>  			ret =3D -EINVAL;
>  			goto err;
>  		}
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/=
drm/xe/display/xe_plane_initial.c
> index b2ede3af9345..97b58c0ff39a 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
>  		 * We don't currently expect this to ever be placed in the
>  		 * stolen portion.
>  		 */
> -		if (phys_base >=3D tile0->mem.vram.usable_size) {
> +		if (phys_base >=3D tile0->mem.vram->usable_size) {
>  			drm_err(&xe->drm,
>  				"Initial plane programming using invalid range, phys_base=3D%pa\n",
>  				&phys_base);
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_asser=
t.h
> index 68fe70ce2be3..cd63cdd2dc78 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -145,7 +145,7 @@
>  	const struct xe_tile *__tile =3D (tile);							\
>  	char __buf[10] __maybe_unused;								\
>  	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,	=
		\
> -		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_=
size, 1,	\
> +		      __tile->id, ({ string_get_size(__tile->mem.vram->actual_physical=
_size, 1,	\
>  				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>  })
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index e160e7be84f0..18f0d8f6d0a2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_devic=
e *xe)
>  	}
>  }
>=20=20
> +static int xe_device_vram_alloc(struct xe_device *xe)
> +{
> +	struct xe_vram_region *vram;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	vram =3D drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> +	if (!vram)
> +		return -ENOMEM;
> +
> +	xe->mem.vram =3D vram;
> +	return 0;
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
>=20=20
>  	xe->wedged.mode =3D xe_modparam.wedged_mode;
>=20=20
> +	err =3D xe_device_vram_alloc(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe=
() */
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 6aca4b1a2824..a7bcda67d05f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -74,6 +74,8 @@ struct xe_pxp;
>   * device, such as HBM memory or CXL extension memory.
>   */
>  struct xe_vram_region {
> +	/** @tile: Backpointer to tile */
> +	struct xe_tile *tile;
>  	/** @io_start: IO start address of this VRAM instance */
>  	resource_size_t io_start;
>  	/**
> @@ -213,7 +215,7 @@ struct xe_tile {
>  		 * Although VRAM is associated with a specific tile, it can
>  		 * still be accessed by all tiles' GTs.
>  		 */
> -		struct xe_vram_region vram;
> +		struct xe_vram_region *vram;

With this, struct xe_vram_region definition could be moved out of
xe_device_types as follow-up, and the pointer could be opaque to a lot
of code.

>=20=20
>  		/** @mem.ggtt: Global graphics translation table */
>  		struct xe_ggtt *ggtt;
> @@ -394,7 +396,7 @@ struct xe_device {
>  	/** @mem: memory info for device */
>  	struct {
>  		/** @mem.vram: VRAM info for device */
> -		struct xe_vram_region vram;
> +		struct xe_vram_region *vram;
>  		/** @mem.sys_mgr: system TTM manager */
>  		struct ttm_resource_manager sys_mgr;
>  		/** @mem.sys_mgr: system memory shrinker. */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm=
/xe/xe_gt_sriov_pf_config.c
> index 3556c41c041b..a33a6f3a6731 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile =3D gt->tile;
>=20=20
> -	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
> +	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
>  }
>=20=20
>  static u64 pf_query_max_lmem(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 8f8e9fdfb2a8..c0bd23aaaa23 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, =
u64 addr, bool is_comp_pte)
>  	u64 identity_offset =3D IDENTITY_OFFSET;
>=20=20
>  	if (GRAPHICS_VER(xe) >=3D 20 && is_comp_pte)
> -		identity_offset +=3D DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_siz=
e, SZ_1G);
> +		identity_offset +=3D DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_si=
ze, SZ_1G);
>=20=20
> -	addr -=3D xe->mem.vram.dpa_base;
> +	addr -=3D xe->mem.vram->dpa_base;
>  	return addr + (identity_offset << xe_pt_shift(2));
>  }
>=20=20
> @@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_d=
evice *xe, struct xe_vm *vm,
>  	u64 pos, ofs, flags;
>  	u64 entry;
>  	/* XXX: Unclear if this should be usable_size? */
> -	u64 vram_limit =3D  xe->mem.vram.actual_physical_size +
> -		xe->mem.vram.dpa_base;
> +	u64 vram_limit =3D xe->mem.vram->actual_physical_size +
> +		xe->mem.vram->dpa_base;
>  	u32 level =3D 2;
>=20=20
>  	ofs =3D map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
>  	flags =3D vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
>  					    true, 0);
>=20=20
> -	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> +	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
>=20=20
>  	/*
>  	 * Use 1GB pages when possible, last chunk always use 2M
>  	 * pages as mixing reserved memory (stolen, WOCPM) with a single
>  	 * mapping is not allowed on certain platforms.
>  	 */
> -	for (pos =3D xe->mem.vram.dpa_base; pos < vram_limit;
> +	for (pos =3D xe->mem.vram->dpa_base; pos < vram_limit;
>  	     pos +=3D SZ_1G, ofs +=3D 8) {
>  		if (pos + SZ_1G >=3D vram_limit) {
>  			entry =3D vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
> @@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile=
, struct xe_migrate *m,
>=20=20
>  		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
>  					    pat_index, pt30_ofs);
> -		xe_assert(xe, xe->mem.vram.actual_physical_size <=3D
> +		xe_assert(xe, xe->mem.vram->actual_physical_size <=3D
>  					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
>=20=20
>  		/*
> @@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *ti=
le, struct xe_migrate *m,
>  		if (GRAPHICS_VER(xe) >=3D 20 && xe_device_has_flat_ccs(xe)) {
>  			u16 comp_pat_index =3D xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
>  			u64 vram_offset =3D IDENTITY_OFFSET +
> -				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> +				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
>  			u64 pt31_ofs =3D bo->size - XE_PAGE_SIZE;
>=20=20
> -			xe_assert(xe, xe->mem.vram.actual_physical_size <=3D (MAX_NUM_PTE -
> +			xe_assert(xe, xe->mem.vram->actual_physical_size <=3D (MAX_NUM_PTE -
>  						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
>  			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
>  						    comp_pat_index, pt31_ofs);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 824461c31288..90494f16d3d8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
>  	 * All of these together determine the overall GT count.
>  	 */
>  	for_each_tile(tile, xe, id) {
> +		int err;
> +
>  		gt =3D tile->primary_gt;
>  		gt->info.id =3D xe->info.gt_count++;
>  		gt->info.type =3D XE_GT_TYPE_MAIN;
>  		gt->info.has_indirect_ring_state =3D graphics_desc->has_indirect_ring_=
state;
>  		gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
>=20=20
> +		err =3D xe_tile_alloc_vram(tile);
> +		if (err)
> +			return err;
> +
>  		if (MEDIA_VER(xe) < 13 && media_desc)
>  			gt->info.engine_mask |=3D media_desc->hw_engine_mask;
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e8e1743dcb1e..ba9b7482605c 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct =
drm_xe_device_query *query)
>  	config->num_params =3D num_params;
>  	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =3D
>  		xe->info.devid | (xe->info.revid << 16);
> -	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> +	if (xe->mem.vram)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>  	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 26418e9bdff0..98d79c118e45 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -302,16 +302,11 @@ static struct xe_vram_region *page_to_vr(struct pag=
e *page)
>  	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
>  }
>=20=20
> -static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
> -{
> -	return container_of(vr, struct xe_tile, mem.vram);
> -}
> -
>  static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
>  				      struct page *page)
>  {
>  	u64 dpa;
> -	struct xe_tile *tile =3D vr_to_tile(vr);
> +	struct xe_tile *tile =3D vr->tile;
>  	u64 pfn =3D page_to_pfn(page);
>  	u64 offset;
>=20=20
> @@ -366,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_=
t *dma_addr,
>=20=20
>  		if (!vr && spage) {
>  			vr =3D page_to_vr(spage);
> -			tile =3D vr_to_tile(vr);
> +			tile =3D vr->tile;
>  		}
>  		XE_WARN_ON(spage && page_to_vr(spage) !=3D vr);
>=20=20
> @@ -502,7 +497,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region =
*vr, u64 offset)
>=20=20
>  static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
>  {
> -	return &tile->mem.vram.ttm.mm;
> +	return &tile->mem.vram->ttm.mm;
>  }
>=20=20
>  static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_a=
llocation,
> @@ -516,7 +511,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpus=
vm_devmem *devmem_allocatio
>=20=20
>  	list_for_each_entry(block, blocks, link) {
>  		struct xe_vram_region *vr =3D block->private;
> -		struct xe_tile *tile =3D vr_to_tile(vr);
> +		struct xe_tile *tile =3D vr->tile;
>  		struct drm_buddy *buddy =3D tile_to_buddy(tile);
>  		u64 block_pfn =3D block_offset_to_pfn(vr, drm_buddy_block_offset(block=
));
>  		int i;
> @@ -679,7 +674,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start=
, u64 end, struct xe_vma *v
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
> -	return &tile->mem.vram;
> +	return tile->mem.vram;
>  }
>=20=20
>  /**
> @@ -726,7 +721,7 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_til=
e *tile,
>  	drm_gpusvm_devmem_init(&bo->devmem_allocation,
>  			       vm->xe->drm.dev, mm,
>  			       &gpusvm_devmem_ops,
> -			       &tile->mem.vram.dpagemap,
> +			       &tile->mem.vram->dpagemap,
>  			       xe_svm_range_size(range));
>=20=20
>  	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 672faa0b67f1..c64a4d1a5bb9 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -94,6 +94,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  	return 0;
>  }
>=20=20
> +/**
> + * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
> + * @tile: Tile to perform allocations for
> + *
> + * Allocates VRAM per-tile data structures using DRM-managed allocations.
> + * Does not touch the hardware.
> + *
> + * Returns -ENOMEM if allocations fail, otherwise 0.
> + */
> +int xe_tile_alloc_vram(struct xe_tile *tile)
> +{
> +	struct xe_device *xe =3D tile_to_xe(tile);
> +	struct xe_vram_region *vram;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	vram =3D drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> +	if (!vram)
> +		return -ENOMEM;
> +
> +	vram->tile =3D tile;
> +	tile->mem.vram =3D vram;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_tile_init_early - Initialize the tile and primary GT
>   * @tile: Tile to initialize
> @@ -131,8 +158,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>  	struct xe_device *xe =3D tile_to_xe(tile);
>  	int err;
>=20=20
> -	if (tile->mem.vram.usable_size) {
> -		err =3D xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
> +	if (tile->mem.vram->usable_size) {
> +		err =3D xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
>  		if (err)
>  			return err;
>  		xe->info.mem_region_mask |=3D BIT(tile->id) << 1;
> @@ -167,7 +194,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  	xe_wa_apply_tile_workarounds(tile);
>=20=20
>  	if (xe->info.has_usm && IS_DGFX(xe))
> -		xe_devm_add(tile, &tile->mem.vram);
> +		xe_devm_add(tile, tile->mem.vram);
>=20=20
>  	return xe_tile_sysfs_init(tile);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index eb939316d55b..8dd87ccb2aca 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,6 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_=
device *xe, u8 id);
>  int xe_tile_init_noalloc(struct xe_tile *tile);
>  int xe_tile_init(struct xe_tile *tile);
>=20=20
> +int xe_tile_alloc_vram(struct xe_tile *tile);
> +
>  void xe_tile_migrate_wait(struct xe_tile *tile);
>=20=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/=
xe_ttm_stolen_mgr.c
> index d9c9d2547aad..19bfc22b9706 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struc=
t xe_ttm_stolen_mgr *mgr)
>  	u64 tile_offset;
>  	u64 tile_size;
>=20=20
> -	tile_offset =3D tile->mem.vram.io_start - xe->mem.vram.io_start;
> -	tile_size =3D tile->mem.vram.actual_physical_size;
> +	tile_offset =3D tile->mem.vram->io_start - xe->mem.vram->io_start;
> +	tile_size =3D tile->mem.vram->actual_physical_size;
>=20=20
>  	/* Use DSM base address instead for stolen memory */
>  	mgr->stolen_base =3D (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) -=
 tile_offset;
> @@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, str=
uct xe_ttm_stolen_mgr *mgr)
>=20=20
>  	/* Verify usage fits in the actual resource available */
>  	if (mgr->stolen_base + stolen_size <=3D pci_resource_len(pdev, LMEM_BAR=
))
> -		mgr->io_base =3D tile->mem.vram.io_start + mgr->stolen_base;
> +		mgr->io_base =3D tile->mem.vram->io_start + mgr->stolen_base;
>=20=20
>  	/*
>  	 * There may be few KB of platform dependent reserved memory at the end
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index 9e375a40aee9..d9afe0e22071 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, stru=
ct xe_ttm_vram_mgr *mgr,
>  int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *m=
gr)
>  {
>  	struct xe_device *xe =3D tile_to_xe(tile);
> -	struct xe_vram_region *vram =3D &tile->mem.vram;
> +	struct xe_vram_region *vram =3D tile->mem.vram;
>=20=20
>  	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
>  				      vram->usable_size, vram->io_size,
> @@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  	 */
>  	xe_res_first(res, offset, length, &cursor);
>  	for_each_sgtable_sg((*sgt), sg, i) {
> -		phys_addr_t phys =3D cursor.start + tile->mem.vram.io_start;
> +		phys_addr_t phys =3D cursor.start + tile->mem.vram->io_start;
>  		size_t size =3D min_t(u64, cursor.size, SZ_2G);
>  		dma_addr_t addr;
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index e421a74fb87c..18124a5fb291 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -147,16 +147,16 @@ static int determine_lmem_bar_size(struct xe_device=
 *xe)
>=20=20
>  	resize_vram_bar(xe);
>=20=20
> -	xe->mem.vram.io_start =3D pci_resource_start(pdev, LMEM_BAR);
> -	xe->mem.vram.io_size =3D pci_resource_len(pdev, LMEM_BAR);
> -	if (!xe->mem.vram.io_size)
> +	xe->mem.vram->io_start =3D pci_resource_start(pdev, LMEM_BAR);
> +	xe->mem.vram->io_size =3D pci_resource_len(pdev, LMEM_BAR);
> +	if (!xe->mem.vram->io_size)
>  		return -EIO;
>=20=20
>  	/* XXX: Need to change when xe link code is ready */
> -	xe->mem.vram.dpa_base =3D 0;
> +	xe->mem.vram->dpa_base =3D 0;
>=20=20
>  	/* set up a map to the total memory area. */
> -	xe->mem.vram.mapping =3D ioremap_wc(xe->mem.vram.io_start, xe->mem.vram=
.io_size);
> +	xe->mem.vram->mapping =3D ioremap_wc(xe->mem.vram->io_start, xe->mem.vr=
am->io_size);
>=20=20
>  	return 0;
>  }
> @@ -278,13 +278,13 @@ static void vram_fini(void *arg)
>  	struct xe_tile *tile;
>  	int id;
>=20=20
> -	if (xe->mem.vram.mapping)
> -		iounmap(xe->mem.vram.mapping);
> +	if (xe->mem.vram->mapping)
> +		iounmap(xe->mem.vram->mapping);
>=20=20
> -	xe->mem.vram.mapping =3D NULL;
> +	xe->mem.vram->mapping =3D NULL;
>=20=20
>  	for_each_tile(tile, xe, id)
> -		tile->mem.vram.mapping =3D NULL;
> +		tile->mem.vram->mapping =3D NULL;
>  }
>=20=20
>  /**
> @@ -320,10 +320,10 @@ int xe_vram_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20=20
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.io_size);
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> +		 &xe->mem.vram->io_size);
>=20=20
> -	io_size =3D xe->mem.vram.io_size;
> +	io_size =3D xe->mem.vram->io_size;
>=20=20
>  	/* tile specific ranges */
>  	for_each_tile(tile, xe, id) {
> @@ -331,44 +331,48 @@ int xe_vram_probe(struct xe_device *xe)
>  		if (err)
>  			return err;
>=20=20
> -		tile->mem.vram.actual_physical_size =3D tile_size;
> -		tile->mem.vram.io_start =3D xe->mem.vram.io_start + tile_offset;
> -		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> +		tile->mem.vram->actual_physical_size =3D tile_size;
> +		tile->mem.vram->io_start =3D xe->mem.vram->io_start + tile_offset;
> +		tile->mem.vram->io_size =3D min_t(u64, vram_size, io_size);
>=20=20
> -		if (!tile->mem.vram.io_size) {
> +		if (!tile->mem.vram->io_size) {
>  			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
>  			return -ENODEV;
>  		}
>=20=20
> -		tile->mem.vram.dpa_base =3D xe->mem.vram.dpa_base + tile_offset;
> -		tile->mem.vram.usable_size =3D vram_size;
> -		tile->mem.vram.mapping =3D xe->mem.vram.mapping + tile_offset;
> +		tile->mem.vram->dpa_base =3D xe->mem.vram->dpa_base + tile_offset;
> +		tile->mem.vram->usable_size =3D vram_size;
> +		tile->mem.vram->mapping =3D xe->mem.vram->mapping + tile_offset;
>=20=20
> -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> +		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
>  			drm_info(&xe->drm, "Small BAR device\n");
> -		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable siz=
e exclude stolen %pa, CPU accessible size %pa\n", id,
> -			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usab=
le_size, &tile->mem.vram.io_size);
> -		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%p=
a-%llx]\n", id, tile->id,
> -			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.v=
ram.actual_physical_size,
> -			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.v=
ram.io_size);
> +		drm_info(&xe->drm,
> +			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen =
%pa, CPU accessible size %pa\n",
> +			 id, tile->id, &tile->mem.vram->actual_physical_size,
> +			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
> +		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%p=
a-%llx]\n",
> +			 id, tile->id, &tile->mem.vram->dpa_base,
> +			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
> +			 &tile->mem.vram->io_start,
> +			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
>=20=20
>  		/* calculate total size using tile size to get the correct HW sizing */
>  		total_size +=3D tile_size;
>  		available_size +=3D vram_size;
>=20=20
> -		if (total_size > xe->mem.vram.io_size) {
> +		if (total_size > xe->mem.vram->io_size) {
>  			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &xe->mem.vram.io_size);
> +				 &total_size, &xe->mem.vram->io_size);
>  		}
>=20=20
>  		io_size -=3D min_t(u64, tile_size, io_size);
>  	}
>=20=20
> -	xe->mem.vram.actual_physical_size =3D total_size;
> +	xe->mem.vram->actual_physical_size =3D total_size;
>=20=20
> -	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.actual_physical_size);
> -	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> +		 &xe->mem.vram->actual_physical_size);
> +	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_star=
t,
>  		 &available_size);
>=20=20
>  	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);

--=20
Jani Nikula, Intel

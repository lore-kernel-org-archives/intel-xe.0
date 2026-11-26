Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7CE606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZdLqSDHZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84310E40E;
	Thu, 26 Nov 2026 13:13:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0295610E40E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795698808; x=1827234808;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uaZ8272JLgFkEKTXOvpQc2TeP7PQ0NNwRJkwXUbE2hs=;
 b=ZdLqSDHZnC8W49AtgPeZCh6ROjXfWBKibUreR7BrDi2KqFWRGics201W
 tb6aRqPwafad3nnLf7UxLwBtM7qtSXTjtZgzJNPDRrjCJ/VEWwigIkJG/
 3D+SVvSN024Hgylhsing2QlWhNW4C96qH0wOeBg/xlKcgR8uRJi7plku4
 q/9KFSh+YepfkmdGPS+1FGA3JIObfFLEyQqLWRnvfNT2NzC2HBj7Evuni
 zoCGImOsRXtlrBjw4nudTtZEAjV1Q8jeIG5Pt5d7qrjmxYuvNXjMK6mpM
 GsDHEc8/E3s47Fzg4zOHNJq7gtgT7F3umXHq20PCmrKlLns++/ZUGJHRq Q==;
X-CSE-ConnectionGUID: CPZne0D5QSSp9x72HR2p/g==
X-CSE-MsgGUID: F8YPqY5nRgeMWLg4hkWf4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4519657"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4519657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:13:28 -0800
X-CSE-ConnectionGUID: wYnqYM/eTK2op6qfvyPewA==
X-CSE-MsgGUID: zTIej1QjThe1uJy1BituzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12674437"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.247])
 ([10.245.244.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:13:26 -0800
Message-ID: <3f476fb29a4e657011d2c3101d6d7e5bf5013235.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/wopcm: Use the size from HW when
 excluding the wopcm range from GGTT
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Piotr
 =?ISO-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Date: Thu, 26 Nov 2026 14:13:23 +0100
In-Reply-To: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
References: <20261118220120.109186-3-daniele.ceraolospurio@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Daniele,

There seems to be a couple of multi-patch series here lacking a proper
cover-letter. If that's the case, please provide one moving forward.

Thanks,
Thomas



On Wed, 2026-11-18 at 22:01 +0000, Daniele Ceraolo Spurio wrote:
> The WOPCM size is available in HW (we read it during the stolen
> memory
> init), so when excluding the WOPCM range from the base of GGTT we can
> use the HW value instead of a hardcoded one (which needs to be
> updated
> any time the config changes on newer HW). This value is not available
> to
> VFs, but the only use VF has for it is to make sure that the PF has
> done
> its programming correctly, so we can just trust PF and drop the
> checks.
> Since the WOPCM is a per-tile value, we can store its size in the
> tile
> structure and re-use it for both GGTT and stolen memory setup.
> We also have a kunit that uses the wopcm size, but as a static kunit
> it
> doesn't actually require a real value but just a non-zero one for
> testing, so we can use the already defined GGTT_TEST_START.
>=20
> Signed-off-by: Daniele Ceraolo Spurio
> <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> #v2
> ---
> v2: drop wopcm size usage from VF
> v3: move guc_ggtt assert from next patch to this one (Sashiko),
> rebase
> on SRIOV updates, add kernel-doc for new functions.
> v4: fix kunit
> ---
> =C2=A0drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c |=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0drivers/gpu/drm/xe/xe_ggtt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++-----
> =C2=A0drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++--
> =C2=A0drivers/gpu/drm/xe/xe_tile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 61
> ++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_tile.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_tile_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c=C2=A0=C2=A0 | 53 +++++++++--=
---------
> =C2=A08 files changed, 107 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> index 25471317d781..202b48b0c984 100644
> --- a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> @@ -12,9 +12,7 @@
> =C2=A0
> =C2=A0static u64 ggtt_test_accessible_size(struct kunit *test)
> =C2=A0{
> -	struct xe_tile *tile =3D xe_device_get_root_tile(test->priv);
> -
> -	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> +	return GUC_GGTT_TOP - GGTT_TEST_START;
> =C2=A0}
> =C2=A0
> =C2=A0static void ggtt_test_fini(void *data)
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 6911c2ac39f8..93cd91fb620d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -934,6 +934,10 @@ int xe_device_probe(struct xe_device *xe)
> =C2=A0	override_has_cached_pt(xe);
> =C2=A0
> =C2=A0	for_each_tile(tile, xe, id) {
> +		err =3D xe_tile_wopcm_init(tile);
> +		if (err)
> +			return err;
> +
> =C2=A0		err =3D xe_ggtt_init_early(tile->mem.ggtt);
> =C2=A0		if (err)
> =C2=A0			return err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> b/drivers/gpu/drm/xe/xe_ggtt.c
> index 44480fad2767..1bc5b8c0f2b9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -30,11 +30,11 @@
> =C2=A0#include "xe_pm.h"
> =C2=A0#include "xe_res_cursor.h"
> =C2=A0#include "xe_sriov.h"
> +#include "xe_tile.h"
> =C2=A0#include "xe_tile_printk.h"
> =C2=A0#include "xe_tile_sriov_vf.h"
> =C2=A0#include "xe_tlb_inval.h"
> =C2=A0#include "xe_wa.h"
> -#include "xe_wopcm.h"
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: Global Graphics Translation Table (GGTT)
> @@ -414,7 +414,7 @@ static int ggtt_probe(struct xe_ggtt *ggtt, u64
> *start, u64 *size)
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> -	*start =3D xe_wopcm_size(xe);
> +	*start =3D xe_tile_wopcm_size(ggtt->tile);
> =C2=A0	*size =3D (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
> =C2=A0
> =C2=A0	return 0;
> @@ -422,13 +422,11 @@ static int ggtt_probe(struct xe_ggtt *ggtt, u64
> *start, u64 *size)
> =C2=A0
> =C2=A0static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start=
,
> u64 *size)
> =C2=A0{
> -	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> -	u64 wopcm =3D xe_wopcm_size(xe);
> -
> =C2=A0	*start =3D xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> =C2=A0	*size =3D xe_tile_sriov_vf_ggtt(ggtt->tile);
> =C2=A0
> -	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
> +	/* We can't check start against WOPCM as VF doesn't have
> access to the WOPCM size */
> +	if (*size > GUC_GGTT_TOP) {
> =C2=A0		xe_log_err_fatal(ggtt->tile, GGTT, -ERANGE,
> =C2=A0				 "Invalid GGTT configuration: %#llx-
> %#llx\n",
> =C2=A0				 *start, *start + *size - 1);
> @@ -734,11 +732,6 @@ static void xe_ggtt_invalidate_engine(struct
> xe_ggtt *ggtt)
> =C2=A0	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
> =C2=A0}
> =C2=A0
> -static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
> -{
> -	return xe_wopcm_size(tile_to_xe(ggtt->tile));
> -}
> -
> =C2=A0/**
> =C2=A0 * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change
> in usable address range.
> =C2=A0 * @ggtt: the &xe_ggtt struct instance
> @@ -750,13 +743,13 @@ static inline u64 xe_ggtt_bottom(struct xe_ggtt
> *ggtt)
> =C2=A0 * This function may be called multiple times during recovery, but
> if
> =C2=A0 * @new_start is unchanged from the current base, it's a noop.
> =C2=A0 *
> - * @new_start should be a value between the GGTT bottom and
> #GUC_GGTT_TOP.
> + * @new_start should be a value between the WOPCM size and
> #GUC_GGTT_TOP. VFs
> + * don't have access to the WOPCM size so we can't test against
> that.
> =C2=A0 */
> =C2=A0void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
> =C2=A0{
> =C2=A0	guard(mutex)(&ggtt->lock);
> =C2=A0
> -	xe_tile_assert(ggtt->tile, new_start >=3D
> xe_ggtt_bottom(ggtt));
> =C2=A0	xe_tile_assert(ggtt->tile, new_start + ggtt->size <=3D
> GUC_GGTT_TOP);
> =C2=A0#ifdef CONFIG_PCI_IOV
> =C2=A0	xe_tile_assert(ggtt->tile, ggtt->shareable_size =3D=3D 0);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c
> b/drivers/gpu/drm/xe/xe_guc.c
> index c4fb34e64cd6..e7e818897bf5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -47,15 +47,16 @@
> =C2=A0#include "xe_sleep.h"
> =C2=A0#include "xe_sriov.h"
> =C2=A0#include "xe_sriov_pf_migration.h"
> +#include "xe_tile.h"
> =C2=A0#include "xe_uc.h"
> =C2=A0#include "xe_uc_fw.h"
> =C2=A0#include "xe_wa.h"
> -#include "xe_wopcm.h"
> =C2=A0
> =C2=A0static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_bo *bo)
> =C2=A0{
> -	struct xe_device *xe =3D guc_to_xe(guc);
> +	struct xe_tile *tile =3D gt_to_tile(guc_to_gt(guc));
> +	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	u32 addr;
> =C2=A0
> =C2=A0	/*
> @@ -64,10 +65,12 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
> =C2=A0	 * might be different for each tile. So, just always ask for
> the address
> =C2=A0	 * on the target GuC.
> =C2=A0	 */
> -	addr =3D __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))-
> >id);
> +	addr =3D __xe_bo_ggtt_addr(bo, tile->id);
> +
> +	if (!IS_SRIOV_VF(xe))
> +		xe_assert(xe, addr >=3D xe_tile_wopcm_size(tile));
> =C2=A0
> =C2=A0	/* GuC addresses above GUC_GGTT_TOP don't map through the
> GTT */
> -	xe_assert(xe, addr >=3D xe_wopcm_size(guc_to_xe(guc)));
> =C2=A0	xe_assert(xe, addr < GUC_GGTT_TOP);
> =C2=A0	xe_assert(xe, xe_bo_size(bo) <=3D GUC_GGTT_TOP - addr);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_tile.c
> b/drivers/gpu/drm/xe/xe_tile.c
> index 810dfd98d830..014b5efdb152 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,15 +13,18 @@
> =C2=A0#include "xe_ggtt.h"
> =C2=A0#include "xe_memirq.h"
> =C2=A0#include "xe_migrate.h"
> +#include "xe_mmio.h"
> =C2=A0#include "xe_pcode.h"
> =C2=A0#include "xe_sa.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_tile.h"
> +#include "xe_tile_printk.h"
> =C2=A0#include "xe_tile_sysfs.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> =C2=A0#include "xe_vram.h"
> =C2=A0#include "xe_vram_types.h"
> =C2=A0#include "xe_wa.h"
> +#include "regs/xe_regs.h"
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: Multi-tile Design
> @@ -225,6 +228,64 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
> =C2=A0	xe_migrate_wait(tile->migrate);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_tile_wopcm_init() - cache the WOPCM size for the tile.
> + * @tile: The tile for which to cache the WOPCM size.
> + *
> + * This function reads the WOPCM size from the hardware and caches
> it in the tile
> + * structure. It does not perform any memory allocations. The cached
> value can
> + * be retrieved later using xe_tile_wopcm_size().
> + * This function can't be called on VFs since VFs don't have access
> to the
> + * register holding the WOPCM size.
> + *
> + * Returns: 0 on success, negative error code on error.
> + */
> +int xe_tile_wopcm_init(struct xe_tile *tile)
> +{
> +	u32 wopcm_size;
> +	u64 val;
> +
> +	if (IS_SRIOV_VF(tile_to_xe(tile)))
> +		return 0;
> +
> +	val =3D xe_mmio_read64_2x32(&tile->mmio, STOLEN_RESERVED);
> +	val =3D REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> +
> +	switch (val) {
> +	case 0x5 ... 0x6:
> +		val--;
> +		fallthrough;
> +	case 0x0 ... 0x3:
> +		wopcm_size =3D (1U << val) * SZ_1M;
> +		break;
> +	default:
> +		WARN(1, "Missing case wopcm_size=3D%llx\n", val);
> +		return -EIO;
> +	}
> +
> +	tile->mem.wopcm_size =3D wopcm_size;
> +
> +	xe_tile_info(tile, "WOPCM size: %uKB\n", wopcm_size / 1024);
> +	return 0;
> +}
> +
> +/**
> + * xe_tile_wopcm_size() - get the WOPCM size for the tile.
> + * @tile: The tile for which to get the WOPCM size.
> + *
> + * This function returns the cached WOPCM size for the tile. This
> function must
> + * be called after xe_tile_wopcm_init() has been called for the
> tile.
> + * This function can't be called on VFs since VFs don't have access
> to the
> + * register holding the WOPCM size.
> + *
> + * Returns: The cached WOPCM size in bytes.
> + */
> +u32 xe_tile_wopcm_size(struct xe_tile *tile)
> +{
> +	xe_assert(tile_to_xe(tile), tile->mem.wopcm_size !=3D 0);
> +	return tile->mem.wopcm_size;
> +}
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> =C2=A0/**
> =C2=A0 * xe_tile_local_pagemap() - Return a pointer to the tile's local
> drm_pagemap if any
> diff --git a/drivers/gpu/drm/xe/xe_tile.h
> b/drivers/gpu/drm/xe/xe_tile.h
> index a2a2c0e936b8..5ae9f6753f96 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -19,6 +19,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
> =C2=A0
> =C2=A0void xe_tile_migrate_wait(struct xe_tile *tile);
> =C2=A0
> +int xe_tile_wopcm_init(struct xe_tile *tile);
> +u32 xe_tile_wopcm_size(struct xe_tile *tile);
> +
> =C2=A0static inline bool xe_tile_is_root(struct xe_tile *tile)
> =C2=A0{
> =C2=A0	return tile->id =3D=3D 0;
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h
> b/drivers/gpu/drm/xe/xe_tile_types.h
> index 3dc011f111a4..dea17282501c 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -84,6 +84,9 @@ struct xe_tile {
> =C2=A0		/** @mem.ggtt: Global graphics translation table */
> =C2=A0		struct xe_ggtt *ggtt;
> =C2=A0
> +		/** @mem.wopcm_size: Size of the WOPCM for this tile
> */
> +		u32 wopcm_size;
> +
> =C2=A0		/**
> =C2=A0		 * @mem.kernel_bb_pool: Pool from which batchbuffers
> are allocated.
> =C2=A0		 *
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 60f39efb02d0..5983b6c0ac3f 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -20,6 +20,7 @@
> =C2=A0#include "xe_gt_printk.h"
> =C2=A0#include "xe_mmio.h"
> =C2=A0#include "xe_sriov.h"
> +#include "xe_tile.h"
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> =C2=A0#include "xe_vram.h"
> =C2=A0#include "xe_wa.h"
> @@ -38,34 +39,12 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct
> xe_device *xe)
> =C2=A0	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
> =C2=A0}
> =C2=A0
> -static u32 get_wopcm_size(struct xe_device *xe)
> -{
> -	u32 wopcm_size;
> -	u64 val;
> -
> -	val =3D xe_mmio_read64_2x32(xe_root_tile_mmio(xe),
> STOLEN_RESERVED);
> -	val =3D REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
> -
> -	switch (val) {
> -	case 0x5 ... 0x6:
> -		val--;
> -		fallthrough;
> -	case 0x0 ... 0x3:
> -		wopcm_size =3D (1U << val) * SZ_1M;
> -		break;
> -	default:
> -		WARN(1, "Missing case wopcm_size=3D%llx\n", val);
> -		wopcm_size =3D 0;
> -	}
> -
> -	return wopcm_size;
> -}
> -
> =C2=A0static u64 detect_lmembar_dgfx(struct xe_device *xe, struct
> xe_ttm_stolen_mgr *mgr)
> =C2=A0{
> -	struct xe_vram_region *tile_vram =3D
> xe_device_get_root_tile(xe)->mem.vram;
> +	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> +	struct xe_vram_region *tile_vram =3D root_tile->mem.vram;
> =C2=A0	resource_size_t tile_io_start =3D
> xe_vram_region_io_start(tile_vram);
> -	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
> +	struct xe_mmio *mmio =3D &root_tile->mmio;
> =C2=A0	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> =C2=A0	u64 stolen_size, wopcm_size;
> =C2=A0	u64 tile_offset;
> @@ -79,8 +58,14 @@ static u64 detect_lmembar_dgfx(struct xe_device
> *xe, struct xe_ttm_stolen_mgr *m
> =C2=A0	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
> =C2=A0		return 0;
> =C2=A0
> -	/* Carve out the top of DSM as it contains the reserved
> WOPCM region */
> -	wopcm_size =3D get_wopcm_size(xe);
> +	/*
> +	 * Carve out the top of DSM as it contains the reserved
> WOPCM region.
> +	 * Note that the WOPCM region is per-tile, but the code
> below only looks
> +	 * at the root tile values for both stolen and WOPCM; this
> works because
> +	 * on PVC there is no driver-usable stolen, so stolen_size
> is 0 for
> +	 * both tiles, but if that changes we'll need to rework
> this.
> +	 */
> +	wopcm_size =3D xe_tile_wopcm_size(root_tile);
> =C2=A0	if (drm_WARN_ON(&xe->drm, !wopcm_size))
> =C2=A0		return 0;
> =C2=A0
> @@ -105,11 +90,12 @@ static u64 detect_lmembar_dgfx(struct xe_device
> *xe, struct xe_ttm_stolen_mgr *m
> =C2=A0static u32 detect_lmembar_integrated(struct xe_device *xe, struct
> xe_ttm_stolen_mgr *mgr)
> =C2=A0{
> =C2=A0	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> -	struct xe_gt *media_gt =3D xe_device_get_root_tile(xe)-
> >media_gt;
> +	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> +	struct xe_gt *media_gt =3D root_tile->media_gt;
> =C2=A0	u32 stolen_size, wopcm_size;
> =C2=A0	u32 ggc, gms;
> =C2=A0
> -	ggc =3D xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
> +	ggc =3D xe_mmio_read32(&root_tile->mmio, GGC);
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Check GGMS: it should be fixed 0x3 (8MB), which
> corresponds to the
> @@ -141,8 +127,13 @@ static u32 detect_lmembar_integrated(struct
> xe_device *xe, struct xe_ttm_stolen_
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	/* Carve out the top of DSM as it contains the reserved
> WOPCM region */
> -	wopcm_size =3D get_wopcm_size(xe);
> +	/*
> +	 * Carve out the top of DSM as it contains the reserved
> WOPCM region. We
> +	 * assume only the root tile is present, so we don't need to
> worry about
> +	 * the WOPCM size for the remote tiles.
> +	 */
> +	xe_assert(xe, xe->info.tile_count =3D=3D 1);
> +	wopcm_size =3D xe_tile_wopcm_size(root_tile);
> =C2=A0	if (drm_WARN_ON(&xe->drm, !wopcm_size))
> =C2=A0		return 0;
> =C2=A0

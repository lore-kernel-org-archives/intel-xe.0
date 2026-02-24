Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30127E9B26C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 14:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB24D10E58C;
	Tue, 24 Feb 2026 14:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/jonl2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA5F10E59D
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771942921; x=1803478921;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JBJDsa7/nvOjo0/94nJZLNFkQp+FhSH7w0jK68hE18s=;
 b=L/jonl2JtuJMeuwj8czTlFH+uJ1oRL4yfTLQd3UVuik6OMgiLaGrHaF4
 wUAew7iicdejMlLIpyUWp/A5llT5owlWqUpTH8jYgEalNyYZr0hrYkGm0
 EIBWDiRIiMXH5ZnBfRy+qY3jkysCsM6t5vZjqmBtuAr0cWnUAgqiId4BK
 we9r/X122qMTlRwHgMR6S1BquhjvhJW2ohY28KK/McscJkxzradDDTyLA
 qcxLNMMDxQ+L9ICooJ/ifNhNR3X43+IEzTiQB8HSRNU2gKM4P4uizYd4R
 4J4PKam5m34TchXCgGz74GyJ+HXDP+2DbAuoCIpNgBSZXBw55FJt9A2EP A==;
X-CSE-ConnectionGUID: UsxESI7RSc2bBvsxxrbPwQ==
X-CSE-MsgGUID: qYjOma0OTHaManWu3BwXAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73135317"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73135317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:22:00 -0800
X-CSE-ConnectionGUID: awbHgW48SRuy8CZtyGG35g==
X-CSE-MsgGUID: raWHITt/QRmxYQZqeBDgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213720547"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.148])
 ([10.245.244.148])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:21:59 -0800
Message-ID: <d5997029095cdcbfddbebb5441137d99230af10f.camel@linux.intel.com>
Subject: Re: [PATCH v5 8/9] drm/xe/bo: Add purgeable shrinker state helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Tue, 24 Feb 2026 15:21:57 +0100
In-Reply-To: <20260211152644.1661165-9-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-9-arvind.yadav@intel.com>
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

On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
> Encapsulate TTM purgeable flag updates and shrinker page accounting
> into helper functions. This prevents desynchronization between the
> TTM tt->purgeable flag and the shrinker's page bucket counters.
>=20
> Without these helpers, direct manipulation of xe_ttm_tt->purgeable
> risks forgetting to update the corresponding shrinker counters,
> leading to incorrect memory pressure calculations.
>=20
> Add xe_bo_set_purgeable_shrinker() and
> xe_bo_clear_purgeable_shrinker()
> which atomically update both the TTM flag and transfer pages between
> the shrinkable and purgeable buckets.
>=20
> Handle ghost BOs and zero-refcount xe BOs separately in
> xe_bo_shrink().
> Ghost BOs from ttm_bo_pipeline_gutting() still hold reclaimable
> pages,
> so attempt the shrink to let the shrinker block until the fence
> signals.
> For xe BOs whose refcount has dropped to zero, return -EBUSY since
> the
> destroy path will handle cleanup.
>=20
> v4:
> =C2=A0 - @madv_purgeable atomic_t =E2=86=92 u32 change across all relevan=
t
> =C2=A0=C2=A0=C2=A0 patches (Matt)
>=20
> v5:
> =C2=A0 - Update purgeable BO state to PURGED after a successful shrinker
> =C2=A0=C2=A0=C2=A0 purge for DONTNEED BOs.
> =C2=A0 - Split ghost BO and zero-refcount handling in xe_bo_shrink()
> (Thomas)

You'd need to split this patch so that the zero-refcount fix gets into
a separate patch with a Fixes: tag!

Otherwise LGTM.


>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 69
> +++++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c |=C2=A0 8 +++-
> =C2=A03 files changed, 76 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7ee85c8eadde..9484105708f7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -863,6 +863,66 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
> =C2=A0	bo->madv_purgeable =3D new_state;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
> shrinker
> + * @bo: Buffer object
> + *
> + * Transfers pages from shrinkable to purgeable bucket. Shrinker can
> now
> + * discard pages immediately without swapping. Caller holds BO lock.
> + */
> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> +	struct ttm_tt *tt =3D ttm_bo->ttm;
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (!xe_tt->purgeable) {
> +		xe_tt->purgeable =3D true;
> +		/* Transfer pages from shrinkable to purgeable count
> */
> +		xe_shrinker_mod_pages(xe->mem.shrinker,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -(long)tt->num_pages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages);
> +	}
> +}
> +
> +/**
> + * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and
> update shrinker
> + * @bo: Buffer object
> + *
> + * Transfers pages from purgeable to shrinkable bucket. Shrinker
> must now
> + * swap pages instead of discarding. Caller holds BO lock.
> + */
> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
> +{
> +	struct ttm_buffer_object *ttm_bo =3D &bo->ttm;
> +	struct ttm_tt *tt =3D ttm_bo->ttm;
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_ttm_tt *xe_tt;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!tt || !ttm_tt_is_populated(tt))
> +		return;
> +
> +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> +
> +	if (xe_tt->purgeable) {
> +		xe_tt->purgeable =3D false;
> +		/* Transfer pages from purgeable to shrinkable count
> */
> +		xe_shrinker_mod_pages(xe->mem.shrinker,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -(long)tt->num_pages);
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_ttm_bo_purge() - Purge buffer object backing store
> =C2=A0 * @ttm_bo: The TTM buffer object to purge
> @@ -1234,14 +1294,21 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0	if (!xe_bo_eviction_valuable(bo, &place))
> =C2=A0		return -EBUSY;
> =C2=A0
> -	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> +	/* Ghost BOs still hold reclaimable pages, try to shrink
> them. */
> +	if (!xe_bo_is_xe_bo(bo))
> =C2=A0		return xe_bo_shrink_purge(ctx, bo, scanned);
> =C2=A0
> +	if (!xe_bo_get_unless_zero(xe_bo))
> +		return -EBUSY;
> +
> =C2=A0	if (xe_tt->purgeable) {
> =C2=A0		if (bo->resource->mem_type !=3D XE_PL_SYSTEM)
> =C2=A0			lret =3D xe_bo_move_notify(xe_bo, ctx);
> =C2=A0		if (!lret)
> =C2=A0			lret =3D xe_bo_shrink_purge(ctx, bo, scanned);
> +		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
> +			xe_bo_set_purgeable_state(xe_bo,
> +						=C2=A0
> XE_MADV_PURGEABLE_PURGED);
> =C2=A0		goto out_unref;
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0d9f25b51eb2..46d1fff10e4f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -272,6 +272,8 @@ static inline bool xe_bo_madv_is_dontneed(struct
> xe_bo *bo)
> =C2=A0}
> =C2=A0
> =C2=A0void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
> xe_madv_purgeable_state new_state);
> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
> =C2=A0
> =C2=A0static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 8d55ea78b6d1..235fff2b654e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -289,12 +289,16 @@ void xe_bo_recompute_purgeable_state(struct
> xe_bo *bo)
> =C2=A0
> =C2=A0	if (xe_bo_all_vmas_dontneed(bo)) {
> =C2=A0		/* All VMAs are DONTNEED - mark BO purgeable */
> -		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_DONTNEED)
> +		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_DONTNEED) {
> =C2=A0			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_DONTNEED);
> +			xe_bo_set_purgeable_shrinker(bo);
> +		}
> =C2=A0	} else {
> =C2=A0		/* At least one VMA is WILLNEED - BO must not be
> purgeable */
> -		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_WILLNEED)
> +		if (bo->madv_purgeable !=3D
> XE_MADV_PURGEABLE_WILLNEED) {
> =C2=A0			xe_bo_set_purgeable_state(bo,
> XE_MADV_PURGEABLE_WILLNEED);
> +			xe_bo_clear_purgeable_shrinker(bo);
> +		}
> =C2=A0	}
> =C2=A0}
> =C2=A0

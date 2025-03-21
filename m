Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F104DC35FFF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 11:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A181510E798;
	Fri, 21 Mar 2025 11:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTsdIV+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFEE10E798
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742557036; x=1774093036;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3giZp3vTzmkRdx6NQpGfHjWuOWN1XflmrplcWc/eXYY=;
 b=aTsdIV+hNVa4jOvSCXGv9PJJEdBNPnzCAMlik2r7K3nKorMBv1H0DRH9
 Zhwp83iQhe/eYQSm+ou29MSPPTCJ9gYvDBuj6cTr/JpjTTtDxHJzzB/YX
 /uv++oJnVO2en8ldKrwbZabmi0EF7hO31DeXU0yVfEisv7AmGOy0VMViE
 g6JEZ/+HLe3dV4fAIy5+tItbuY0oGxLvZFHHMk15I5p879Og1EMuda/Qw
 iUaqeO6NY6SC40yN7tdFogrzhfbHHfnYTqXPJN7kmO7bOVQLbuV4Wjg14
 CQhGcFwzZGf35CKECQ/xWie1eurKnBXTK2QkXUHq/yOUij6hy+pV+g+9+ g==;
X-CSE-ConnectionGUID: Q9NqKOTLTMuwbWHLsdaHjA==
X-CSE-MsgGUID: 4Q4BAu1ZTBSiAlLSYjxluQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43064466"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43064466"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:37:15 -0700
X-CSE-ConnectionGUID: ARwjTprFTDyaSuZ42WqlTg==
X-CSE-MsgGUID: XTPoGhfSS1a7C7Tm1iWCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123351628"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.196])
 ([10.245.246.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 04:37:14 -0700
Message-ID: <4dc419e3c79b324f0978d43b0eb23cac1b6368a5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Simplify pinned bo iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 21 Mar 2025 12:37:11 +0100
In-Reply-To: <20250321112959.13037-1-thomas.hellstrom@linux.intel.com>
References: <20250321112959.13037-1-thomas.hellstrom@linux.intel.com>
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

On Fri, 2025-03-21 at 12:29 +0100, Thomas Hellstr=C3=B6m wrote:
> Introduce and use a helper to iterate over the various pinned bo
> lists.
> There are a couple of slight functional changes:
>=20
> 1) GGTT maps are now performed with the bo locked.
> 2) If the per-bo callback fails, keep the bo on the original list.
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 10 +-
> =C2=A0drivers/gpu/drm/xe/xe_bo_evict.c | 209 ++++++++++++----------------=
-
> --
> =C2=A02 files changed, 86 insertions(+), 133 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..070dafdad66b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2102,12 +2102,10 @@ int xe_bo_pin_external(struct xe_bo *bo)
> =C2=A0		if (err)
> =C2=A0			return err;
> =C2=A0
> -		if (xe_bo_is_vram(bo)) {
> -			spin_lock(&xe->pinned.lock);
> -			list_add_tail(&bo->pinned_link,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram);
> -			spin_unlock(&xe->pinned.lock);
> -		}
> +		spin_lock(&xe->pinned.lock);
> +		list_add_tail(&bo->pinned_link,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram);
> +		spin_unlock(&xe->pinned.lock);
> =C2=A0	}

The above belongs to a separate patch, pls ignore when reviewing.
/Thomas


> =C2=A0
> =C2=A0	ttm_bo_pin(&bo->ttm);
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 6a40eedd9db1..1eeb3910450b 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -10,6 +10,44 @@
> =C2=A0#include "xe_ggtt.h"
> =C2=A0#include "xe_tile.h"
> =C2=A0
> +typedef int (*xe_pinned_fn)(struct xe_bo *bo);
> +
> +static int xe_bo_apply_to_pinned(struct xe_device *xe,
> +				 struct list_head *pinned_list,
> +				 struct list_head *new_list,
> +				 const xe_pinned_fn pinned_fn)
> +{
> +	LIST_HEAD(still_in_list);
> +	struct xe_bo *bo;
> +	int ret =3D 0;
> +
> +	spin_lock(&xe->pinned.lock);
> +	while (!ret) {
> +		bo =3D list_first_entry_or_null(pinned_list,
> typeof(*bo),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinned_link);
> +		if (!bo)
> +			break;
> +		xe_bo_get(bo);
> +		list_move_tail(&bo->pinned_link, &still_in_list);
> +		spin_unlock(&xe->pinned.lock);
> +
> +		xe_bo_lock(bo, false);
> +		ret =3D pinned_fn(bo);
> +		if (ret && pinned_list !=3D new_list) {
> +			spin_lock(&xe->pinned.lock);
> +			list_move(&bo->pinned_link, pinned_list);
> +			spin_unlock(&xe->pinned.lock);
> +		}
> +		xe_bo_unlock(bo);
> +		xe_bo_put(bo);
> +		spin_lock(&xe->pinned.lock);
> +	}
> +	list_splice_tail(&still_in_list, new_list);
> +	spin_unlock(&xe->pinned.lock);
> +
> +	return ret;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_bo_evict_all - evict all BOs from VRAM
> =C2=A0 *
> @@ -27,9 +65,7 @@
> =C2=A0int xe_bo_evict_all(struct xe_device *xe)
> =C2=A0{
> =C2=A0	struct ttm_device *bdev =3D &xe->ttm;
> -	struct xe_bo *bo;
> =C2=A0	struct xe_tile *tile;
> -	struct list_head still_in_list;
> =C2=A0	u32 mem_type;
> =C2=A0	u8 id;
> =C2=A0	int ret;
> @@ -57,34 +93,9 @@ int xe_bo_evict_all(struct xe_device *xe)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/* Pinned user memory in VRAM */
> -	INIT_LIST_HEAD(&still_in_list);
> -	spin_lock(&xe->pinned.lock);
> -	for (;;) {
> -		bo =3D list_first_entry_or_null(&xe-
> >pinned.external_vram,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(*bo),
> pinned_link);
> -		if (!bo)
> -			break;
> -		xe_bo_get(bo);
> -		list_move_tail(&bo->pinned_link, &still_in_list);
> -		spin_unlock(&xe->pinned.lock);
> -
> -		xe_bo_lock(bo, false);
> -		ret =3D xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo);
> -		xe_bo_put(bo);
> -		if (ret) {
> -			spin_lock(&xe->pinned.lock);
> -			list_splice_tail(&still_in_list,
> -					 &xe->pinned.external_vram);
> -			spin_unlock(&xe->pinned.lock);
> -			return ret;
> -		}
> -
> -		spin_lock(&xe->pinned.lock);
> -	}
> -	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
> -	spin_unlock(&xe->pinned.lock);
> +	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
> +				=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram,
> +				=C2=A0=C2=A0=C2=A0 xe_bo_evict_pinned);
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Wait for all user BO to be evicted as those evictions
> depend on the
> @@ -93,26 +104,42 @@ int xe_bo_evict_all(struct xe_device *xe)
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_tile_migrate_wait(tile);
> =C2=A0
> -	spin_lock(&xe->pinned.lock);
> -	for (;;) {
> -		bo =3D list_first_entry_or_null(&xe-
> >pinned.kernel_bo_present,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(*bo),
> pinned_link);
> -		if (!bo)
> -			break;
> -		xe_bo_get(bo);
> -		list_move_tail(&bo->pinned_link, &xe-
> >pinned.evicted);
> -		spin_unlock(&xe->pinned.lock);
> +	if (ret)
> +		return ret;
> =C2=A0
> -		xe_bo_lock(bo, false);
> -		ret =3D xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo);
> -		xe_bo_put(bo);
> -		if (ret)
> -			return ret;
> +	return xe_bo_apply_to_pinned(xe, &xe-
> >pinned.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 &xe->pinned.evicted,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_evict_pinned);
> +}
> =C2=A0
> -		spin_lock(&xe->pinned.lock);
> +static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
> +{
> +	struct xe_device *xe =3D xe_bo_device(bo);
> +	int ret;
> +
> +	ret =3D xe_bo_restore_pinned(bo);
> +	if (ret)
> +		return ret;
> +
> +	if (bo->flags & XE_BO_FLAG_GGTT) {
> +		struct xe_tile *tile;
> +		u8 id;
> +
> +		for_each_tile(tile, xe_bo_device(bo), id) {
> +			if (tile !=3D bo->tile && !(bo->flags &
> XE_BO_FLAG_GGTTx(tile)))
> +				continue;
> +
> +			mutex_lock(&tile->mem.ggtt->lock);
> +			xe_ggtt_map_bo(tile->mem.ggtt, bo);
> +			mutex_unlock(&tile->mem.ggtt->lock);
> +		}
> =C2=A0	}
> -	spin_unlock(&xe->pinned.lock);
> +
> +	/*
> +	 * We expect validate to trigger a move VRAM and our move
> code
> +	 * should setup the iosys map.
> +	 */
> +	xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -130,54 +157,9 @@ int xe_bo_evict_all(struct xe_device *xe)
> =C2=A0 */
> =C2=A0int xe_bo_restore_kernel(struct xe_device *xe)
> =C2=A0{
> -	struct xe_bo *bo;
> -	int ret;
> -
> -	spin_lock(&xe->pinned.lock);
> -	for (;;) {
> -		bo =3D list_first_entry_or_null(&xe->pinned.evicted,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(*bo),
> pinned_link);
> -		if (!bo)
> -			break;
> -		xe_bo_get(bo);
> -		list_move_tail(&bo->pinned_link, &xe-
> >pinned.kernel_bo_present);
> -		spin_unlock(&xe->pinned.lock);
> -
> -		xe_bo_lock(bo, false);
> -		ret =3D xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo);
> -		if (ret) {
> -			xe_bo_put(bo);
> -			return ret;
> -		}
> -
> -		if (bo->flags & XE_BO_FLAG_GGTT) {
> -			struct xe_tile *tile;
> -			u8 id;
> -
> -			for_each_tile(tile, xe, id) {
> -				if (tile !=3D bo->tile && !(bo->flags
> & XE_BO_FLAG_GGTTx(tile)))
> -					continue;
> -
> -				mutex_lock(&tile->mem.ggtt->lock);
> -				xe_ggtt_map_bo(tile->mem.ggtt, bo);
> -				mutex_unlock(&tile->mem.ggtt->lock);
> -			}
> -		}
> -
> -		/*
> -		 * We expect validate to trigger a move VRAM and our
> move code
> -		 * should setup the iosys map.
> -		 */
> -		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> -
> -		xe_bo_put(bo);
> -
> -		spin_lock(&xe->pinned.lock);
> -	}
> -	spin_unlock(&xe->pinned.lock);
> -
> -	return 0;
> +	return xe_bo_apply_to_pinned(xe, &xe->pinned.evicted,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 &xe->pinned.kernel_bo_present,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_restore_and_map_ggtt);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -192,47 +174,20 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> =C2=A0 */
> =C2=A0int xe_bo_restore_user(struct xe_device *xe)
> =C2=A0{
> -	struct xe_bo *bo;
> =C2=A0	struct xe_tile *tile;
> -	struct list_head still_in_list;
> -	u8 id;
> -	int ret;
> +	int ret, id;
> =C2=A0
> =C2=A0	if (!IS_DGFX(xe))
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	/* Pinned user memory in VRAM should be validated on resume
> */
> -	INIT_LIST_HEAD(&still_in_list);
> -	spin_lock(&xe->pinned.lock);
> -	for (;;) {
> -		bo =3D list_first_entry_or_null(&xe-
> >pinned.external_vram,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(*bo),
> pinned_link);
> -		if (!bo)
> -			break;
> -		list_move_tail(&bo->pinned_link, &still_in_list);
> -		xe_bo_get(bo);
> -		spin_unlock(&xe->pinned.lock);
> -
> -		xe_bo_lock(bo, false);
> -		ret =3D xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo);
> -		xe_bo_put(bo);
> -		if (ret) {
> -			spin_lock(&xe->pinned.lock);
> -			list_splice_tail(&still_in_list,
> -					 &xe->pinned.external_vram);
> -			spin_unlock(&xe->pinned.lock);
> -			return ret;
> -		}
> -
> -		spin_lock(&xe->pinned.lock);
> -	}
> -	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
> -	spin_unlock(&xe->pinned.lock);
> +	ret =3D xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
> +				=C2=A0=C2=A0=C2=A0 &xe->pinned.external_vram,
> +				=C2=A0=C2=A0=C2=A0 xe_bo_restore_pinned);
> =C2=A0
> =C2=A0	/* Wait for restore to complete */
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_tile_migrate_wait(tile);
> =C2=A0
> -	return 0;
> +	return ret;
> =C2=A0}


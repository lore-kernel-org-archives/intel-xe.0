Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D4CCA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 09:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F1C10E900;
	Fri, 15 Aug 2025 09:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iimeN/Bn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C7C10E900
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755250655; x=1786786655;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aq/QsPAHjXDtV06tlOYd24eCpgSIjq43b3PVMmm9ous=;
 b=iimeN/BnGELdhVd7EsVyIJGBSypedIOP1W/StmyYlnVfHbrAjqN6BhwA
 FQXIMHr7pI1M5ONAVh1dKT6Xn48KSb6C8616W5AUnJV9nkJVR5x1avYbp
 X5nsu3BO2PuIxwuDneJ9AYnq6lCe3fADjUyJmg7K1nGMgk5RhnrhEA/cN
 AhUb4F15M1xSQjRwUTPl3yxhOLRCO2UDJxxvRtH9gAmlcyBAXp0RRJgc2
 LatUPFyfjDRd8/QsfeYZZNMknVbnp5rVVDwQF9zD+tU1QN5C5pfUOyIiN
 30E3ZBiTF8X37Wg+4ktWswQ0MWOTfMone37XPSmVIj+qkVtfBiVJMmxGU A==;
X-CSE-ConnectionGUID: V/p9yxYaTRCOWh+TvaTyTw==
X-CSE-MsgGUID: nemgilFxTYmHh8OLoe64vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68277820"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68277820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 02:37:35 -0700
X-CSE-ConnectionGUID: Jl6wWhlQQEGP1K1hhxzFog==
X-CSE-MsgGUID: DDO/tHDiTjuBxTAaOQWwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167240402"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 02:37:33 -0700
Message-ID: <8912eb7d24f0e38b1ef45006ee1d591d2ef6d20a.camel@linux.intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Fri, 15 Aug 2025 11:37:30 +0200
In-Reply-To: <aJ4vfeIn9q9CuTTs@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
 <aJ4vfeIn9q9CuTTs@lstrano-desk.jf.intel.com>
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

On Thu, 2025-08-14 at 11:48 -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:19PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Most users of xe_bo_create_pin_map_at() and
> > xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
> > and that simplifies conversion. Introduce an
> > xe_bo_create_pin_map_at_novm() function and make the _aligned()
> > version static. Use xe_validation_guard() for conversion.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0.../compat-i915-headers/gem/i915_gem_stolen.h | 24 ++----
> > =C2=A0drivers/gpu/drm/xe/display/xe_fb_pin.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 45 +++++-----
> > =C2=A0drivers/gpu/drm/xe/display/xe_plane_initial.c |=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 83 ++++++++++++++-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 13 +--
> > =C2=A0drivers/gpu/drm/xe/xe_eu_stall.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
> > =C2=A06 files changed, 101 insertions(+), 74 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/compat-i915-
> > headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-
> > headers/gem/i915_gem_stolen.h
> > index 1ce1e9da975b..ab48635ddffa 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> > @@ -21,9 +21,7 @@ static inline int
> > i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 size,
> > u32 align,
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 start,
> > u32 end)
> > =C2=A0{
> > -	struct drm_exec *exec =3D XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0	struct xe_bo *bo;
> > -	int err;
> > =C2=A0	u32 flags =3D XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
> > =C2=A0
> > =C2=A0	if (start < SZ_4K)
> > @@ -34,25 +32,15 @@ static inline int
> > i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
> > =C2=A0		start =3D ALIGN(start, align);
> > =C2=A0	}
> > =C2=A0
> > -	bo =3D xe_bo_create_locked_range(xe,
> > xe_device_get_root_tile(xe),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, size, start, end,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel, flags,
> > 0, exec);
> > -	if (IS_ERR(bo)) {
> > -		err =3D PTR_ERR(bo);
> > -		bo =3D NULL;
> > -		return err;
> > -	}
> > -	err =3D xe_bo_pin(bo, exec);
> > -	xe_bo_unlock_vm_held(bo);
> > -
> > -	if (err) {
> > -		xe_bo_put(fb->bo);
> > -		bo =3D NULL;
> > -	}
> > +	bo =3D xe_bo_create_pin_map_at_novm(xe,
> > xe_device_get_root_tile(xe),
> > +					=C2=A0 size, start,
> > ttm_bo_type_kernel, flags,
> > +					=C2=A0 false, 0, true);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > =C2=A0
> > =C2=A0	fb->bo =3D bo;
> > =C2=A0
> > -	return err;
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static inline int i915_gem_stolen_insert_node(struct xe_device
> > *xe,
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 43c45344ea26..d46ff7ebb0a1 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -102,29 +102,32 @@ static int __xe_pin_fb_vma_dpt(const struct
> > intel_framebuffer *fb,
> > =C2=A0				 XE_PAGE_SIZE);
> > =C2=A0
> > =C2=A0	if (IS_DGFX(xe))
> > -		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0,
> > NULL,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpt_size,
> > ~0ull,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM0 |
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_GGTT |
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignment);
> > +		dpt =3D xe_bo_create_pin_map_at_novm(xe, tile0,
> > +						=C2=A0=C2=A0 dpt_size,
> > ~0ull,
> > +						=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > +						=C2=A0=C2=A0 true,
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_VRAM0 |
> > +						=C2=A0=C2=A0 XE_BO_FLAG_GGTT
> > |
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > +						=C2=A0=C2=A0 alignment,
> > false);
> > =C2=A0	else
> > -		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0,
> > NULL,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpt_size,=C2=A0
> > ~0ull,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_STOLEN |
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_GGTT |
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignment);
> > +		dpt =3D xe_bo_create_pin_map_at_novm(xe, tile0,
> > +						=C2=A0=C2=A0 dpt_size,=C2=A0
> > ~0ull,
> > +						=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > +						=C2=A0=C2=A0 true,
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_STOLEN |
> > +						=C2=A0=C2=A0 XE_BO_FLAG_GGTT
> > |
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > +						=C2=A0=C2=A0 alignment,
> > false);
> > =C2=A0	if (IS_ERR(dpt))
> > -		dpt =3D xe_bo_create_pin_map_at_aligned(xe, tile0,
> > NULL,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dpt_size,=C2=A0
> > ~0ull,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_SYSTEM |
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_GGTT |
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignment);
> > +		dpt =3D xe_bo_create_pin_map_at_novm(xe, tile0,
> > +						=C2=A0=C2=A0 dpt_size,=C2=A0
> > ~0ull,
> > +						=C2=A0=C2=A0
> > ttm_bo_type_kernel,
> > +						=C2=A0=C2=A0 true,
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_SYSTEM |
> > +						=C2=A0=C2=A0 XE_BO_FLAG_GGTT
> > |
> > +						=C2=A0=C2=A0
> > XE_BO_FLAG_PAGETABLE,
> > +						=C2=A0=C2=A0 alignment,
> > false);
> > =C2=A0	if (IS_ERR(dpt))
> > =C2=A0		return PTR_ERR(dpt);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > index 826ac3d578b7..79d00127caf4 100644
> > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > @@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
> > =C2=A0			page_size);
> > =C2=A0	size -=3D base;
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map_at(xe, tile0, NULL, size,
> > phys_base,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel, flags);
> > +	bo =3D xe_bo_create_pin_map_at_novm(xe, tile0, size,
> > phys_base,
> > +					=C2=A0 ttm_bo_type_kernel,
> > flags, true, 0, false);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		drm_dbg(&xe->drm,
> > =C2=A0			"Failed to create bo phys_base=3D%pa size %u
> > with flags %x: %li\n",
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 23b28eeef59f..c9928d4ee5a0 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -2253,29 +2253,20 @@ struct xe_bo *xe_bo_create_user(struct
> > xe_device *xe,
> > =C2=A0	return bo;
> > =C2=A0}
> > =C2=A0
> > -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct
> > xe_tile *tile,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64 offset,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags)
> > -{
> > -	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size,
> > offset,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type, flags, 0);
> > -}
> > -
> > -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device
> > *xe,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile
> > *tile,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64
> > offset,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_bo_type
> > type, u32 flags,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 alignment)
> > +static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct
> > xe_device *xe,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > xe_tile *tile,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm
> > *vm,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 size_t size,
> > u64 offset,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 enum
> > ttm_bo_type type, u32 flags,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 bool vmap,
> > u64 alignment,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > drm_exec *exec)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo;
> > =C2=A0	int err;
> > =C2=A0	u64 start =3D offset =3D=3D ~0ull ? 0 : offset;
> > =C2=A0	u64 end =3D offset =3D=3D ~0ull ? offset : start + size;
> > -	struct drm_exec *exec =3D vm ? xe_vm_validation_exec(vm) :
> > XE_VALIDATION_UNIMPLEMENTED;
> > =C2=A0
>=20
> General comment for the series: should all BO-layer functions that
> allocate (or may allocate) memory include a lockdep assertion that
> the
> xe_validation_device->val lock is held? We already have
> xe_validation_assert_exec in several places, which is similar, but
> IMO
> it wouldn=E2=80=99t hurt to also assert xe_validation_device->val in the
> relevant driver paths. The new TTM manager functions are good
> candidates
> as well. Consider adding a follow-up patch at the end of the series
> to
> add these assertions once all allocation paths adhere to the new
> locking
> model.

Good idea, although the val lock may go away when TTM matures, we can
then perhaps replace that with just a lockdep map.

/Thomas



>=20
> Matt
>=20
> > -	if (flags & XE_BO_FLAG_STOLEN &&
> > +	if (flags & XE_BO_FLAG_STOLEN && vmap &&
> > =C2=A0	=C2=A0=C2=A0=C2=A0 xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> > =C2=A0		flags |=3D XE_BO_FLAG_GGTT;
> > =C2=A0
> > @@ -2289,9 +2280,11 @@ struct xe_bo
> > *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> > =C2=A0	if (err)
> > =C2=A0		goto err_put;
> > =C2=A0
> > -	err =3D xe_bo_vmap(bo);
> > -	if (err)
> > -		goto err_unpin;
> > +	if (vmap) {
> > +		err =3D xe_bo_vmap(bo);
> > +		if (err)
> > +			goto err_unpin;
> > +	}
> > =C2=A0
> > =C2=A0	xe_bo_unlock_vm_held(bo);
> > =C2=A0
> > @@ -2305,11 +2298,59 @@ struct xe_bo
> > *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> > =C2=A0	return ERR_PTR(err);
> > =C2=A0}
> > =C2=A0
> > +/**
> > + * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at
> > optional VRAM offset
> > + * @xe: The xe device.
> > + * @tile: The tile to select for migration of this bo, and the
> > tile used for
> > + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel
> > bos.
> > + * @size: The storage size to use for the bo.
> > + * @offset: Optional VRAM offset or %0 for don't care.
> > + * @type: The TTM buffer object type.
> > + * @flags: XE_BO_FLAG_ flags.
> > + * @vmap: Whether to create a buffer object map.
> > + * @alignment: GGTT alignment.
> > + * @intr: Whether to execut any waits for backing store
> > interruptible.
> > + *
> > + * Create a pinned and optionally mapped bo with VRAM offset and
> > GGTT alignment
> > + * options. The bo will be external and not associated with a VM.
> > + *
> > + * Return: The buffer object on success. Negative error pointer on
> > failure.
> > + * In particular, the function may return ERR_PTR(%-EINTR) if
> > @intr was set
> > + * to true on entry.
> > + */
> > +struct xe_bo *
> > +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile
> > *tile,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64 offset, enum
> > ttm_bo_type type, u32 flags,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 bool vmap, u64 alignment, bool intr)
> > +{
> > +	u32 drm_exec_flags =3D intr ? DRM_EXEC_INTERRUPTIBLE_WAIT :
> > 0;
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > +	struct xe_bo *bo;
> > +	int ret =3D 0;
> > +
> > +	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags,
> > ret, false) {
> > +		bo =3D xe_bo_create_pin_map_at_aligned(xe, tile,
> > NULL, size, offset,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 type, flags,
> > vmap,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 alignment,
> > &exec);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (IS_ERR(bo)) {
> > +			ret =3D PTR_ERR(bo);
> > +			xe_validation_retry_on_oom(&ctx, &ret);
> > +		}
> > +	}
> > +
> > +	return ret ? ERR_PTR(ret) : bo;
> > +}
> > +
> > =C2=A0struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct
> > xe_tile *tile,
> > =C2=A0				=C2=A0=C2=A0 struct xe_vm *vm, size_t size,
> > =C2=A0				=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags)
> > =C2=A0{
> > -	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull,
> > type, flags);
> > +	struct drm_exec *exec =3D vm ? xe_vm_validation_exec(vm) :
> > XE_VALIDATION_UNIMPLEMENTED;
> > +
> > +	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size,
> > ~0ull, type, flags,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 true, 0, exec);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void __xe_bo_unpin_map_no_vm(void *arg)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index a625806deeb6..d06266af9662 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -109,15 +109,10 @@ struct xe_bo *xe_bo_create_user(struct
> > xe_device *xe, struct xe_vm *vm, size_t s
> > =C2=A0struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct
> > xe_tile *tile,
> > =C2=A0				=C2=A0=C2=A0 struct xe_vm *vm, size_t size,
> > =C2=A0				=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags);
> > -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct
> > xe_tile *tile,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm, size_t
> > size, u64 offset,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_bo_type type, u32
> > flags);
> > -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device
> > *xe,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile
> > *tile,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64
> > offset,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_bo_type
> > type, u32 flags,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 alignment);
> > +struct xe_bo *
> > +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile
> > *tile,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, u64 offset, enum
> > ttm_bo_type type,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags, bool vmap, u64 alignment,
> > bool intr);
> > =C2=A0struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe,
> > struct xe_tile *tile,
> > =C2=A0					=C2=A0=C2=A0 size_t size, u32
> > flags);
> > =C2=A0struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe=
,
> > struct xe_tile *tile,
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c
> > b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index fdd514fec5ef..afabfc125488 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -617,9 +617,9 @@ static int xe_eu_stall_data_buf_alloc(struct
> > xe_eu_stall_data_stream *stream,
> > =C2=A0
> > =C2=A0	size =3D stream->per_xecore_buf_size * last_xecore;
> > =C2=A0
> > -	bo =3D xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 size, ~0ull,
> > ttm_bo_type_kernel,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_GGTT, SZ_64);
> > +	bo =3D xe_bo_create_pin_map_at_novm(tile->xe, tile, size,
> > ~0ull, ttm_bo_type_kernel,
> > +					=C2=A0 XE_BO_FLAG_SYSTEM |
> > XE_BO_FLAG_GGTT, true,
> > +					=C2=A0 SZ_64, false);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		kfree(stream->xecore_buf);
> > =C2=A0		return PTR_ERR(bo);
> > --=20
> > 2.50.1
> >=20


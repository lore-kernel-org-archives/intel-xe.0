Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC10BC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 08:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E93B10E065;
	Mon, 12 Aug 2024 08:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHI4ytKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA110E065
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723452951; x=1754988951;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YJiucTPuONTaxHjxhMYA+joji3z52cMgZl6y+NVvX7s=;
 b=CHI4ytKf3xaO7k+V4xd5/6RGaOy6pz/zFiA4lhPa2y8lwltOSoJH0+eG
 9kb4PtT9w8Afpl/4XJOWIc5MqSnV82qSGfBCDfAaPZi8IrGcbr742FQGS
 BzzYYU2ov82wzrkhm/WUDvRXaygzqQ4tQ9JcSVtXgWEPpd8kEf4cuQJfP
 f4LVN5OAx7ZDLFZL+kuTatHAGtkDKsf8BDXdG9uBVsBsYub1GYbWVwoiC
 fTnTZQ47QJJHAUtZ3HjEO1ngxaqVifj+frzeFdXHvj/VsWGgIhuDOuaOw
 3NXSy8jp82S+OT8to0mfjd+HFXYO4+0yYunuuSzA/gzvzsomypEBjaety A==;
X-CSE-ConnectionGUID: FPWNiXHOR1mAhkdf9quuIg==
X-CSE-MsgGUID: sRdPIhyuQmKQ8lHUL1DAFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32126754"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32126754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 01:55:50 -0700
X-CSE-ConnectionGUID: yVUxWELYS5GKD+vL2bWDeQ==
X-CSE-MsgGUID: fNvEUPBQSl6CAOA2nlHJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62854554"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.53])
 ([10.245.244.53])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 01:55:48 -0700
Message-ID: <fbae468accaa4ca50550dec93af5a118699bc7e5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Akshata
 Jahagirdar <akshata.jahagirdar@intel.com>
Date: Mon, 12 Aug 2024 10:55:46 +0200
In-Reply-To: <ef360a74-72c3-42a9-9553-76f2d165613e@intel.com>
References: <20240809220347.25330-1-nirmoy.das@intel.com>
 <ef360a74-72c3-42a9-9553-76f2d165613e@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Sat, 2024-08-10 at 00:23 +0200, Nirmoy Das wrote:
> Extracting this from
> https://patchwork.freedesktop.org/series/136277/=C2=A0as=20
> there is a regression in performance number on drm-tip.
>=20
> I think it will take some time to find out what is going on. This
> patch=20
> can be applied independently sending it separately.

Hi, Nirmoy.

What's the regression and do we have a Fixes: tag for this patch?
/Thomas


>=20
>=20
> Regards,
>=20
> Nirmoy
>=20
> On 8/10/2024 12:03 AM, Nirmoy Das wrote:
> > Parameterize clearing ccs and bo data in xe_migrate_clear() which=C2=A0
> > higher
> > layers can utilize. This patch will be used later on when doing bo
> > data
> > clear for igfx as well.
> >=20
> > v2: Replace multiple params with flags in xe_migrate_clear (Matt B)
> > v3: s/CLEAR_BO_DATA_FLAG_*/XE_MIGRATE_CLEAR_FLAG_* and move to
> > =C2=A0=C2=A0=C2=A0=C2=A0 xe_migrate.h. other nits(Matt B)
> >=20
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/tests/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 ++-
> > =C2=A0 drivers/gpu/drm/xe/tests/xe_migrate.c | 12 ++++++++----
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++--
> > =C2=A0 drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 27 +++++++++++++++++++---
> > -----
> > =C2=A0 drivers/gpu/drm/xe/xe_migrate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 7 ++++++-
> > =C2=A0 5 files changed, 45 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 1768483da1b7..df9fd907edd4 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -36,7 +36,8 @@ static int ccs_test_migrate(struct xe_tile *tile,
> > struct xe_bo *bo,
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Optionally clear bo *and* CCS data in VRAM. */
> > =C2=A0=C2=A0	if (clear) {
> > -		fence =3D xe_migrate_clear(tile->migrate, bo, bo-
> > >ttm.resource);
> > +		fence =3D xe_migrate_clear(tile->migrate, bo, bo-
> > >ttm.resource,
> > +				=09
> > XE_MIGRATE_CLEAR_FLAG_FULL);
> > =C2=A0=C2=A0		if (IS_ERR(fence)) {
> > =C2=A0=C2=A0			KUNIT_FAIL(test, "Failed to submit bo
> > clear.\n");
> > =C2=A0=C2=A0			return PTR_ERR(fence);
> > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > index 4344a1724029..47ae9d0b8864 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > @@ -105,7 +105,8 @@ static void test_copy(struct xe_migrate *m,
> > struct xe_bo *bo,
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
> > -	fence =3D xe_migrate_clear(m, remote, remote->ttm.resource);
> > +	fence =3D xe_migrate_clear(m, remote, remote->ttm.resource,
> > +				 XE_MIGRATE_CLEAR_FLAG_FULL);
> > =C2=A0=C2=A0	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote
> > big bo" :
> > =C2=A0=C2=A0				 "Clearing remote small bo",
> > test)) {
> > =C2=A0=C2=A0		retval =3D xe_map_rd(xe, &remote->vmap, 0, u64);
> > @@ -279,7 +280,8 @@ static void xe_migrate_sanity_test(struct
> > xe_migrate *m, struct kunit *test)
> > =C2=A0=C2=A0	kunit_info(test, "Clearing small buffer object\n");
> > =C2=A0=C2=A0	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
> > =C2=A0=C2=A0	expected =3D 0;
> > -	fence =3D xe_migrate_clear(m, tiny, tiny->ttm.resource);
> > +	fence =3D xe_migrate_clear(m, tiny, tiny->ttm.resource,
> > +				 XE_MIGRATE_CLEAR_FLAG_FULL);
> > =C2=A0=C2=A0	if (sanity_fence_failed(xe, fence, "Clearing small bo",
> > test))
> > =C2=A0=C2=A0		goto out;
> > =C2=A0=20
> > @@ -300,7 +302,8 @@ static void xe_migrate_sanity_test(struct
> > xe_migrate *m, struct kunit *test)
> > =C2=A0=C2=A0	kunit_info(test, "Clearing big buffer object\n");
> > =C2=A0=C2=A0	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
> > =C2=A0=C2=A0	expected =3D 0;
> > -	fence =3D xe_migrate_clear(m, big, big->ttm.resource);
> > +	fence =3D xe_migrate_clear(m, big, big->ttm.resource,
> > +				 XE_MIGRATE_CLEAR_FLAG_FULL);
> > =C2=A0=C2=A0	if (sanity_fence_failed(xe, fence, "Clearing big bo",
> > test))
> > =C2=A0=C2=A0		goto out;
> > =C2=A0=20
> > @@ -603,7 +606,8 @@ static void test_clear(struct xe_device *xe,
> > struct xe_tile *tile,
> > =C2=A0=20
> > =C2=A0=C2=A0	kunit_info(test, "Clear vram buffer object\n");
> > =C2=A0=C2=A0	expected =3D 0x0000000000000000;
> > -	fence =3D xe_migrate_clear(tile->migrate, vram_bo, vram_bo-
> > >ttm.resource);
> > +	fence =3D xe_migrate_clear(tile->migrate, vram_bo, vram_bo-
> > >ttm.resource,
> > +				 XE_MIGRATE_CLEAR_FLAG_FULL);
> > =C2=A0=C2=A0	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
> > =C2=A0=C2=A0		return;
> > =C2=A0=C2=A0	dma_fence_put(fence);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 3295bc92d7aa..56a089aa3916 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -793,8 +793,16 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> > =C2=A0=C2=A0			}
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0	} else {
> > -		if (move_lacks_source)
> > -			fence =3D xe_migrate_clear(migrate, bo,
> > new_mem);
> > +		if (move_lacks_source) {
> > +			u32 flags =3D 0;
> > +
> > +			if (mem_type_is_vram(new_mem->mem_type))
> > +				flags |=3D
> > XE_MIGRATE_CLEAR_FLAG_FULL;
> > +			else if (handle_system_ccs)
> > +				flags |=3D
> > XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> > +
> > +			fence =3D xe_migrate_clear(migrate, bo,
> > new_mem, flags);
> > +		}
> > =C2=A0=C2=A0		else
> > =C2=A0=C2=A0			fence =3D xe_migrate_copy(migrate, bo, bo,
> > old_mem,
> > =C2=A0=C2=A0						new_mem,
> > handle_system_ccs);
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 6f24aaf58252..a2d0ce3c59bf 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1037,9 +1037,11 @@ static void emit_clear(struct xe_gt *gt,
> > struct xe_bb *bb, u64 src_ofs,
> > =C2=A0=C2=A0 * @m: The migration context.
> > =C2=A0=C2=A0 * @bo: The buffer object @dst is currently bound to.
> > =C2=A0=C2=A0 * @dst: The dst TTM resource to be cleared.
> > + * @clear_flags: flags to specify which data to clear: CCS, BO, or
> > both.
> > =C2=A0=C2=A0 *
> > - * Clear the contents of @dst to zero. On flat CCS devices,
> > - * the CCS metadata is cleared to zero as well on VRAM
> > destinations.
> > + * Clear the contents of @dst to zero when
> > XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
> > + * On flat CCS devices, the CCS metadata is cleared to zero with
> > XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
> > + * Set XE_MIGRATE_CLEAR_FLAG_FULL to clear bo as well as CCS
> > metadata.
> > =C2=A0=C2=A0 * TODO: Eliminate the @bo argument.
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Return: Pointer to a dma_fence representing the last cle=
ar
> > batch, or
> > @@ -1048,18 +1050,27 @@ static void emit_clear(struct xe_gt *gt,
> > struct xe_bb *bb, u64 src_ofs,
> > =C2=A0=C2=A0 */
> > =C2=A0 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > =C2=A0=C2=A0				=C2=A0=C2=A0 struct xe_bo *bo,
> > -				=C2=A0=C2=A0 struct ttm_resource *dst)
> > +				=C2=A0=C2=A0 struct ttm_resource *dst,
> > +				=C2=A0=C2=A0 u32 clear_flags)
> > =C2=A0 {
> > =C2=A0=C2=A0	bool clear_vram =3D mem_type_is_vram(dst->mem_type);
> > +	bool clear_bo_data =3D XE_MIGRATE_CLEAR_FLAG_BO_DATA &
> > clear_flags;
> > +	bool clear_ccs =3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA &
> > clear_flags;
> > =C2=A0=C2=A0	struct xe_gt *gt =3D m->tile->primary_gt;
> > =C2=A0=C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > -	bool clear_system_ccs =3D (xe_bo_needs_ccs_pages(bo) &&
> > !IS_DGFX(xe)) ? true : false;
> > +	bool clear_only_system_ccs =3D false;
> > =C2=A0=C2=A0	struct dma_fence *fence =3D NULL;
> > =C2=A0=C2=A0	u64 size =3D bo->size;
> > =C2=A0=C2=A0	struct xe_res_cursor src_it;
> > =C2=A0=C2=A0	struct ttm_resource *src =3D dst;
> > =C2=A0=C2=A0	int err;
> > =C2=A0=20
> > +	if (WARN_ON(!clear_bo_data && !clear_ccs))
> > +		return NULL;
> > +
> > +	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > +		clear_only_system_ccs =3D true;
> > +
> > =C2=A0=C2=A0	if (!clear_vram)
> > =C2=A0=C2=A0		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > &src_it);
> > =C2=A0=C2=A0	else
> > @@ -1085,7 +1096,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> > =C2=A0=C2=A0		batch_size =3D 2 +
> > =C2=A0=C2=A0			pte_update_size(m, pte_flags, src,
> > &src_it,
> > =C2=A0=C2=A0					&clear_L0, &clear_L0_ofs,
> > &clear_L0_pt,
> > -					clear_system_ccs ? 0 :
> > emit_clear_cmd_len(gt), 0,
> > +					clear_bo_data ?
> > emit_clear_cmd_len(gt) : 0, 0,
> > =C2=A0=C2=A0					avail_pts);
> > =C2=A0=20
> > =C2=A0=C2=A0		if (xe_migrate_needs_ccs_emit(xe))
> > @@ -1107,13 +1118,13 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> > =C2=A0=C2=A0		if (clear_vram &&
> > xe_migrate_allow_identity(clear_L0, &src_it))
> > =C2=A0=C2=A0			xe_res_next(&src_it, clear_L0);
> > =C2=A0=C2=A0		else
> > -			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > clear_system_ccs,
> > +			emit_pte(m, bb, clear_L0_pt, clear_vram,
> > clear_only_system_ccs,
> > =C2=A0=C2=A0				 &src_it, clear_L0, dst);
> > =C2=A0=20
> > =C2=A0=C2=A0		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> > =C2=A0=C2=A0		update_idx =3D bb->len;
> > =C2=A0=20
> > -		if (!clear_system_ccs)
> > +		if (clear_bo_data)
> > =C2=A0=C2=A0			emit_clear(gt, bb, clear_L0_ofs, clear_L0,
> > XE_PAGE_SIZE, clear_vram);
> > =C2=A0=20
> > =C2=A0=C2=A0		if (xe_migrate_needs_ccs_emit(xe)) {
> > @@ -1172,7 +1183,7 @@ struct dma_fence *xe_migrate_clear(struct
> > xe_migrate *m,
> > =C2=A0=C2=A0		return ERR_PTR(err);
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	if (clear_system_ccs)
> > +	if (clear_ccs)
> > =C2=A0=C2=A0		bo->ccs_cleared =3D true;
> > =C2=A0=20
> > =C2=A0=C2=A0	return fence;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index 453e0ecf5034..7929cc2425e8 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -102,9 +102,14 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> > =C2=A0=C2=A0				=C2=A0 struct ttm_resource *dst,
> > =C2=A0=C2=A0				=C2=A0 bool copy_only_ccs);
> > =C2=A0=20
> > +#define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > +#define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > +#define
> > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> > +					XE_MIGRATE_CLEAR_FLAG_CCS_
> > DATA)
> > =C2=A0 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > =C2=A0=C2=A0				=C2=A0=C2=A0 struct xe_bo *bo,
> > -				=C2=A0=C2=A0 struct ttm_resource *dst);
> > +				=C2=A0=C2=A0 struct ttm_resource *dst,
> > +				=C2=A0=C2=A0 u32 clear_flags);
> > =C2=A0=20
> > =C2=A0 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> > =C2=A0=20


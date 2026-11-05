Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C560A2625
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkHawJXu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8FC10E318;
	Thu,  5 Nov 2026 16:32:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712B510E318
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:32:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 95F6B609FE;
 Thu,  5 Nov 2026 16:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3242B1F0093A;
 Thu,  5 Nov 2026 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793896369;
 bh=pCm2DqcFbJr15ct3HXkLYYG3yUxmaxzWj7e6fm6ZTrA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hkHawJXudTh33HGsK82D2NlHpEJIFqXkY8rKeVsPmREM4NqbkT3gjRzFKwf31IS+a
 NB2idQXu/TjMQ+yRNWmMRlAuI9Cv4Ulo07uxODzfn6MBeAYRAnbbNkcNjct+m5aiSo
 TDWWO3hRyge26IOal069d9YztxbXv9yI7+2d1IdKGagEX7VdvyeMSjmR0yVrv50dki
 nJjHhaJpX2Qq96AtvKj7bf/77ZE0Jv7stY9vfSX2r6JUVfL+HB6il6vRbLwaoHjGPw
 J0h5WPS8wwMqtLO/r5pW2gjTar2J2ueZ0Y2vGHFyNyTGBnLjtfQpzoX4PTd4WbL62W
 zlkLxrXC4CfEQ==
Message-ID: <sashiko-outbox-199502@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] drm/xe/migrate: Support copying between sysmem
 and stolen
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261105161444.593259-9-dev@lankhorst.se>
References: <20261105161444.593259-7-dev@lankhorst.se>
 <20261105161444.593259-9-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:32:48 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/xe/migrate: unmapped identity map used for stolen memory on dg=
fx
- [High] drm/xe/migrate: invalid devmem PTE flag for stolen on pre-1270 igfx
- [Medium] drm/xe/migrate: missing PTE_UPDATE_FLAG_ALLOW_IDENTITY in blt_co=
py()
- [Low] drm/xe/migrate: consolidate identity map check in xe_migrate_allow_=
identity()
--

commit dee6bf0b0a807a0e7400bee24300c61c27406789
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/migrate: Support copying between sysmem and stolen

This commit updates xe_migrate_copy() and xe_migrate_clear() to treat
stolen memory as device memory while restricting the VRAM identity map
to discrete graphics so integrated stolen BOs can be copied to and from
sysmem.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..027a2c9a0a286 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -907,6 +907,7 @@ static bool xe_migrate_allow_identity(u64 size, const=
 struct xe_res_cursor *cur)
> =20
>  #define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
>  #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
> +#define PTE_UPDATE_FLAG_ALLOW_IDENTITY	BIT(2)
> =20
>  static u32 pte_update_size(struct xe_migrate *m,
>  			   u32 flags,
> @@ -918,9 +919,10 @@ static u32 pte_update_size(struct xe_migrate *m,
>  	u32 cmds =3D 0;
>  	bool is_vram =3D PTE_UPDATE_FLAG_IS_VRAM & flags;
>  	bool is_comp_pte =3D PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
> +	bool allow_identity =3D PTE_UPDATE_FLAG_ALLOW_IDENTITY & flags;
> =20
>  	*L0_pt =3D pt_ofs;
> -	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> +	if (is_vram && allow_identity && xe_migrate_allow_identity(*L0, cur)) {

[Severity: Medium]
Does requiring PTE_UPDATE_FLAG_ALLOW_IDENTITY in pte_update_size() break
blt_copy() in drivers/gpu/drm/xe/tests/xe_migrate.c?

In blt_copy(), pte_flags is set without PTE_UPDATE_FLAG_ALLOW_IDENTITY,
while emit_pte() is still skipped whenever src_is_vram or dst_is_vram is
true:

drivers/gpu/drm/xe/tests/xe_migrate.c:blt_copy() {
    ...
		pte_flags =3D src_is_vram ? (PTE_UPDATE_FLAG_IS_VRAM |
					   PTE_UPDATE_FLAG_IS_COMP_PTE) : 0;
		batch_size +=3D pte_update_size(m, pte_flags, src, &src_it, &src_L0,
					      &src_L0_ofs, &src_L0_pt, 0, 0,
					      avail_pts);
    ...
		if (src_is_vram)
			xe_res_next(&src_it, src_L0);
		else
			emit_pte(m, bb, src_L0_pt, src_is_vram, false,
				 &src_it, src_L0, src);
    ...
}

Because pte_update_size() no longer takes the identity map branch for
VRAM in blt_copy(), src_L0_ofs and dst_L0_ofs are set to dynamic page
table addresses via xe_migrate_vm_addr(pt_ofs, 0) that are never
populated by emit_pte(), causing xe_validate_ccs_kunit to read and write
through unpopulated PTEs.

>  		/* Offset into identity map. */
>  		*L0_ofs =3D xe_migrate_vram_ofs(tile_to_xe(m->tile),
>  					      cur->start + vram_region_gpu_offset(res),
> @@ -1206,6 +1208,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *=
m,
>  	return flush_flags;
>  }
> =20
> +static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
> +{
> +	if (mem_type_is_vram(res->mem_type) || res->mem_type =3D=3D XE_PL_STOLE=
N)
> +		return true;
> +
> +	return false;
> +}
> +
>  static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  					   struct xe_bo *src_bo,
>  					   struct xe_bo *dst_bo,
> @@ -1226,8 +1236,8 @@ static struct dma_fence *__xe_migrate_copy(struct x=
e_migrate *m,
>  	int err;
>  	bool src_is_pltt =3D src->mem_type =3D=3D XE_PL_TT;
>  	bool dst_is_pltt =3D dst->mem_type =3D=3D XE_PL_TT;
> -	bool src_is_vram =3D mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram =3D mem_type_is_vram(dst->mem_type);
> +	bool src_is_vram =3D is_devmem(src_bo, src);
> +	bool dst_is_vram =3D is_devmem(dst_bo, dst);

[Severity: High]
On integrated platforms with GRAPHICS_VERx100(xe) < 1270 (such as TGL,
RKL, and ADL), will returning true from is_devmem() for XE_PL_STOLEN
cause emit_pte() and emit_clear_main_copy() to program invalid device
memory flags?

In drivers/gpu/drm/xe/xe_bo.c, xe_bo_is_stolen_devmem() only treats
stolen memory as devmem on graphics version 12.70 and newer:

bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
{
	return xe_bo_is_stolen(bo) &&
		GRAPHICS_VERx100(xe_bo_device(bo)) >=3D 1270;
}

However, is_devmem() ignores its bo argument and returns true for all
XE_PL_STOLEN resources. When copying or clearing a stolen BO in
__xe_migrate_copy() or xe_migrate_clear() on pre-12.70 integrated
platforms, passing is_vram =3D true into emit_pte() sets devmem =3D true and
encodes XE_PPGTT_PTE_DM into the PTEs:

drivers/gpu/drm/xe/xe_migrate.c:emit_pte() {
    ...
			if (is_vram) {
				...
				addr +=3D vram_region_gpu_offset(res);
				devmem =3D true;
			}

			addr =3D vm->pt_ops->pte_encode_addr(m->tile->xe,
							   addr, pat_index,
							   0, devmem, flags);
    ...
}

Similarly, xe_migrate_clear() passes clear_vram =3D true to
emit_clear() -> emit_clear_main_copy(), which selects local memory (0x0)
instead of system memory (0x1) in XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT.
Should is_devmem() check xe_bo_is_stolen_devmem(bo) instead of
res->mem_type =3D=3D XE_PL_STOLEN, or should the cursor initialization for
XE_PL_STOLEN be separated from the devmem PTE and blitter flags on
pre-12.70 platforms?

>  	bool type_device =3D src_bo->ttm.type =3D=3D ttm_bo_type_device;
>  	bool needs_ccs_emit =3D type_device && xe_migrate_needs_ccs_emit(xe);
>  	bool copy_ccs =3D xe_device_has_flat_ccs(xe) &&
> @@ -1287,6 +1297,7 @@ static struct dma_fence *__xe_migrate_copy(struct x=
e_migrate *m,
> =20
>  		pte_flags =3D src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
>  		pte_flags |=3D use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		pte_flags |=3D IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
>  		batch_size +=3D pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>  					      avail_pts);
> @@ -1294,6 +1305,7 @@ static struct dma_fence *__xe_migrate_copy(struct x=
e_migrate *m,
>  			dst_L0_ofs =3D src_L0_ofs;
>  		} else {
>  			pte_flags =3D dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +			pte_flags |=3D IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
>  			batch_size +=3D pte_update_size(m, pte_flags, dst,
>  						      &dst_it, &src_L0,
>  						      &dst_L0_ofs, &dst_L0_pt,
> @@ -1320,13 +1332,13 @@ static struct dma_fence *__xe_migrate_copy(struct=
 xe_migrate *m,
>  			goto err_sync;
>  		}
> =20
> -		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
> +		if (src_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &s=
rc_it))
>  			xe_res_next(&src_it, src_L0);
>  		else
>  			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs || use_comp_p=
at,
>  				 &src_it, src_L0, src);
> =20
> -		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
> +		if (dst_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &d=
st_it))
>  			xe_res_next(&dst_it, src_L0);
>  		else if (!copy_only_ccs)
>  			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,

[Severity: High]
What happens when __xe_migrate_copy() or xe_migrate_clear() operates on
an XE_PL_STOLEN BO on discrete graphics (such as during pinned BO
eviction/restore via xe_bo_evict_pinned_copy() and
xe_bo_restore_pinned())?

Because is_devmem() returns true for XE_PL_STOLEN and xe_res_first()
sets cur->size =3D size for XE_PL_STOLEN, both pte_update_size() and the
emit_pte() checks in __xe_migrate_copy() and xe_migrate_clear() will
take the identity map path when IS_DGFX(xe) is true.

However, xe_migrate_program_identity() only maps usable VRAM up to
xe_vram_region_usable_size(vram) + dpa_base, which excludes stolen
memory at the top of VRAM:

drivers/gpu/drm/xe/xe_migrate.c:xe_migrate_program_identity() {
    ...
	u64 vram_limit =3D xe_vram_region_usable_size(vram) + dpa_base;
    ...
}

Won't skipping emit_pte() and using xe_migrate_vram_ofs() for
XE_PL_STOLEN on DGFX access unmapped virtual addresses in the migration
VM?

[ ... ]

> @@ -1927,7 +1939,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
>  				   struct ttm_resource *dst,
>  				   u32 clear_flags)
>  {
> -	bool clear_vram =3D mem_type_is_vram(dst->mem_type);
> +	bool clear_vram =3D is_devmem(bo, dst);
>  	bool clear_bo_data =3D XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
>  	bool clear_ccs =3D XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
>  	struct xe_gt *gt =3D m->tile->primary_gt;
> @@ -1967,6 +1979,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
> =20
>  		/* Calculate final sizes and batch size.. */
>  		pte_flags =3D clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		pte_flags |=3D IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
>  		batch_size =3D 1 +
>  			pte_update_size(m, pte_flags, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> @@ -1989,7 +2002,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
> =20
>  		size -=3D clear_L0;
>  		/* Preemption is enabled again by the ring ops. */
> -		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
> +		if (clear_vram && IS_DGFX(xe) && xe_migrate_allow_identity(clear_L0, &=
src_it)) {

[Severity: Low]
As reported by Matthew Brost on v1 [1], this isn't a bug, but could the
identity map check be consolidated inside xe_migrate_allow_identity()
(for instance by checking cur->mem_type !=3D XE_PL_STOLEN) rather than
adding PTE_UPDATE_FLAG_ALLOW_IDENTITY and repeating IS_DGFX(xe) across
__xe_migrate_copy() and xe_migrate_clear()?

In the v1 discussion, it was noted that disallowing XE_PL_STOLEN in
xe_migrate_allow_identity() would avoid scattering these checks (and
would also avoid the DGFX stolen identity map issue above and the
blt_copy() mismatch). Also, if is_devmem() does not use its struct xe_bo
*bo parameter, should that parameter be dropped or used to check
xe_bo_is_stolen_devmem(bo)?

[1] https://lore.kernel.org/r/al5yelaY34ls2%2Fvw@gsse-cloud1.jf.intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105161444.5932=
59-7-dev@lankhorst.se?part=3D2

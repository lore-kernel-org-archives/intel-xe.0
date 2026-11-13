Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0F60A260F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMdgRggq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7FF1123FC;
	Fri, 13 Nov 2026 13:05:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFA11247F;
 Fri, 13 Nov 2026 13:05:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 51426462F2;
 Fri, 13 Nov 2026 13:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9C91F000C4;
 Fri, 13 Nov 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794575135;
 bh=hk7LTJHV4WONjK/8z63DVgptD3VLzIGn8C2RToPObLo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=RMdgRggqnAonU2/qO1J9UdjsvosRVJsBAL7BpVu24UlhHzrjw3UYINYLr/INS3GZ2
 6OudOhON6ftZQcx01OFa2lkO2TMsyW1zOBL/JuSeWi/NHhfuqwKQGTlRDK7+7nRJgx
 wqZqhKb4zTbdUqUvqLb+2FLRL6vAV+WCIX+H/dsdVcKJ+PKwhQu9CdfXr886SdyNjm
 Z/jEJuqhiw7oZuJJOm78HkHcIGYEivnPFi0W8U56r5ZPdVH34kd+C8pRQWqlZWZZaG
 EKK/D40GPsr/gYlMpdT25LujYGCzOET2KN9WMsFO0f2ZS2I1GnmcSmZ0T1WjweyBr1
 o9HXNzwitAE/Q==
Message-ID: <sashiko-outbox-212805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] drm/xe/migrate: Support copying between sysmem
 and stolen
To: "Maarten Lankhorst" <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20261113124453.144408-9-dev@lankhorst.se>
References: <20261113124453.144408-7-dev@lankhorst.se>
 <20261113124453.144408-9-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:05:34 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/migrate: is_devmem() checks bo->ttm.resource instead of
  res
- [High] drm/xe/migrate: NULL deref and broken PTEs for stolen on
  pre-1270 GPUs
--

commit 3c7e5791762e378b27bc3e708f8e54449d9a1afa
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/xe/migrate: Support copying between sysmem and stolen

This commit updates xe_migrate to disallow identity mapping for
XE_PL_STOLEN and adds an is_devmem() helper to handle stolen device
memory during migration copies and clears.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..23b8f50d1ba21 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -1206,6 +1210,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *=
m,
>  	return flush_flags;
>  }
> =20
> +static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
> +{
> +	if (mem_type_is_vram(res->mem_type))
> +		return true;
> +
> +	return xe_bo_is_stolen_devmem(bo);
> +}

[Severity: High]
Does is_devmem() cause a NULL pointer dereference in xe_bo_sg() when
migrating or clearing an XE_PL_STOLEN BO on platforms with graphics
version < 12.70 (such as TGL, ADL, DG1, or DG2)?

mem_type_is_vram() explicitly excludes XE_PL_STOLEN, and
xe_bo_is_stolen_devmem() returns false when GRAPHICS_VERx100(xe) < 1270,
so is_devmem() returns false for stolen memory on those platforms.
__xe_migrate_copy() and xe_migrate_clear() then take the non-VRAM path
and call xe_res_first_sg(xe_bo_sg(bo), ...), but stolen BOs are managed
with use_tt =3D false and have bo->ttm.ttm =3D=3D NULL:

drivers/gpu/drm/xe/xe_bo.c:xe_bo_sg() {
	struct ttm_tt *tt =3D bo->ttm.ttm;
	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);

	return xe_tt->sg;
}

In addition, emit_pte() only adds vram_region_gpu_offset(res) (which
returns mgr->stolen_base for XE_PL_STOLEN) inside the if (is_vram)
block alongside devmem =3D true, whereas pre-12.70 integrated stolen
memory needs xe_res_first() and vram_region_gpu_offset(res) without
setting XE_PPGTT_PTE_DM, and pre-12.70 discrete stolen memory (DG1, DG2)
resides in LMEM and needs both.

>  static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  					   struct xe_bo *src_bo,
>  					   struct xe_bo *dst_bo,
> @@ -1226,8 +1238,8 @@ static struct dma_fence *__xe_migrate_copy(struct x=
e_migrate *m,
>  	int err;
>  	bool src_is_pltt =3D src->mem_type =3D=3D XE_PL_TT;
>  	bool dst_is_pltt =3D dst->mem_type =3D=3D XE_PL_TT;
> -	bool src_is_vram =3D mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram =3D mem_type_is_vram(dst->mem_type);
> +	bool src_is_vram =3D is_devmem(src_bo, src);
> +	bool dst_is_vram =3D is_devmem(dst_bo, dst);

[Severity: High]
When moving or evicting a BO between XE_PL_STOLEN and XE_PL_TT, does
is_devmem() inspect bo->ttm.resource instead of the passed-in res?

xe_bo_is_stolen_devmem() calls xe_bo_is_stolen(), which checks
bo->ttm.resource->mem_type =3D=3D XE_PL_STOLEN rather than res->mem_type.
During xe_bo_move(), xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
...) and xe_migrate_clear(migrate, bo, new_mem, ...) run before
bo->ttm.resource is updated to new_mem.

If a stolen BO is evicted from XE_PL_STOLEN (src) to XE_PL_TT (dst),
is_devmem(dst_bo, dst) sees bo->ttm.resource->mem_type =3D=3D XE_PL_STOLEN
and returns true for the XE_PL_TT destination.  __xe_migrate_copy() then
initializes dst_it with xe_res_first(dst, ...) (which sets
dst_it.mem_type =3D XE_PL_TT and dst_it.size =3D size), passes
PTE_UPDATE_FLAG_IS_VRAM to pte_update_size(), and because
xe_migrate_allow_identity() returns true for dst_it.mem_type !=3D
XE_PL_STOLEN, calls xe_migrate_vram_ofs() and dereferences a NULL
xe->mem.vram on integrated GPUs.  Conversely, moving from XE_PL_TT to
XE_PL_STOLEN or clearing a newly allocated XE_PL_STOLEN resource while
bo->ttm.resource is NULL or XE_PL_TT returns false from is_devmem() and
calls xe_bo_sg() on a stolen BO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113124453.1444=
08-7-dev@lankhorst.se?part=3D2

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3B0C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0BB10E38D;
	Mon, 18 Dec 2023 19:38:01 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34C710E38D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:37:59 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2cc7ba7d12eso3292721fa.3
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702928278; x=1703533078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ai8VwBCA9bCkOeX2HQ8N2cQDKJSbPq60EjOvvJro5AI=;
 b=CD51j5d/3AnFPSjcCq4CGlAbAjHP6eLB/z4BfMhJE14Ez5Ue+pIV0KQw4t9ovEToTl
 W5gsgxMwrC5SLV4+zmm3muis5auJwWeYGYUnwpiAGqZWEtGilREoOcJhFgUcWQBI2VyZ
 FnPQUfdIibu2X0mihNWxkmN4I1gpB+HEwkmtlhkAGtlTrzCvTpuSazEZijsb35iemCX7
 iaUJUriijRKQJ/jVPuYC9YAthogVOsdCiM7NQkLuuTq8gJScFAtZ7l+lG2XnWYb+X3Hc
 3H4z48zjXRyov2cqtQ9G8rLKPGcARKOjJjsIKZV0fph7PUF0IgYZnTyn+ChPKDQIvsQa
 i90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928278; x=1703533078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ai8VwBCA9bCkOeX2HQ8N2cQDKJSbPq60EjOvvJro5AI=;
 b=iDFC16Vd6OEHThnAAVU7mCALHlJIZclMSt0LVEhNbZFmNaf4KZIGPYTj8qvh+Cfsun
 iw0YQVyZJmg+4m3FcuDccDZEBjqPhAsekmn505BvUO0CCe/zmp8huiHWUBlm7TmSzDr+
 MkZjhFFIl5hShiLUNy5k4jEpeaZ7/DTrYtktwHDN7EZxbD0oupoKvAUoofcYhYNzgSuf
 wQtGAsQwi4oiTSZUi9jS0bsrFtIKGB8haJFOgUVOtRJ7j0NF9FekyrkycHfAKop6oec3
 35sR5Av4OsNgYl4iEXUJp8vPTqQQnc7LbI89r8IGuuBXAI0Ar5M2iGtt4AMbLJHXOsHL
 JKoQ==
X-Gm-Message-State: AOJu0YwG1L8QFyQF+7LU2a8bFS4eBStbqoA61WtDeqIxgIQuIxjkunvl
 Xp+ImxKMTL9SosANSSj955I78/GKQJg+BYLGRwc=
X-Google-Smtp-Source: AGHT+IE1I+3Rfkdbqn9P5NcHcFq5ui9IBJb+u9CxSux6vtzqUFr8mn1PRPU/Aboor+0a2ufvEZB8ctFoGK6u0laGFqY=
X-Received: by 2002:a05:651c:1a11:b0:2cc:7db2:acb8 with SMTP id
 by17-20020a05651c1a1100b002cc7db2acb8mr1369ljb.107.1702928277395; Mon, 18 Dec
 2023 11:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20231218142933.8571-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231218142933.8571-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 18 Dec 2023 19:37:30 +0000
Message-ID: <CAM0jSHMq+NKYU+9aWfjAjxZGOr5HNGuVitu_F4xWu_a0Hzxspg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023 at 14:29, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Since the migrate code is using the identity map for addressing VRAM,
> copy chunks may become as small as 64K if the VRAM resource is fragmented=
.
>
> However, a chunk size smaller that 1MiB may lead to the *next* chunk's
> offset into the CCS metadata backup memory may not be page-aligned, and
> the XY_CTRL_SURF_COPY_BLT command can't handle that, and even if it could=
,
> the current code doesn't handle the offset calculaton correctly.
>
> To fix this, make sure we align the size of VRAM copy chunks to 1MiB. If
> the remaining data to copy is smaller than that, that's not a problem,
> so use the remaining size. If the VRAM copy cunk becomes fragmented due
> to the size alignment restriction, don't use the identity map, but instea=
d
> emit PTEs into the page-table like we do for system memory.
>
> v2:
> - Rebase
> v3:
> - Future proof somewhat by taking into account the real data size to
>   flat CCS metadata size ratio. (Matt Roper)
> - Invert a couple of if-statements for better readability.
> - Fix support for 4K-granularity VRAM sizes. (Tested on DG1).
> v4:
> - Fix up code comments
> - Fix debug printout format typo.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |   2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 128 ++++++++++++++++----------
>  2 files changed, 80 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> index 7a32faa2f688..a6523df0f1d3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -331,7 +331,7 @@ static void xe_migrate_sanity_test(struct xe_migrate =
*m, struct kunit *test)
>                 xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>
>         emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
> -                &src_it, XE_PAGE_SIZE, pt);
> +                &src_it, XE_PAGE_SIZE, pt->ttm.resource);
>
>         run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT",=
 test);
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index adf1dab5eba2..d8fff0403f74 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -62,6 +62,8 @@ struct xe_migrate {
>          * out of the pt_bo.
>          */
>         struct drm_suballoc_manager vm_update_sa;
> +       /** @min_chunk_size: For dgfx, Minimum chunk size */
> +       u64 min_chunk_size;
>  };
>
>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> @@ -364,6 +366,19 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *t=
ile)
>         if (err)
>                 return ERR_PTR(err);
>
> +       if (IS_DGFX(xe)) {
> +               if (xe_device_has_flat_ccs(xe))
> +                       /* min chunk size corresponds to 4K of CCS Metada=
ta */
> +                       m->min_chunk_size =3D SZ_4K * SZ_64K /
> +                               xe_device_ccs_bytes(xe, SZ_64K);
> +               else
> +                       /* Somewhat arbitrary to avoid a huge amount of b=
lits */
> +                       m->min_chunk_size =3D SZ_64K;
> +               m->min_chunk_size =3D roundup_pow_of_two(m->min_chunk_siz=
e);
> +               drm_dbg(&xe->drm, "Migrate min chunk size is 0x%08llx\n",
> +                       (unsigned long long)m->min_chunk_size);
> +       }
> +
>         return m;
>  }
>
> @@ -375,16 +390,35 @@ static u64 max_mem_transfer_per_pass(struct xe_devi=
ce *xe)
>         return MAX_PREEMPTDISABLE_TRANSFER;
>  }
>
> -static u64 xe_migrate_res_sizes(struct xe_device *xe, struct xe_res_curs=
or *cur)
> +static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_curs=
or *cur)
>  {
> -       /*
> -        * For VRAM we use identity mapped pages so we are limited to cur=
rent
> -        * cursor size. For system we program the pages ourselves so we h=
ave no
> -        * such limitation.
> -        */
> -       return min_t(u64, max_mem_transfer_per_pass(xe),
> -                    mem_type_is_vram(cur->mem_type) ? cur->size :
> -                    cur->remaining);
> +       struct xe_device *xe =3D tile_to_xe(m->tile);
> +       u64 size =3D min_t(u64, max_mem_transfer_per_pass(xe), cur->remai=
ning);
> +
> +       if (mem_type_is_vram(cur->mem_type)) {
> +               /*
> +                * VRAM we want to blit in chunks with sizes aligned to
> +                * min_chunk_size in order for the offset to CCS metadata=
 to be
> +                * page-aligned. If it's the last chunk it may be smaller=
.
> +                *
> +                * Another constraint is that we need to limit the blit t=
o
> +                * the VRAM block size, unless size is smaller than
> +                * min_chunk_size.
> +                */
> +               u64 chunk =3D max_t(u64, cur->size, m->min_chunk_size);
> +
> +               size =3D min_t(u64, size, chunk);
> +               if (size > m->min_chunk_size)
> +                       size =3D round_down(size, m->min_chunk_size);
> +       }
> +
> +       return size;

Patch makes sense. Just one question here.

Say you have 1G object, but it is ultra fragmented into 64K only
pages. IIUC cur->remaining would be 1G, and cur->size would be 64K.
But with that chunk=3D1M and the returned size=3D1M? Shouldn't the
returned size be 64K in this case?

> +}
> +
> +static bool xe_migrate_allow_identity(u64 size, const struct xe_res_curs=
or *cur)
> +{
> +       /* If the chunk is not fragmented, allow identity map. */
> +       return cur->size >=3D size;
>  }
>
>  static u32 pte_update_size(struct xe_migrate *m,
> @@ -397,7 +431,12 @@ static u32 pte_update_size(struct xe_migrate *m,
>         u32 cmds =3D 0;
>
>         *L0_pt =3D pt_ofs;
> -       if (!is_vram) {
> +       if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> +               /* Offset into identity map. */
> +               *L0_ofs =3D xe_migrate_vram_ofs(tile_to_xe(m->tile),
> +                                             cur->start + vram_region_gp=
u_offset(res));
> +               cmds +=3D cmd_size;
> +       } else {
>                 /* Clip L0 to available size */
>                 u64 size =3D min(*L0, (u64)avail_pts * SZ_2M);
>                 u64 num_4k_pages =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -413,11 +452,6 @@ static u32 pte_update_size(struct xe_migrate *m,
>
>                 /* Each chunk has a single blit command */
>                 cmds +=3D cmd_size;
> -       } else {
> -               /* Offset into identity map. */
> -               *L0_ofs =3D xe_migrate_vram_ofs(tile_to_xe(m->tile),
> -                                             cur->start + vram_region_gp=
u_offset(res));
> -               cmds +=3D cmd_size;
>         }
>
>         return cmds;
> @@ -427,10 +461,10 @@ static void emit_pte(struct xe_migrate *m,
>                      struct xe_bb *bb, u32 at_pt,
>                      bool is_vram, bool is_comp_pte,
>                      struct xe_res_cursor *cur,
> -                    u32 size, struct xe_bo *bo)
> +                    u32 size, struct ttm_resource *res)
>  {
>         struct xe_device *xe =3D tile_to_xe(m->tile);
> -
> +       struct xe_vm *vm =3D m->q->vm;
>         u16 pat_index;
>         u32 ptes;
>         u64 ofs =3D at_pt * XE_PAGE_SIZE;
> @@ -443,13 +477,6 @@ static void emit_pte(struct xe_migrate *m,
>         else
>                 pat_index =3D xe->pat.idx[XE_CACHE_WB];
>
> -       /*
> -        * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
> -        * we're only emitting VRAM PTEs during sanity tests, so when
> -        * that's moved to a Kunit test, we should condition VRAM PTEs
> -        * on running tests.
> -        */
> -
>         ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
>
>         while (ptes) {
> @@ -469,20 +496,22 @@ static void emit_pte(struct xe_migrate *m,
>
>                         addr =3D xe_res_dma(cur) & PAGE_MASK;
>                         if (is_vram) {
> -                               /* Is this a 64K PTE entry? */
> -                               if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
> -                                   !(cur_ofs & (16 * 8 - 1))) {
> -                                       xe_tile_assert(m->tile, IS_ALIGNE=
D(addr, SZ_64K));
> +                               if (vm->flags & XE_VM_FLAG_64K) {
> +                                       u64 va =3D cur_ofs * XE_PAGE_SIZE=
 / 8;
> +
> +                                       xe_assert(xe, (va & (SZ_64K - 1))=
 =3D=3D
> +                                                 (addr & (SZ_64K - 1)));
> +
>                                         flags |=3D XE_PTE_PS64;
>                                 }
>
> -                               addr +=3D vram_region_gpu_offset(bo->ttm.=
resource);
> +                               addr +=3D vram_region_gpu_offset(res);
>                                 devmem =3D true;
>                         }
>
> -                       addr =3D m->q->vm->pt_ops->pte_encode_addr(m->til=
e->xe,
> -                                                                addr, pa=
t_index,
> -                                                                0, devme=
m, flags);
> +                       addr =3D vm->pt_ops->pte_encode_addr(m->tile->xe,
> +                                                          addr, pat_inde=
x,
> +                                                          0, devmem, fla=
gs);
>                         bb->cs[bb->len++] =3D lower_32_bits(addr);
>                         bb->cs[bb->len++] =3D upper_32_bits(addr);
>
> @@ -694,8 +723,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *=
m,
>                 bool usm =3D xe->info.has_usm;
>                 u32 avail_pts =3D max_mem_transfer_per_pass(xe) / LEVEL0_=
PAGE_TABLE_ENCODE_SIZE;
>
> -               src_L0 =3D xe_migrate_res_sizes(xe, &src_it);
> -               dst_L0 =3D xe_migrate_res_sizes(xe, &dst_it);
> +               src_L0 =3D xe_migrate_res_sizes(m, &src_it);
> +               dst_L0 =3D xe_migrate_res_sizes(m, &dst_it);
>
>                 drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
>                         pass++, src_L0, dst_L0);
> @@ -716,6 +745,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *=
m,
>                                                       &ccs_ofs, &ccs_pt, =
0,
>                                                       2 * avail_pts,
>                                                       avail_pts);
> +                       xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE)=
);
>                 }
>
>                 /* Add copy commands size here */
> @@ -728,20 +758,20 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate=
 *m,
>                         goto err_sync;
>                 }
>
> -               if (!src_is_vram)
> -                       emit_pte(m, bb, src_L0_pt, src_is_vram, true, &sr=
c_it, src_L0,
> -                                src_bo);
> -               else
> +               if (src_is_vram && xe_migrate_allow_identity(src_L0, &src=
_it))
>                         xe_res_next(&src_it, src_L0);
> -
> -               if (!dst_is_vram)
> -                       emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &ds=
t_it, src_L0,
> -                                dst_bo);
>                 else
> +                       emit_pte(m, bb, src_L0_pt, src_is_vram, true, &sr=
c_it, src_L0,
> +                                src);
> +
> +               if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst=
_it))
>                         xe_res_next(&dst_it, src_L0);
> +               else
> +                       emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &ds=
t_it, src_L0,
> +                                dst);
>
>                 if (copy_system_ccs)
> -                       emit_pte(m, bb, ccs_pt, false, false, &ccs_it, cc=
s_size, src_bo);
> +                       emit_pte(m, bb, ccs_pt, false, false, &ccs_it, cc=
s_size, src);
>
>                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>                 update_idx =3D bb->len;
> @@ -950,7 +980,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
>                 bool usm =3D xe->info.has_usm;
>                 u32 avail_pts =3D max_mem_transfer_per_pass(xe) / LEVEL0_=
PAGE_TABLE_ENCODE_SIZE;
>
> -               clear_L0 =3D xe_migrate_res_sizes(xe, &src_it);
> +               clear_L0 =3D xe_migrate_res_sizes(m, &src_it);
>
>                 drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_=
L0);
>
> @@ -977,12 +1007,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migra=
te *m,
>
>                 size -=3D clear_L0;
>                 /* Preemption is enabled again by the ring ops. */
> -               if (!clear_vram) {
> -                       emit_pte(m, bb, clear_L0_pt, clear_vram, true, &s=
rc_it, clear_L0,
> -                                bo);
> -               } else {
> +               if (clear_vram && xe_migrate_allow_identity(clear_L0, &sr=
c_it))
>                         xe_res_next(&src_it, clear_L0);
> -               }
> +               else
> +                       emit_pte(m, bb, clear_L0_pt, clear_vram, true, &s=
rc_it, clear_L0,
> +                                dst);
> +
>                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>                 update_idx =3D bb->len;
>
> --
> 2.42.0
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8152AC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 10:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74A10E6EE;
	Tue,  9 Jan 2024 10:33:46 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD3510E469
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 10:33:44 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e67e37661so3358289e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Jan 2024 02:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704796423; x=1705401223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RR9+dm5QEV0+oaYixShDzmcfrEcOJBjfQWpsKmyyPk=;
 b=cpfFPqMa9V1n6YQaS6YVk9oQ6i3Y8zu9xCmU1fuJWkBHj+ldZjMNFNLLXDkVfL42OT
 1ScF9mM/BK+OJzoCXs92Oz4CGiUaZBNUvqGrCxaf/8HW5OhdbtxO7j7WvkQUEk7h1tKL
 t47vuQ5YOUl6FRaBjaTm9QRXc95VA2wp0tDKSwN60/6bYKKBd4JXhygVGZ0kqkd1J+lY
 0yX677M/gioQfFJ1Os+Jil640iRK8fVxySijiomXJpxDyFB4xKFBzCw781iXWtK4S1kz
 v98OAs/SyIhUZSkjavASK+a6n1QjWsN3GrlLH4PhKEkyrge08cnejBKN8LiJLg6vTmIU
 dihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704796423; x=1705401223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6RR9+dm5QEV0+oaYixShDzmcfrEcOJBjfQWpsKmyyPk=;
 b=pfbNhuYMmJH9I89q/my1lbNUsMP4OYo4mWlIqw8KrWRCWU6oDdjuC5c8INe2BPVhlo
 fcy4SWDIIxWxnZrciGHooRHAq5mdeJUBYAtN9m0g/R/JWH6TYEpilnsk/5dYQfVqEuFU
 Dn9rIlctxXtOXoAdipLVlt4krMoT/zL2DM91zxxIT2vnEtrI4U5BOKZwdGYpcsqN4YcZ
 dNCXMU3tyGiFq8Kizxx+/v9PRgGLbKnriO/WaQk5VFg+wyV9/rKmRhndXiwCmBQXjRbc
 LLjZX0q0IG94MjCpH6fde7U5x3QhY5M8WKEq7to8DNhkhmGPmYUo6u58V+rWWw1BhsDG
 86Bg==
X-Gm-Message-State: AOJu0YyYrZIEbLYcKT+JX6X29i9xDPqk9d9o4a6ZzzyXkJWIzKu+SWcb
 5qfQjCS9uBiKLa9x5Z7iv+ltj0WIHd+ZqJtLz4XqjrY+z9E=
X-Google-Smtp-Source: AGHT+IF8Y4a0naG0iEeD5an560SdP4ZNPN2IId8ZiWqn4WalL3fD1SU2eaUex68Y7cdlfFsIixMJDLkfSyEb2mzOq8c=
X-Received: by 2002:a05:6512:1306:b0:50e:7c08:1a55 with SMTP id
 x6-20020a056512130600b0050e7c081a55mr2998733lfu.18.1704796422597; Tue, 09 Jan
 2024 02:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20231218142933.8571-1-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMq+NKYU+9aWfjAjxZGOr5HNGuVitu_F4xWu_a0Hzxspg@mail.gmail.com>
 <CAM0jSHNLW_T0hWRFsCBRmU1WecFaveueEXPtQPahJTk21gKe5w@mail.gmail.com>
In-Reply-To: <CAM0jSHNLW_T0hWRFsCBRmU1WecFaveueEXPtQPahJTk21gKe5w@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 9 Jan 2024 10:33:14 +0000
Message-ID: <CAM0jSHNQ9V-YkfuwW4JcORurjE0Pryw40OpswpTPSrpwAOqrcw@mail.gmail.com>
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

On Tue, 19 Dec 2023 at 05:44, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Mon, 18 Dec 2023 at 19:37, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Mon, 18 Dec 2023 at 14:29, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >
> > > Since the migrate code is using the identity map for addressing VRAM,
> > > copy chunks may become as small as 64K if the VRAM resource is fragme=
nted.
> > >
> > > However, a chunk size smaller that 1MiB may lead to the *next* chunk'=
s
> > > offset into the CCS metadata backup memory may not be page-aligned, a=
nd
> > > the XY_CTRL_SURF_COPY_BLT command can't handle that, and even if it c=
ould,
> > > the current code doesn't handle the offset calculaton correctly.
> > >
> > > To fix this, make sure we align the size of VRAM copy chunks to 1MiB.=
 If
> > > the remaining data to copy is smaller than that, that's not a problem=
,
> > > so use the remaining size. If the VRAM copy cunk becomes fragmented d=
ue
> > > to the size alignment restriction, don't use the identity map, but in=
stead
> > > emit PTEs into the page-table like we do for system memory.
> > >
> > > v2:
> > > - Rebase
> > > v3:
> > > - Future proof somewhat by taking into account the real data size to
> > >   flat CCS metadata size ratio. (Matt Roper)
> > > - Invert a couple of if-statements for better readability.
> > > - Fix support for 4K-granularity VRAM sizes. (Tested on DG1).
> > > v4:
> > > - Fix up code comments
> > > - Fix debug printout format typo.
> > >
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Matthew Auld <matthew.william.auld@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m>
> > > ---
> > >  drivers/gpu/drm/xe/tests/xe_migrate.c |   2 +-
> > >  drivers/gpu/drm/xe/xe_migrate.c       | 128 ++++++++++++++++--------=
--
> > >  2 files changed, 80 insertions(+), 50 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/=
xe/tests/xe_migrate.c
> > > index 7a32faa2f688..a6523df0f1d3 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > > @@ -331,7 +331,7 @@ static void xe_migrate_sanity_test(struct xe_migr=
ate *m, struct kunit *test)
> > >                 xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
> > >
> > >         emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
> > > -                &src_it, XE_PAGE_SIZE, pt);
> > > +                &src_it, XE_PAGE_SIZE, pt->ttm.resource);
> > >
> > >         run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake =
PT", test);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_=
migrate.c
> > > index adf1dab5eba2..d8fff0403f74 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -62,6 +62,8 @@ struct xe_migrate {
> > >          * out of the pt_bo.
> > >          */
> > >         struct drm_suballoc_manager vm_update_sa;
> > > +       /** @min_chunk_size: For dgfx, Minimum chunk size */
> > > +       u64 min_chunk_size;
> > >  };
> > >
> > >  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
> > > @@ -364,6 +366,19 @@ struct xe_migrate *xe_migrate_init(struct xe_til=
e *tile)
> > >         if (err)
> > >                 return ERR_PTR(err);
> > >
> > > +       if (IS_DGFX(xe)) {
> > > +               if (xe_device_has_flat_ccs(xe))
> > > +                       /* min chunk size corresponds to 4K of CCS Me=
tadata */
> > > +                       m->min_chunk_size =3D SZ_4K * SZ_64K /
> > > +                               xe_device_ccs_bytes(xe, SZ_64K);
> > > +               else
> > > +                       /* Somewhat arbitrary to avoid a huge amount =
of blits */
> > > +                       m->min_chunk_size =3D SZ_64K;
> > > +               m->min_chunk_size =3D roundup_pow_of_two(m->min_chunk=
_size);
> > > +               drm_dbg(&xe->drm, "Migrate min chunk size is 0x%08llx=
\n",
> > > +                       (unsigned long long)m->min_chunk_size);
> > > +       }
> > > +
> > >         return m;
> > >  }
> > >
> > > @@ -375,16 +390,35 @@ static u64 max_mem_transfer_per_pass(struct xe_=
device *xe)
> > >         return MAX_PREEMPTDISABLE_TRANSFER;
> > >  }
> > >
> > > -static u64 xe_migrate_res_sizes(struct xe_device *xe, struct xe_res_=
cursor *cur)
> > > +static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_=
cursor *cur)
> > >  {
> > > -       /*
> > > -        * For VRAM we use identity mapped pages so we are limited to=
 current
> > > -        * cursor size. For system we program the pages ourselves so =
we have no
> > > -        * such limitation.
> > > -        */
> > > -       return min_t(u64, max_mem_transfer_per_pass(xe),
> > > -                    mem_type_is_vram(cur->mem_type) ? cur->size :
> > > -                    cur->remaining);
> > > +       struct xe_device *xe =3D tile_to_xe(m->tile);
> > > +       u64 size =3D min_t(u64, max_mem_transfer_per_pass(xe), cur->r=
emaining);
> > > +
> > > +       if (mem_type_is_vram(cur->mem_type)) {
> > > +               /*
> > > +                * VRAM we want to blit in chunks with sizes aligned =
to
> > > +                * min_chunk_size in order for the offset to CCS meta=
data to be
> > > +                * page-aligned. If it's the last chunk it may be sma=
ller.
> > > +                *
> > > +                * Another constraint is that we need to limit the bl=
it to
> > > +                * the VRAM block size, unless size is smaller than
> > > +                * min_chunk_size.
> > > +                */
> > > +               u64 chunk =3D max_t(u64, cur->size, m->min_chunk_size=
);
> > > +
> > > +               size =3D min_t(u64, size, chunk);
> > > +               if (size > m->min_chunk_size)
> > > +                       size =3D round_down(size, m->min_chunk_size);
> > > +       }
> > > +
> > > +       return size;
> >
> > Patch makes sense. Just one question here.
> >
> > Say you have 1G object, but it is ultra fragmented into 64K only
> > pages. IIUC cur->remaining would be 1G, and cur->size would be 64K.
> > But with that chunk=3D1M and the returned size=3D1M? Shouldn't the
> > returned size be 64K in this case?
>
> Nevermind. In that case cur->size would be smaller than size here, and
> so allow_identity would not be allowed.
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thomas, should we go ahead and merge this? I don't see it in xe-next.

>
> >
> > > +}
> > > +
> > > +static bool xe_migrate_allow_identity(u64 size, const struct xe_res_=
cursor *cur)
> > > +{
> > > +       /* If the chunk is not fragmented, allow identity map. */
> > > +       return cur->size >=3D size;
> > >  }
> > >
> > >  static u32 pte_update_size(struct xe_migrate *m,
> > > @@ -397,7 +431,12 @@ static u32 pte_update_size(struct xe_migrate *m,
> > >         u32 cmds =3D 0;
> > >
> > >         *L0_pt =3D pt_ofs;
> > > -       if (!is_vram) {
> > > +       if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> > > +               /* Offset into identity map. */
> > > +               *L0_ofs =3D xe_migrate_vram_ofs(tile_to_xe(m->tile),
> > > +                                             cur->start + vram_regio=
n_gpu_offset(res));
> > > +               cmds +=3D cmd_size;
> > > +       } else {
> > >                 /* Clip L0 to available size */
> > >                 u64 size =3D min(*L0, (u64)avail_pts * SZ_2M);
> > >                 u64 num_4k_pages =3D DIV_ROUND_UP(size, XE_PAGE_SIZE)=
;
> > > @@ -413,11 +452,6 @@ static u32 pte_update_size(struct xe_migrate *m,
> > >
> > >                 /* Each chunk has a single blit command */
> > >                 cmds +=3D cmd_size;
> > > -       } else {
> > > -               /* Offset into identity map. */
> > > -               *L0_ofs =3D xe_migrate_vram_ofs(tile_to_xe(m->tile),
> > > -                                             cur->start + vram_regio=
n_gpu_offset(res));
> > > -               cmds +=3D cmd_size;
> > >         }
> > >
> > >         return cmds;
> > > @@ -427,10 +461,10 @@ static void emit_pte(struct xe_migrate *m,
> > >                      struct xe_bb *bb, u32 at_pt,
> > >                      bool is_vram, bool is_comp_pte,
> > >                      struct xe_res_cursor *cur,
> > > -                    u32 size, struct xe_bo *bo)
> > > +                    u32 size, struct ttm_resource *res)
> > >  {
> > >         struct xe_device *xe =3D tile_to_xe(m->tile);
> > > -
> > > +       struct xe_vm *vm =3D m->q->vm;
> > >         u16 pat_index;
> > >         u32 ptes;
> > >         u64 ofs =3D at_pt * XE_PAGE_SIZE;
> > > @@ -443,13 +477,6 @@ static void emit_pte(struct xe_migrate *m,
> > >         else
> > >                 pat_index =3D xe->pat.idx[XE_CACHE_WB];
> > >
> > > -       /*
> > > -        * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currentl=
y
> > > -        * we're only emitting VRAM PTEs during sanity tests, so when
> > > -        * that's moved to a Kunit test, we should condition VRAM PTE=
s
> > > -        * on running tests.
> > > -        */
> > > -
> > >         ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > >
> > >         while (ptes) {
> > > @@ -469,20 +496,22 @@ static void emit_pte(struct xe_migrate *m,
> > >
> > >                         addr =3D xe_res_dma(cur) & PAGE_MASK;
> > >                         if (is_vram) {
> > > -                               /* Is this a 64K PTE entry? */
> > > -                               if ((m->q->vm->flags & XE_VM_FLAG_64K=
) &&
> > > -                                   !(cur_ofs & (16 * 8 - 1))) {
> > > -                                       xe_tile_assert(m->tile, IS_AL=
IGNED(addr, SZ_64K));
> > > +                               if (vm->flags & XE_VM_FLAG_64K) {
> > > +                                       u64 va =3D cur_ofs * XE_PAGE_=
SIZE / 8;
> > > +
> > > +                                       xe_assert(xe, (va & (SZ_64K -=
 1)) =3D=3D
> > > +                                                 (addr & (SZ_64K - 1=
)));
> > > +
> > >                                         flags |=3D XE_PTE_PS64;
> > >                                 }
> > >
> > > -                               addr +=3D vram_region_gpu_offset(bo->=
ttm.resource);
> > > +                               addr +=3D vram_region_gpu_offset(res)=
;
> > >                                 devmem =3D true;
> > >                         }
> > >
> > > -                       addr =3D m->q->vm->pt_ops->pte_encode_addr(m-=
>tile->xe,
> > > -                                                                addr=
, pat_index,
> > > -                                                                0, d=
evmem, flags);
> > > +                       addr =3D vm->pt_ops->pte_encode_addr(m->tile-=
>xe,
> > > +                                                          addr, pat_=
index,
> > > +                                                          0, devmem,=
 flags);
> > >                         bb->cs[bb->len++] =3D lower_32_bits(addr);
> > >                         bb->cs[bb->len++] =3D upper_32_bits(addr);
> > >
> > > @@ -694,8 +723,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migra=
te *m,
> > >                 bool usm =3D xe->info.has_usm;
> > >                 u32 avail_pts =3D max_mem_transfer_per_pass(xe) / LEV=
EL0_PAGE_TABLE_ENCODE_SIZE;
> > >
> > > -               src_L0 =3D xe_migrate_res_sizes(xe, &src_it);
> > > -               dst_L0 =3D xe_migrate_res_sizes(xe, &dst_it);
> > > +               src_L0 =3D xe_migrate_res_sizes(m, &src_it);
> > > +               dst_L0 =3D xe_migrate_res_sizes(m, &dst_it);
> > >
> > >                 drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
> > >                         pass++, src_L0, dst_L0);
> > > @@ -716,6 +745,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migra=
te *m,
> > >                                                       &ccs_ofs, &ccs_=
pt, 0,
> > >                                                       2 * avail_pts,
> > >                                                       avail_pts);
> > > +                       xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_S=
IZE));
> > >                 }
> > >
> > >                 /* Add copy commands size here */
> > > @@ -728,20 +758,20 @@ struct dma_fence *xe_migrate_copy(struct xe_mig=
rate *m,
> > >                         goto err_sync;
> > >                 }
> > >
> > > -               if (!src_is_vram)
> > > -                       emit_pte(m, bb, src_L0_pt, src_is_vram, true,=
 &src_it, src_L0,
> > > -                                src_bo);
> > > -               else
> > > +               if (src_is_vram && xe_migrate_allow_identity(src_L0, =
&src_it))
> > >                         xe_res_next(&src_it, src_L0);
> > > -
> > > -               if (!dst_is_vram)
> > > -                       emit_pte(m, bb, dst_L0_pt, dst_is_vram, true,=
 &dst_it, src_L0,
> > > -                                dst_bo);
> > >                 else
> > > +                       emit_pte(m, bb, src_L0_pt, src_is_vram, true,=
 &src_it, src_L0,
> > > +                                src);
> > > +
> > > +               if (dst_is_vram && xe_migrate_allow_identity(src_L0, =
&dst_it))
> > >                         xe_res_next(&dst_it, src_L0);
> > > +               else
> > > +                       emit_pte(m, bb, dst_L0_pt, dst_is_vram, true,=
 &dst_it, src_L0,
> > > +                                dst);
> > >
> > >                 if (copy_system_ccs)
> > > -                       emit_pte(m, bb, ccs_pt, false, false, &ccs_it=
, ccs_size, src_bo);
> > > +                       emit_pte(m, bb, ccs_pt, false, false, &ccs_it=
, ccs_size, src);
> > >
> > >                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> > >                 update_idx =3D bb->len;
> > > @@ -950,7 +980,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migr=
ate *m,
> > >                 bool usm =3D xe->info.has_usm;
> > >                 u32 avail_pts =3D max_mem_transfer_per_pass(xe) / LEV=
EL0_PAGE_TABLE_ENCODE_SIZE;
> > >
> > > -               clear_L0 =3D xe_migrate_res_sizes(xe, &src_it);
> > > +               clear_L0 =3D xe_migrate_res_sizes(m, &src_it);
> > >
> > >                 drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, cl=
ear_L0);
> > >
> > > @@ -977,12 +1007,12 @@ struct dma_fence *xe_migrate_clear(struct xe_m=
igrate *m,
> > >
> > >                 size -=3D clear_L0;
> > >                 /* Preemption is enabled again by the ring ops. */
> > > -               if (!clear_vram) {
> > > -                       emit_pte(m, bb, clear_L0_pt, clear_vram, true=
, &src_it, clear_L0,
> > > -                                bo);
> > > -               } else {
> > > +               if (clear_vram && xe_migrate_allow_identity(clear_L0,=
 &src_it))
> > >                         xe_res_next(&src_it, clear_L0);
> > > -               }
> > > +               else
> > > +                       emit_pte(m, bb, clear_L0_pt, clear_vram, true=
, &src_it, clear_L0,
> > > +                                dst);
> > > +
> > >                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> > >                 update_idx =3D bb->len;
> > >
> > > --
> > > 2.42.0
> > >

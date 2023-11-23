Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819A8C61D97
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 16:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD0E10E160;
	Thu, 23 Nov 2023 16:50:40 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FE510E160
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 16:50:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c4fdf94666so13467311fa.2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700758236; x=1701363036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVJ8pWvbS1J4kVCcA9wLvIbXAlF5pjgs5a0ab2+V7eQ=;
 b=OciTAfsiElCRslUhTDcBcRNNtHfP2Nk0q6r62YrKfwgCS+dvHfxBSK4FizxCBRPm0L
 WwzGVnURgbhMfttdlt1wq1NgFmbEu+CTVkCxl84Vx0eoQDOBCi+nhoqZ5qsTb9C47gST
 2JOyj286skugFKPzKIBXtpJCi225QgMvJTB1qWr6GTOi8VwdCB73S0G1bdiekUPyKMOm
 06dk+nEmxoKrAXgEWcNrRVzVrUXiWxBMIOO5Ko46034MiyY6vW8HA6pgRolqIA732QjH
 K7PsCReTWJsVy0eRmyfC6NOwwkb665Ukx/BOq3Diw+0ehNK+ioEWwZE7X+i5BIesOzzs
 +xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700758236; x=1701363036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVJ8pWvbS1J4kVCcA9wLvIbXAlF5pjgs5a0ab2+V7eQ=;
 b=sE1Y/Lbd05p8uOms9K9X6m77n+qhEoy+oFLY/IcfJjpteyuoZoR0YibINUNg3j6LQr
 FbkrV0oiiWJRbfVkS6NdSz4oPltJL7O1navursHu1kVI43CpbbNNl7Verdtp7LYs8+u8
 9cN+F71VI9GvaT1hUsrNVwUUQtO8XnOgOxdoK074Mz4QOCsG0h0jjiGb2Oq1VxNh0KZt
 6zPdwbqwwjzTBJqGjIPM5tqyMdM+SfV0HOdRCS/5SRWFc0O+6yCypDJu4vpYvLSGVYBz
 IuecrKdqOlXiKVn/ieQ1PlvKOu3SFUsQ3o/R4Po2ZMvTDTOYDSLRLZ2CfdBYveI5k/gF
 1bFg==
X-Gm-Message-State: AOJu0Yys8ISytnxcjJy/x3f3eIBYQAWJLBd2GQTHVHue0Ja5Z7+uwqgU
 qTELOZpMe/YLR9yoQNNqnJVonjE9ZFpgBFdlNAwtEOfoyRrALQ==
X-Google-Smtp-Source: AGHT+IHmNF6TlIqE3MB/lTiy3t1xOyxdHA2U+V761gNN9nJd1Z/oiXu8/bSiRjsZyd3RTM6FUPTC6Q+EXqNyTbQkx/8=
X-Received: by 2002:a05:651c:20c:b0:2c6:f6eb:b396 with SMTP id
 y12-20020a05651c020c00b002c6f6ebb396mr3960365ljn.40.1700758236280; Thu, 23
 Nov 2023 08:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20231121100117.3584066-1-himal.prasad.ghimiray@intel.com>
 <20231121100117.3584066-7-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231121100117.3584066-7-himal.prasad.ghimiray@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 23 Nov 2023 16:50:08 +0000
Message-ID: <CAM0jSHPBkOLDYzZ+kO3Wzen=en-0FPwTqqMUzbuCSTT2ciapww@mail.gmail.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC 6/6] drm/xe/xe2: Handle flat ccs move for igfx.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023 at 09:54, Himal Prasad Ghimiray
<himal.prasad.ghimiray@intel.com> wrote:
>
> - Clear flat ccs during user bo creation.
> - copy ccs meta data between flat ccs and bo during eviction and
> restore.

I guess it is possible to detect compression usage during vm_bind?
Just wondering if it is somehow possible to push this work prior to
binding such that we can skip if compression is never even used?

> - Add a bool field ccs_cleared in bo, true means ccs region of bo is
> already cleared.
>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 25 ++++++++-----
>  drivers/gpu/drm/xe/xe_bo_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_migrate.c  | 62 ++++++++++++++++----------------
>  3 files changed, 50 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4730ee3c1012..a40f17ae21e7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -630,10 +630,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm=
_bo, bool evict,
>         bool move_lacks_source;
>         bool tt_has_data;
>         bool needs_clear;
> +       bool handle_system_ccs =3D (!IS_DGFX(xe) && xe_bo_needs_ccs_pages=
(bo) &&
> +                                 ttm && ttm_tt_is_populated(ttm)) ? true=
 : false;
>         int ret =3D 0;
> -
> -       /* Bo creation path, moving to system or TT. No clearing required=
. */
> -       if (!old_mem && ttm) {
> +       /* Bo creation path, moving to system or TT. */
> +       if (((old_mem_type =3D=3D XE_PL_SYSTEM && new_mem->mem_type =3D=
=3D XE_PL_TT) ||
> +            (!old_mem && ttm)) && !handle_system_ccs) {
>                 ttm_bo_move_null(ttm_bo, new_mem);
>                 return 0;
>         }
> @@ -648,14 +650,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm=
_bo, bool evict,
>         tt_has_data =3D ttm && (ttm_tt_is_populated(ttm) ||
>                               (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>
> -       move_lacks_source =3D !mem_type_is_vram(old_mem_type) && !tt_has_=
data;
> +       move_lacks_source =3D handle_system_ccs ? (!bo->ccs_cleared)  :
> +                                               (!mem_type_is_vram(old_me=
m_type) && !tt_has_data);
>
>         needs_clear =3D (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)=
 ||
>                 (!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);
>
> -       if ((move_lacks_source && !needs_clear) ||
> -           (old_mem_type =3D=3D XE_PL_SYSTEM &&
> -            new_mem->mem_type =3D=3D XE_PL_TT)) {
> +       if ((move_lacks_source && !needs_clear)) {
>                 ttm_bo_move_null(ttm_bo, new_mem);
>                 goto out;
>         }
> @@ -686,8 +687,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_=
bo, bool evict,
>                         ret =3D timeout;
>                         goto out;
>                 }
> -               ttm_bo_move_null(ttm_bo, new_mem);
> -               goto out;
> +
> +               if (!handle_system_ccs) {
> +                       ttm_bo_move_null(ttm_bo, new_mem);
> +                       goto out;
> +               }
>         }
>
>         if (!move_lacks_source &&
> @@ -708,6 +712,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_b=
o, bool evict,
>                 migrate =3D mem_type_to_migrate(xe, new_mem->mem_type);
>         else if (mem_type_is_vram(old_mem_type))
>                 migrate =3D mem_type_to_migrate(xe, old_mem_type);
> +       else
> +               migrate =3D xe->tiles[0].migrate;
>
>         xe_assert(xe, migrate);
>
> @@ -1229,6 +1235,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_devic=
e *xe, struct xe_bo *bo,
>                 alignment =3D SZ_4K >> PAGE_SHIFT;
>         }
>
> +       bo->ccs_cleared =3D false;
>         bo->tile =3D tile;
>         bo->size =3D size;
>         bo->flags =3D flags;
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_=
types.h
> index 4bff60996168..508e67c81427 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -79,6 +79,8 @@ struct xe_bo {
>         struct llist_node freed;
>         /** @created: Whether the bo has passed initial creation */
>         bool created;
> +       /** @ccs_cleared */
> +       bool ccs_cleared;
>  };
>
>  #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index bdcb20f23531..bac24768fe2a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -564,14 +564,14 @@ static u64 xe_migrate_batch_base(struct xe_migrate =
*m, bool usm)
>
>  static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>                                struct xe_bb *bb,
> -                              u64 src_ofs, bool src_is_vram,
> -                              u64 dst_ofs, bool dst_is_vram, u32 dst_siz=
e,
> +                              u64 src_ofs, bool src_is_indirect,
> +                              u64 dst_ofs, bool dst_is_indirect, u32 dst=
_size,
>                                u64 ccs_ofs, bool copy_ccs)
>  {
>         struct xe_gt *gt =3D m->tile->primary_gt;
>         u32 flush_flags =3D 0;
>
> -       if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_v=
ram) {
> +       if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_i=
ndirect) {
>                 /*
>                  * If the src is already in vram, then it should already
>                  * have been cleared by us, or has been populated by the
> @@ -580,28 +580,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m=
,
>                  * Otherwise if the bo doesn't have any CCS metadata atta=
ched,
>                  * we still need to clear it for security reasons.
>                  */
> -               u64 ccs_src_ofs =3D  src_is_vram ? src_ofs : m->cleared_m=
em_ofs;
> +               u64 ccs_src_ofs =3D  src_is_indirect ? src_ofs : m->clear=
ed_mem_ofs;
>
>                 emit_copy_ccs(gt, bb,
>                               dst_ofs, true,
> -                             ccs_src_ofs, src_is_vram, dst_size);
> +                             ccs_src_ofs, src_is_indirect, dst_size);
>
>                 flush_flags =3D MI_FLUSH_DW_CCS;
>         } else if (copy_ccs) {
> -               if (!src_is_vram)
> +               if (!src_is_indirect)
>                         src_ofs =3D ccs_ofs;
> -               else if (!dst_is_vram)
> +               else if (!dst_is_indirect)
>                         dst_ofs =3D ccs_ofs;
>
> -               /*
> -                * At the moment, we don't support copying CCS metadata f=
rom
> -                * system to system.
> -                */
> -               xe_gt_assert(gt, src_is_vram || dst_is_vram);
> +               xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
>
> -               emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
> -                             src_is_vram, dst_size);
> -               if (dst_is_vram)
> +               emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect, src_ofs,
> +                             src_is_indirect, dst_size);
> +               if (dst_is_indirect)
>                         flush_flags =3D MI_FLUSH_DW_CCS;
>         }
>
> @@ -642,6 +638,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *=
m,
>         u64 src_L0, dst_L0;
>         int pass =3D 0;
>         int err;
> +       bool src_is_pltt =3D src->mem_type =3D=3D XE_PL_TT;
> +       bool dst_is_pltt =3D dst->mem_type =3D=3D XE_PL_TT;
>         bool src_is_vram =3D mem_type_is_vram(src->mem_type);
>         bool dst_is_vram =3D mem_type_is_vram(dst->mem_type);
>         bool copy_ccs =3D xe_device_has_flat_ccs(xe) &&
> @@ -682,9 +680,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *=
m,
>                 src_L0 =3D xe_migrate_res_sizes(&src_it);
>                 dst_L0 =3D xe_migrate_res_sizes(&dst_it);
>
> -               drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
> -                       pass++, src_L0, dst_L0);
> -
> +               drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n", pass++=
, src_L0, dst_L0);
>                 src_L0 =3D min(src_L0, dst_L0);
>
>                 batch_size +=3D pte_update_size(m, src_is_vram, src, &src=
_it, &src_L0,
> @@ -704,8 +700,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *=
m,
>                 }
>
>                 /* Add copy commands size here */
> -               batch_size +=3D EMIT_COPY_DW +
> -                       (xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : =
0);
> +               batch_size +=3D ((!src_is_vram && !dst_is_vram) ? 0 : EMI=
T_COPY_DW) +
> +                       ((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW :=
 0));
>
>                 bb =3D xe_bb_new(gt, batch_size, usm);
>                 if (IS_ERR(bb)) {
> @@ -731,10 +727,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate=
 *m,
>                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>                 update_idx =3D bb->len;
>
> -               emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
> -                         XE_PAGE_SIZE);
> -               flush_flags =3D xe_migrate_ccs_copy(m, bb, src_L0_ofs, sr=
c_is_vram,
> -                                                 dst_L0_ofs, dst_is_vram=
,
> +               if (src_is_vram || dst_is_vram)
> +                       emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,=
 XE_PAGE_SIZE);
> +
> +               flush_flags =3D xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +                                                 IS_DGFX(xe) ? src_is_vr=
am : src_is_pltt,
> +                                                 dst_L0_ofs,
> +                                                 IS_DGFX(xe) ? dst_is_vr=
am : dst_is_pltt,
>                                                   src_L0, ccs_ofs, copy_c=
cs);
>
>                 mutex_lock(&m->job_mutex);
> @@ -907,6 +906,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
>         bool clear_vram =3D mem_type_is_vram(dst->mem_type);
>         struct xe_gt *gt =3D m->tile->primary_gt;
>         struct xe_device *xe =3D gt_to_xe(gt);
> +       bool clear_system_ccs =3D (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(=
xe)) ? true : false;
>         struct dma_fence *fence =3D NULL;
>         u64 size =3D bo->size;
>         struct xe_res_cursor src_it;
> @@ -936,9 +936,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
>                 batch_size =3D 2 +
>                         pte_update_size(m, clear_vram, src, &src_it,
>                                         &clear_L0, &clear_L0_ofs, &clear_=
L0_pt,
> -                                       emit_clear_cmd_len(gt), 0,
> +                                       clear_system_ccs ? 0 : emit_clear=
_cmd_len(gt), 0,
>                                         NUM_PT_PER_BLIT);
> -               if (xe_device_has_flat_ccs(xe) && clear_vram)
> +               if (xe_bo_needs_ccs_pages(bo))
>                         batch_size +=3D EMIT_COPY_CCS_DW;
>
>                 /* Clear commands */
> @@ -953,7 +953,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
>                 }
>
>                 size -=3D clear_L0;
> -
>                 /* Preemption is enabled again by the ring ops. */
>                 if (!clear_vram) {
>                         emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it,=
 clear_L0,
> @@ -964,10 +963,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
>                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>                 update_idx =3D bb->len;
>
> -               emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
> -                          clear_vram);
> +               if (!clear_system_ccs)
> +                       emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAG=
E_SIZE, clear_vram);
>
> -               if (xe_device_has_flat_ccs(xe) && clear_vram) {
> +               if (xe_bo_needs_ccs_pages(bo)) {
>                         emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>                                       m->cleared_mem_ofs, false, clear_L0=
);
>                         flush_flags =3D MI_FLUSH_DW_CCS;
> @@ -1024,6 +1023,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrat=
e *m,
>                 return ERR_PTR(err);
>         }
>
> +       if (clear_system_ccs)
> +               bo->ccs_cleared =3D true;
> +
>         return fence;
>  }
>
> --
> 2.25.1
>

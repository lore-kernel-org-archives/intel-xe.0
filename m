Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CB2C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 10:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5E010E8C9;
	Thu, 25 May 2023 10:42:57 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914BD10E8C9
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 10:42:55 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af30a12e84so4621401fa.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685011372; x=1687603372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilwEpbh9vcxglTuH4jj0NvALcaMh+JTlQcWIRV7A9dc=;
 b=h8JzmKndCDH+6ZoR5F6ezLXm/VcB/upJ8V2+laZ8lXlJaL/XPu6+k7QtdGqcTICYIp
 s+ltE4uVFhV/Gom0eAXX+fqFPY5StTZ5OMwlsPlQgXP4mGkVC93n7W01c6zfdYltF1Qg
 iia02G1k70yx+PgoKoheKIXB0STUrTpW4E8miJvafpGXse+0mbCnikSvIHdSVOJ22Tmq
 JZNCjRv5oijk0/i22rMqFAqm+RDQELhMdnoswWMQzVCZlhBiDWUEXkHEzLEY2L+3TnBD
 dZzfD6gnlendrlL9gTBMlqMBufTurLcxlPqHpn18qBuYh+kedd1nuwnK7j+F0iNt5p49
 e+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685011372; x=1687603372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilwEpbh9vcxglTuH4jj0NvALcaMh+JTlQcWIRV7A9dc=;
 b=igpWX6Lx0I9n8E1ehyhTHRfNhAiC18d3TbYgNxvkZe50avx0DCJBMWtQOz97a7awjR
 eQbOl8YvzuT1zMAJtD7zDIl5B6RD88wvLZXY7fsHggW4So05YrknLRNN9u0mzluaM5EW
 x7Y+F5urbO6ygSuHeZrlMkPsasjkU4mRuDwyQSUSssr+j1zzc7J2hw3Wo/G+OdEOjtQX
 AcRz7ImH7xH5oYOtAQKqyYhj4tengVd/O1ZvIBARAAHTPEjRA4C3xwAWDa64qQZlVoh2
 jnjPubM/sruA5VxhIR9DXsHfZrdBfFvZuS7iYZzE5m69WAtDNC6dJCYt9PuKL2rkGRw+
 amGw==
X-Gm-Message-State: AC+VfDxIYtYrWPY0JAkh/JIjsLHBu31qo+w/bkYbPqmPaU6Ro0i5GfCx
 38f4qTqigG3+ywWv0+hUyJ8SySizwOX3l+uMqte8E60WDy8=
X-Google-Smtp-Source: ACHHUZ4gE+wbC4JgyfTkR05vGL24D9AlFMkZ0Wj9tuH3hN7RXlVvj6RgnjVOwhKxY6xCvRZmXo4IcY4KyOv75FQaaFE=
X-Received: by 2002:a2e:90c2:0:b0:2b0:5a04:a5af with SMTP id
 o2-20020a2e90c2000000b002b05a04a5afmr376537ljg.18.1685011372162; Thu, 25 May
 2023 03:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230525062724.176084-1-thomas.hellstrom@linux.intel.com>
 <20230525062724.176084-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230525062724.176084-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 25 May 2023 11:42:25 +0100
Message-ID: <CAM0jSHN9oS51UP6JEbOzT-FsiCdV8MGH+qod2G80xKRUBk2emg@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Support copying of data between
 system memory bos
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

On Thu, 25 May 2023 at 07:27, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Modify the xe_migrate_copy() function somewhat to explicitly allow
> copying of data between two buffer objects including system memory
> buffer objects. Update the migrate test accordingly.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 16 +++++-------
>  drivers/gpu/drm/xe/xe_bo.c            |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 37 +++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
>  4 files changed, 32 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> index f8ee9b9fca99..4a3ca2960fd5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -150,7 +150,7 @@ static void test_copy(struct xe_migrate *m, struct xe=
_bo *bo,
>         xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
>
>         expected =3D 0xc0c0c0c0c0c0c0c0;
> -       fence =3D xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
> +       fence =3D xe_migrate_copy(m, sysmem, bo, sysmem->ttm.resource,
>                                 bo->ttm.resource);
>         if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem =
-> vram" :
>                                  "Copying small bo sysmem -> vram", test)=
) {
> @@ -167,7 +167,7 @@ static void test_copy(struct xe_migrate *m, struct xe=
_bo *bo,
>         xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
>         xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
>
> -       fence =3D xe_migrate_copy(m, sysmem, bo->ttm.resource,
> +       fence =3D xe_migrate_copy(m, bo, sysmem, bo->ttm.resource,
>                                 sysmem->ttm.resource);
>         if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram ->=
 sysmem" :
>                                  "Copying small bo vram -> sysmem", test)=
) {
> @@ -347,10 +347,8 @@ static void xe_migrate_sanity_test(struct xe_migrate=
 *m, struct kunit *test)
>         retval =3D xe_map_rd(xe, &tiny->vmap, tiny->size - 4, u32);
>         check(retval, expected, "Command clear small last value", test);
>
> -       if (IS_DGFX(xe)) {
> -               kunit_info(test, "Copying small buffer object to system\n=
");
> -               test_copy(m, tiny, test);
> -       }
> +       kunit_info(test, "Copying small buffer object to system\n");
> +       test_copy(m, tiny, test);
>
>         /* Clear a big bo */
>         kunit_info(test, "Clearing big buffer object\n");
> @@ -366,10 +364,8 @@ static void xe_migrate_sanity_test(struct xe_migrate=
 *m, struct kunit *test)
>         retval =3D xe_map_rd(xe, &big->vmap, big->size - 4, u32);
>         check(retval, expected, "Command clear big last value", test);
>
> -       if (IS_DGFX(xe)) {
> -               kunit_info(test, "Copying big buffer object to system\n")=
;
> -               test_copy(m, big, test);
> -       }
> +       kunit_info(test, "Copying big buffer object to system\n");
> +       test_copy(m, big, test);
>
>         kunit_info(test, "Testing page table update using CPU if GPU idle=
.\n");
>         test_pt_update(m, pt, test, false);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c82e995df779..d6d7823aab5a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -677,7 +677,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_b=
o, bool evict,
>                 if (move_lacks_source)
>                         fence =3D xe_migrate_clear(gt->migrate, bo, new_m=
em);
>                 else
> -                       fence =3D xe_migrate_copy(gt->migrate, bo, old_me=
m, new_mem);
> +                       fence =3D xe_migrate_copy(gt->migrate, bo, bo, ol=
d_mem, new_mem);
>                 if (IS_ERR(fence)) {
>                         ret =3D PTR_ERR(fence);
>                         xe_device_mem_access_put(xe);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index f40f47ccb76f..bcbb87a28eb6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -582,30 +582,31 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m=
,
>  /**
>   * xe_migrate_copy() - Copy content of TTM resources.
>   * @m: The migration context.
> - * @bo: The buffer object @src is currently bound to.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @dst_bo: If copying between resources created for the same bo, set th=
is to
> + * the same value as @src_bo. If copying between buffer objects, set it =
to
> + * the buffer object @dst is currently bound to.
>   * @src: The source TTM resource.
>   * @dst: The dst TTM resource.
>   *
>   * Copies the contents of @src to @dst: On flat CCS devices,
>   * the CCS metadata is copied as well if needed, or if not present,
>   * the CCS metadata of @dst is cleared for security reasons.
> - * It's currently not possible to copy between two system resources,
> - * since that would require two TTM page-vectors.
> - * TODO: Eliminate the @bo argument and supply two TTM page-vectors.
>   *
>   * Return: Pointer to a dma_fence representing the last copy batch, or
>   * an error pointer on failure. If there is a failure, any copy operatio=
n
>   * started by the function call has been synced.
>   */
>  struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> -                                 struct xe_bo *bo,
> +                                 struct xe_bo *src_bo,
> +                                 struct xe_bo *dst_bo,
>                                   struct ttm_resource *src,
>                                   struct ttm_resource *dst)
>  {
>         struct xe_gt *gt =3D m->gt;
>         struct xe_device *xe =3D gt_to_xe(gt);
>         struct dma_fence *fence =3D NULL;
> -       u64 size =3D bo->size;
> +       u64 size =3D src_bo->size;
>         struct xe_res_cursor src_it, dst_it, ccs_it;
>         u64 src_L0_ofs, dst_L0_ofs;
>         u32 src_L0_pt, dst_L0_pt;
> @@ -614,20 +615,25 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate=
 *m,
>         int err;
>         bool src_is_vram =3D mem_type_is_vram(src->mem_type);
>         bool dst_is_vram =3D mem_type_is_vram(dst->mem_type);
> -       bool copy_ccs =3D xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_p=
ages(bo);
> +       bool copy_ccs =3D xe_device_has_flat_ccs(xe) &&
> +               xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(ds=
t_bo);
>         bool copy_system_ccs =3D copy_ccs && (!src_is_vram || !dst_is_vra=
m);
>
> +       /* Copying CCS between two different BOs is not supported yet. */
> +       if (XE_WARN_ON(copy_ccs && src_bo !=3D dst_bo))
> +               return ERR_PTR(-EINVAL);

Do we error somewhere on src_bo->size !=3D dst_bo->size?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>         if (!src_is_vram)
> -               xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &src_it);
> +               xe_res_first_sg(xe_bo_get_sg(src_bo), 0, size, &src_it);
>         else
>                 xe_res_first(src, 0, size, &src_it);
>         if (!dst_is_vram)
> -               xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &dst_it);
> +               xe_res_first_sg(xe_bo_get_sg(dst_bo), 0, size, &dst_it);
>         else
>                 xe_res_first(dst, 0, size, &dst_it);
>
>         if (copy_system_ccs)
> -               xe_res_first_sg(xe_bo_get_sg(bo), xe_bo_ccs_pages_start(b=
o),
> +               xe_res_first_sg(xe_bo_get_sg(src_bo), xe_bo_ccs_pages_sta=
rt(src_bo),
>                                 PAGE_ALIGN(xe_device_ccs_bytes(xe, size))=
,
>                                 &ccs_it);
>
> @@ -681,18 +687,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate=
 *m,
>
>                 if (!src_is_vram)
>                         emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, =
src_L0,
> -                                bo);
> +                                src_bo);
>                 else
>                         xe_res_next(&src_it, src_L0);
>
>                 if (!dst_is_vram)
>                         emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, =
src_L0,
> -                                bo);
> +                                dst_bo);
>                 else
>                         xe_res_next(&dst_it, src_L0);
>
>                 if (copy_system_ccs)
> -                       emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size,=
 bo);
> +                       emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size,=
 src_bo);
>
>                 bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
>                 update_idx =3D bb->len;
> @@ -714,8 +720,11 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate =
*m,
>
>                 xe_sched_job_add_migrate_flush(job, flush_flags);
>                 if (!fence) {
> -                       err =3D job_add_deps(job, bo->ttm.base.resv,
> +                       err =3D job_add_deps(job, src_bo->ttm.base.resv,
>                                            DMA_RESV_USAGE_BOOKKEEP);
> +                       if (!err && src_bo !=3D dst_bo)
> +                               err =3D job_add_deps(job, dst_bo->ttm.bas=
e.resv,
> +                                                  DMA_RESV_USAGE_BOOKKEE=
P);
>                         if (err)
>                                 goto err_job;
>                 }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migr=
ate.h
> index 1ff6e0a90de5..c283b626c21c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -73,7 +73,8 @@ struct xe_migrate_pt_update {
>  struct xe_migrate *xe_migrate_init(struct xe_gt *gt);
>
>  struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> -                                 struct xe_bo *bo,
> +                                 struct xe_bo *src_bo,
> +                                 struct xe_bo *dst_bo,
>                                   struct ttm_resource *src,
>                                   struct ttm_resource *dst);
>
> --
> 2.39.2
>

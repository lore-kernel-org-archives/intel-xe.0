Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62A7C76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 05:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670010E323;
	Fri, 31 Mar 2023 05:40:38 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8E810E323
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 05:40:35 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id q16so27456159lfe.10
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 22:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680241234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yEJ91jTqbOUMtAjmtfcAuW27CglN080Dc7okY5VcQWE=;
 b=NlHt6tYkFqKgLWhDD6CXiGkGI4LLr0+66aUfu7ZCoPW30Nokltq6vsXvhLoMjqPBku
 kkRu96mse+b4waSf+wKbW0wfsU4WFbr6WuBp+24Q/XZOCzTJ6Spu8O5e6fQgmgwJBtIJ
 Csg03VB/YTPgzrE1c4fvWEHIxbmXzNK3PMihDUk901Rme7E7eNop6lVa5h8cuUF/o00p
 mxtLmRSY21Zhn9/kMndPCHivh1TfoI6zm2hHuMaLgRsK2hc+V1VTJjrcr2XSW6xtInK2
 bWD04wrZfuWRTLBZbWrlTv/VJQDmTqX7ftOFN/B6DHV8maWuKZ8rJ0gmTXBd3Kebxku6
 za/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680241234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEJ91jTqbOUMtAjmtfcAuW27CglN080Dc7okY5VcQWE=;
 b=1Lz8EqMKPJ+sCXrTz0ZTjyfHzA9gSU783BSQ6WSzb9fp7A+frYy9REprhUlbO5jFCT
 Ivmfsg3UfwpJOn4PeyH9V5NZxTOyMslNPF2o9V8KiLsllxQLkUM8746rNuUt7DKI5Z8d
 H4DVswKSOoQEVlo2hI9l1vEzvnojwEH2ZQISz2s8M96Lo0y78MHYSX7Yta9a1iPeFy5R
 vu9TeSvmYJk/G+HgMdaGRZZEcaS4uFArOgl+nFyg3HYrmUskXJgdxS/1izzB7NfKuJMR
 AH0ZEp/YxeQykH1Kf268FfztTLzLZeeoAl1b8RXZ/eHM0IOAeB7DhURkT/R02io9K39X
 XHqw==
X-Gm-Message-State: AAQBX9cjWs99D08OI1qkETWqw6toYf7/KBkpMHMt1wy5DQfv5OtWNFm2
 j0qP9e8Kgcob9H65QCuUH5WzlidyTGF2zwUiGsgzean1XYs=
X-Google-Smtp-Source: AKy350YolyFDvDnFsgicbewYTNHdQ9SUiIPT7fULLzMxgr+JftDlzYlyX0Q7m+rz6/StwjVxKxkUnQbn9P1NtTzn0+E=
X-Received: by 2002:ac2:5448:0:b0:4ea:fafd:e669 with SMTP id
 d8-20020ac25448000000b004eafafde669mr7482349lfn.10.1680241233715; Thu, 30 Mar
 2023 22:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230330154026.4282-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230330154026.4282-1-yu.bruce.chang@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 31 Mar 2023 06:40:06 +0100
Message-ID: <CAM0jSHPvzNKj9Z-sX6BykN4v6JQQJve4e=jYae-ZAEdmb8mPbA@mail.gmail.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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

On Thu, 30 Mar 2023 at 16:40, Chang, Bruce <yu.bruce.chang@intel.com> wrote:
>
> Currently, unload pvc driver will generate a null dereference
> and the call stack is as below.
>
> [ 4850.618000] Call Trace:
> [ 4850.620740]  <TASK>
> [ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
> [ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
> [ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
> [ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
> [ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
> [ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
> [ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
> [ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
> [ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
> [ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
> [ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
>
> There are a couple issues, but the main one is due to TTM has only
> one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
> 1 TTM_PL_TT each tile. The second will overwrite the first one.
>
> During unload time, the first tile will reset the TTM_PL_TT manger
> and when the second tile is trying to free Bo and it will generate
> the null reference since the TTM manage is already got reset to 0.
>
> The fix is to share the TTM_PL_TT manager and use a count to only
> allow the last instance to release.

Would it make sense to rather move it out of GT init, and just have
one instance in the xe_device? And with that to rather consider
xe->mem.vram_size, instead of gt->mem.vram_size when considering the
potential "GTT" size? I think PL_TT is just system memory that can be
touched by the GPU device (likely has a gtt mapping), so not sure why
that needs to be GT centric.

>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt.c           |  9 +++++++--
>  drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c  | 25 +++++++++++++++----------
>  3 files changed, 25 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 88f863edc41c..ea771f120c0f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -195,6 +195,9 @@ struct xe_device {
>                         /** @mapping: pointer to VRAM mappable space */
>                         void *__iomem mapping;
>                 } vram;
> +               /** @gtt_mr: GTT TTM manager */
> +               struct xe_ttm_gtt_mgr *gtt_mgr;
> +               int instance;
>         } mem;
>
>         /** @usm: unified memory state */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index fd7a5b43ba3e..e7ca141478ef 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -77,8 +77,13 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>                 if (!gt->mem.vram_mgr)
>                         return -ENOMEM;
>
> -               gt->mem.gtt_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.gtt_mgr),
> -                                              GFP_KERNEL);
> +               if (!xe->mem.gtt_mgr) {
> +                       xe->mem.gtt_mgr =
> +                               drmm_kzalloc(drm, sizeof(*gt->mem.gtt_mgr),
> +                                            GFP_KERNEL);
> +                       xe->mem.instance = 0;
> +               }
> +               gt->mem.gtt_mgr = xe->mem.gtt_mgr;
>                 if (!gt->mem.gtt_mgr)
>                         return -ENOMEM;
>         } else {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> index 8075781070f2..05300c71928e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> @@ -94,6 +94,9 @@ static void ttm_gtt_mgr_fini(struct drm_device *drm, void *arg)
>         struct ttm_resource_manager *man = &mgr->manager;
>         int err;
>
> +       if (--xe->mem.instance)
> +               return;
> +
>         ttm_resource_manager_set_used(man, false);
>
>         err = ttm_resource_manager_evict_all(&xe->ttm, man);
> @@ -113,18 +116,20 @@ int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
>
>         XE_BUG_ON(xe_gt_is_media_type(gt));
>
> -       mgr->gt = gt;
> -       man->use_tt = true;
> -       man->func = &xe_ttm_gtt_mgr_func;
> -
> -       ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
> +       if (!xe->mem.instance) {
> +               mgr->gt = gt;
> +               man->use_tt = true;
> +               man->func = &xe_ttm_gtt_mgr_func;
>
> -       ttm_set_driver_manager(&xe->ttm, XE_PL_TT, &mgr->manager);
> -       ttm_resource_manager_set_used(man, true);
> +               ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>
> -       err = drmm_add_action_or_reset(&xe->drm, ttm_gtt_mgr_fini, mgr);
> -       if (err)
> -               return err;
> +               ttm_set_driver_manager(&xe->ttm, XE_PL_TT, &mgr->manager);
> +               ttm_resource_manager_set_used(man, true);
> +               err = drmm_add_action_or_reset(&xe->drm, ttm_gtt_mgr_fini, mgr);
> +               if (err)
> +                       return err;
> +       }
> +       xe->mem.instance ++;
>
>         return 0;
>  }
> --
> 2.25.1
>

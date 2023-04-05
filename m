Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ED6C77B60
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7191D10E9FF;
	Wed,  5 Apr 2023 15:40:40 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C1A10EA01
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:37 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id c9so36768806lfb.1
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680709235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TNLXftxFv68LLm0AO3fajURq1gGvr19pzlQ0CBBzB+w=;
 b=e9w/ftQtLNnYXuG0vSjK2C/pSW8B/CJKjlNqiG8lfjQ+li6tTw2d1W9xyKYegU+0PO
 m/kxa1icrj/Y8+QtbTOpnBmFjW3l72Do+fKjoM7sfBnf2t5I49T15c0i+DLDwM0v/r+B
 bPVmHMofu6Te6w0bqHZZU/oIpbQxBmvYR3Yl60g2d++coDxIhh9NgKhhBB5ZaO0YeGtU
 e8bhOI8eT+GlTYnCi7EWVhuyGyniMmR99U0w7w+9acg5hXO76ngdQC43W/o+a79o55l8
 oYxWqv6J6tN4ggXxw7WrhPtOpRTqPeqjsxyWTnHekHs+9ni+Qf4PEs0jW+pbMM6o/5mU
 9T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680709235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNLXftxFv68LLm0AO3fajURq1gGvr19pzlQ0CBBzB+w=;
 b=dr/AGuklzqydmKMzc5VjgpEJRsW37/EDZ8/PJnFMDKBdcZa5oEm8A4B3Nk0nHdCqut
 iw6p58zezwgJ9Ev+jE50f5ntzo1Zamz5125/1401iI6NnFoeCTX1fR+sgmU1zxrs8MXm
 j29g4gkZZ0Ui/zNCE5oV7Thffxn4/i14MzRaYPySWwjjqdGB55FeZvRaJ7rC37S6hPEb
 ymbk5+L1H+6UXU6OQ7Twn0NcGsdOGuasnIIU1D04kUkU0LFwzFTHC+6JfY3+tVRxO53r
 tlmWWT0gzRslM2S6IB/iQU5tEYyAsUy6nE7MWfdUtZtXaU66ZT3E7T+R/xl1qwHz/XT7
 SQNw==
X-Gm-Message-State: AAQBX9f7xjeMBGPpHB/n6DOAa25yyFiTJ6GQZ3K0hLeYw/ivF+xdk521
 Ok7cX3FsIsqaA1O8FhJ0lBzZuoUNFkGNYetkdemi0+i+W8Vwobfo
X-Google-Smtp-Source: AKy350YCrJeGx+IaeSSQiPNoSlPTpdL+JeeL/vDVIUtWsL5MRjGauOyKoRTxKgJjAfNjY5R1seY+M0zXL+16EuM8pZI=
X-Received: by 2002:a19:ad09:0:b0:4dc:807a:d140 with SMTP id
 t9-20020a19ad09000000b004dc807ad140mr1954750lfc.10.1680709234953; Wed, 05 Apr
 2023 08:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230405143706.4063988-1-matthew.brost@intel.com>
In-Reply-To: <20230405143706.4063988-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 Apr 2023 16:40:07 +0100
Message-ID: <CAM0jSHMxwTi4VMJdu=N=jcpzg8hEY4McZBFBuo8Jp+ie6x5GAg@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: Use Xe BO pin / unpin functions
 for FB pin
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

On Wed, 5 Apr 2023 at 15:37, Matthew Brost <matthew.brost@intel.com> wrote:
>
> Need to use XE BO pin / unpin for suspend / resume to work properly.
> Part this fix too is too allow xe_bo_pin to be called more than once.
>
> v2:
>   - (Matthew Auld) fixup unpin
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Tried to reload the module on DG2 with display enabled and it didn't
blow, so I guess we are good,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
>  drivers/gpu/drm/xe/xe_bo.c             | 8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 65c0bc28a3d1..c7c849be288f 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>
>         ret = xe_bo_validate(bo, NULL, true);
>         if (!ret)
> -               ttm_bo_pin(&bo->ttm);
> +               xe_bo_pin(bo);
>         ttm_bo_unreserve(&bo->ttm);
>         if (ret)
>                 goto err;
> @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>
>  err_unpin:
>         ttm_bo_reserve(&bo->ttm, false, false, NULL);
> -       ttm_bo_unpin(&bo->ttm);
> +       xe_bo_unpin(bo);
>         ttm_bo_unreserve(&bo->ttm);
>  err:
>         kfree(vma);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3a482c61c3ec..2cf112bedc92 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
>          */
>         XE_BUG_ON(bo->ttm.base.import_attach);
>
> -       /* We only expect at most 1 pin */
> -       XE_BUG_ON(xe_bo_is_pinned(bo));
> +       if (xe_bo_is_pinned(bo))
> +               goto pin;
>
>         err = xe_bo_validate(bo, NULL, false);
>         if (err)
> @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
>                 }
>         }
>
> +pin:
>         ttm_bo_pin(&bo->ttm);
>
>         /*
> @@ -1359,7 +1360,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>         XE_BUG_ON(bo->ttm.base.import_attach);
>         XE_BUG_ON(!xe_bo_is_pinned(bo));
>
> -       if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
> +       if (bo->ttm.pin_count == 1 && IS_DGFX(xe) &&
> +           !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
>             bo->flags & XE_BO_INTERNAL_TEST)) {
>                 struct ttm_place *place = &(bo->placements[0]);
>
> --
> 2.34.1
>

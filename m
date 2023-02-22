Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF03C6379F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 10:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B5810E1C1;
	Wed, 22 Feb 2023 10:02:40 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AA110E1C1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 10:02:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f16so7137111ljq.10
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jmkPcoHYRJus4sy+Yo8kInq0Sw0S+r60V9XbHPEGIVo=;
 b=HIm9bMIJ0idsFxyUgg9A14ct8DU4tw7IRNl5K88v1jR1elILcpr8SY+V+tmH2Nn9yj
 oWHeKlOA91+iyf6FcMGphBxV1wJg92yzo56DHXcuFDS04IyeZu4aKXy/Ocl5674p+TEb
 Z5tA4sBbqDpL/YEo+2e753rByjVp/YJc4gAUS51GYDmf1zufiZOI3sRRQIyrhfw7PsnX
 we4zqOpLLX+eRGyH9MkNwVI9/zySMslZFex6UOkFSjg/LSDmhjxIkCYeIToN/Lmu69ao
 Nqop1sp64l+68fmb9gwU3iA3XbPnLTiD59LREDcKWP199jBiUaPMy6ZWIfAvydmZKLAQ
 rxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jmkPcoHYRJus4sy+Yo8kInq0Sw0S+r60V9XbHPEGIVo=;
 b=Qgmv7lJrmYrA9gL7Stdw6mbqrV4Sn6Ctc+EHo6/6M5HxcRe9/DkfLO47WGGzR1iJZ6
 lPNj2z7aF62d0fuEuf7cosirfifljq/jRieCOFkPnDQOuqEaJkRYcYyiGkUdV7JX9u7B
 XWTY8NK3d/MGptrybe8Z7N1ZN6AIC7TPZmr2j1yAYA/xfE5DitELHu6GLBOLSBdv2X9S
 dO4rlsHGz2CmhgVrMoXpXbGKa/JzUuV4Ks5t8jDi3whGPhvSsWpaKm7cky7DmC6DeC5G
 inUpfUMPxU2FIdAN0rrsc7+vASnP9QCaaljIhIvt0dIRBfFWDcw3eYe7y1mLWmhaOMv0
 SuDw==
X-Gm-Message-State: AO0yUKUjYh5k5US48hwIC4JhbE5axxl0LJflU/hq/DRz7P1zgTZVG2YT
 axKGpQ6TipIkww/VNReg1kmnE4vC24EzDiW8ZUw=
X-Google-Smtp-Source: AK7set/IOGvNWqMVakTLGDzft6lb2nKmb9ysEGRnSiOXJ4f+I3cnmYqrIr12ezwK87ENA61OEQN0NS8EfQFHT8IsXCQ=
X-Received: by 2002:a2e:bc16:0:b0:294:d75f:4cc6 with SMTP id
 b22-20020a2ebc16000000b00294d75f4cc6mr3935553ljf.0.1677060155548; Wed, 22 Feb
 2023 02:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-4-lucas.demarchi@intel.com>
In-Reply-To: <20230221233348.883897-4-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 10:02:08 +0000
Message-ID: <CAM0jSHM8xp7M0A47AqnwdBPjxY1ZVKPp=rH+yP8NB2_2G4Z3Wg@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe: Fix kunit integration due to
 missing prototypes
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

On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> In order to avoid  -Werror=missing-prototypes, add the prototypes and
> move the functions to the end of the file, surrounded by
> `#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)`.

Is everything under tests/ not excluded from compilation when !XE_KUNIT_TEST?

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      | 54 +++++++++++++++------------
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +++
>  3 files changed, 39 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 87ac21cc8ca9..2c94ddaacda6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -141,29 +141,6 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>         xe_bo_put(bo);
>  }
>
> -static int ccs_test_run_device(struct xe_device *xe)
> -{
> -       struct kunit *test = xe_cur_kunit();
> -       struct xe_gt *gt;
> -       int id;
> -
> -       if (!xe_device_has_flat_ccs(xe)) {
> -               kunit_info(test, "Skipping non-flat-ccs device.\n");
> -               return 0;
> -       }
> -
> -       for_each_gt(gt, xe, id)
> -               ccs_test_run_gt(xe, gt, test);
> -
> -       return 0;
> -}
> -
> -void xe_ccs_migrate_kunit(struct kunit *test)
> -{
> -       xe_call_for_each_device(ccs_test_run_device);
> -}
> -EXPORT_SYMBOL(xe_ccs_migrate_kunit);
> -
>  static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
>  {
>         struct xe_bo *bo, *external;
> @@ -278,6 +255,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>         return 0;
>  }
>
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +
>  static int evict_test_run_device(struct xe_device *xe)
>  {
>         struct kunit *test = xe_cur_kunit();
> @@ -296,8 +275,37 @@ static int evict_test_run_device(struct xe_device *xe)
>         return 0;
>  }
>
> +void xe_bo_evict_kunit(struct kunit *test);
> +
>  void xe_bo_evict_kunit(struct kunit *test)
>  {
>         xe_call_for_each_device(evict_test_run_device);
>  }
>  EXPORT_SYMBOL(xe_bo_evict_kunit);
> +
> +static int ccs_test_run_device(struct xe_device *xe)
> +{
> +       struct kunit *test = xe_cur_kunit();
> +       struct xe_gt *gt;
> +       int id;
> +
> +       if (!xe_device_has_flat_ccs(xe)) {
> +               kunit_info(test, "Skipping non-flat-ccs device.\n");
> +               return 0;
> +       }
> +
> +       for_each_gt(gt, xe, id)
> +               ccs_test_run_gt(xe, gt, test);
> +
> +       return 0;
> +}
> +
> +void xe_ccs_migrate_kunit(struct kunit *test);
> +
> +void xe_ccs_migrate_kunit(struct kunit *test)
> +{
> +       xe_call_for_each_device(ccs_test_run_device);
> +}
> +EXPORT_SYMBOL(xe_ccs_migrate_kunit);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 615d22e3f731..d8ad135d0e04 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -252,6 +252,8 @@ static int dma_buf_run_device(struct xe_device *xe)
>         return 0;
>  }
>
> +void xe_dma_buf_kunit(struct kunit *test);
> +
>  void xe_dma_buf_kunit(struct kunit *test)
>  {
>         xe_call_for_each_device(dma_buf_run_device);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 03a60d5b42f1..7be0c2543916 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -352,6 +352,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>         xe_bo_vunmap(m->pt_bo);
>  }
>
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +
>  static int migrate_test_run_device(struct xe_device *xe)
>  {
>         struct kunit *test = xe_cur_kunit();
> @@ -371,8 +373,12 @@ static int migrate_test_run_device(struct xe_device *xe)
>         return 0;
>  }
>
> +void xe_migrate_sanity_kunit(struct kunit *test);
> +
>  void xe_migrate_sanity_kunit(struct kunit *test)
>  {
>         xe_call_for_each_device(migrate_test_run_device);
>  }
>  EXPORT_SYMBOL(xe_migrate_sanity_kunit);
> +
> +#endif
> --
> 2.39.0
>

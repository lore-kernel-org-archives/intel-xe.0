Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A5CC636D6
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 17:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AE710E1B7;
	Wed, 22 Feb 2023 17:11:26 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7DD10E0A5
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 17:11:24 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id f16so8509255ljq.10
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 09:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DaaFqq6tya0qBbnKMezfkknSLmYP0x5ZrkSahW0oX18=;
 b=BZiJjvsPkjrFCfjjrRhcfo9ArXEtgthgEq8J8ME2N6ksylSWYygxXfn06XJqfvamFa
 CjTrUay0u+lfeght+NtP9UxKBWRNPJPxq0wqvzW0WGJQEquvjRLR+q7kz4dvUga6AgkW
 V2wT0/0HSsjR9uy4NOieTqtl46laqfKVz5cS/sk1j6su0+pqCN2EUrpzGyDlKbEKe/ck
 M+xpG78ZH7JQf9ey7m5/CeP5Xdao9ZCzgresG98dKdUyQb8WfhAaIvMmixCAnCQ44mNz
 HBsvAfqY0c1+rSBBz02L97X/MDgSnIeU/jlo0ek3wrEEK7VkkXYym0T3fZuVuMEfrdBG
 YKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DaaFqq6tya0qBbnKMezfkknSLmYP0x5ZrkSahW0oX18=;
 b=C0MBOdjGbW+n6DasACdbPm++gjuHs1pweEZC9BjvkEbYyOkboDXgpAU2AklG95zt9N
 sq3gqD7bbtMngXJK8JiQO+E2wJ0gP6b5D85kT+pPywnXwweME+XHq63J2Hx20Q1geRaE
 Ozkc4LGwbsxdvaoeAetJUtD6Y4TkVCqK8L+9HfwIca9Aym0UvdEorwboUaSd3oNLfDcE
 o8WFRbt3vYLbx0jfh/fclI0WTZ4ZXpNzvbp16celH0WzA9H4nle5MTxBeTn5z8g+gW2j
 07h9uSzZxu/CBk9BbdE+3Y8KaktHjLLraffq6z2aiJMEBxC7U4Cem5w92dzVZHcdcGFW
 v2fA==
X-Gm-Message-State: AO0yUKWjLIO5kF2yb4+cX+vrUz15BdnZfn0PIZr8W1veDcvJIIyj1aYd
 qbaOBnt0NF73p2yRbo74FmEBL5N2mN5Iyi7rIUOHchg+nNQ=
X-Google-Smtp-Source: AK7set+UWpFujSSei4NL29uKEH+YWxR/Lj6hgAbBmR/s+TuOvpQgR1wQVO5Xowt9UlJH36+0aECSVL8VMyRQlPafhZg=
X-Received: by 2002:a05:651c:326:b0:28e:d4ae:90ab with SMTP id
 b6-20020a05651c032600b0028ed4ae90abmr2968920ljp.2.1677085882526; Wed, 22 Feb
 2023 09:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-4-lucas.demarchi@intel.com>
 <CAM0jSHM8xp7M0A47AqnwdBPjxY1ZVKPp=rH+yP8NB2_2G4Z3Wg@mail.gmail.com>
 <20230222145934.d5xmmfyle2iwyhnw@ldmartin-desk2.jf.intel.com>
In-Reply-To: <20230222145934.d5xmmfyle2iwyhnw@ldmartin-desk2.jf.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 17:10:55 +0000
Message-ID: <CAM0jSHOkr+d=Zy8MuKoLMCA8sAZCP1JMjFLR0mEtMvN4R--F-g@mail.gmail.com>
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

On Wed, 22 Feb 2023 at 14:59, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> On Wed, Feb 22, 2023 at 10:02:08AM +0000, Matthew Auld wrote:
> >On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >>
> >> In order to avoid  -Werror=missing-prototypes, add the prototypes and
> >> move the functions to the end of the file, surrounded by
> >> `#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)`.
> >
> >Is everything under tests/ not excluded from compilation when !XE_KUNIT_TEST?
>
> yes, except the ifdef is not in tests/. Example:
> drivers/gpu/drm/xe/tests/xe_bo.c

AFAICT xe/tests is only compiled if XE_KUNIT_TEST is enabled (looking
at the Makefile). tests/xe_bo.c is included at the bottom of xe_bo.c
but that is also wrapped in ifdef. So not seeing why we need to add
the ifdef stuff directly in tests/xe_bo.c, for example.

>
> The way the kunit tests in xe are split is: each .o in tests/ will
> create a separate module. In order to test a function like we are
> doing, the function needs to be declared !static and exported so the
> other module can call it.
>
> There are other possible ways to test functions on a different
> compilation unit: https://kunit.dev/third_party/kernel/docs/tips.html?highlight=static%20function#testing-static-functions
> I'm not so familiar with kunit yet to be able to say which one
> is better for our case, so I just went with the easy fix.
>
> +Thomas
>
> Lucas De Marchi
>
> >
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/tests/xe_bo.c      | 54 +++++++++++++++------------
> >>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +
> >>  drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +++
> >>  3 files changed, 39 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> >> index 87ac21cc8ca9..2c94ddaacda6 100644
> >> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> >> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> >> @@ -141,29 +141,6 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
> >>         xe_bo_put(bo);
> >>  }
> >>
> >> -static int ccs_test_run_device(struct xe_device *xe)
> >> -{
> >> -       struct kunit *test = xe_cur_kunit();
> >> -       struct xe_gt *gt;
> >> -       int id;
> >> -
> >> -       if (!xe_device_has_flat_ccs(xe)) {
> >> -               kunit_info(test, "Skipping non-flat-ccs device.\n");
> >> -               return 0;
> >> -       }
> >> -
> >> -       for_each_gt(gt, xe, id)
> >> -               ccs_test_run_gt(xe, gt, test);
> >> -
> >> -       return 0;
> >> -}
> >> -
> >> -void xe_ccs_migrate_kunit(struct kunit *test)
> >> -{
> >> -       xe_call_for_each_device(ccs_test_run_device);
> >> -}
> >> -EXPORT_SYMBOL(xe_ccs_migrate_kunit);
> >> -
> >>  static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
> >>  {
> >>         struct xe_bo *bo, *external;
> >> @@ -278,6 +255,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
> >>         return 0;
> >>  }
> >>
> >> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >> +
> >>  static int evict_test_run_device(struct xe_device *xe)
> >>  {
> >>         struct kunit *test = xe_cur_kunit();
> >> @@ -296,8 +275,37 @@ static int evict_test_run_device(struct xe_device *xe)
> >>         return 0;
> >>  }
> >>
> >> +void xe_bo_evict_kunit(struct kunit *test);
> >> +
> >>  void xe_bo_evict_kunit(struct kunit *test)
> >>  {
> >>         xe_call_for_each_device(evict_test_run_device);
> >>  }
> >>  EXPORT_SYMBOL(xe_bo_evict_kunit);
> >> +
> >> +static int ccs_test_run_device(struct xe_device *xe)
> >> +{
> >> +       struct kunit *test = xe_cur_kunit();
> >> +       struct xe_gt *gt;
> >> +       int id;
> >> +
> >> +       if (!xe_device_has_flat_ccs(xe)) {
> >> +               kunit_info(test, "Skipping non-flat-ccs device.\n");
> >> +               return 0;
> >> +       }
> >> +
> >> +       for_each_gt(gt, xe, id)
> >> +               ccs_test_run_gt(xe, gt, test);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +void xe_ccs_migrate_kunit(struct kunit *test);
> >> +
> >> +void xe_ccs_migrate_kunit(struct kunit *test)
> >> +{
> >> +       xe_call_for_each_device(ccs_test_run_device);
> >> +}
> >> +EXPORT_SYMBOL(xe_ccs_migrate_kunit);
> >> +
> >> +#endif
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> >> index 615d22e3f731..d8ad135d0e04 100644
> >> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> >> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> >> @@ -252,6 +252,8 @@ static int dma_buf_run_device(struct xe_device *xe)
> >>         return 0;
> >>  }
> >>
> >> +void xe_dma_buf_kunit(struct kunit *test);
> >> +
> >>  void xe_dma_buf_kunit(struct kunit *test)
> >>  {
> >>         xe_call_for_each_device(dma_buf_run_device);
> >> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> >> index 03a60d5b42f1..7be0c2543916 100644
> >> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> >> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> >> @@ -352,6 +352,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> >>         xe_bo_vunmap(m->pt_bo);
> >>  }
> >>
> >> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >> +
> >>  static int migrate_test_run_device(struct xe_device *xe)
> >>  {
> >>         struct kunit *test = xe_cur_kunit();
> >> @@ -371,8 +373,12 @@ static int migrate_test_run_device(struct xe_device *xe)
> >>         return 0;
> >>  }
> >>
> >> +void xe_migrate_sanity_kunit(struct kunit *test);
> >> +
> >>  void xe_migrate_sanity_kunit(struct kunit *test)
> >>  {
> >>         xe_call_for_each_device(migrate_test_run_device);
> >>  }
> >>  EXPORT_SYMBOL(xe_migrate_sanity_kunit);
> >> +
> >> +#endif
> >> --
> >> 2.39.0
> >>

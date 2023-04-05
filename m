Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA97C761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 14:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EF410E996;
	Wed,  5 Apr 2023 14:26:37 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9266610E998
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 14:26:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id x20so37470854ljq.9
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680704793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ek9tZG+kPenY/b8sA5UnlpVbIFXd4M849NQBAUGNYvo=;
 b=FtxGvdCqbFiE3zUSRnTNjKt7dkRHQF0VFJSOI++TtqyatZ9ZZLN2B0g3uZo3wx5fgf
 GO0pJt+2OKLKD1HVOMAeBj4DuaYUkcQ16xOG8cu/JYOsOkpVZm3z+K7wkd2ybmnxI306
 AgCm/Cv6/WDPVgyorOymhZT3ziaF4ZBLFX6/26pX0ZwpD9Ro9GFKEHS7ZRevbJwpPdpE
 8tAuFmpnskQ1s7ucXjc3lPQapc0fiSb+ehsIqbuJLbo+H2uanSZZ86rw7/NULW4rh7AQ
 Gk86/TZZydaPHNNdITmiv2hmIwjjMOhU75NcVNaLvFwhQWuJ3aGJiUWZYbU0wopHqF3c
 xxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680704793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ek9tZG+kPenY/b8sA5UnlpVbIFXd4M849NQBAUGNYvo=;
 b=PYFQgiSiuPu2D1YUc0JqBPuwQ06uVWSdoBvUiflA9oNvvB+nZmaH0Ju3I0/48YSfum
 Zns0no5Qswouy1qP5l6n/MlniFGVUXa1SycCiBw+oLjawQi90ERtLXLSVvf3MYb6wEhH
 d6cqOS8xE2w8jAQss45cUVDP5dwob+ViBfFxG6lICugVptw8zXheWJNvMNYafgTgV1Q1
 FB9TFR3qBikSCNRES1uVN5hfLO7QMiphWoeFOrLHrkKWG//h5JoirEPWzGSii60VuWq2
 zOFVav7g8ErNmWpmj02Kj9Q3DW6o7/WtKGEIIYMXaEhSKvBoxqTVyM13m4DVfHJz8e8g
 qSPQ==
X-Gm-Message-State: AAQBX9dZmuscuV+UnyKiY3S81JII9LywD5y46MaTn5nZVU6KwgPyKQyz
 x4qQn99eBL1U9D19zj2PXTcPHbDDmy/RbxSZb5C1eIsR1CL77LyE
X-Google-Smtp-Source: AKy350YGDH47Rt+5xbbHj66+6VwWbZqsSSLHZmtD7Ld+5Sc70Q/ngMDnRWkW2ZfrYWrQs9Ku3cbnI1Io/kBD38+FlyY=
X-Received: by 2002:a2e:824a:0:b0:299:b5e6:4c45 with SMTP id
 j10-20020a2e824a000000b00299b5e64c45mr2288545ljh.5.1680704793340; Wed, 05 Apr
 2023 07:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230405041943.3980167-1-matthew.brost@intel.com>
 <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
 <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 Apr 2023 15:26:06 +0100
Message-ID: <CAM0jSHPRY=mrDvdpiOcoLccm_mVLGMaPPZrtJ7wzD8rR4C7rfQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use Xe BO pin / unpin functions for
 FB pin
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

On Wed, 5 Apr 2023 at 15:15, Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Wed, Apr 05, 2023 at 02:19:35PM +0100, Matthew Auld wrote:
> > On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > Need to use XE BO pin / unpin for suspend / resume to work properly.
> > > Part this fix too is too allow xe_bo_pin to be called more than once.
> > >
> > > Should fix:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >
> > Change makes sense to me, but I think we also need to update xe_bo_unpin()?
> >
>
> Yep, thought that coded correctly but was looking at xe_bo_unpin_external().
>
> > But I must be misunderstanding something here. AFAICT we can have
> > various pinned VRAM objects, and xe_bo_pin() still adds them to
> > pinned.kernel_bo_present, where during suspend we evict everything on
> > that list to system memory. But as these are all still pinned, suspend
> > is still going to fail with this patch, given the recent TTM changes.
>
> What reference recent TTM changes? This all worked at one point in time.

From the bug report:

commit f87c1f0b7b79b7a4f165750d1884da1fd29ae93c
       drm/ttm: prevent moving of pinned BOs

The change came from a recent rebase on drm-tip. It now treats trying
to move pinned objects as an error.

>
> Matt
>
> > What am I missing?
> >
> > > ---
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
> > >  drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index 65c0bc28a3d1..c7c849be288f 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > >
> > >         ret = xe_bo_validate(bo, NULL, true);
> > >         if (!ret)
> > > -               ttm_bo_pin(&bo->ttm);
> > > +               xe_bo_pin(bo);
> > >         ttm_bo_unreserve(&bo->ttm);
> > >         if (ret)
> > >                 goto err;
> > > @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > >
> > >  err_unpin:
> > >         ttm_bo_reserve(&bo->ttm, false, false, NULL);
> > > -       ttm_bo_unpin(&bo->ttm);
> > > +       xe_bo_unpin(bo);
> > >         ttm_bo_unreserve(&bo->ttm);
> > >  err:
> > >         kfree(vma);
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 3a482c61c3ec..25c696bd380c 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
> > >          */
> > >         XE_BUG_ON(bo->ttm.base.import_attach);
> > >
> > > -       /* We only expect at most 1 pin */
> > > -       XE_BUG_ON(xe_bo_is_pinned(bo));
> > > +       if (xe_bo_is_pinned(bo))
> > > +               goto pin;
> > >
> > >         err = xe_bo_validate(bo, NULL, false);
> > >         if (err)
> > > @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
> > >                 }
> > >         }
> > >
> > > +pin:
> > >         ttm_bo_pin(&bo->ttm);
> > >
> > >         /*
> > > --
> > > 2.34.1
> > >

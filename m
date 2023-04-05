Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A1C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 17:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7310E194;
	Wed,  5 Apr 2023 17:05:14 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05210E194
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 17:05:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id x17so47603698lfu.5
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680714310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0aAxFyW3AxTiJ5sqxV8hjMpAxkKCYUbSxqRIJqgCGA0=;
 b=oI9ZnoQ2tTiI0B0JuPHP4mKPnMtlODoFaakF5zteiipNB34wjbjbjnxE2MAVZpqLNV
 D6MA6G4Mueq6AGSO9LLNTSPMVbq8t3ZYSKL4uj1DRdLvYc+Vh3ZkJopIRzw6I8haNOjQ
 cSo0Fu0CVRKv8KSwvMA7z2FZTGDUPHVKfOLT7pwa7VzewUJQQrwBiS0lNzRyf81KZVOw
 xmR9MWPsqlL/zvgQ3wZOV+Juc3BQkTHI+YWtd3/lwaGZmrOVwBe2z0vjbo6s4oxF9Vo0
 PEP5BZ5TDI/RIPAbzDulZ/+n3dEgo9PTdEhM9QubUiylSgjgkpZ0MAZlfSNux9V3WX/6
 h+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680714310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0aAxFyW3AxTiJ5sqxV8hjMpAxkKCYUbSxqRIJqgCGA0=;
 b=gzTKTPUCdP/QNgcP/NJvYwRaQN7LR13cF8BLmb1lvf5+99mKioilCT9ZRPposelYLq
 xj5S5EoPSuk9PEq2ew/UZzKGtAXYHG1NudjzKvsXbSxqdDix0qkJOa8kb1HvNuaFCAmY
 +eaSVohsbKBr0CqtvMnAKd1H0o74LdGZX59I7Lg3JkfKPC7y1VGdzER0kYJZMgC7hYdv
 fbJGDLZ9EqekbedFH6jZtgjwaCLRJY1d/+oWkgroFWfdmks6rUXhNdL1txBDw+d+wXw3
 2wjLm97mcmQhMzQVD2HC9x7PHZhy2zGxkRXSqTYZKmJwtNAnxhRwQpNQxQf81qUra2b/
 PORg==
X-Gm-Message-State: AAQBX9cK5zu2UtxP/veM51cjUCQQGOfAC5alpw0gXS9EnCYByEhUZwFR
 t8Peyg8hEBRQA+044KuJAfhOWksjl7KMbPmBKDk=
X-Google-Smtp-Source: AKy350Z8Z4tV+7PZxHxypYtbN19RFrcexjIreB/XY0Tq7d2BNIJSA8y9pD2tXvqX7glzBhu5fwDT+zvNMpxSn0TGZU8=
X-Received: by 2002:a19:740f:0:b0:4eb:d8d:6c17 with SMTP id
 v15-20020a19740f000000b004eb0d8d6c17mr2129225lfe.10.1680714310271; Wed, 05
 Apr 2023 10:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230405041943.3980167-1-matthew.brost@intel.com>
 <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
 <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
 <ZC2FfgbxUJpI+FEI@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZC2FfgbxUJpI+FEI@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 Apr 2023 18:04:42 +0100
Message-ID: <CAM0jSHNS0G3pTptm-3+6byuB7HmQiKswoWoceD7O9e5CgG9T6w@mail.gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 15:28, Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Wed, Apr 05, 2023 at 02:14:22PM +0000, Matthew Brost wrote:
> > On Wed, Apr 05, 2023 at 02:19:35PM +0100, Matthew Auld wrote:
> > > On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com> wrote:
> > > >
> > > > Need to use XE BO pin / unpin for suspend / resume to work properly.
> > > > Part this fix too is too allow xe_bo_pin to be called more than once.
> > > >
> > > > Should fix:
> > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
> > > >
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >
> > > Change makes sense to me, but I think we also need to update xe_bo_unpin()?
> > >
> >
> > Yep, thought that coded correctly but was looking at xe_bo_unpin_external().
> >
> > > But I must be misunderstanding something here. AFAICT we can have
> > > various pinned VRAM objects, and xe_bo_pin() still adds them to
> > > pinned.kernel_bo_present, where during suspend we evict everything on
> > > that list to system memory. But as these are all still pinned, suspend
> > > is still going to fail with this patch, given the recent TTM changes.
> >
> > What reference recent TTM changes? This all worked at one point in time.
> >
>
> Oh, I see:
> git format-patch -1 f87c1f0b7b79b
>
> I would've NAK'd that one as this broke us. What you think is the best
> way to move forward on this one? I like the idea of using TTM to move
> the objects...
>
> I know we could just hack this and set pin_count=0 before calling
> validate aand restore it after? Horried hack though?
>
> Revert the above patch + post upstream?

Christian, can you share your thoughts here?

This is regarding the TTM change: f87c1f0b7b79 ("drm/ttm: prevent
moving of pinned BOs"). To quickly summarize, it looks like Xe was
relying on being able to move pinned BOs for suspend-resume, where the
driver has some special kernel-internal VRAM buffers that are
perma-pinned, but need to be moved to system memory during suspend and
then copied back when resuming. This was all handled by just doing
something like ttm_bo_validate(PL_SYSTEM), without needing any special
handling. But this ofc no longer works.

So wondering if it makes any sense to move the decision back into the
driver, for whether to treat moving pinned objects as an error or not,
given the above use case with suspend-resume in Xe?

>
> BTW, this patch is needed regardless with the fix in xe_bo_unpin().
>
> Matt
>
> > Matt
> >
> > > What am I missing?
> > >
> > > > ---
> > > >  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
> > > >  drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
> > > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > > index 65c0bc28a3d1..c7c849be288f 100644
> > > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > > @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > > >
> > > >         ret = xe_bo_validate(bo, NULL, true);
> > > >         if (!ret)
> > > > -               ttm_bo_pin(&bo->ttm);
> > > > +               xe_bo_pin(bo);
> > > >         ttm_bo_unreserve(&bo->ttm);
> > > >         if (ret)
> > > >                 goto err;
> > > > @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > > >
> > > >  err_unpin:
> > > >         ttm_bo_reserve(&bo->ttm, false, false, NULL);
> > > > -       ttm_bo_unpin(&bo->ttm);
> > > > +       xe_bo_unpin(bo);
> > > >         ttm_bo_unreserve(&bo->ttm);
> > > >  err:
> > > >         kfree(vma);
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 3a482c61c3ec..25c696bd380c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
> > > >          */
> > > >         XE_BUG_ON(bo->ttm.base.import_attach);
> > > >
> > > > -       /* We only expect at most 1 pin */
> > > > -       XE_BUG_ON(xe_bo_is_pinned(bo));
> > > > +       if (xe_bo_is_pinned(bo))
> > > > +               goto pin;
> > > >
> > > >         err = xe_bo_validate(bo, NULL, false);
> > > >         if (err)
> > > > @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
> > > >                 }
> > > >         }
> > > >
> > > > +pin:
> > > >         ttm_bo_pin(&bo->ttm);
> > > >
> > > >         /*
> > > > --
> > > > 2.34.1
> > > >

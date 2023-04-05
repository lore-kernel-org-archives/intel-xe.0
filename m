Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CEDC76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 13:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6881910E94D;
	Wed,  5 Apr 2023 13:20:07 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0328B10E962
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 13:20:04 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e9so22003513ljq.4
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680700803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lF7F6D9AjhElx5iK8F6ArT5wI/ar6n850ymyIHiobEM=;
 b=BayXWWTAwOsBOwHDotTt7UNkueCd8KlUMykkZ3CqWlWiakhqGoeYZZRNpAbg0AFV5L
 zkuQHP2uHbqqAMHmlJV0yCd+FPqzgR0BEyB0pzbgqKTslIrhLqmjperAYCoIYgftG1CI
 vb2ZKlt0MXL+TyHMtgdn0HXEBGAgox+fSFj2xWpBzrsQrfOxQPcVrLU8WD4Xg8PEiMOl
 RrUeEALCYxBdp3xcUk/QW+5pQG9oxd3FFZZ6ZU5dZL5xPBsPZn9IEl1AGc1CQIrG2m5V
 Fl0Qce78dOKx/neywwnzhL2wuq9zDuEirHulaTuiAKUFMgRbbdZi1djfuko7yYRH7TN/
 i/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680700803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lF7F6D9AjhElx5iK8F6ArT5wI/ar6n850ymyIHiobEM=;
 b=h9wLHUjhWdS6u8b1vQdKXlgrO4Ia7JqOZYOZAuiPZHbdPfFmH2poO4XHG05UaS3/+U
 MY85o+PID8IvzTHbapH37UWzVyftalyxyinGS28ngh1Y/+x8G245P+EmSKEEloUfDBve
 Z3P/z2XBdjVBzvUW27VVVIKA0TuI7szY+dzMM9Qe/+JeYnpLTAUE2+gyKlfCW6lHb6BT
 ZiDBAqRSgozMUci2SX6f66IOscIdMrAqJuR0uR9jqe/okjp0RcrpCK+Np7qdJsjYq2kv
 gW+YVjvQUcU3FQ6D21H7F/8siylE+HDniPlfyy97csEGdPl+oA3vVaTGeeAl/fByACEH
 ZY3g==
X-Gm-Message-State: AAQBX9fnNzwEZAoH/ErjTMpZyoETDssZKfXOkc4GCBASycCchLxGHtNA
 nwOLRsDaqpwRd5PnJQu9fhYkaISnNhW0HdIYOgV+NJDto21YChls
X-Google-Smtp-Source: AKy350aTCo3zhmc/t7uR9ytTFZ5F6Rr3eUFtgml0YRl9ZTsiic9iNjdIc47HdrCJm6YPqpUWisSrRMGSEWV75lt7Tq8=
X-Received: by 2002:a2e:99c6:0:b0:2a6:16b4:40a2 with SMTP id
 l6-20020a2e99c6000000b002a616b440a2mr2201858ljj.5.1680700802657; Wed, 05 Apr
 2023 06:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230405041943.3980167-1-matthew.brost@intel.com>
In-Reply-To: <20230405041943.3980167-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 Apr 2023 14:19:35 +0100
Message-ID: <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
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

On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com> wrote:
>
> Need to use XE BO pin / unpin for suspend / resume to work properly.
> Part this fix too is too allow xe_bo_pin to be called more than once.
>
> Should fix:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Change makes sense to me, but I think we also need to update xe_bo_unpin()?

But I must be misunderstanding something here. AFAICT we can have
various pinned VRAM objects, and xe_bo_pin() still adds them to
pinned.kernel_bo_present, where during suspend we evict everything on
that list to system memory. But as these are all still pinned, suspend
is still going to fail with this patch, given the recent TTM changes.
What am I missing?

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
>  drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
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
> index 3a482c61c3ec..25c696bd380c 100644
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
> --
> 2.34.1
>

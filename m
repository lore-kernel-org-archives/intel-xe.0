Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D3DC5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 12:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238E10E296;
	Fri, 21 Aug 2026 12:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZkiCpibJ";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A6A10EE01
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 18:01:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6a36982a875so345858a12.0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 11:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787248906; cv=none;
 d=google.com; s=arc-20260327;
 b=dkrqpHPKlMSca3UUegUknSR77KA4iFq4dxh31WRIaXSWcH/uNFgDo+MkD0JcJSFV7S
 ttJFtPJVp8UPUbhOTFw6/rIcCRo6OTKueKn9Q92cpZRZTRUoDdjb6E0f3LFkjKDE3vrU
 Gw4aG4A7/KOQxKXIatC2frrNwerzDsEmOxs6f3odeX/1mG72MPBZI12XutOfX3e3450y
 ONLYrt4N1t+fn+8xWKUVdzQshTHshMcxR6k1JwdFCTNy0eyvZjiBCs7jFlRYaz4ssrHQ
 lFXKLDnXlOTlWdXNW5LB0yFGFyA9XQa4KaJZoLIwOKxBia70NSiZ2fLITT/OtOC5Swv5
 y0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xiE1wfQ7zi2gKZTJsWtWdqsC7M3ZKazhZclZNdF0HU4=;
 fh=tdY4gMVmj8PFjqvkUnl7sST2Y9kuGryD0l8hDwV3LzU=;
 b=flTMmwf15yeJqXc1pPGhJh/vzM/7wjLnj5R63UA9baLoB0+6HJAgiLD+QJh5bX9GRg
 Hm0mbtHTv5mkHSWT4eaqVb0XkspioEb/XH0tzfgrwQdNtdWDD1G5gdQ6I85GFvp1I9IJ
 QY7wmK81IgeAB8ZkTsH/RAnk9BInSbmOyl8XaEdQizjWFqWsEk3Gn2Jn6nUdIJOcm4E2
 flzxftAk+CJBhoeHkr8oOW+q6ZDDFUk8aVnnZF1lKbyjKXGbS+SKUvooxMrrNzcybHnb
 8q7cJbrwd/Dn4qQwWtc/wHbFbEL3EH3/2gH7LiWHyMJ8QskcEEYgDjlKfiUyF/TbUoN+
 AbMQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787248906; x=1787853706; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xiE1wfQ7zi2gKZTJsWtWdqsC7M3ZKazhZclZNdF0HU4=;
 b=ZkiCpibJgdLFd+23VK9hqn4o8TBvRC5WOEe5SGXozVmh1/2OGjOYnLwtbLgXCnWbgM
 QCyy30wto4l2BOM60//KwA4KxQSFaeRyvnN8zZzq2dwTM4QWYAb7aY2ImLsJ9tXU/5NN
 r//A6NlnAPC6/WxgWpNkggT84FQseYwGSWa+rRyym316JZ2Csac1TSk4m6dFSV4wLhVH
 sL7ztlDQmqC15UDGdeGWIcz9FWUihE7yV9E1q6mHUwuBmYyyKVW6f6jA1SNch6GKp9Pv
 zAwoW0zAGwLGxi6q5X3ecu+lyBG1ry5HVg+Bq3QCIYzZnJ/GrNJ2U2kFJeKCiA65sW7Z
 k2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787248906; x=1787853706;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xiE1wfQ7zi2gKZTJsWtWdqsC7M3ZKazhZclZNdF0HU4=;
 b=I1aYgPdpeoyVHjNIj0G+firhithnzzTtW13xEX3Tx8RpOoMk4HuV38xdM/pdVDFXBt
 MY6fDUNYITVQJnAYum/GSKw2LQ8uiUMURkazyknR9E0vBpQU7tqT0kxg1Jri9ZHbeC6u
 WMeiv1F2qbMP1oxywVZLhh9ER3JgNVEpTancXsYaj+ZMykAi0QUxUNdaaH3d7AmUU7Ee
 9tOQg5oCGUcy/csLPVCsH/GfSoJ9XJLcn8bhlvAwVK+1oZsWnqL+WS6gfIHq0fa+hr2W
 Pja3gu6EnY5zvwZ0fTbJY6Hl3MWK4FsMHRyk4hYxlH120Nt8p5yoN+3Dp3h9S4lpLKB3
 0Wgw==
X-Gm-Message-State: AFuF++kGuABJn9VuRlXakUuJNKhevgkE8+nq3XzoQlMHNTs5AQG+HxDy
 quMFKQglJ7J0dED+yalz+kelpa2j43lMnGSM60jMxcYQe+LdmeFxAwzMX9MXXDeB2Q+yzzZLloe
 kiyHRZy5dFl3NzMqHs2AZXnZSrm659B0=
X-Gm-Gg: AR+sD137ZZe8l2Xc9m032fkILormJXZHUGBV+eJVYqi/jk3/Kf/E5HO1d+ki6Y/w0WK
 r8tpdeLiZ5cEto2SoG1C7SlE1E9v0sAovIsPVxfnpRCwuWJaFhO3rncqzMQhNL6gzBz6r7Yp1Vk
 0X4oy88BVGugFgqnduByC8xJVoPopfR3x/fwUG1lBodOuCGEXQyl3cete6sv9VUJptvuqnIiy+d
 SkvXOBqXlVDLpxU5neWA8CVCI4lYqHsgzCJJqr+fDUen9geJTdDkkq2RtlD54LztJ5/McfrtAQC
 obYHssTj6v/uWb9yfowreDEYo/UwonzmirH6d40PnbPqhfpr8oHxLUyjkfxKNav71I754MBce4x
 zNU/a6mZfTFOddWxwKa3tj5uz1qKP8XeB
X-Received: by 2002:a05:6402:21d9:b0:698:be4d:ca2a with SMTP id
 4fb4d7f45d1cf-6a42f20e03amr410703a12.15.1787248905304; Thu, 20 Aug 2026
 11:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
 <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com>
In-Reply-To: <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com>
From: Nathan Bourgeois <iridescentrosesfall@gmail.com>
Date: Thu, 20 Aug 2026 14:01:33 -0400
X-Gm-Features: AcwNN1Vrzv8ZnwX8vx5mizV0-lFRqeSmOpKj5ei8oWelRaI6xOWgS3ZoyGZ3-Xc
Message-ID: <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Content-Type: multipart/alternative; boundary="000000000000203d2806597e5078"
X-Mailman-Approved-At: Fri, 21 Aug 2026 12:52:53 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--000000000000203d2806597e5078
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, I replied only to Matt by mistake earlier. Here's the same reply for
the list:

Hi Matt, Thank you so much for reviewing this! > Reading the commit which
added ttm_bo_setup_export, to me this looks
> like a bug in ttm_bo_setup_export() or in general TTM.
> 'This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.'

> I'd probably move this fix into ttm_bo_setup_export() and post it for
> discussion.

I agree that this is a much cleaner and smaller fix, I initially wanted to
keep
the change scoped only to xe where it was causing an observable issue,
but I will move it into ttm_bo_setup_export() given your recommendation.

> It may also be the case that the ttm_tt preallocated with
> XE_BO_FLAG_DEFER_BACKING should be dropped once the BO moves to VRAM, as
> that dangling ttm_tt could cause other issues. I'll need to take a
> closer look at that angle.

Yes, considering that this is essentially the source of this particular
behavior
it stands to reason that there may be other latent correctness issues cause=
d
by the dangling ttm_tt.

> This part looks good as different patch from what I'm assuming will be a
> TTM fix.

Yes, I'll submit a patch with RFC for discussing the ttm_bo_setup_export()
changes and a second patch for the unit test.

Best Regards,
Nathan Bourgeois

On Thu, Aug 20, 2026 at 1:03=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com>
wrote:

> On Wed, Aug 19, 2026 at 11:19:01PM -0400, Nathan Bourgeois wrote:
>
> Thanks the patch.
>
> > When a buffer object (BO) has a created but unpopulated ttm_tt and is
> > exported, the default behavior populates the ttm_tt, even if the manage=
r
> > does not require a TT. This unnecessary host-side population reduces
> > host memory available to the user.
> >
> > This occurs when a BO is created with XE_BO_FLAG_DEFER_BACKING and
> > migration places the BO into a resource whose manager does not use the
> > TT backing. The retained ttm_tt is not authoritative for storage, yet
> > the default ttm_bo_setup_export() treats the existence of the ttm_tt as
> > requiring population.
> >
>
> Thanks for explaining this, I see the problem.
>
> > The issue was reproduced with vLLM 0.27.1 loading
> > 0xSer0/DeepSeek-V4-Flash-180B (d3c704b) on a system with 128 GB of RAM
> > and six Intel Arc Pro B70 GPUs providing 192 GB of VRAM. Loading the
> > weights (100.61 GB) triggered host-memory exhaustion and OOM events on
> > the baseline kernel.
> >
> > On Ubuntu 24.04 with 7.0-12-generic, the vLLM service cgroup grew by
> > 115.84 GB on the instrumented baseline and by 15.34 GB with this change=
,
> > a reduction of 100.50 GB. Diagnostic instrumentation counting cumulativ=
e
> > TT pages across all six GPUs recorded 109.22 GB on baseline and 8.72 GB
> > with this change. The reduction is 0.11 GB less than the model weight
> > size.
> >
> > The change creates an Xe-local export setup helper which skips
> > ttm_bo_populate() when the BO has a current resource manager and if tha=
t
> > manager has use_tt =3D=3D false. If the manager does not use TT, then
> > population is skipped, while an absent manager conservatively calls
> > ttm_bo_populate(). Behavior for a manager which requires a TT backing
> > remains unchanged. Keep this policy local to Xe so other TTM drivers
> > retain their existing export behavior.
> >
>
> Reading the commit which added ttm_bo_setup_export, to me this looks
> like a bug in ttm_bo_setup_export() or in general TTM.
>
> git format-patch -1 50243079865ae
>
> 'This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.'
>
> I'd probably move this fix into ttm_bo_setup_export() and post it for
> discussion.
>
> It may also be the case that the ttm_tt preallocated with
> XE_BO_FLAG_DEFER_BACKING should be dropped once the BO moves to VRAM, as
> that dangling ttm_tt could cause other issues. I'll need to take a
> closer look at that angle.
>
> > The regression test creates both the control case and the VRAM migratio=
n
> > case. The control case creates the deferred BO in system RAM and leaves
> > it there, which requires a TT and population when xe_gem_prime_export()
> is
> > called. The VRAM migration case creates the deferred BO in system RAM
> > and then migrates it to VRAM, which does not require a TT and thus, whe=
n
> > xe_gem_prime_export() is called, no population occurs.
> >
>
> This part looks good as different patch from what I'm assuming will be a
> TTM fix.
>
> Matt
>
> > Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5.6-sol
> > Signed-off-by: Nathan Bourgeois <iridescentrosesfall@gmail.com>
> > ---
> > Newer Testing:
> > - Built and booted b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6 plus this
> patch on EPYC 7352 with six Intel Arc Pro B70.
> > - KUnit xe_live_test: xe_dma_buf_kunit: pass:6 fail:0 skip:0 total:6 PA=
SS
> > - vLLM 0.27.1 loading DeepSeek-V4-Flash-0731 (full model compared to
> REAP) on six Intel Arc Pro B70 GPUs: No OOM error, 17.82 GB delta.
> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 105 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_dma_buf.c       |  28 ++++++-
> >  2 files changed, 132 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > index 0be8440b3976..bff803ab7a57 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > @@ -260,12 +260,117 @@ static const struct dma_buf_test_params
> test_params[] =3D {
> >       {}
> >  };
> >
> > +static void xe_test_dmabuf_export_deferred(struct xe_device *xe, u32
> bo_flags,
> > +                                        u32 mem_type, bool
> expect_populated)
> > +{
> > +     struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
> > +     struct kunit *test =3D kunit_get_current_test();
> > +     struct ttm_resource_manager *man;
> > +     struct dma_buf *dmabuf;
> > +     struct xe_bo *bo;
> > +     size_t size =3D PAGE_SIZE;
> > +     int err;
> > +
> > +     /* No VRAM on device? */
> > +     if (!ttm_manager_type(&xe->ttm, mem_type))
> > +             return;
> > +
> > +     if (mem_type =3D=3D XE_PL_VRAM0 &&
> > +         xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > +             size =3D SZ_64K;
> > +
> > +     /*
> > +      * DEFER_BACKING places the BO in SYSTEM and creates a ttm_tt whi=
ch
> > +      * is unpopulated. In the case of VRAM, migrating leaves the ttm_=
tt
> > +      * retained and unpopulated while VRAM becomes the real backing.
> > +      */
> > +     bo =3D xe_bo_create_user(xe, NULL, size, DRM_XE_GEM_CPU_CACHING_W=
C,
> > +                            bo_flags | XE_BO_FLAG_DEFER_BACKING, NULL)=
;
> > +     if (IS_ERR(bo)) {
> > +             KUNIT_FAIL(test, "BO creation failed: %pe\n", bo);
> > +             return;
> > +     }
> > +
> > +     err =3D xe_bo_lock(bo, false);
> > +     if (err) {
> > +             KUNIT_FAIL(test, "BO lock failed: %d\n", err);
> > +             goto out_put_bo;
> > +     }
> > +
> > +     if (bo->ttm.resource->mem_type !=3D mem_type)
> > +             err =3D xe_bo_migrate(bo, mem_type, NULL, exec);
> > +     if (err) {
> > +             KUNIT_FAIL(test, "BO migration to %u failed: %d\n",
> mem_type,
> > +                        err);
> > +             goto out_unlock;
> > +     }
> > +
> > +     man =3D ttm_manager_type(bo->ttm.bdev, bo->ttm.resource->mem_type=
);
> > +     if (!man || !bo->ttm.ttm) {
> > +             KUNIT_FAIL(test, "Expected a retained unpopulated TT\n");
> > +             goto out_unlock;
> > +     }
> > +
> > +     /* Precondition: ttm_tt starts unpopulated after migration */
> > +     KUNIT_EXPECT_EQ(test, man->use_tt, expect_populated);
> > +     KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm.ttm));
> > +
> > +     xe_bo_unlock(bo);
> > +
> > +     dmabuf =3D xe_gem_prime_export(&bo->ttm.base, 0);
> > +     if (IS_ERR(dmabuf)) {
> > +             KUNIT_FAIL(test, "dma-buf export failed: %pe\n", dmabuf);
> > +             goto out_put_bo;
> > +     }
> > +
> > +     err =3D xe_bo_lock(bo, false);
> > +     if (err) {
> > +             KUNIT_FAIL(test, "post-export BO lock failed: %d\n", err)=
;
> > +             goto out_put_dmabuf;
> > +     }
> > +
> > +     /* Postcondition: if VRAM, ttm_tt remains unpopulated, if SYSTEM
> ttm_tt is populated */
> > +     KUNIT_EXPECT_EQ(test, bo->ttm.resource->mem_type, mem_type);
> > +     KUNIT_EXPECT_NOT_NULL(test, bo->ttm.ttm);
> > +     if (bo->ttm.ttm)
> > +             KUNIT_EXPECT_EQ(test, ttm_tt_is_populated(bo->ttm.ttm),
> > +                             expect_populated);
> > +
> > +     xe_bo_unlock(bo);
> > +     dma_buf_put(dmabuf);
> > +     drm_gem_object_put(&bo->ttm.base);
> > +     return;
> > +
> > +out_unlock:
> > +     xe_bo_unlock(bo);
> > +     goto out_put_bo;
> > +out_put_dmabuf:
> > +     dma_buf_put(dmabuf);
> > +out_put_bo:
> > +     drm_gem_object_put(&bo->ttm.base);
> > +}
> > +
> >  static int dma_buf_run_device(struct xe_device *xe)
> >  {
> >       const struct dma_buf_test_params *params;
> >       struct kunit *test =3D kunit_get_current_test();
> >
> >       guard(xe_pm_runtime)(xe);
> > +
> > +     /*
> > +      * A retained TT must not be populated when VRAM is the backing
> > +      * resource.
> > +      */
> > +     xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_VRAM0, XE_PL_VRAM0,
> > +                                    false);
> > +
> > +     /*
> > +      * Control case: deferred SYSTEM backing must still be populated
> > +      * before export.
> > +      */
> > +     xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_SYSTEM, XE_PL_SYSTE=
M,
> > +                                    true);
> > +
> >       for (params =3D test_params; params->mem_mask; ++params) {
> >               struct dma_buf_test_params p =3D *params;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index bf0728838ead..0c4e4e2e1a81 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -219,6 +219,32 @@ static const struct dma_buf_ops xe_dmabuf_ops =3D =
{
> >       .vunmap =3D drm_gem_dmabuf_vunmap,
> >  };
> >
> > +static int xe_dma_bo_setup_export(struct ttm_buffer_object *tbo,
> > +                               struct ttm_operation_ctx *ctx)
> > +{
> > +     struct ttm_resource_manager *man =3D NULL;
> > +     int ret;
> > +
> > +     ret =3D ttm_bo_reserve(tbo, false, false, NULL);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (tbo->resource)
> > +             man =3D ttm_manager_type(tbo->bdev, tbo->resource->mem_ty=
pe);
> > +
> > +     /*
> > +      * Do not populate BO-sized system pages when backed by a non-TT
> resource.
> > +      * This is Xe-specific; the generic ttm_bo_setup_export() always
> populates.
> > +      */
> > +     if (man && !man->use_tt)
> > +             ret =3D 0;
> > +     else
> > +             ret =3D ttm_bo_populate(tbo, ctx);
> > +
> > +     ttm_bo_unreserve(tbo);
> > +     return ret;
> > +}
> > +
> >  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int
> flags)
> >  {
> >       struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > @@ -257,7 +283,7 @@ struct dma_buf *xe_gem_prime_export(struct
> drm_gem_object *obj, int flags)
> >       xe_bo_willneed_get_locked(bo);
> >       xe_bo_unlock(bo);
> >
> > -     ret =3D ttm_bo_setup_export(&bo->ttm, &ctx);
> > +     ret =3D xe_dma_bo_setup_export(&bo->ttm, &ctx);
> >       if (ret)
> >               goto out_put;
> >
> >
> > base-commit: b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6
> > --
> > 2.55.0
> >
>

--000000000000203d2806597e5078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><p dir=3D"auto" style=3D"white-space:pre-wrap">Sorr=
y, I replied only to Matt by mistake earlier. Here&#39;s the same reply for=
 the list:
</p><div class=3D"gmail-gs" style=3D"margin:0px;min-width:0px;padding:0px 0=
px 20px;width:auto;font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,H=
elvetica,Arial,sans-serif;font-size:medium"><div class=3D"gmail-"><div clas=
s=3D"gmail-ii gmail-gt gmail-adO" id=3D"gmail-:20q" style=3D"direction:ltr;=
margin:8px 0px 0px;padding:0px;font-size:0.875rem;overflow-x:hidden"><div i=
d=3D"gmail-:20r" class=3D"gmail-a3s gmail-aiL" style=3D"direction:ltr;font-=
style:normal;font-variant:normal;font-size-adjust:none;font-kerning:auto;fo=
nt-feature-settings:normal;font-stretch:normal;font-size:small;line-height:=
1.5;font-family:Arial,Helvetica,sans-serif;overflow:auto hidden"><div dir=
=3D"ltr"><p dir=3D"auto" style=3D"white-space:pre-wrap">Hi Matt,

Thank you so much for reviewing this!=20

&gt; <span style=3D"white-space:normal"><span style=3D"background-color:tra=
nsparent">Reading the commit which added ttm_bo_setup_export, to me this lo=
oks<br></span></span><span class=3D"gmail-im" style=3D"color:inherit"><span=
 style=3D"white-space:normal"><span style=3D"background-color:transparent">=
&gt; like a bug in ttm_bo_setup_export() or in general TTM.</span></span></=
span></p>&gt; &#39;This only applies currently to TTM_PL_SYSTEM objects, be=
cause<span class=3D"gmail-im" style=3D"color:inherit"><br>&gt; GTT objects =
get populated on first validate, and VRAM doesn&#39;t<br>&gt; use TT.&#39;<=
/span><div><br><div><span class=3D"gmail-im" style=3D"color:inherit"><span =
style=3D"background-color:transparent">&gt; I&#39;d probably move this fix =
into ttm_bo_setup_export() and post it for<br></span></span><span style=3D"=
background-color:transparent">&gt; discussion.<br><br>I agree that this is =
a much cleaner and smaller fix, I initially wanted to keep<br>the change sc=
oped only to xe where it was causing an observable issue,<br>but I will mov=
e it into ttm_bo_setup_export() given your recommendation.</span></div><div=
><span style=3D"background-color:transparent"><br></span></div><div><span c=
lass=3D"gmail-im" style=3D"color:inherit"><span style=3D"background-color:t=
ransparent">&gt;=C2=A0</span><span style=3D"background-color:transparent">I=
t may also be the case that the ttm_tt preallocated with<br></span><span st=
yle=3D"background-color:transparent">&gt; XE_BO_FLAG_DEFER_BACKING should b=
e dropped once the BO moves to VRAM, as<br></span><span style=3D"background=
-color:transparent">&gt; that dangling ttm_tt could cause other issues. I&#=
39;ll need to take a<br></span></span><span style=3D"background-color:trans=
parent"><span class=3D"gmail-im" style=3D"color:inherit">&gt; closer look a=
t that angle.<br><br></span>Yes, considering that this is essentially the s=
ource of this particular behavior<br>it stands to reason that there may be =
other latent correctness issues caused<br>by the dangling ttm_tt.<br><br>&g=
t;=C2=A0</span><span style=3D"background-color:transparent">This part looks=
 good as different patch from what I&#39;m assuming will be a</span></div>&=
gt; TTM fix.<br><br>Yes, I&#39;ll submit a patch with RFC for discussing th=
e ttm_bo_setup_export()<br>changes and a second patch for=C2=A0the unit tes=
t.<br><br>Best Regards,<br>Nathan Bourgeois</div></div></div></div></div></=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Aug 20, 2026 at 1:03=E2=80=AFPM Matthew B=
rost &lt;<a href=3D"mailto:matthew.brost@intel.com">matthew.brost@intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Aug 19, 2026 at 11:19:01PM -0400, Nathan Bourgeois wrote:<br>
<br>
Thanks the patch.<br>
<br>
&gt; When a buffer object (BO) has a created but unpopulated ttm_tt and is<=
br>
&gt; exported, the default behavior populates the ttm_tt, even if the manag=
er<br>
&gt; does not require a TT. This unnecessary host-side population reduces<b=
r>
&gt; host memory available to the user.<br>
&gt; <br>
&gt; This occurs when a BO is created with XE_BO_FLAG_DEFER_BACKING and<br>
&gt; migration places the BO into a resource whose manager does not use the=
<br>
&gt; TT backing. The retained ttm_tt is not authoritative for storage, yet<=
br>
&gt; the default ttm_bo_setup_export() treats the existence of the ttm_tt a=
s<br>
&gt; requiring population.<br>
&gt; <br>
<br>
Thanks for explaining this, I see the problem.<br>
<br>
&gt; The issue was reproduced with vLLM 0.27.1 loading<br>
&gt; 0xSer0/DeepSeek-V4-Flash-180B (d3c704b) on a system with 128 GB of RAM=
<br>
&gt; and six Intel Arc Pro B70 GPUs providing 192 GB of VRAM. Loading the<b=
r>
&gt; weights (100.61 GB) triggered host-memory exhaustion and OOM events on=
<br>
&gt; the baseline kernel.<br>
&gt; <br>
&gt; On Ubuntu 24.04 with 7.0-12-generic, the vLLM service cgroup grew by<b=
r>
&gt; 115.84 GB on the instrumented baseline and by 15.34 GB with this chang=
e,<br>
&gt; a reduction of 100.50 GB. Diagnostic instrumentation counting cumulati=
ve<br>
&gt; TT pages across all six GPUs recorded 109.22 GB on baseline and 8.72 G=
B<br>
&gt; with this change. The reduction is 0.11 GB less than the model weight<=
br>
&gt; size.<br>
&gt; <br>
&gt; The change creates an Xe-local export setup helper which skips<br>
&gt; ttm_bo_populate() when the BO has a current resource manager and if th=
at<br>
&gt; manager has use_tt =3D=3D false. If the manager does not use TT, then<=
br>
&gt; population is skipped, while an absent manager conservatively calls<br=
>
&gt; ttm_bo_populate(). Behavior for a manager which requires a TT backing<=
br>
&gt; remains unchanged. Keep this policy local to Xe so other TTM drivers<b=
r>
&gt; retain their existing export behavior.<br>
&gt; <br>
<br>
Reading the commit which added ttm_bo_setup_export, to me this looks<br>
like a bug in ttm_bo_setup_export() or in general TTM.<br>
<br>
git format-patch -1 50243079865ae<br>
<br>
&#39;This only applies currently to TTM_PL_SYSTEM objects, because<br>
GTT objects get populated on first validate, and VRAM doesn&#39;t<br>
use TT.&#39;<br>
<br>
I&#39;d probably move this fix into ttm_bo_setup_export() and post it for<b=
r>
discussion.<br>
<br>
It may also be the case that the ttm_tt preallocated with<br>
XE_BO_FLAG_DEFER_BACKING should be dropped once the BO moves to VRAM, as<br=
>
that dangling ttm_tt could cause other issues. I&#39;ll need to take a<br>
closer look at that angle.<br>
<br>
&gt; The regression test creates both the control case and the VRAM migrati=
on<br>
&gt; case. The control case creates the deferred BO in system RAM and leave=
s<br>
&gt; it there, which requires a TT and population when xe_gem_prime_export(=
) is<br>
&gt; called. The VRAM migration case creates the deferred BO in system RAM<=
br>
&gt; and then migrates it to VRAM, which does not require a TT and thus, wh=
en<br>
&gt; xe_gem_prime_export() is called, no population occurs.<br>
&gt;<br>
<br>
This part looks good as different patch from what I&#39;m assuming will be =
a<br>
TTM fix.<br>
<br>
Matt<br>
<br>
&gt; Fixes: 91494dee1091 (&quot;xe: populate buffers before exporting them.=
&quot;)<br>
&gt; Cc: <a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable=
@vger.kernel.org</a><br>
&gt; Assisted-by: Codex:gpt-5.6-sol<br>
&gt; Signed-off-by: Nathan Bourgeois &lt;<a href=3D"mailto:iridescentrosesf=
all@gmail.com" target=3D"_blank">iridescentrosesfall@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Newer Testing:<br>
&gt; - Built and booted b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6 plus this =
patch on EPYC 7352 with six Intel Arc Pro B70.<br>
&gt; - KUnit xe_live_test: xe_dma_buf_kunit: pass:6 fail:0 skip:0 total:6 P=
ASS<br>
&gt; - vLLM 0.27.1 loading DeepSeek-V4-Flash-0731 (full model compared to R=
EAP) on six Intel Arc Pro B70 GPUs: No OOM error, 17.82 GB delta.<br>
&gt;=C2=A0 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 105 ++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 drivers/gpu/drm/xe/xe_dma_buf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 28 ++++++-<br>
&gt;=C2=A0 2 files changed, 132 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/x=
e/tests/xe_dma_buf.c<br>
&gt; index 0be8440b3976..bff803ab7a57 100644<br>
&gt; --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c<br>
&gt; +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c<br>
&gt; @@ -260,12 +260,117 @@ static const struct dma_buf_test_params test_pa=
rams[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +static void xe_test_dmabuf_export_deferred(struct xe_device *xe, u32 =
bo_flags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 =
mem_type, bool expect_populated)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct kunit *test =3D kunit_get_current_test();<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ttm_resource_manager *man;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dma_buf *dmabuf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct xe_bo *bo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t size =3D PAGE_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* No VRAM on device? */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ttm_manager_type(&amp;xe-&gt;ttm, mem_type))=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mem_type =3D=3D XE_PL_VRAM0 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe-&gt;info.vram_flags &amp; XE_VRA=
M_FLAGS_NEED64K)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D SZ_64K;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * DEFER_BACKING places the BO in SYSTEM and crea=
tes a ttm_tt which<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * is unpopulated. In the case of VRAM, migrating=
 leaves the ttm_tt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * retained and unpopulated while VRAM becomes th=
e real backing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bo =3D xe_bo_create_user(xe, NULL, size, DRM_XE_G=
EM_CPU_CACHING_WC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo_flags | XE_BO_FLAG_DEFER_BACKING, NULL);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(bo)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_FAIL(test, &quo=
t;BO creation failed: %pe\n&quot;, bo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D xe_bo_lock(bo, false);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_FAIL(test, &quo=
t;BO lock failed: %d\n&quot;, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_put_bo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (bo-&gt;ttm.resource-&gt;mem_type !=3D mem_typ=
e)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D xe_bo_migrate=
(bo, mem_type, NULL, exec);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_FAIL(test, &quo=
t;BO migration to %u failed: %d\n&quot;, mem_type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0man =3D ttm_manager_type(bo-&gt;ttm.bdev, bo-&gt;=
ttm.resource-&gt;mem_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!man || !bo-&gt;ttm.ttm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_FAIL(test, &quo=
t;Expected a retained unpopulated TT\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Precondition: ttm_tt starts unpopulated after =
migration */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, man-&gt;use_tt, expect_popu=
lated);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo-&=
gt;ttm.ttm));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xe_bo_unlock(bo);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dmabuf =3D xe_gem_prime_export(&amp;bo-&gt;ttm.ba=
se, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(dmabuf)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_FAIL(test, &quo=
t;dma-buf export failed: %pe\n&quot;, dmabuf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_put_bo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D xe_bo_lock(bo, false);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_FAIL(test, &quo=
t;post-export BO lock failed: %d\n&quot;, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_put_dmabuf;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Postcondition: if VRAM, ttm_tt remains unpopul=
ated, if SYSTEM ttm_tt is populated */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test, bo-&gt;ttm.resource-&gt;mem=
_type, mem_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_NOT_NULL(test, bo-&gt;ttm.ttm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (bo-&gt;ttm.ttm)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KUNIT_EXPECT_EQ(test,=
 ttm_tt_is_populated(bo-&gt;ttm.ttm),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expect_populated);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xe_bo_unlock(bo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_buf_put(dmabuf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_gem_object_put(&amp;bo-&gt;ttm.base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +out_unlock:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xe_bo_unlock(bo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto out_put_bo;<br>
&gt; +out_put_dmabuf:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dma_buf_put(dmabuf);<br>
&gt; +out_put_bo:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_gem_object_put(&amp;bo-&gt;ttm.base);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int dma_buf_run_device(struct xe_device *xe)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dma_buf_test_params *params;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct kunit *test =3D kunit_get_current_tes=
t();<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0guard(xe_pm_runtime)(xe);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * A retained TT must not be populated when VRAM =
is the backing<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * resource.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_VRA=
M0, XE_PL_VRAM0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Control case: deferred SYSTEM backing must sti=
ll be populated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * before export.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_SYS=
TEM, XE_PL_SYSTEM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 true);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (params =3D test_params; params-&gt;mem_=
mask; ++params) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_t=
est_params p =3D *params;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_d=
ma_buf.c<br>
&gt; index bf0728838ead..0c4e4e2e1a81 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_dma_buf.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_dma_buf.c<br>
&gt; @@ -219,6 +219,32 @@ static const struct dma_buf_ops xe_dmabuf_ops =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.vunmap =3D drm_gem_dmabuf_vunmap,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +static int xe_dma_bo_setup_export(struct ttm_buffer_object *tbo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_operation_ctx *ctx)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ttm_resource_manager *man =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_reserve(tbo, false, false, NULL);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tbo-&gt;resource)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0man =3D ttm_manager_t=
ype(tbo-&gt;bdev, tbo-&gt;resource-&gt;mem_type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Do not populate BO-sized system pages when bac=
ked by a non-TT resource.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This is Xe-specific; the generic ttm_bo_setup_=
export() always populates.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (man &amp;&amp; !man-&gt;use_tt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_popula=
te(tbo, ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ttm_bo_unreserve(tbo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, =
int flags)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct xe_bo *bo =3D gem_to_xe_bo(obj);<br>
&gt; @@ -257,7 +283,7 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem=
_object *obj, int flags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xe_bo_willneed_get_locked(bo);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xe_bo_unlock(bo);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D ttm_bo_setup_export(&amp;bo-&gt;ttm, &amp=
;ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D xe_dma_bo_setup_export(&amp;bo-&gt;ttm, &=
amp;ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_put;<br=
>
&gt;=C2=A0 <br>
&gt; <br>
&gt; base-commit: b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6<br>
&gt; -- <br>
&gt; 2.55.0<br>
&gt; <br>
</blockquote></div>

--000000000000203d2806597e5078--

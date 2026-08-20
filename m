Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93602C5DF89
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 12:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886F10E4C4;
	Fri, 21 Aug 2026 12:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="n950560h";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA74A10F16A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 18:57:05 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c15cd3fd760so21355366b.2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 11:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787252224; cv=none;
 d=google.com; s=arc-20260327;
 b=IXEqPmg/cwgbJfdwixvL04gf288Rg5IvslQcYEx+rHLZPqZPxkySgRK4JzHX1yJO+I
 u5B8h/4KXrf/cQQADqy0dDth7ENC7XNZUhq2Em4Dwp6TGlYjcfGybQHC49tCNxXeBbaV
 e+VmTgjwktn8O62t1JYfz2fIObURKccdXor4rd9jyicm/rmrrtAAfpOKfmIgJniypLZT
 RAhjM4z9q/FhOMstIEhRu+q4lvGL3sbR2Vo1vKzWOPTFyqB9QbtcDKbyokfB1JiS7zPX
 p2CX1GWNvscwNSaQ3AIJYuksySkB0iIuf3iQDZOFsQ1f0f8ED818UU2KBUDlO6876dzf
 F8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=28nTqNIXpFZIlYV3zkCCU4nW4w23pcpXcVdHEcaI6bo=;
 fh=tdY4gMVmj8PFjqvkUnl7sST2Y9kuGryD0l8hDwV3LzU=;
 b=HpLdNjOx+H4SjqdUNxHSRubpUja5tFEiGPyH96RmD+c0qRzMwm0kvsE2aySMcT4i00
 GJgCLmpZjRLIjVgJ4BS3eWdMvzh/gl2T3s4piniManpSA+CjqwnHPEPXdrJGTycb+r9h
 ABT8f0AyQJcd7jTr0ZYnGjYxqFWC0Hf6zeU9cHNTC5OVVaU8POEfV1hBZSa8TZu3Vr/0
 9tES1WVXx6FX3uCKLbomFYTBfGD78Z8SIIe7QRZKb0xyjOqQOER+LYQOhbAGGN43Gfrs
 8NThKV3M3nvAhaHPGMnhv6VzmFf60lkchD1Cfg9Zz4Ylz04maeiUaHTvOVTUgLoj7FIH
 DxBQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787252224; x=1787857024; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=28nTqNIXpFZIlYV3zkCCU4nW4w23pcpXcVdHEcaI6bo=;
 b=n950560hbYNB3vAiVTJ9IfULF9CluQ5RqT32unbzsRDUKjS+adVijcae06wb1Tb75c
 Lwlix/p+R5992bYeM0S0t/2f2MIFjvWy57RZP9MeZFXvmSapilnrzdrHmguIYksprPbn
 t6uIL7qZA1owlVxMOhNYjpwoe+PkoG5V69FqN06OuSpcTlLrc0FRi2XPMXsuQi9qhEk5
 xwLx2M+CCGtDgSjW8/S1hwWefVIBJGhPhPLH4P5EamYGjScLSy31oZK/cYJocfZeo8Ji
 A0cCDLbTV4GXL0sxAdSX4Rk+RythgMmWwNNCmZISGJVaod5RDxuCem+F1RkzBkrqpm/z
 MnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787252224; x=1787857024;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=28nTqNIXpFZIlYV3zkCCU4nW4w23pcpXcVdHEcaI6bo=;
 b=sKllNQKaWXkWxn87lARhcwrC+OzM0aAcUlNDMssymOHahSj+cU27ZOuTXPfGm3e1dF
 uDcgR8X6IwJBgQ4HqJm0q5a5D2IrkR++hmm4Qvzhgb1uICVuZZt8XbFbZEGrX11VVq3j
 6IeDqv4fDN1DWGGZtuQIaKbLt9AIiy3kUF3BAcl2PjAEd+9OlhRpl+RtlqrpjMnBK31D
 N7Iz64M9AxYnpOdox1a27MoJsYLdVQIZxl5rSfoEOtSrmPIJtdgLGc+aRNyWRQUV6+cB
 7LkgvCk+yTzX0hml2Bc28T0lk/Cwtj6KgoLFYqYyEDkh3AH7SSgNndgRbAIlqtnOFgYe
 okLQ==
X-Gm-Message-State: AOJu0YxJ0Lo0DEbN45+tVySuoKHGu+1UuiJAppXKvQ0uj+8PbvoiaCFa
 eftPen6xJ3hvCbYKuDSVrUFKrRWpbeBZFneyEjo/ZguOrT/pAEb1hi/UGa7xXZcEx+Vc6NdzUrM
 O6sa09OP3HEW1UXQAm3X+lop0T0ROqXk=
X-Gm-Gg: AR+sD12VZSWAr+LPMp5yHGH8Qfj+2Sad3UUOTeU6nakA8e+8+8DuOVKwXhS2ELWgagk
 2OjF9obI0bIYqF6qDZNyku7jsZ2QmFReInwDfF+hA/NuJak7ULzeoUiVcZTMJ2Fv/Cywus1c9pL
 N9udeyglhBkfdu2HOQzGmyS0Yi4UbprPU0UJBM7vY4nrnVAs77Rc8N7lZfZEovV1+azQ1rn2ChV
 gMDa//quku9vc86PJg01X24yXMKiu4gucgCjus+/X2qSe6y5v4hnHcQZe49QidaxQdHGGbeKHQ4
 kkwftj8Iax63xp0PlMxBQ7QBIA0FPNiH+oeJUDczH2CwbnjhEdjiuVt+/dyO9zMGoW7xpTv23mx
 XbhokkNMlUxQHen05sUH1IJuX8J6XiNfaxkfuCa5fzMjC
X-Received: by 2002:a17:907:7241:b0:c1f:1520:4de5 with SMTP id
 a640c23a62f3a-c246a4ac5ebmr40748266b.1.1787252223895; Thu, 20 Aug 2026
 11:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
 <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com>
 <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
In-Reply-To: <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
From: Nathan Bourgeois <iridescentrosesfall@gmail.com>
Date: Thu, 20 Aug 2026 14:56:52 -0400
X-Gm-Features: AcwNN1VFZVoBAP2FCtCz66XiuMlgDrXl0LKdENv4zVBal7urDS7LMc0qfIITFeM
Message-ID: <CAMpTW2fxFRrpn1b5WGYBrtLLMfUo_fmx9s2D0b552GJp-sF5qg@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,
Sorry, I replied only to Matt by mistake earlier and didn't realize it
was text-only. Here's the same reply for the list:

Hi Matt,

Thank you so much for reviewing this!

> Reading the commit which added ttm_bo_setup_export, to me this looks
> like a bug in ttm_bo_setup_export() or in general TTM.

> 'This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.'

> I'd probably move this fix into ttm_bo_setup_export() and post it for
> discussion.

I agree that this is a much cleaner and smaller fix, I initially wanted to =
keep
the change scoped only to xe where it was causing an observable issue,
but I will move it into ttm_bo_setup_export() given your recommendation.

> It may also be the case that the ttm_tt preallocated with
> XE_BO_FLAG_DEFER_BACKING should be dropped once the BO moves to VRAM, as
> that dangling ttm_tt could cause other issues. I'll need to take a
> closer look at that angle.

Yes, considering that this is essentially the source of this particular beh=
avior
it stands to reason that there may be other latent correctness issues cause=
d
by the dangling ttm_tt.

> This part looks good as different patch from what I'm assuming will be a
> TTM fix.

Yes, I'll submit a patch with RFC for discussing the ttm_bo_setup_export()
changes and a second patch for the unit test.

Best Regards,
Nathan Bourgeois


On Thu, Aug 20, 2026 at 2:01=E2=80=AFPM Nathan Bourgeois
<iridescentrosesfall@gmail.com> wrote:
>
> Hi,
>
> Sorry, I replied only to Matt by mistake earlier. Here's the same reply f=
or the list:
>
> Hi Matt, Thank you so much for reviewing this! > Reading the commit which=
 added ttm_bo_setup_export, to me this looks
> > like a bug in ttm_bo_setup_export() or in general TTM.
>
> > 'This only applies currently to TTM_PL_SYSTEM objects, because
> > GTT objects get populated on first validate, and VRAM doesn't
> > use TT.'
>
> > I'd probably move this fix into ttm_bo_setup_export() and post it for
> > discussion.
>
> I agree that this is a much cleaner and smaller fix, I initially wanted t=
o keep
> the change scoped only to xe where it was causing an observable issue,
> but I will move it into ttm_bo_setup_export() given your recommendation.
>
> > It may also be the case that the ttm_tt preallocated with
> > XE_BO_FLAG_DEFER_BACKING should be dropped once the BO moves to VRAM, a=
s
> > that dangling ttm_tt could cause other issues. I'll need to take a
> > closer look at that angle.
>
> Yes, considering that this is essentially the source of this particular b=
ehavior
> it stands to reason that there may be other latent correctness issues cau=
sed
> by the dangling ttm_tt.
>
> > This part looks good as different patch from what I'm assuming will be =
a
> > TTM fix.
>
> Yes, I'll submit a patch with RFC for discussing the ttm_bo_setup_export(=
)
> changes and a second patch for the unit test.
>
> Best Regards,
> Nathan Bourgeois
>
> On Thu, Aug 20, 2026 at 1:03=E2=80=AFPM Matthew Brost <matthew.brost@inte=
l.com> wrote:
>>
>> On Wed, Aug 19, 2026 at 11:19:01PM -0400, Nathan Bourgeois wrote:
>>
>> Thanks the patch.
>>
>> > When a buffer object (BO) has a created but unpopulated ttm_tt and is
>> > exported, the default behavior populates the ttm_tt, even if the manag=
er
>> > does not require a TT. This unnecessary host-side population reduces
>> > host memory available to the user.
>> >
>> > This occurs when a BO is created with XE_BO_FLAG_DEFER_BACKING and
>> > migration places the BO into a resource whose manager does not use the
>> > TT backing. The retained ttm_tt is not authoritative for storage, yet
>> > the default ttm_bo_setup_export() treats the existence of the ttm_tt a=
s
>> > requiring population.
>> >
>>
>> Thanks for explaining this, I see the problem.
>>
>> > The issue was reproduced with vLLM 0.27.1 loading
>> > 0xSer0/DeepSeek-V4-Flash-180B (d3c704b) on a system with 128 GB of RAM
>> > and six Intel Arc Pro B70 GPUs providing 192 GB of VRAM. Loading the
>> > weights (100.61 GB) triggered host-memory exhaustion and OOM events on
>> > the baseline kernel.
>> >
>> > On Ubuntu 24.04 with 7.0-12-generic, the vLLM service cgroup grew by
>> > 115.84 GB on the instrumented baseline and by 15.34 GB with this chang=
e,
>> > a reduction of 100.50 GB. Diagnostic instrumentation counting cumulati=
ve
>> > TT pages across all six GPUs recorded 109.22 GB on baseline and 8.72 G=
B
>> > with this change. The reduction is 0.11 GB less than the model weight
>> > size.
>> >
>> > The change creates an Xe-local export setup helper which skips
>> > ttm_bo_populate() when the BO has a current resource manager and if th=
at
>> > manager has use_tt =3D=3D false. If the manager does not use TT, then
>> > population is skipped, while an absent manager conservatively calls
>> > ttm_bo_populate(). Behavior for a manager which requires a TT backing
>> > remains unchanged. Keep this policy local to Xe so other TTM drivers
>> > retain their existing export behavior.
>> >
>>
>> Reading the commit which added ttm_bo_setup_export, to me this looks
>> like a bug in ttm_bo_setup_export() or in general TTM.
>>
>> git format-patch -1 50243079865ae
>>
>> 'This only applies currently to TTM_PL_SYSTEM objects, because
>> GTT objects get populated on first validate, and VRAM doesn't
>> use TT.'
>>
>> I'd probably move this fix into ttm_bo_setup_export() and post it for
>> discussion.
>>
>> It may also be the case that the ttm_tt preallocated with
>> XE_BO_FLAG_DEFER_BACKING should be dropped once the BO moves to VRAM, as
>> that dangling ttm_tt could cause other issues. I'll need to take a
>> closer look at that angle.
>>
>> > The regression test creates both the control case and the VRAM migrati=
on
>> > case. The control case creates the deferred BO in system RAM and leave=
s
>> > it there, which requires a TT and population when xe_gem_prime_export(=
) is
>> > called. The VRAM migration case creates the deferred BO in system RAM
>> > and then migrates it to VRAM, which does not require a TT and thus, wh=
en
>> > xe_gem_prime_export() is called, no population occurs.
>> >
>>
>> This part looks good as different patch from what I'm assuming will be a
>> TTM fix.
>>
>> Matt
>>
>> > Fixes: 91494dee1091 ("xe: populate buffers before exporting them.")
>> > Cc: stable@vger.kernel.org
>> > Assisted-by: Codex:gpt-5.6-sol
>> > Signed-off-by: Nathan Bourgeois <iridescentrosesfall@gmail.com>
>> > ---
>> > Newer Testing:
>> > - Built and booted b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6 plus this =
patch on EPYC 7352 with six Intel Arc Pro B70.
>> > - KUnit xe_live_test: xe_dma_buf_kunit: pass:6 fail:0 skip:0 total:6 P=
ASS
>> > - vLLM 0.27.1 loading DeepSeek-V4-Flash-0731 (full model compared to R=
EAP) on six Intel Arc Pro B70 GPUs: No OOM error, 17.82 GB delta.
>> >  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 105 +++++++++++++++++++++++++=
+
>> >  drivers/gpu/drm/xe/xe_dma_buf.c       |  28 ++++++-
>> >  2 files changed, 132 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/x=
e/tests/xe_dma_buf.c
>> > index 0be8440b3976..bff803ab7a57 100644
>> > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> > @@ -260,12 +260,117 @@ static const struct dma_buf_test_params test_pa=
rams[] =3D {
>> >       {}
>> >  };
>> >
>> > +static void xe_test_dmabuf_export_deferred(struct xe_device *xe, u32 =
bo_flags,
>> > +                                        u32 mem_type, bool expect_pop=
ulated)
>> > +{
>> > +     struct drm_exec *exec =3D XE_VALIDATION_OPT_OUT;
>> > +     struct kunit *test =3D kunit_get_current_test();
>> > +     struct ttm_resource_manager *man;
>> > +     struct dma_buf *dmabuf;
>> > +     struct xe_bo *bo;
>> > +     size_t size =3D PAGE_SIZE;
>> > +     int err;
>> > +
>> > +     /* No VRAM on device? */
>> > +     if (!ttm_manager_type(&xe->ttm, mem_type))
>> > +             return;
>> > +
>> > +     if (mem_type =3D=3D XE_PL_VRAM0 &&
>> > +         xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>> > +             size =3D SZ_64K;
>> > +
>> > +     /*
>> > +      * DEFER_BACKING places the BO in SYSTEM and creates a ttm_tt wh=
ich
>> > +      * is unpopulated. In the case of VRAM, migrating leaves the ttm=
_tt
>> > +      * retained and unpopulated while VRAM becomes the real backing.
>> > +      */
>> > +     bo =3D xe_bo_create_user(xe, NULL, size, DRM_XE_GEM_CPU_CACHING_=
WC,
>> > +                            bo_flags | XE_BO_FLAG_DEFER_BACKING, NULL=
);
>> > +     if (IS_ERR(bo)) {
>> > +             KUNIT_FAIL(test, "BO creation failed: %pe\n", bo);
>> > +             return;
>> > +     }
>> > +
>> > +     err =3D xe_bo_lock(bo, false);
>> > +     if (err) {
>> > +             KUNIT_FAIL(test, "BO lock failed: %d\n", err);
>> > +             goto out_put_bo;
>> > +     }
>> > +
>> > +     if (bo->ttm.resource->mem_type !=3D mem_type)
>> > +             err =3D xe_bo_migrate(bo, mem_type, NULL, exec);
>> > +     if (err) {
>> > +             KUNIT_FAIL(test, "BO migration to %u failed: %d\n", mem_=
type,
>> > +                        err);
>> > +             goto out_unlock;
>> > +     }
>> > +
>> > +     man =3D ttm_manager_type(bo->ttm.bdev, bo->ttm.resource->mem_typ=
e);
>> > +     if (!man || !bo->ttm.ttm) {
>> > +             KUNIT_FAIL(test, "Expected a retained unpopulated TT\n")=
;
>> > +             goto out_unlock;
>> > +     }
>> > +
>> > +     /* Precondition: ttm_tt starts unpopulated after migration */
>> > +     KUNIT_EXPECT_EQ(test, man->use_tt, expect_populated);
>> > +     KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm.ttm));
>> > +
>> > +     xe_bo_unlock(bo);
>> > +
>> > +     dmabuf =3D xe_gem_prime_export(&bo->ttm.base, 0);
>> > +     if (IS_ERR(dmabuf)) {
>> > +             KUNIT_FAIL(test, "dma-buf export failed: %pe\n", dmabuf)=
;
>> > +             goto out_put_bo;
>> > +     }
>> > +
>> > +     err =3D xe_bo_lock(bo, false);
>> > +     if (err) {
>> > +             KUNIT_FAIL(test, "post-export BO lock failed: %d\n", err=
);
>> > +             goto out_put_dmabuf;
>> > +     }
>> > +
>> > +     /* Postcondition: if VRAM, ttm_tt remains unpopulated, if SYSTEM=
 ttm_tt is populated */
>> > +     KUNIT_EXPECT_EQ(test, bo->ttm.resource->mem_type, mem_type);
>> > +     KUNIT_EXPECT_NOT_NULL(test, bo->ttm.ttm);
>> > +     if (bo->ttm.ttm)
>> > +             KUNIT_EXPECT_EQ(test, ttm_tt_is_populated(bo->ttm.ttm),
>> > +                             expect_populated);
>> > +
>> > +     xe_bo_unlock(bo);
>> > +     dma_buf_put(dmabuf);
>> > +     drm_gem_object_put(&bo->ttm.base);
>> > +     return;
>> > +
>> > +out_unlock:
>> > +     xe_bo_unlock(bo);
>> > +     goto out_put_bo;
>> > +out_put_dmabuf:
>> > +     dma_buf_put(dmabuf);
>> > +out_put_bo:
>> > +     drm_gem_object_put(&bo->ttm.base);
>> > +}
>> > +
>> >  static int dma_buf_run_device(struct xe_device *xe)
>> >  {
>> >       const struct dma_buf_test_params *params;
>> >       struct kunit *test =3D kunit_get_current_test();
>> >
>> >       guard(xe_pm_runtime)(xe);
>> > +
>> > +     /*
>> > +      * A retained TT must not be populated when VRAM is the backing
>> > +      * resource.
>> > +      */
>> > +     xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_VRAM0, XE_PL_VRAM0=
,
>> > +                                    false);
>> > +
>> > +     /*
>> > +      * Control case: deferred SYSTEM backing must still be populated
>> > +      * before export.
>> > +      */
>> > +     xe_test_dmabuf_export_deferred(xe, XE_BO_FLAG_SYSTEM, XE_PL_SYST=
EM,
>> > +                                    true);
>> > +
>> >       for (params =3D test_params; params->mem_mask; ++params) {
>> >               struct dma_buf_test_params p =3D *params;
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_d=
ma_buf.c
>> > index bf0728838ead..0c4e4e2e1a81 100644
>> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> > @@ -219,6 +219,32 @@ static const struct dma_buf_ops xe_dmabuf_ops =3D=
 {
>> >       .vunmap =3D drm_gem_dmabuf_vunmap,
>> >  };
>> >
>> > +static int xe_dma_bo_setup_export(struct ttm_buffer_object *tbo,
>> > +                               struct ttm_operation_ctx *ctx)
>> > +{
>> > +     struct ttm_resource_manager *man =3D NULL;
>> > +     int ret;
>> > +
>> > +     ret =3D ttm_bo_reserve(tbo, false, false, NULL);
>> > +     if (ret)
>> > +             return ret;
>> > +
>> > +     if (tbo->resource)
>> > +             man =3D ttm_manager_type(tbo->bdev, tbo->resource->mem_t=
ype);
>> > +
>> > +     /*
>> > +      * Do not populate BO-sized system pages when backed by a non-TT=
 resource.
>> > +      * This is Xe-specific; the generic ttm_bo_setup_export() always=
 populates.
>> > +      */
>> > +     if (man && !man->use_tt)
>> > +             ret =3D 0;
>> > +     else
>> > +             ret =3D ttm_bo_populate(tbo, ctx);
>> > +
>> > +     ttm_bo_unreserve(tbo);
>> > +     return ret;
>> > +}
>> > +
>> >  struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int f=
lags)
>> >  {
>> >       struct xe_bo *bo =3D gem_to_xe_bo(obj);
>> > @@ -257,7 +283,7 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem=
_object *obj, int flags)
>> >       xe_bo_willneed_get_locked(bo);
>> >       xe_bo_unlock(bo);
>> >
>> > -     ret =3D ttm_bo_setup_export(&bo->ttm, &ctx);
>> > +     ret =3D xe_dma_bo_setup_export(&bo->ttm, &ctx);
>> >       if (ret)
>> >               goto out_put;
>> >
>> >
>> > base-commit: b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6
>> > --
>> > 2.55.0
>> >

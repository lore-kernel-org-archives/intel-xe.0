Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA44C7618A
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 16:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BA610E80A;
	Tue, 14 Mar 2023 16:02:45 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5126210E80A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 16:02:43 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o8so684492lfo.0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678809761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0cmTo2jiDDXx8fOGDK2iIpgLGAP+c/piWuVrF6HImc=;
 b=JNjXIm3YAiOO6C94Zpss0kyR9v5mgyc6k4wOJNF4JX8EdZtjvig/01YwD6MpaePmSm
 tWYMQ/tO+hSd6UQUED7g/+lSdPsZjpmqaZL+JeYaAHzKgQ2p6gnpsMnV05jWq+vaLvjO
 et2ZUiw7EzV8+iz9mRsE/50EcrdT70zGyk5CMHX+2nHk26JUyMZF7NY0+jZR00O/6/9C
 1zDaQQF39IdC+Krpt6q1YUPv064zdB974C76qdyGhfyZUudOy6QiboBb5FPYq1rRdAxY
 5NAZaCh1G8K7ktcnIvPWdAKHTPii/LHsFnQg5yncUzDWhtWs8bwFkU775ct9r0lMUvE5
 maww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678809761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0cmTo2jiDDXx8fOGDK2iIpgLGAP+c/piWuVrF6HImc=;
 b=jKNbjRqsbKYnDQE7VtS1UyqnSDW9tUeay5STyuhdJ2oJXRU9iQhD/fWTYiUqLl8KVV
 map8gUAsyhLYCNlYm/nfmdBeKE4dgGiAvx/EIeoHmbAJdFwaqLSi0TTOu+ItiZ5aXFTM
 eNsQGZuPVsR8pesBYDcQ7GvhLfshqjGtphiqdTE4vuzNjXb0ZnNCJEfm8b6f0Gbi8cuh
 bJZvWzLKsdyiYpttgY+TcYkzUr9+5iTURp/5gFZczo5xe5IK2RsdYajD4pyDkjqx+lJH
 sQG+D3/LdlHMbdxzM0HQjluvEyco2sFFuAN6Lc1hu+O5o5Zo8m6QjqrW5VNMfyX00ttV
 hrPg==
X-Gm-Message-State: AO0yUKUFiohjrBoH8BPZ3ZhW5Wc1dd+fMo/IBfjSomvm7piflZWXpGl3
 XmfEbzXcf5hc4WhOGnwr0fNClMSlNMBJrzu82eE+sg2b28E=
X-Google-Smtp-Source: AK7set8QV7QPVKd1P5hJPwUDeDrkSGqbgflThWRejjk7KO3ZUnM1u9MTJl1t7iHVE7sdflzZuByWu2NUj8Y76y5ofEM=
X-Received: by 2002:ac2:5df9:0:b0:4db:2554:93a2 with SMTP id
 z25-20020ac25df9000000b004db255493a2mr931187lfq.10.1678809761218; Tue, 14 Mar
 2023 09:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-2-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMfN2z3FV75PDNMtwRYMTDV2PgKk2R1iKm3MtgcS9=Rrw@mail.gmail.com>
 <e5ac0c2e-1812-ff2f-680d-f49c40fea72b@linux.intel.com>
In-Reply-To: <e5ac0c2e-1812-ff2f-680d-f49c40fea72b@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 16:02:13 +0000
Message-ID: <CAM0jSHOHKP0NdoOvdg-Z97UfH08tN1dqZUCSTSW1TCXQWq9oag@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: Use a define to set initial
 seqno for fences
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

On Tue, 14 Mar 2023 at 13:03, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 3/14/23 12:54, Matthew Auld wrote:
> > On Mon, 13 Mar 2023 at 20:46, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> >> Also for HW fences, write the initial seqno - 1 to the HW completed
> >> seqno to initialize.
> >>
> >> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com=
>
> >> ---
> >>   drivers/gpu/drm/xe/xe_engine.c   | 5 +++--
> >>   drivers/gpu/drm/xe/xe_hw_fence.c | 5 ++---
> >>   drivers/gpu/drm/xe/xe_hw_fence.h | 2 ++
> >>   drivers/gpu/drm/xe/xe_lrc.c      | 3 +++
> >>   4 files changed, 10 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_en=
gine.c
> >> index 3b6f8a25112a..7e6367a84f1f 100644
> >> --- a/drivers/gpu/drm/xe/xe_engine.c
> >> +++ b/drivers/gpu/drm/xe/xe_engine.c
> >> @@ -13,6 +13,7 @@
> >>
> >>   #include "xe_device.h"
> >>   #include "xe_gt.h"
> >> +#include "xe_hw_fence.h"
> >>   #include "xe_lrc.h"
> >>   #include "xe_macros.h"
> >>   #include "xe_migrate.h"
> >> @@ -57,11 +58,11 @@ static struct xe_engine *__xe_engine_create(struct=
 xe_device *xe,
> >>
> >>          if (xe_engine_is_parallel(e)) {
> >>                  e->parallel.composite_fence_ctx =3D dma_fence_context=
_alloc(1);
> >> -               e->parallel.composite_fence_seqno =3D 1;
> >> +               e->parallel.composite_fence_seqno =3D XE_FENCE_INITIAL=
_SEQNO;
> >>          }
> >>          if (e->flags & ENGINE_FLAG_VM) {
> >>                  e->bind.fence_ctx =3D dma_fence_context_alloc(1);
> >> -               e->bind.fence_seqno =3D 1;
> >> +               e->bind.fence_seqno =3D XE_FENCE_INITIAL_SEQNO;
> >>          }
> >>
> >>          for (i =3D 0; i < width; ++i) {
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_=
hw_fence.c
> >> index e56ca2867545..ca8304650713 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> >> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> >> @@ -129,7 +129,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *=
ctx, struct xe_gt *gt,
> >>          ctx->gt =3D gt;
> >>          ctx->irq =3D irq;
> >>          ctx->dma_fence_ctx =3D dma_fence_context_alloc(1);
> >> -       ctx->next_seqno =3D 1;
> >> +       ctx->next_seqno =3D XE_FENCE_INITIAL_SEQNO;
> >>          sprintf(ctx->name, "%s", name);
> >>   }
> >>
> >> @@ -164,8 +164,7 @@ static bool xe_hw_fence_signaled(struct dma_fence =
*dma_fence)
> >>          struct xe_device *xe =3D gt_to_xe(fence->ctx->gt);
> >>          u32 seqno =3D xe_map_rd(xe, &fence->seqno_map, 0, u32);
> >>
> >> -       return dma_fence->error ||
> >> -               (s32)fence->dma.seqno <=3D (s32)seqno;
> >> +       return dma_fence->error || (s32)(u32)fence->dma.seqno <=3D (s3=
2)seqno;
> > Why do we need this change? Also the hw fence dma.seqno should always
> > be u32, right?
>
> Thanks for reviewing, Matt.
>
> Yes the value should always be u32, but the type is u64, and I read
> somewhere that casting an u64 to s32 could yield
> implementation-dependent results. I could double-check that, or actually
> even use __dma_fence_is_later(). That seems to be the best choice.

Ok, sounds good.

>
> /Thomas
>
>
>
> >
> >>   }
> >>
> >>   static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence=
)
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_=
hw_fence.h
> >> index 07f202db6526..523c2611ef5d 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> >> +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> >> @@ -8,6 +8,8 @@
> >>
> >>   #include "xe_hw_fence_types.h"
> >>
> >> +#define XE_FENCE_INITIAL_SEQNO 1
> >> +
> >>   int xe_hw_fence_module_init(void);
> >>   void xe_hw_fence_module_exit(void);
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> >> index 9140b057a5ba..fb8c6f7d6528 100644
> >> --- a/drivers/gpu/drm/xe/xe_lrc.c
> >> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> >> @@ -697,6 +697,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_e=
ngine *hwe,
> >>          arb_enable =3D MI_ARB_ON_OFF | MI_ARB_ENABLE;
> >>          xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
> >>
> >> +       map =3D __xe_lrc_seqno_map(lrc);
> >> +       xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno=
 - 1);
> >> +
> >>          return 0;
> >>
> >>   err_lrc_finish:
> >> --
> >> 2.39.2
> >>

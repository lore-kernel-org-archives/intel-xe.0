Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F14EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 18:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF12D10E0A0;
	Thu, 15 Jun 2023 18:21:15 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033BD10E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 18:21:12 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b34969e65fso33133591fa.3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686853271; x=1689445271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=myy4Ila2BLT3yWs1aPXa1cRPbGPXzTTuDYG1meORtxg=;
 b=e3jXoO0tXaiWp5/EcSd7e8Vf/IpriPrRTYWBHu8lgY2Jz882hXjwxxFPPUZ9h+Ou9I
 6Ryj3W2PuDkYsSVGvVmq9PYtBjN/AGAvIZMBZD4sm+FDAhBHp7uJc2DGdsMSmQyOb/a1
 twtOBu2K+R6qwDk5zifsu3CJtan612+zNoNJRJPzpgNA/zyvLKxb1c8mPZxlZEsgaXSX
 gRTJKTXT4LLKE8OxQ+anG1rXPGiB/r3HtzOtsQv5b9/f+PIEhpMK/rcJn9YwPPjAMHzz
 NF+8Gp62HMZvTNw4idgJ1oqcQMz/mQXpsc6d0/YyfGYJqrP1Ca+TX1IBvYHtREIHd46D
 Nmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686853271; x=1689445271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myy4Ila2BLT3yWs1aPXa1cRPbGPXzTTuDYG1meORtxg=;
 b=Qvn2rN7nvkHWc8ceUQ+sA8YtYfDeSiIkryJIZjGKcResuj08NN5dw4nBJTY8UXKG0m
 +dQH59kKiQCQGBeNOpdUVfPwVqqH1vyKWu93j1HKjwuyCz1EIShrXX6zaSkuAN0Uu4Ac
 GRvTJt70ITIUJL0z3VHPztzXGtxLKXOThwIW5dszebucK64MO7NiTph27bNRUVzIrI9j
 xM4Doc7r0qJcvcaUJrdvE+xyRLCA7YrNdQ3qYBOXBBl1SNhBaROOlcSc79jXafL/fzTH
 kgn1eliTC51beGZQAXP1gbN0MBRsKKjYWMLgLItVlW/0NXdPcEZyvxoffgrc/LGSgMoV
 tP4A==
X-Gm-Message-State: AC+VfDyebrwv9lYGZ8Achjh6V4etjAuyGf6Gli5N+YyBFjClCV0in3zk
 Q1k3fOOQWxvvm1rFNF9PVZm5fXwntOa7X8nJZLo=
X-Google-Smtp-Source: ACHHUZ49VaidZch1QVsGZ6z7uIr45MD1lYLXElmnBAcpRkzSBC2tjR9d6DK+T/76uietljFIXSmbXNsvDftbiMpXe04=
X-Received: by 2002:a2e:3002:0:b0:2b4:466d:deab with SMTP id
 w2-20020a2e3002000000b002b4466ddeabmr143412ljw.35.1686853270322; Thu, 15 Jun
 2023 11:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
 <CAM0jSHMO+2qWYJMyt7D-vS740NmFcPH+MzcW=Qg+vz+st2kK0A@mail.gmail.com>
 <9a2854ac-0d33-a1cb-fc5e-9bfffcdd2490@intel.com>
In-Reply-To: <9a2854ac-0d33-a1cb-fc5e-9bfffcdd2490@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Jun 2023 19:20:43 +0100
Message-ID: <CAM0jSHMaP-cYTNN1dygFCzhFHq9h8EGu7jmAnt5m+8U+2LpzjA@mail.gmail.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: limit GGTT size to GUC_GGTT_TOP
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

On Thu, 15 Jun 2023 at 17:36, Ceraolo Spurio, Daniele
<daniele.ceraolospurio@intel.com> wrote:
>
>
>
> On 6/15/2023 1:55 AM, Matthew Auld wrote:
> > On Thu, 15 Jun 2023 at 01:25, Daniele Ceraolo Spurio
> > <daniele.ceraolospurio@intel.com> wrote:
> >> The GuC can't access addresses above GUC_GGTT_TOP, so any GuC-accessible
> >> objects can't be mapped above that offset. Instead of checking each
> >> object to see if GuC may access it or not before mapping it, we just
> >> limit the GGTT size to GUC_GGTT_TOP. This wastes a bit of address space
> >> (about ~18 MBs, which is in addition to what already removed at the bottom
> >> of the GGTT), but it is a good tradeoff to keep the code simple.
> >>
> >> The in-code comment has also been updated to explain the limitation.
> >>
> >> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/xe_ggtt.c | 24 ++++++++++++++++++------
> >>   1 file changed, 18 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> >> index bae9f66a33cb..7588fbc2f278 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> >> @@ -24,6 +24,9 @@
> >>   #define MTL_GGTT_PTE_PAT0      BIT_ULL(52)
> >>   #define MTL_GGTT_PTE_PAT1      BIT_ULL(53)
> >>
> >> +/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> >> +#define GUC_GGTT_TOP   0xFEE00000
> >> +
> >>   u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
> >>   {
> >>          struct xe_device *xe = xe_bo_device(bo);
> >> @@ -111,12 +114,18 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
> >>          /*
> >>           * 8B per entry, each points to a 4KB page.
> >>           *
> >> -        * The GuC owns the WOPCM space, thus we can't allocate GGTT address in
> >> -        * this area. Even though we likely configure the WOPCM to less than the
> >> -        * maximum value, to simplify the driver load (no need to fetch HuC +
> >> -        * GuC firmwares and determine there sizes before initializing the GGTT)
> >> -        * just start the GGTT allocation above the max WOPCM size. This might
> >> -        * waste space in the GGTT (WOPCM is 2MB on modern platforms) but we can
> >> +        * The GuC address space is limited on both ends of the GGTT, because
> >> +        * the GuC shim HW redirects accesses to those addresses to other HW
> >> +        * areas instead of going through the GGTT. On the bottom end, the GuC
> >> +        * can't access offsets below the WOPCM size, while on the top side the
> >> +        * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
> >> +        * checking each object to see if they are accessed by GuC or not, we
> >> +        * just exclude those areas from the allocator. Additionally, to
> >> +        * simplify the driver load, we use the maximum WOPCM size in this logic
> >> +        * instead of the programmed one, so we don't need to wait until the
> >> +        * actual size to be programmed is determined (which requires FW fetch)
> >> +        * before initializing the GGTT. These simplifications might waste space
> >> +        * in the GGTT (about 20-25 MBs depending on the platform) but we can
> >>           * live with this.
> >>           *
> >>           * Another benifit of this is the GuC bootrom can't access anything
> >> @@ -125,6 +134,9 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
> >>           * Starting the GGTT allocations above the WOPCM max give us the correct
> >>           * placement for free.
> >>           */
> >> +       if (ggtt->size > GUC_GGTT_TOP)
> >> +               ggtt->size = GUC_GGTT_TOP;
> >> +
> >>          drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
> >>                      ggtt->size - xe_wopcm_size(xe));
> > We also subtract the xe_wopcm_size(). Do you know if that is still
> > needed with GUC_GGTT_TOP?
>
> It is. The GGTT range is reduced from [0, 4GB] to [wopcm_size,
> GUC_GGTT_TOP], so we need to subtract wopcm_size to account for the
> chunk removed at the bottom.

Ahh right, fwiw.
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>
> Daniele
>
> >
> >>          mutex_init(&ggtt->lock);
> >> --
> >> 2.40.0
> >>
>

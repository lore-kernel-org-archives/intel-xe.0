Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB415EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 08:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0A610E49D;
	Thu, 15 Jun 2023 08:56:09 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2D510E49F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 08:56:07 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b44200367bso9569481fa.2
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686819365; x=1689411365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+TRM+JMuRe3/yAoDSuw7M5PvxW4XnOKKLaMQUiaZhRo=;
 b=lHhkrD+LuxRROH9VMSvlRPRTlP5aVTTmLjTpIaDiLfS90C9cpWN3mnYQt7rPPcI8k/
 Tt/i7zvYJHNC9buqxoHu5e2vIv1NNveJJ7e28YXygiq31LVBZxrdylOuGVIkwRXrY7cd
 Vrt/kgcZky/Za1L31h4CvvnecpmKVABbQQqeQavDJxjC5fsXecD4Jf2P4HYIWnphDCEA
 i6IFK/8gOKc4285xgI4/89/rGctR5wJJ11+itxIalq2zmajlYGEQ3rmPCAK2SHgLVEQw
 FuCBDo1mBj5YFELbDysH5rYzQ9YIx6hIUG3P/q0KFpyLwnJ/DHtGlbML4o9Ye9zdQ68x
 Jykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686819365; x=1689411365;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TRM+JMuRe3/yAoDSuw7M5PvxW4XnOKKLaMQUiaZhRo=;
 b=fZKUWnBdE/aCcSlJwv9YMQNgzSrhI+c+EdYpDpoq94e+zez7InCn9gSUuac8HpfuN6
 HUPMh8VK+qnAwlC/dJ6VMkBH7zU38bmnSZjzv14HU/69eT13QQYLK+cEH2I7K0q4rHkF
 z/uKqjzwxcFPNltvmBNWKZxB1y413jJ7E4l85MOYk9BpI8FeIgLYkey/i8a1XYBLefWt
 VHCsxwfWePI3BIbwTXka3EeZ76wE0DKDbzEBKNdQlrLlwL/Qw34fIztA9G70Mx5D1eFV
 pXPV/vbWwoH9ei5MiFPEoucGHpE6XCuAgzYov3fa+y9WjCTLF9DsKqE7r/9YstbnzqEW
 nq1w==
X-Gm-Message-State: AC+VfDwnhJFtWcQGeQC2k+ySgm/eAlz17vP5l5EwXNb7oAiTxdE54+yU
 GKXJcmYpdbB7uHe1rc3Ru73YegMlGKz3hS8sMTM=
X-Google-Smtp-Source: ACHHUZ40BHYZ9bkMow0+y/e/IIJvPM5pWf3mQ7yivkh/HEP10CMveIYVDCiSGKwkvj00d12PTVeymaGBkI97L4hnk3E=
X-Received: by 2002:a05:651c:d6:b0:2ac:8992:272d with SMTP id
 22-20020a05651c00d600b002ac8992272dmr7565426ljr.11.1686819365228; Thu, 15 Jun
 2023 01:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Jun 2023 09:55:38 +0100
Message-ID: <CAM0jSHMO+2qWYJMyt7D-vS740NmFcPH+MzcW=Qg+vz+st2kK0A@mail.gmail.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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

On Thu, 15 Jun 2023 at 01:25, Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> wrote:
>
> The GuC can't access addresses above GUC_GGTT_TOP, so any GuC-accessible
> objects can't be mapped above that offset. Instead of checking each
> object to see if GuC may access it or not before mapping it, we just
> limit the GGTT size to GUC_GGTT_TOP. This wastes a bit of address space
> (about ~18 MBs, which is in addition to what already removed at the bottom
> of the GGTT), but it is a good tradeoff to keep the code simple.
>
> The in-code comment has also been updated to explain the limitation.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index bae9f66a33cb..7588fbc2f278 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -24,6 +24,9 @@
>  #define MTL_GGTT_PTE_PAT0      BIT_ULL(52)
>  #define MTL_GGTT_PTE_PAT1      BIT_ULL(53)
>
> +/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> +#define GUC_GGTT_TOP   0xFEE00000
> +
>  u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  {
>         struct xe_device *xe = xe_bo_device(bo);
> @@ -111,12 +114,18 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>         /*
>          * 8B per entry, each points to a 4KB page.
>          *
> -        * The GuC owns the WOPCM space, thus we can't allocate GGTT address in
> -        * this area. Even though we likely configure the WOPCM to less than the
> -        * maximum value, to simplify the driver load (no need to fetch HuC +
> -        * GuC firmwares and determine there sizes before initializing the GGTT)
> -        * just start the GGTT allocation above the max WOPCM size. This might
> -        * waste space in the GGTT (WOPCM is 2MB on modern platforms) but we can
> +        * The GuC address space is limited on both ends of the GGTT, because
> +        * the GuC shim HW redirects accesses to those addresses to other HW
> +        * areas instead of going through the GGTT. On the bottom end, the GuC
> +        * can't access offsets below the WOPCM size, while on the top side the
> +        * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
> +        * checking each object to see if they are accessed by GuC or not, we
> +        * just exclude those areas from the allocator. Additionally, to
> +        * simplify the driver load, we use the maximum WOPCM size in this logic
> +        * instead of the programmed one, so we don't need to wait until the
> +        * actual size to be programmed is determined (which requires FW fetch)
> +        * before initializing the GGTT. These simplifications might waste space
> +        * in the GGTT (about 20-25 MBs depending on the platform) but we can
>          * live with this.
>          *
>          * Another benifit of this is the GuC bootrom can't access anything
> @@ -125,6 +134,9 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>          * Starting the GGTT allocations above the WOPCM max give us the correct
>          * placement for free.
>          */
> +       if (ggtt->size > GUC_GGTT_TOP)
> +               ggtt->size = GUC_GGTT_TOP;
> +
>         drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>                     ggtt->size - xe_wopcm_size(xe));

We also subtract the xe_wopcm_size(). Do you know if that is still
needed with GUC_GGTT_TOP?

>         mutex_init(&ggtt->lock);
> --
> 2.40.0
>

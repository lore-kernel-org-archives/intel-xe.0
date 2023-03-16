Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9533C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 12:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAD488C4C;
	Thu, 16 Mar 2023 12:22:01 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0953B88C4C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 12:21:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l22so1444229ljc.11
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678969317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xcjyRFyFgptLgcnr5aIXqNnBNDAPII+MMuk+uU3jhic=;
 b=UybkBnU1efgkXzATAeehlA71O2x0wMpfLLe+r9uZe3Mo0HvFFqZ0Zot2VGIVvMaIMn
 f6P83d5IPbnCj02GWV7gxu+I6lRJQKWR0vCTm4g6NGVNDMPWsFWGvbHYnaCrW8azuV4L
 LFb6VN0+YQrQYSuw8JgJRSSjYbBBzvSUgl2/yw8oNOdkW6T/rwuhQlL5nT1fpbuRvy1r
 iGpQHbSF7z4adMtCW0/M4TNWhmJcToO/GbkAIcFgepjfIk9BQTI0lrQOqSO4ojo2T/Ln
 rEgADiA0yvTMQndGWe6v7fX7mVYbHdT4px55Gz6u10BG45I8S5xdWiL2VTAelGhCDocU
 MVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678969317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xcjyRFyFgptLgcnr5aIXqNnBNDAPII+MMuk+uU3jhic=;
 b=a/IW8sMHcMb64C/dl25hZTUgzXN7GQYyv5JXgn989sn9YFuKrwytsy+aJvyC/UQo/D
 mmXgBxkASim9kM+rjhYFrf8YK7GwGVtTIn9LF4irFxxHLxaZ/jTJGB72lihqgTaBb9Kq
 zJHmMT6UeRbWMcp1COhcpWXytSHzcGlZvDCFZoQQe+rVOg9XyHpy0v5Z4x9Pi3zzUYox
 CUla2eAQ3Jdza36BX9RbSjd4IMLV0K7sRd319HImHJXUAqfqjZdhy7wm8BhrqAHXoJOM
 Siu0fVPYTTragZP1N8AHwJKxXA2TgObYBN6+iRpa1IdMILiwU5v48bdhemF+51CdhWxD
 azUA==
X-Gm-Message-State: AO0yUKXJxynSrnW5TWxxH+/a8VZHURtL4ZLaeHR6E86Ac99QH5e+0PMU
 MBcxcie5Gd/EJ/BDzW+7KSKk6f6ieylAYv4izTruecRNilmQJQ==
X-Google-Smtp-Source: AK7set/P5VYXC7j2Jee8MvMYcxmZ2C3pHYvlPKcvZlgdKB26xt8U0XGkH6ZPkoOmpjVTea3UAnymXXyHZNgPba1GcGs=
X-Received: by 2002:a2e:b534:0:b0:295:a32a:3664 with SMTP id
 z20-20020a2eb534000000b00295a32a3664mr2024738ljm.5.1678969317177; Thu, 16 Mar
 2023 05:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230316110752.129831-1-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 16 Mar 2023 12:21:29 +0000
Message-ID: <CAM0jSHPC9JOdBKw0JV-LUh-4SdQKi9n0_HHdbHT3aE4Lq0QLeQ@mail.gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix Alderlake-P and DG2 display info
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

On Thu, 16 Mar 2023 at 11:08, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> DG2 has cdclk squash, without which we calculate the CDCLK wrongly.
> Alderlake-P is LPD, not gen 12 display.
>
> With those fixed, display should work on both and all problems that were
> uncovered by testing done from rebasing are fixed.
>

Can we add:
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/210

Or is that a different issue?

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index f28553be858d..54ec8ba5d3f3 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -482,19 +482,27 @@ void xe_display_info_init(struct xe_device *xe)
>                 xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
>                 break;
>         case XE_ALDERLAKE_S:
> -       case XE_ALDERLAKE_P:
>                 xe->info.display = (struct xe_device_display_info) {
>                         GEN12_DISPLAY,
>                         .has_hti = 1,
>                         .has_psr_hw_tracking = 0,
>                 };
>                 break;
> +       case XE_ALDERLAKE_P:
> +               xe->info.display = (struct xe_device_display_info) {
> +                       XE_LPD,
> +                       .has_cdclk_crawl = 1,
> +                       .has_modular_fia = 1,
> +                       .has_psr_hw_tracking = 0,
> +               };
> +               break;
>         case XE_DG2:
>                 xe->info.display = (struct xe_device_display_info) {
>                         XE_LPD,
>                         .cpu_transcoder_mask =
>                                 BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>                                 BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
> +                       .has_cdclk_squash = 1,
>                 };
>                 break;
>         case XE_METEORLAKE:
> --
> 2.34.1
>

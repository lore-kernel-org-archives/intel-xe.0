Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A5CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B8D112744;
	Mon,  8 Apr 2024 16:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M3P18olB";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEEA112744
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712592023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzT0TmTCc3PocC0E+JBIML1F0GfPUfaU3FMisghLLDg=;
 b=M3P18olBV5paeTufzS8l90qSKIKkecvJXZ8JjXLaJ48Q/S/GdGL23W9zRkajD0Q+/kzMAB
 BxJ7fK+ea48sTcZemyjZNxTpUDHa18sqD2avJXDqHUVTErwwF8R503p5Otg/TIuvxI7NQR
 R1ho8bcWQI+dTy4VVxQY12ge9HUacHY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-CTiSnUIsOqK2x24G2XveNA-1; Mon, 08 Apr 2024 12:00:20 -0400
X-MC-Unique: CTiSnUIsOqK2x24G2XveNA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-56e58297218so510719a12.0
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Apr 2024 09:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712592018; x=1713196818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzT0TmTCc3PocC0E+JBIML1F0GfPUfaU3FMisghLLDg=;
 b=ZXpz1UpXfp+Lz7yhuTrp1HAd5pZBrWAUqeBXLo7VtimLThrO+bQjIZk+ufkbK/p35I
 fQUwnsc/hWu48w5981SOPgNvHTouiKmUDKVtJDNv3AOZ5TLQJubVcmES3H8DoemDiuZ1
 6QdHzOkabkJU5TUQK8MH3d40rx0IkAiuP0xZeuAZTXQsaj3LtkpkFi6QbCa6k4IlTGKj
 MIDZino0jkp99/6e1KPdDLcAwmhQGZ42QTA4xnvbCpgi9hiW35IUp7qICocS+vPfOr6b
 SUSFN5WUjkC8e++cJKNr8vAzyJAzpTYH6EcnIoDAejV1CF2KwK/KqC6/fQ2kSBEyUHD2
 kgZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW6UXfU9XUUys/FT/XTvgZ8fQ4IHf+KrNazRMnVAy8qOkf0ueo7OXW19+UpAnGihUvf1GnC5GdLOcY/D/fgLyg3cJn19ptZLKODdtGwPQ=
X-Gm-Message-State: AOJu0Yx7Va9uEqF5Vfp0V2WrCqFb8BYd4EIPu90ebAFYvoACDZKQ/zJM
 WfgSeaZqLVPCOgslNtkXAHuz2BjR2lezMwuEAoVF+S75ZDd5LG6/XzetLroNhI7UInG3eDXkhoq
 Xt0w5BlMabXajuCKkgHlZbmxu6AeN/QzSZlSa9pgkdbtL3trQaNyMSsQwvZo0deQ2ck2N2yn8YA
 9+0F9qqtTlTFdi/4j3uOln9qAggCrIlwiS4tJkBpZ9pt57Dg8=
X-Received: by 2002:a50:8a81:0:b0:56d:fca8:d209 with SMTP id
 j1-20020a508a81000000b0056dfca8d209mr6746750edj.10.1712592018033; 
 Mon, 08 Apr 2024 09:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo52vVJrQ0FGG8nNa/HY0uMoIxU2eMhB6fe+Tht1BFvEDfqO+atzRfiaR0I7oU7XLBMwQMR60tv+ZHmsFspzo=
X-Received: by 2002:a50:8a81:0:b0:56d:fca8:d209 with SMTP id
 j1-20020a508a81000000b0056dfca8d209mr6746732edj.10.1712592017681; Mon, 08 Apr
 2024 09:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712345787.git.jani.nikula@intel.com>
 <15935837a0c15f861bb2a688cc53514f47153ef3.1712345787.git.jani.nikula@intel.com>
 <xdp2oca3z7aaxohhxmlethruxuwnmz5jdcbshooyrte5fzndfy@agmh33pvzbvs>
In-Reply-To: <xdp2oca3z7aaxohhxmlethruxuwnmz5jdcbshooyrte5fzndfy@agmh33pvzbvs>
From: Josh Boyer <jwboyer@redhat.com>
Date: Mon, 8 Apr 2024 12:00:05 -0400
Message-ID: <CANyg3HgrEDfDav_ZuHxSe38v3H4w3Kr0ON4wZCFPEpqzNnE4LA@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/i915/dmc: define firmware URL locally
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 5, 2024 at 4:29=E2=80=AFPM Lucas De Marchi <lucas.demarchi@inte=
l.com> wrote:
>
> On Fri, Apr 05, 2024 at 10:37:39PM +0300, Jani Nikula wrote:
> >Avoid the dependency on intel_uc_fw.h, and allow removal of xe compat
> >intel_uc_fw.h. If there needs to be duplication of the URL, at least
> >have the duplication in a sensible way.
> >
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> but see below. +Josh
>
> >---
> > drivers/gpu/drm/i915/display/intel_dmc.c             |  4 +++-
> > drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h    |  1 -
> > drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h | 11 -----------
> > 3 files changed, 3 insertions(+), 13 deletions(-)
> > delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >
> >diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/=
i915/display/intel_dmc.c
> >index 3fa851b5c7a6..e61e9c1b8947 100644
> >--- a/drivers/gpu/drm/i915/display/intel_dmc.c
> >+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> >@@ -38,6 +38,8 @@
> >  * low-power state and comes back to normal.
> >  */
> >
> >+#define INTEL_DMC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/ke=
rnel/git/firmware/linux-firmware.git"
>
> repo recently moved to gitlab, but as far as I know the one on
> kernel.org will still work. Do we want to change it?
>
> https://gitlab.com/kernel-firmware/linux-firmware

I don't think there's a need to change it right now.  I can't see us
removing the kernel.org linux-firmware tree.  Given it's firmware, I
don't think the defined macro is really trying to point to a
contribution site either so pointing to gitlab probably isn't
worthwhile.

josh

> thanks
> Lucas De Marchi
>
> >+
> > enum intel_dmc_id {
> >       DMC_FW_MAIN =3D 0,
> >       DMC_FW_PIPEA,
> >@@ -953,7 +955,7 @@ static void dmc_load_work_fn(struct work_struct *wor=
k)
> >                          " Disabling runtime power management.\n",
> >                          dmc->fw_path);
> >               drm_notice(&i915->drm, "DMC firmware homepage: %s",
> >-                         INTEL_UC_FIRMWARE_URL);
> >+                         INTEL_DMC_FIRMWARE_URL);
> >       }
> >
> >       release_firmware(fw);
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers=
/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >index a01d1b869c2d..837e95e3604e 100644
> >--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >@@ -26,7 +26,6 @@
> > #include "i915_utils.h"
> > #include "intel_gt_types.h"
> > #include "intel_step.h"
> >-#include "intel_uc_fw.h"
> > #include "intel_uncore.h"
> > #include "intel_runtime_pm.h"
> > #include <linux/pm_runtime.h>
> >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h b/driv=
ers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >deleted file mode 100644
> >index 009745328992..000000000000
> >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h
> >+++ /dev/null
> >@@ -1,11 +0,0 @@
> >-/* SPDX-License-Identifier: MIT */
> >-/*
> >- * Copyright =C2=A9 2023 Intel Corporation
> >- */
> >-
> >-#ifndef _INTEL_UC_FW_H_
> >-#define _INTEL_UC_FW_H_
> >-
> >-#define INTEL_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/ker=
nel/git/firmware/linux-firmware.git"
> >-
> >-#endif
> >--
> >2.39.2
> >
>


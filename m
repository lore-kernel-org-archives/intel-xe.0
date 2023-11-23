Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B27DC5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 16:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C1510E08B;
	Thu, 23 Nov 2023 16:38:10 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA29E10E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 16:38:07 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c8880f14eeso13360021fa.3
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700757486; x=1701362286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFJutFA13JlEGMKmo/0usEYXLhR8GIN5K40Wt2XRGvc=;
 b=XkBpaLFt3PnwQbz67C9aV51H0VjRhYcgDMv3a8di+E6gY8a39GtogQYa6EA+r8CWim
 jc2BQgDUphb/nmVtfnPhSZCNTehtyvRC2xIF98zVZYCFhl5/VVvX2cV7+zTJQPP7reYq
 hhI2p0NimFTByoM8wo0OzH5cmDjhy1f+SNteCbuxO2xKfLMl5bd49PXQMf8AEJu7HCg0
 t2HOGT46MR/IYFL8FZB/S9vQY3g3aZeNIURUaSl/XcJiaLMf99usI8ov38W0nSoKn6N1
 cpDTsVW19tRTRHTCQbafddvcdjCgx5M00leUlSXM9iBKLa++6dIagWspI6pUCPQObDit
 aV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700757486; x=1701362286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFJutFA13JlEGMKmo/0usEYXLhR8GIN5K40Wt2XRGvc=;
 b=M6N9OomtB8rvqZDL4q/kDYzsC4KzsFY3dlU1MGs4hrXUXbehg1+KYCbICWbAIfgeMo
 mJ4rN0L1QMDt4BaKoIm8tKHPzDJa5o2fTxoHY1LsbOdS2Fd9Zx+T6mkJYDNWvGlo5n3m
 LuUDxOzqHuHWRYJKehR80cYCTrfioBAfqBl5ZbUaOEqDf87pxSS8cMkHqnq7SlwP51bd
 cV/5DfU0ymnkXV93gL+z+xrMnKrYeMQVSEuDbee7w4fNkAhUU9oYK3qGpFzKMvsx6tzX
 KaqpGiyY3i1+QznTVxfPLbB5sKl2CFfvJNOru2jYSJj8WMMLsGu4jSHwNW/gQ3EPZZVO
 Quuw==
X-Gm-Message-State: AOJu0Yw7zf5DriZa3kjyLgjLVN2YUtHxJE5hVuAkw45mvmGlB/HYlkGa
 u4HQwnDibXnlp1ycej1evjoNWUiZa3uy0a4KPenHabPvmds=
X-Google-Smtp-Source: AGHT+IH1oGT8Jvcd+nDyNqDdZm6hQIzMIAeUp0+nHWPKd9HGF6lupeztAnEmbwuwvBZxV5ILwMQ8t/iNZ9x2HdRzALY=
X-Received: by 2002:a2e:b1c9:0:b0:2bc:b224:98ac with SMTP id
 e9-20020a2eb1c9000000b002bcb22498acmr4063949lja.31.1700757485630; Thu, 23 Nov
 2023 08:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 23 Nov 2023 16:37:38 +0000
Message-ID: <CAM0jSHNGO3AKBkH9U7WueNp7dPwT_FLQbD-8e=OtHA3yOrQeZg@mail.gmail.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC v2 2/6] drm/xe/xe2: Determine bios enablement
 for flat ccs on igfx.
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

On Tue, 21 Nov 2023 at 10:01, Himal Prasad Ghimiray
<himal.prasad.ghimiray@intel.com> wrote:
>
> If bios disables flat ccs on igfx  make has_flat_ccs as 0 and notify
> via drm_info.
>
> Bspec:59255
>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Huh, I wonder if that explains why on some particular LNL DUTs
compression just didn't seem to "work" for me.

So should this information be passed along to userspace via some query
uAPI? Maybe there is some tradeoff between enabling compression and
other features (like coherency), and so knowing this might be useful?

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index cc27fe8fc363..b642301947f5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -142,6 +142,9 @@
>  #define XEHP_SLICE_COMMON_ECO_CHICKEN1         XE_REG_MCR(0x731c, XE_REG=
_OPTION_MASKED)
>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE   REG_BIT(14)
>
> +#define XE2_FLAT_CCS_BASE_RANGE_LOWER          XE_REG_MCR(0x8800)
> +#define   XE2_FLAT_CCS_ENABLE                  REG_BIT(0)
> +
>  #define VF_PREEMPTION                          XE_REG(0x83a4, XE_REG_OPT=
ION_MASKED)
>  #define   PREEMPTION_VERTEX_COUNT              REG_GENMASK(15, 0)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 8be765adf702..07a3e4cf48d1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -16,6 +16,7 @@
>  #include <drm/xe_drm.h>
>
>  #include "regs/xe_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
>  #include "xe_display.h"
> @@ -25,6 +26,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_exec.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -342,6 +344,29 @@ static void xe_device_sanitize(struct drm_device *dr=
m, void *arg)
>                 xe_gt_sanitize(gt);
>  }
>
> +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +{
> +       u32 reg;
> +       int err;
> +
> +       if (IS_DGFX(xe) || GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_cc=
s)
> +               return 0;
> +
> +       struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> +
> +       err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +       if (err)
> +               return err;
> +
> +       reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LO=
WER);
> +       xe->info.has_flat_ccs =3D (reg & XE2_FLAT_CCS_ENABLE);
> +
> +       if (!xe->info.has_flat_ccs)
> +               drm_info(&xe->drm,
> +                        "Flat CCS has been disabled in bios, May lead to=
 performance impact");
> +       return 0;
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>         struct xe_tile *tile;
> @@ -352,6 +377,7 @@ int xe_device_probe(struct xe_device *xe)
>         xe_pat_init_early(xe);
>
>         xe->info.mem_region_mask =3D 1;
> +
>         err =3D xe_display_init_nommio(xe);
>         if (err)
>                 return err;
> @@ -390,6 +416,10 @@ int xe_device_probe(struct xe_device *xe)
>                         goto err_irq_shutdown;
>         }
>
> +       err =3D xe_device_set_has_flat_ccs(xe);
> +       if (err)
> +               return err;
> +
>         err =3D xe_mmio_probe_vram(xe);
>         if (err)
>                 goto err_irq_shutdown;
> --
> 2.25.1
>

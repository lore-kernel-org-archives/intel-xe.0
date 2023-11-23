Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C0DC61D97
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 17:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0B10E034;
	Thu, 23 Nov 2023 17:01:57 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82610E034
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 17:01:56 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so14041211fa.1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Nov 2023 09:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700758915; x=1701363715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WguNTQato9TBxHSWR8x6p6g79o8O4z7iJwel/YmzjPM=;
 b=IYYdOB+G5XmUBL20ZMYo8ifcPKkQaLGjLLbsZ6+ND8Ppn+2+gkJdr4P97dbcWgcktf
 jRtNkTy+Z3/dJk263q1lSHhgsdKAHYYufy1K5hN/r6v9vXGAzDuk97kEMG3chV6i1Kkh
 r2GONibWv+eVy/WJ1TrMChVFCQuEaEsvjpFcLO+98s8W0u7dTo5wRmLP4qtGRn370wbL
 YARBZ2DZmgqXRWFG8Vhupft7jzEwChe3QIS7iZGQw3qrF3wTgv/LMnYWpGiExSI2T+xf
 r+NXuGCQbdwonJsVL2elG81aOri8jURjV+V+uAYXJ55t5uqrqMfY6wzNlc5vKeKDhwlH
 yn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700758915; x=1701363715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WguNTQato9TBxHSWR8x6p6g79o8O4z7iJwel/YmzjPM=;
 b=j4KdXaPiFFreyfdjMDp/AHRMQWy50GwG/VahjC+ljZv0mqURDEeSojceCMjo8CXOiA
 i5MxRWZfqWVwp6ZmH1STzVjbvEZZ3WundEMcwAlhtlWoY9iHqkcCVFo++rY8le5KxHJ7
 Dk1Pe9YCusUhnyitb5HRNQvBG9PFAuSfoJ2nSnbWoLF0AMO0al3GkTKg0DP2fCgYcr3J
 CfJHHl9JowY9nO6jCU/gpVF0SBIWMRyIWtFf4lkk5uOsZE6Epr25AMqEQKpt1aZ9xHqW
 VVEMX+lE+pk+mhIOk82eHW/4IIjSP/lT8A+0BYGPfScZe896AnPONogRUldH3aJNM0D1
 wjmw==
X-Gm-Message-State: AOJu0Ywlsx8B9xF6inp5wowIHexcs2KeB1AKdnqS/X74Rp71j5tgTns6
 7FvEWihMJJtGryFYkmtlMfPBihKutEjw/wTdIh0GxAX1VcI=
X-Google-Smtp-Source: AGHT+IEgVTHkvydNZg3Cwqqs8cQcY5WYVHHWjJFCjC4n640QtE5NshGKa5HJDFBtZTN9tGfNAHDagu09kdWXO6nbSQo=
X-Received: by 2002:a2e:a7d2:0:b0:2c7:b9b3:4ec1 with SMTP id
 x18-20020a2ea7d2000000b002c7b9b34ec1mr5186605ljp.17.1700758914534; Thu, 23
 Nov 2023 09:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-3-himal.prasad.ghimiray@intel.com>
 <CAM0jSHNGO3AKBkH9U7WueNp7dPwT_FLQbD-8e=OtHA3yOrQeZg@mail.gmail.com>
In-Reply-To: <CAM0jSHNGO3AKBkH9U7WueNp7dPwT_FLQbD-8e=OtHA3yOrQeZg@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 23 Nov 2023 17:01:27 +0000
Message-ID: <CAM0jSHPfO6dm74KbKVUC=gJym8RzFgd9S8U6QJeSTWmW1pr3Sg@mail.gmail.com>
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

On Thu, 23 Nov 2023 at 16:37, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Tue, 21 Nov 2023 at 10:01, Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com> wrote:
> >
> > If bios disables flat ccs on igfx  make has_flat_ccs as 0 and notify
> > via drm_info.
> >
> > Bspec:59255
> >
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> Huh, I wonder if that explains why on some particular LNL DUTs
> compression just didn't seem to "work" for me.
>
> So should this information be passed along to userspace via some query
> uAPI? Maybe there is some tradeoff between enabling compression and
> other features (like coherency), and so knowing this might be useful?

Another idea might be to reject any compressed pat_index, if the
platform doesn't support flat_ccs?

>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> >  drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/=
regs/xe_gt_regs.h
> > index cc27fe8fc363..b642301947f5 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -142,6 +142,9 @@
> >  #define XEHP_SLICE_COMMON_ECO_CHICKEN1         XE_REG_MCR(0x731c, XE_R=
EG_OPTION_MASKED)
> >  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE   REG_BIT(14)
> >
> > +#define XE2_FLAT_CCS_BASE_RANGE_LOWER          XE_REG_MCR(0x8800)
> > +#define   XE2_FLAT_CCS_ENABLE                  REG_BIT(0)
> > +
> >  #define VF_PREEMPTION                          XE_REG(0x83a4, XE_REG_O=
PTION_MASKED)
> >  #define   PREEMPTION_VERTEX_COUNT              REG_GENMASK(15, 0)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_dev=
ice.c
> > index 8be765adf702..07a3e4cf48d1 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -16,6 +16,7 @@
> >  #include <drm/xe_drm.h>
> >
> >  #include "regs/xe_regs.h"
> > +#include "regs/xe_gt_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_debugfs.h"
> >  #include "xe_display.h"
> > @@ -25,6 +26,7 @@
> >  #include "xe_exec_queue.h"
> >  #include "xe_exec.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_mcr.h"
> >  #include "xe_irq.h"
> >  #include "xe_mmio.h"
> >  #include "xe_module.h"
> > @@ -342,6 +344,29 @@ static void xe_device_sanitize(struct drm_device *=
drm, void *arg)
> >                 xe_gt_sanitize(gt);
> >  }
> >
> > +static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> > +{
> > +       u32 reg;
> > +       int err;
> > +
> > +       if (IS_DGFX(xe) || GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_=
ccs)
> > +               return 0;
> > +
> > +       struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> > +
> > +       err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +       if (err)
> > +               return err;
> > +
> > +       reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_=
LOWER);
> > +       xe->info.has_flat_ccs =3D (reg & XE2_FLAT_CCS_ENABLE);
> > +
> > +       if (!xe->info.has_flat_ccs)
> > +               drm_info(&xe->drm,
> > +                        "Flat CCS has been disabled in bios, May lead =
to performance impact");
> > +       return 0;
> > +}
> > +
> >  int xe_device_probe(struct xe_device *xe)
> >  {
> >         struct xe_tile *tile;
> > @@ -352,6 +377,7 @@ int xe_device_probe(struct xe_device *xe)
> >         xe_pat_init_early(xe);
> >
> >         xe->info.mem_region_mask =3D 1;
> > +
> >         err =3D xe_display_init_nommio(xe);
> >         if (err)
> >                 return err;
> > @@ -390,6 +416,10 @@ int xe_device_probe(struct xe_device *xe)
> >                         goto err_irq_shutdown;
> >         }
> >
> > +       err =3D xe_device_set_has_flat_ccs(xe);
> > +       if (err)
> > +               return err;
> > +
> >         err =3D xe_mmio_probe_vram(xe);
> >         if (err)
> >                 goto err_irq_shutdown;
> > --
> > 2.25.1
> >

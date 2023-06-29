Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC29EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 09:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957C810E099;
	Thu, 29 Jun 2023 09:14:46 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB1B10E099
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 09:14:44 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so660693e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688030082; x=1690622082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qVCsyut+W2n2YthntlhwcL8JHUqh2bfEf8FzyXS5BkQ=;
 b=WxUj1NwdXM27ncKlnwYOi+ft1KZuEyjhTBucBODO/dTONSFOnGZ193hQZQ9KV4Ob0g
 HhPkqcXua+bACRV/EGO5ZxHXz5aVTs6tSufCmJDUb/DUpiVM/IsEevSR/a8by2NEpl9J
 eA1f7EjQjEpKerX8DoejvVzVVSGXwVt6Mk8/gaDQtKpMQb+p1Qa5ircb+uxSN/R4u139
 xjAPbHM+2lcLFteQRfrGTVJTZgxqG4DRm0KIo777BL76HYDXXqJ98cpwu7yJdkY0xCDV
 1WepSaXYHFrh0GWSQekdkstZDL4aBZOYWdDuGhlDwzf8un1ec2ilf5oXm8fgOfWUmSDJ
 eIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688030082; x=1690622082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVCsyut+W2n2YthntlhwcL8JHUqh2bfEf8FzyXS5BkQ=;
 b=ADQMxvY/gPtwMcd2I6rXjnYoIXOIZuREJle4yTnMrsj+mRGg1vqZQpRyfBXKdj50bD
 EgFcakmqGehv94Pwggb6RjZtLFcRfClMntB98JJHgrQQchz4Ex1jvc/+xNHjKeE4WPLV
 Wx0zo0kFO2jDDz6cu1crYiKceW9//Syl5MggFUDEjlHuF2w948p394Nj82mgaphdaeu9
 8xMHwWudYFXzPIuDOF4iMSTts0XwguramO3ZV/ODAOUl1TaCzjwfGfpAEWhHKtK9y9ud
 UHZAzVhIQiA8zD2+4KwbOPLqrj0NsksB81hW2qJovr4615hfuDXFO5uFs661bPchaqA9
 L+lw==
X-Gm-Message-State: AC+VfDxIqcWvTuak8G7oIMzH58hGAjxIXWJuJxzCPiLK/ssNkC8X+L2t
 2NXuTm43wca9uNFjidJ6mCaEe1kZqWeZSX7JFwWVDYEAOEM=
X-Google-Smtp-Source: ACHHUZ6Xq5wTKo4muQCguw4BS+54ualZ8ebdfGnabI2CDCVCHXzm0QYrjZq+NNh0qQXXZkp74cgkgD55rNo0ew/SI6U=
X-Received: by 2002:a05:6512:1284:b0:4fb:89f2:594d with SMTP id
 u4-20020a056512128400b004fb89f2594dmr5237243lfs.63.1688030081464; Thu, 29 Jun
 2023 02:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230614200445.3363527-1-matthew.d.roper@intel.com>
 <CAM0jSHNkKHgyuSUAAHEurhGi2ufhgnyDod0fhaXjTgUFEh6arw@mail.gmail.com>
 <20230615202033.GX5433@mdroper-desk1.amr.corp.intel.com>
 <CAM0jSHOYkQi96+fBbr24KH0Dvkum7jq7D-_juz-sBBG+oLAUKA@mail.gmail.com>
 <7tjqngk5gzar5a7mtd6xoyeyshks443c52cpeutzwq6qnhswiz@fl4z5qgkwv7l>
In-Reply-To: <7tjqngk5gzar5a7mtd6xoyeyshks443c52cpeutzwq6qnhswiz@fl4z5qgkwv7l>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 29 Jun 2023 10:14:14 +0100
Message-ID: <CAM0jSHMbmQmHC2xoxzCw5KnEiMxUkpyvkksB+VpF+DPiU=hFOg@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Grab runtime PM over MMIO ioctl
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 29 Jun 2023 at 03:29, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> On Fri, Jun 16, 2023 at 01:10:49PM +0100, Matthew Auld wrote:
> >On Thu, 15 Jun 2023 at 21:20, Matt Roper <matthew.d.roper@intel.com> wrote:
> >>
> >> On Thu, Jun 15, 2023 at 09:42:03AM +0100, Matthew Auld wrote:
> >> > On Wed, 14 Jun 2023 at 21:04, Matt Roper <matthew.d.roper@intel.com> wrote:
> >> > >
> >> > > The MMIO ioctl (which is generally used from IGT's xe_reg tool) may be
> >> > > called while the device is in D3, resulting in invalid results (i.e.,
> >> > > all registers read back as 0xFFFFFFFF, writes are dropped).  Make sure
> >> > > we grab runtime PM wakeref before performing register reads/writes.
> >> > >
> >> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >> >
> >> > AFAIK we should use mem_access_get() for MMIO:
> >>
> >> I thought mem_access_get() was specifically for memory access (like we
> >> needed for a special workaround on some early steppings of PVC); is it
> >> intended to be used for all devices accesses, not just memory now?  If
> >> so we might want to rename it to something more accurate like
> >> 'mmio_access_get' (and also add some kerneldoc explaining when/why it
> >> would be used instead of the standard runtime PM).
> >
> >AFAIK Rodrigo is planning to add some docs to explain its usage. I was
> >also under the impression that it was more for stuff like VRAM memory
> >access, but it seems MMIO should also be included or really any device
> >level memory access.
> >
> >https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/281
>
> I don't see how mem_access_get() would be the appropriate call here.
> At the most we should have a dep in which when force_wake is taken, it
> get a mem access cookie. Here it is really about "wake up everything, we
> don't know crazy thing userspace is going to do".
>
> In that sense, why are we not getting the pm when taking the force wake
> rather than wrapping it here? Shouldn't a force_wake ensure the device
> is not pm suspended?

There was some discussion here:
https://patchwork.freedesktop.org/patch/542124/?series=119213&rev=1

For the simple cases, like in this patch which is at the ioctl level,
we could potentially add a convenience helper or something which does
as you say. But I'm not sure how feasible it would be to roll that out
to all force_wake users.

>
> Lucas De Marchi
>
> >
> >>
> >> Actually, I'm having trouble understanding what mem_access_get is trying
> >> to do.  It seems like it's trying to avoid using the runtime PM's
> >> refcounting and is turning it into a boolean on/off instead, which makes
> >> things a bit racy.  It's not obvious to me why we're trying to work
> >> around the refcount design?
> >
> >I don't know the full history here, so I'm not completely sure tbh.
> >
> >AFAICT the racy bit is in xe_pm_runtime_resume_if_suspended(), when it
> >calls pm_runtime_suspended(), which is a TOCTOU bug and also doesn't
> >work if we are currently in the process of suspending/resuming, but
> >the reason for having the check is to prevent deadlocking when
> >pm_runtime_get_sync() is called from our runtime pm callbacks. So
> >dropping that check fixes the races but then uncovers all those
> >deadlocks. Parking that to one side, I don't think there is any issue
> >with always calling pm_runtime_get_sync(), we just need to have some
> >way of asserting at various places in the driver that we have ref > 0
> >or perhaps that the device is PM active. But if we end up having our
> >own mem_access.ref then there is no strict need to call into PM every
> >time.
> >
> >>
> >>
> >> Matt
> >>
> >> > https://patchwork.freedesktop.org/patch/542124/?series=119213&rev=1
> >> >
> >> > But that requires first fixing the races with mem_access which is
> >> > quite involved, so perhaps using runtime_get() directly here is fine
> >> > for now. We can just replace the instance here with mem_access once
> >> > that's ready.
> >> >
> >> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >> >
> >> > > ---
> >> > >  drivers/gpu/drm/xe/xe_mmio.c | 3 +++
> >> > >  1 file changed, 3 insertions(+)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >> > > index f7a7f996b37f..5f4c8ae23771 100644
> >> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> >> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> > > @@ -19,6 +19,7 @@
> >> > >  #include "xe_gt_mcr.h"
> >> > >  #include "xe_macros.h"
> >> > >  #include "xe_module.h"
> >> > > +#include "xe_pm.h"
> >> > >
> >> > >  #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
> >> > >  #define TILE_COUNT             REG_GENMASK(15, 8)
> >> > > @@ -476,6 +477,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >> > >          */
> >> > >         reg = XE_REG(args->addr);
> >> > >
> >> > > +       xe_pm_runtime_get(xe);
> >> > >         xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >> > >
> >> > >         if (args->flags & DRM_XE_MMIO_WRITE) {
> >> > > @@ -519,6 +521,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >> > >
> >> > >  exit:
> >> > >         xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >> > > +       xe_pm_runtime_put(xe);
> >> > >
> >> > >         return ret;
> >> > >  }
> >> > > --
> >> > > 2.40.1
> >> > >
> >>
> >> --
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation

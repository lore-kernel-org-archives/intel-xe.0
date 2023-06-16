Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A34DEB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 12:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20610E606;
	Fri, 16 Jun 2023 12:11:21 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA8F10E606
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 12:11:19 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f76b6db73fso2259350e87.1
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686917477; x=1689509477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/KMMO38ZxtwE1mtSawPt3fSUKSJZ1RUq717/VR2kjSY=;
 b=Lf2EFv1gvkVFTMZbmSC3DBxrCXodsITppFRwu+71PqeJUMHNK0OUy+VboOcpfn9oMR
 8e5STWQ5C2kmL27ZykNpd8dJep9BsTtJMejAVxNl4AVcQuByrCVNKrMY31lDtsftIx15
 MvMExB0lGvMDHlZsqNMbxkofJakw1UAq0U2SCKsMq+/V8RsvRE38SDNC1eriSo/8roCp
 IcZn5c/UN0hyWB5QMgaZOcTGCUo0+IwBgPaLKzxzR+iY4c8pzeJMBAhg6wac8HtZJXIt
 BeJJlQ2gXCOo2Y35zMOEg3kFGd3gFRcyBHacWwpmhjPQPtfKhjo4L9a1yytKd/kLLgmP
 lmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686917477; x=1689509477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/KMMO38ZxtwE1mtSawPt3fSUKSJZ1RUq717/VR2kjSY=;
 b=dK6+/fXrR6i7zIQW1XOBEYbOPaL0j89dwpDej8bdRxP9OY0zUlD/8IUW45YKm5MVad
 ygQ9yinoV+0HRM/sB29La/DgpFhuVj+BtH4b6c/7L52B3bipeOPc+RPQD47yCwXkmXmA
 gEnKm9yUUpVqi1lsW2TbeoBnd7vxFzQn/5iu6wpDWl1B0McVr6I4FlkRz4m8PDWyMdfv
 iBaBClAYXJVzJcTd4leLjoyXo/6Yv3x4jfq4kJz7/OK5itHtIgCGO3Q4KidBuZFn2Dhr
 q8JJ+yLtgMmQbwMHfjNftPZwFYjP3PFzjKioL4KvTyNYdDQq7tKwHSpm/37Z5k+K4EVJ
 P3Sw==
X-Gm-Message-State: AC+VfDySCpx6SZSxvaHLbKfPadoGD438DTN9ZTbaDs8z7UVvnEV74icZ
 H+RUalufpnnxOuqp3mlwJWOn5utz7p3CLhiIz3Q=
X-Google-Smtp-Source: ACHHUZ4/sE5KhkdJjfke7L/wV0/w2Xk0Qn5j/Y3lLjub2+YYufLSJexufwphjWGexc8L2c+1cV+BtqHfmlVrl51I2rc=
X-Received: by 2002:a05:6512:1289:b0:4f6:19c3:da30 with SMTP id
 u9-20020a056512128900b004f619c3da30mr2590697lfs.29.1686917476712; Fri, 16 Jun
 2023 05:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230614200445.3363527-1-matthew.d.roper@intel.com>
 <CAM0jSHNkKHgyuSUAAHEurhGi2ufhgnyDod0fhaXjTgUFEh6arw@mail.gmail.com>
 <20230615202033.GX5433@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230615202033.GX5433@mdroper-desk1.amr.corp.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jun 2023 13:10:49 +0100
Message-ID: <CAM0jSHOYkQi96+fBbr24KH0Dvkum7jq7D-_juz-sBBG+oLAUKA@mail.gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 15 Jun 2023 at 21:20, Matt Roper <matthew.d.roper@intel.com> wrote:
>
> On Thu, Jun 15, 2023 at 09:42:03AM +0100, Matthew Auld wrote:
> > On Wed, 14 Jun 2023 at 21:04, Matt Roper <matthew.d.roper@intel.com> wrote:
> > >
> > > The MMIO ioctl (which is generally used from IGT's xe_reg tool) may be
> > > called while the device is in D3, resulting in invalid results (i.e.,
> > > all registers read back as 0xFFFFFFFF, writes are dropped).  Make sure
> > > we grab runtime PM wakeref before performing register reads/writes.
> > >
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >
> > AFAIK we should use mem_access_get() for MMIO:
>
> I thought mem_access_get() was specifically for memory access (like we
> needed for a special workaround on some early steppings of PVC); is it
> intended to be used for all devices accesses, not just memory now?  If
> so we might want to rename it to something more accurate like
> 'mmio_access_get' (and also add some kerneldoc explaining when/why it
> would be used instead of the standard runtime PM).

AFAIK Rodrigo is planning to add some docs to explain its usage. I was
also under the impression that it was more for stuff like VRAM memory
access, but it seems MMIO should also be included or really any device
level memory access.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/281

>
> Actually, I'm having trouble understanding what mem_access_get is trying
> to do.  It seems like it's trying to avoid using the runtime PM's
> refcounting and is turning it into a boolean on/off instead, which makes
> things a bit racy.  It's not obvious to me why we're trying to work
> around the refcount design?

I don't know the full history here, so I'm not completely sure tbh.

AFAICT the racy bit is in xe_pm_runtime_resume_if_suspended(), when it
calls pm_runtime_suspended(), which is a TOCTOU bug and also doesn't
work if we are currently in the process of suspending/resuming, but
the reason for having the check is to prevent deadlocking when
pm_runtime_get_sync() is called from our runtime pm callbacks. So
dropping that check fixes the races but then uncovers all those
deadlocks. Parking that to one side, I don't think there is any issue
with always calling pm_runtime_get_sync(), we just need to have some
way of asserting at various places in the driver that we have ref > 0
or perhaps that the device is PM active. But if we end up having our
own mem_access.ref then there is no strict need to call into PM every
time.

>
>
> Matt
>
> > https://patchwork.freedesktop.org/patch/542124/?series=119213&rev=1
> >
> > But that requires first fixing the races with mem_access which is
> > quite involved, so perhaps using runtime_get() directly here is fine
> > for now. We can just replace the instance here with mem_access once
> > that's ready.
> >
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> >
> > > ---
> > >  drivers/gpu/drm/xe/xe_mmio.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index f7a7f996b37f..5f4c8ae23771 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -19,6 +19,7 @@
> > >  #include "xe_gt_mcr.h"
> > >  #include "xe_macros.h"
> > >  #include "xe_module.h"
> > > +#include "xe_pm.h"
> > >
> > >  #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
> > >  #define TILE_COUNT             REG_GENMASK(15, 8)
> > > @@ -476,6 +477,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> > >          */
> > >         reg = XE_REG(args->addr);
> > >
> > > +       xe_pm_runtime_get(xe);
> > >         xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > >
> > >         if (args->flags & DRM_XE_MMIO_WRITE) {
> > > @@ -519,6 +521,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> > >
> > >  exit:
> > >         xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > +       xe_pm_runtime_put(xe);
> > >
> > >         return ret;
> > >  }
> > > --
> > > 2.40.1
> > >
>
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

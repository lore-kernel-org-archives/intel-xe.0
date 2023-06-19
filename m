Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76159EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 12:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10010E1F7;
	Mon, 19 Jun 2023 12:33:05 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB72010E1F7
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 12:33:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f86a7a5499so1914305e87.2
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687177980; x=1689769980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZQpLq/zVi6SRWwP5lpSU6P4r8c+tOWIJDtaNg4d0I8=;
 b=JixjxUQHZh4k2ZMLKhYIQX54fYXehzNQZcn6j98sO5XCJpMcS7Ou4hYRj14PM3NYgy
 gcwZfCSr1bb/cfjcPQf8i5536DB8UF7QPNTvKy4XB7ZH6rmc6YYnexOvjw343VJr2bky
 SQm2OYeA6AwnsghpVUlc3Psx3UBiCWcpcDr5Ke7I9Q4h0EYALaMaBHC0XYIVAerv3Du2
 Vw8AGD5IGKYqn8vsHR34S7FoSdqX880SB5V4Kdc9dHhlkQ+SpOApJ7GxSDY/FYjH6L20
 YhmeDwQiiGtSNV4fKDj1dzL/LnE8WCzk5+ia/L/L9SN950NcR2D9arxipjx6N5/cIZDL
 cUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687177980; x=1689769980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9ZQpLq/zVi6SRWwP5lpSU6P4r8c+tOWIJDtaNg4d0I8=;
 b=dIlmzyQNYErQqkBZdEvstFSdpop3pEd89WW6OhYcHXFr/+PIQeqqrQM1Sgau6dcLaU
 3zNAR3mybT484v4ganJwpgIKbNXeAZ8M5Nc3sMpK8aUKDzWqOqcIIfI2lePx7E4KW8Rm
 ksJ9D8SFb2z6qeYcbkEJ9N5Y9zTprJU2IhUJNywkisYiGk9fa0eo+lrtRYYUNiA+qPmX
 xMTsWTXXU8G7wB5mdM0yNwW4BzvWdvBIkqwD86NnVzxYtkCQFitOUw1IOSz0X759PAnl
 PUTXejFznMMFS7so44poiO58JY3JcPnwjvO71xIO/wUv0WTy9VqL7X5ywvkVk3Ih8YsV
 OiPQ==
X-Gm-Message-State: AC+VfDxrBKT9UccskBce3QIWavj3e3jPwhbxDF5lavh/yhGUc9b/zieE
 BVObFh4JkHV/RCNZM8UvSMNfeQAOHKUpWd5DevSDq8sX3zA=
X-Google-Smtp-Source: ACHHUZ4QVnAZM9ijV/auEEZV9UtfAF/N8PB/OQGejPGMrUyJeU1nJ3bZm35jQMUonYQAqhsOnVhgLNaDMIThaFpl0rM=
X-Received: by 2002:a19:2d54:0:b0:4f8:5e5f:b368 with SMTP id
 t20-20020a192d54000000b004f85e5fb368mr3235299lft.21.1687177980114; Mon, 19
 Jun 2023 05:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
 <20230616141115.1128000-2-anshuman.gupta@intel.com>
 <ZIzAcvfQnGQvDMb7@DUT025-TGLU.fm.intel.com>
 <CY5PR11MB62115C1381F4AE8C6F0EB8BC955FA@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB62115C1381F4AE8C6F0EB8BC955FA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Jun 2023 13:32:33 +0100
Message-ID: <CAM0jSHOSCK1mVaZ-cuE=94UMs38hHPJ24JmQWrs8gCBpaVR9-g@mail.gmail.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended
 with power.lock
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 19 Jun 2023 at 12:18, Gupta, Anshuman <anshuman.gupta@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Saturday, June 17, 2023 1:35 AM
> > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Nilawar, Badal
> > <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Tauro,
> > Riana <riana.tauro@intel.com>; Sundaresan, Sujaritha
> > <sujaritha.sundaresan@intel.com>
> > Subject: Re: [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended with
> > power.lock
> >
> > On Fri, Jun 16, 2023 at 07:41:14PM +0530, Anshuman Gupta wrote:
> > > pm_runtime_suspended() doc has requirement to use it with PM lock of
> > > @dev to get the trusted value.
> > > Wrap pm_runtime_suspended within xe_pm_runtime_suspended() with
> > proper
> > > locking.
> > >
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pm.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index b7b57f10ba25..04c5353ba870 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -210,11 +210,23 @@ int xe_pm_runtime_put(struct xe_device *xe)
> > >     return pm_runtime_put_autosuspend(xe->drm.dev);
> > >  }
> > >
> > > +static bool xe_pm_runtime_suspended(struct xe_device *xe) {
> > > +   unsigned long flags;
> > > +   bool suspended;
> > > +
> > > +   spin_lock_irqsave(&xe->drm.dev->power.lock, flags);
> > > +   suspended = pm_runtime_suspended(xe->drm.dev);
> > > +   spin_unlock_irqrestore(&xe->drm.dev->power.lock, flags);
> >
> > A few things.
> >
> > First, you probably can make this spin_lock_irq / spin_unlock_irq as IRQ
> > contexts are not really used in Xe it is doubtful this function would ever be
> > called from an unknown context.
> Thanks  for review , I will fix this.
> >
> > Second, I have questions if this patch is actually doing anything useful. Yes, I
> > can see doc which indicates that pm_runtime_suspended can only be
> > trusted if the lock is held but looking at the code paths where
> > xe_pm_runtime_suspended is called unsure how this lock helps.
> >
> > e.g. How is this better?
> This is helpful in case, when pm_runtime_suspended() returns status is RPM_SUSPENDING and it will be going to change to RPM_SUPENDED,
> rpm_suspend() changes the runtime status from RPM_ACTIVE -> RPM_SUSPENDING -> driver->runtime_suspend() callback -> RPM_SUSPENDED
> https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c#L558
> rpm_suspend() caller has already grabbed the lock and RPM status changed to RPM_SUSPENDING, therefore Xe has to wait to grab the lock to get the trusted value, which is RPM_SUSPENDED.
> Without a proper lock, the xe driver may access the vram while the device was runtime suspended, which is a violation of  PCIe specs.> if (trusted value)
> >       now the trusted value can change, do something
> The other way around is if Xe has grabbed the lock first then the possible runtime status is either RPM_ACTIVE or RUNTIME_SUPENDED  for both Xe is increasing usage
> ref count explicitly to make sure the device is in an active state.

From my reading of the RPM core code, it eventually drops the
power.lock before calling any of the driver pm callbacks (see
__rpm_callback() for example), and then only re-acquires it after. I
think it mostly just protects the RPM state. If something is
transitioning from RPM_ACTIVE -> RPM_SUSPENDING or whatever, grabbing
the power.lock won't synchronise the actual operation, since the lock
is not even being held when our callback is being run. If we want to
actually synchronise an ongoing SUSPENDING or RESUMING you have to
call something like pm_runtime_get_sync() I think.

Also like Matt said, even if this somehow all worked there is still
the actual race window between checking if it is not suspended and
then proceeding as if that is still going to be the case.

FWIW there is an attempt to fix such issues here, although it's all
quite nasty: https://patchwork.freedesktop.org/series/119213/

>
> Thanks ,
> Anshuman Gupta.
> >
> >
> > Than?
> > if (untrusted value)
> >       do something
> > Also if you look all over kernel pm_runtime_suspended is called frequently
> > dev->power.lock.
> >
> > Matt
> >
> > > +
> > > +   return suspended;
> > > +}
> > > +
> > >  /* Return true if resume operation happened and usage count was
> > > increased */  bool xe_pm_runtime_resume_if_suspended(struct
> > xe_device
> > > *xe)  {
> > >     /* In case we are suspended we need to immediately wake up */
> > > -   if (pm_runtime_suspended(xe->drm.dev))
> > > +   if (xe_pm_runtime_suspended(xe))
> > >             return !pm_runtime_resume_and_get(xe->drm.dev);
> > >
> > >     return false;
> > > @@ -222,6 +234,6 @@ bool xe_pm_runtime_resume_if_suspended(struct
> > > xe_device *xe)
> > >
> > >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> > > -   WARN_ON(pm_runtime_suspended(xe->drm.dev));
> > > +   WARN_ON(xe_pm_runtime_suspended(xe));
> > >     return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > > --
> > > 2.38.0
> > >

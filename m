Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B624EB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 08:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF9A10E0B0;
	Wed, 21 Jun 2023 08:55:52 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875DC10E41C
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 08:55:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f957a45b10so867476e87.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687337748; x=1689929748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vMCh+DJyEtZ9OZASV5rc3zI2flqL3hC0ulmdOXhELi4=;
 b=j4GggFPbKKrafWKSxfcJZOD2V3jH0hTgXRfynoCzI01XHWNdrWmXcKeCXtEaJV2pjt
 faKm/ss3ITIlWo7yeabl8zuOKTpiygakhrkehf2PJXfs2ULh4TEyMcztaH0vF1m98xDe
 /jqyPa7jyl+um5Cy1bmba3FaJr0lQ/tyXRKx2YjaIwLt2MP3yaSdJHlqV18JxciNm/eQ
 tx2pwo7oiJjUMNrjpnxq2Cn47I2xD4QKLUhrOQDvFYCJ/oh7L7o1kkD9gRFYErKgZKzU
 5bx/HEmEeFjt+VxmeXSGP65OK2hwhQSX9a0Q2k6945+pQKZW+u62UqxkvJm6ylSbyQc8
 h7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687337748; x=1689929748;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vMCh+DJyEtZ9OZASV5rc3zI2flqL3hC0ulmdOXhELi4=;
 b=ZEyY3RXgeRElOamTxTcb53/I9Wov81WRf4IrsFopzILoB7zDugnox/HbWbhG2eSq27
 6MKokUo83FAVQCvtCv1gNazf4K1/GAF+2Xgm4fy5YzL8ANjHqGlkhkfpWx/6PCw9rDDB
 S+dQUr2JATYXGFXr1EzHoh6vQLGiTvo9J50CcLZVJejtJLkDEOT5rNJzQ/eJ9IcWKGdg
 Wk2CLN5XaJlOFGYywW9Z74rJx2IdePIc3axWPeRazr1MtYY+wBQxNTVwlnZ5HQaPb056
 jd7H/sB5jHY1AFr3meqzf6i1yRsTzE2qNNy5u/FvYD579IWRBvp1Fh2ynQWSPt+TT5w8
 0gLQ==
X-Gm-Message-State: AC+VfDxTotkokxo3NG0ET5JOZ3g2ugy4nkBMU4yHt1HA1x7O3smwAPao
 5+4kU3GFOnU1KUBIULlpnjEyFv8+WNnyPmi7US/wEUsTMYYh9A==
X-Google-Smtp-Source: ACHHUZ4inYGEsXBszA9pbysN/m8/QMkJw+5qB/dro1FKos3g9KbohBqfB1+zNacWw/1/YjcAm2WQZY0eh2Ni7LKpcLY=
X-Received: by 2002:a19:6d0e:0:b0:4f6:520d:6b9b with SMTP id
 i14-20020a196d0e000000b004f6520d6b9bmr7369129lfc.60.1687337747825; Wed, 21
 Jun 2023 01:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
 <20230616141115.1128000-2-anshuman.gupta@intel.com>
 <ZIzAcvfQnGQvDMb7@DUT025-TGLU.fm.intel.com>
 <CY5PR11MB62115C1381F4AE8C6F0EB8BC955FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CAM0jSHOSCK1mVaZ-cuE=94UMs38hHPJ24JmQWrs8gCBpaVR9-g@mail.gmail.com>
 <CY5PR11MB621192D546FCE64CF2F5D5DA955DA@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB621192D546FCE64CF2F5D5DA955DA@CY5PR11MB6211.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 21 Jun 2023 09:55:20 +0100
Message-ID: <CAM0jSHO0RzckaGHGU8AkTeK02S8anod6=OBV4RyrUxshTp2iqA@mail.gmail.com>
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

On Wed, 21 Jun 2023 at 08:54, Gupta, Anshuman <anshuman.gupta@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Matthew Auld <matthew.william.auld@gmail.com>
> > Sent: Monday, June 19, 2023 6:03 PM
> > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Sundaresan, Sujaritha
> > <sujaritha.sundaresan@intel.com>; intel-xe@lists.freedesktop.org; Vivi,
> > Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/pm: Wrap
> > pm_runtime_suspended with power.lock
> >
> > On Mon, 19 Jun 2023 at 12:18, Gupta, Anshuman
> > <anshuman.gupta@intel.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Saturday, June 17, 2023 1:35 AM
> > > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Nilawar, Badal
> > > > <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> > > > Tauro, Riana <riana.tauro@intel.com>; Sundaresan, Sujaritha
> > > > <sujaritha.sundaresan@intel.com>
> > > > Subject: Re: [PATCH 1/2] drm/xe/pm: Wrap pm_runtime_suspended
> > with
> > > > power.lock
> > > >
> > > > On Fri, Jun 16, 2023 at 07:41:14PM +0530, Anshuman Gupta wrote:
> > > > > pm_runtime_suspended() doc has requirement to use it with PM lock
> > > > > of @dev to get the trusted value.
> > > > > Wrap pm_runtime_suspended within xe_pm_runtime_suspended()
> > with
> > > > proper
> > > > > locking.
> > > > >
> > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pm.c | 16 ++++++++++++++--
> > > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > > b/drivers/gpu/drm/xe/xe_pm.c index b7b57f10ba25..04c5353ba870
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -210,11 +210,23 @@ int xe_pm_runtime_put(struct xe_device
> > *xe)
> > > > >     return pm_runtime_put_autosuspend(xe->drm.dev);
> > > > >  }
> > > > >
> > > > > +static bool xe_pm_runtime_suspended(struct xe_device *xe) {
> > > > > +   unsigned long flags;
> > > > > +   bool suspended;
> > > > > +
> > > > > +   spin_lock_irqsave(&xe->drm.dev->power.lock, flags);
> > > > > +   suspended = pm_runtime_suspended(xe->drm.dev);
> > > > > +   spin_unlock_irqrestore(&xe->drm.dev->power.lock, flags);
> > > >
> > > > A few things.
> > > >
> > > > First, you probably can make this spin_lock_irq / spin_unlock_irq as
> > > > IRQ contexts are not really used in Xe it is doubtful this function
> > > > would ever be called from an unknown context.
> > > Thanks  for review , I will fix this.
> > > >
> > > > Second, I have questions if this patch is actually doing anything
> > > > useful. Yes, I can see doc which indicates that pm_runtime_suspended
> > > > can only be trusted if the lock is held but looking at the code
> > > > paths where xe_pm_runtime_suspended is called unsure how this lock
> > helps.
> > > >
> > > > e.g. How is this better?
> > > This is helpful in case, when pm_runtime_suspended() returns status is
> > > RPM_SUSPENDING and it will be going to change to RPM_SUPENDED,
> > > rpm_suspend() changes the runtime status from RPM_ACTIVE ->
> > > RPM_SUSPENDING -> driver->runtime_suspend() callback ->
> > RPM_SUSPENDED
> > > https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runt
> > > ime.c#L558
> > > rpm_suspend() caller has already grabbed the lock and RPM status
> > changed to RPM_SUSPENDING, therefore Xe has to wait to grab the lock to
> > get the trusted value, which is RPM_SUSPENDED.
> > > Without a proper lock, the xe driver may access the vram while the
> > > device was runtime suspended, which is a violation of  PCIe specs.> if
> > > (trusted value)
> > > >       now the trusted value can change, do something
> > > The other way around is if Xe has grabbed the lock first then the
> > > possible runtime status is either RPM_ACTIVE or RUNTIME_SUPENDED  for
> > both Xe is increasing usage ref count explicitly to make sure the device is in
> > an active state.
> >
> > From my reading of the RPM core code, it eventually drops the power.lock
> > before calling any of the driver pm callbacks (see
> > __rpm_callback() for example), and then only re-acquires it after. I think it
> > mostly just protects the RPM state. If something is transitioning from
> > RPM_ACTIVE -> RPM_SUSPENDING or whatever, grabbing the power.lock
> > won't synchronise the actual operation, since the lock is not even being held
> > when our callback is being run. If we want to actually synchronise an ongoing
> > SUSPENDING or RESUMING you have to call something like
> > pm_runtime_get_sync() I think.
> All rpm_{idle,resume,suspend} PM core calls being called with power.lock held.

They hold it yes, but my point is that it is eventually dropped and
then re-acquired during some or all of those calls, like when calling
into the driver resume or suspend callbacks. Did you take a look at
__rpm_callback()? See below.

> See below.
> https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c#L1140
> https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c#L1158
> https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c#L1102
>
> So during driver callback as well, power lock will be held.

Here is what xe_pm_runtime_get() looks like on the 0 -> 1 transition
with SUSPENDED -> RESUMING -> ACTIVE:

xe_pm_runtime_get()
  pm_runtime_get_sync()
    __pm_runtime_resume()
        spin_lock_irqsave(power.lock, flags)
        retval = rpm_resume()
              __update_runtime_status(RPM_RESUMING)
              cb = RPM_GET_CALLBACK(runtime_resume);
              rpm_callback(cb)
                    __rpm_callback(cb)
                           spin_unlock(power.lock); /* !!! */
                           ret = cb(dev) /* run driver callback */
                           spin_lock(power.lock)
              ..........
            _update_runtime_status(dev, RPM_ACTIVE);
      spin_unlock_irqrestore(power.lock, flags)

>
> We can not use pm_runtime_get_sync() in the the runtime suspend call path as it will cause a deadlock.
> See xe_device_mem_access_get() is even get called from runtime supend call patch as well.
> This seems intentional to reuse the code.

Right, and that is the major pain point in the below series. But if
the PM code was indeed holding power.lock over driver callbacks then
you would also see deadlocks, since our pm callbacks will call
xe_pm_runtime_suspended() which also now acquires power.lock as per
this patch.

> >
> > Also like Matt said, even if this somehow all worked there is still the actual
> > race window between checking if it is not suspended and then proceeding as
> > if that is still going to be the case.
> >
> > FWIW there is an attempt to fix such issues here, although it's all quite nasty:
> > https://patchwork.freedesktop.org/series/119213/
> Thanks for pointing the series, will take look in  to it.

Thanks.

>
> Thanks,
> Anshuman Gupta.
>
> >
> > >
> > > Thanks ,
> > > Anshuman Gupta.
> > > >
> > > >
> > > > Than?
> > > > if (untrusted value)
> > > >       do something
> > > > Also if you look all over kernel pm_runtime_suspended is called
> > > > frequently
> > > > dev->power.lock.
> > > >
> > > > Matt
> > > >
> > > > > +
> > > > > +   return suspended;
> > > > > +}
> > > > > +
> > > > >  /* Return true if resume operation happened and usage count was
> > > > > increased */  bool xe_pm_runtime_resume_if_suspended(struct
> > > > xe_device
> > > > > *xe)  {
> > > > >     /* In case we are suspended we need to immediately wake up */
> > > > > -   if (pm_runtime_suspended(xe->drm.dev))
> > > > > +   if (xe_pm_runtime_suspended(xe))
> > > > >             return !pm_runtime_resume_and_get(xe->drm.dev);
> > > > >
> > > > >     return false;
> > > > > @@ -222,6 +234,6 @@ bool
> > xe_pm_runtime_resume_if_suspended(struct
> > > > > xe_device *xe)
> > > > >
> > > > >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> > > > > -   WARN_ON(pm_runtime_suspended(xe->drm.dev));
> > > > > +   WARN_ON(xe_pm_runtime_suspended(xe));
> > > > >     return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > > > > --
> > > > > 2.38.0
> > > > >

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E845C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 11:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C6910E223;
	Thu,  3 Apr 2025 11:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rDa/WwRM";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2CC10E223
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:16:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6DE394384F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89EDC4CEE3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743678994;
 bh=k7z7q5pV2BmChUi1am0e3T+bsqT3y2I1PvIo9G9EYKg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rDa/WwRMmNNgyR/jcxliuPh1mP5JLMwyR+1xaZsIzI+r2aMSdMX8lWKvI6zr9P77Q
 NdN5Giu5ZhL33j7OrNsj+1NLCUYQIw7R9tfcpkOW6c3OtBB5gA/dPMcEjzIOQ0QUoX
 qxjJCaweIaw5kdwmHQg5Lqk/Adx7R8xwBAQKIg6fQko9wtyxmVx4prm5EQ5yhjz61/
 4glI+HJ9Aq6ZirCUBSXygQ7cWZPCDv4zSMjduXTtM/llM3zGhdj0fKj/cO7GMGkJPC
 x4I04tM86yH+KCL/IuNWEMC15IaLMz03WJFXpQmxRK6q9hPBGaEKDSAZOP1zJyk26e
 n8fd3C/RqzupQ==
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5fc447b03f2so206768eaf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Apr 2025 04:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVTgJi2/hV5MMSHZrm6FkOr1Yw1dooNbh1Z85knjUIP79dqWtAw99MX5SJvT0+S8/pBmSV8FNh6cg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Qb/aXg+rE1v7UArJAHdHci5keJ6CiMEVCYc/4he9fJ0YJKh5
 e2K6vBJjDhp0xfReSkBu4DEe4QhskBhAY2nhsrdYUYiZx9R/G2wW+JKs5gmex/UXsSuzqGVAeo+
 ju0xF7cVm8BjVXVx2Eb/urZVyhHg=
X-Google-Smtp-Source: AGHT+IHQq4nli131E5AOq3mtSw6Pb/6DctbCQMIvKTCsVIEjxSuVNmBt9bcXIyZNlN1pR7D7RYfgZwU9nLuFjOcpPRk=
X-Received: by 2002:a05:6870:b522:b0:2cc:3530:d2fe with SMTP id
 586e51a60fabf-2cc7f68d618mr1201274fac.21.1743678993965; Thu, 03 Apr 2025
 04:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com> <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
 <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
 <287e5242-c2f3-4bad-a5b8-836c6ab6accc@intel.com>
In-Reply-To: <287e5242-c2f3-4bad-a5b8-836c6ab6accc@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Apr 2025 13:16:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iPGDHDx9j8WiCDBdQ92szq8kxSpBV8p6xChX+0zgSPtg@mail.gmail.com>
X-Gm-Features: AQ5f1JpRxWh34c5B5mu6dF_MEc7DxGrGTSZRfBFtKuYleJZUuPpDQQOBAQcNW-s
Message-ID: <CAJZ5v0iPGDHDx9j8WiCDBdQ92szq8kxSpBV8p6xChX+0zgSPtg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Raag Jadav <raag.jadav@intel.com>,
 "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org, 
 anshuman.gupta@intel.com
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

On Thu, Apr 3, 2025 at 9:37=E2=80=AFAM Nilawar, Badal <badal.nilawar@intel.=
com> wrote:
>
>
> On 02-04-2025 01:05, Rafael J. Wysocki wrote:
> > On Tue, Apr 1, 2025 at 7:53=E2=80=AFPM Raag Jadav <raag.jadav@intel.com=
> wrote:
> >> On Mon, Mar 31, 2025 at 10:18:16PM +0200, Wysocki, Rafael J wrote:
> >>> On 3/31/2025 6:15 PM, Rodrigo Vivi wrote:
> >>>> On Sat, Mar 29, 2025 at 07:20:37AM +0200, Raag Jadav wrote:
> >>>>> On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
> >>>>>> On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
> >>>>>>> On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> >>>>>>>> On 27-03-2025 21:49, Badal Nilawar wrote:
> >>>>>>>> Hi Rodrigo,
> >>>>>>>>
> >>>>>>>>> According to pci core guidelines, pci_save_config is recommende=
d when the
> >>>>>>>>> driver explicitly needs to set the pci power state. As of now x=
e kmd is
> >>>>>>>>> only doing pci_save_config while entering to s2idle/s3 state, w=
hich makes
> >>>>>>>>> pci core think that device driver has already applied required =
pci power
> >>>>>>>>> state. This leads to GPU remain in D0 state. To fix the issue s=
etting
> >>>>>>>>> the pci power state to D3Cold.
> >>>>>>>>>
> >>>>>>>>> Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Int=
el GPUs")
> >>>>>>>>> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>>>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> >>>>>>>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> >>>>>>>>> ---
> >>>>>>>>>     drivers/gpu/drm/xe/xe_pci.c | 1 +
> >>>>>>>>>     1 file changed, 1 insertion(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/x=
e_pci.c
> >>>>>>>>> index 7046e7e9a6c7..3317d475be79 100644
> >>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
> >>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >>>>>>>>> @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *de=
v)
> >>>>>>>>>            pci_save_state(pdev);
> >>>>>>>>>            pci_disable_device(pdev);
> >>>>>>>>> + pci_set_power_state(pdev, PCI_D3cold);
> >>>>>>>> Another approach to avoid calling pci_save_state and pci_set_pow=
er_state,
> >>>>>>>> allowing the PCI core to manage this.
> >>>>>>>> Currently, the above change aligns with the Xe RPM suspend flow.
> >>>>>>> Either way is fine it seems. Or we don't save the state and let p=
ci subsystem
> >>>>>>> handle that for us or we save and set explicitly. So, let's move =
quickly
> >>>>>>> with this option here that is already fixing our current issue.
> >>>>> On our way to become another i915 now, are we?
> >>>> could you please expand on this?
> >>>>
> >>>> A simple git grep on pci_set_power_state and on pci_save_state
> >>>> return many more entries than i915.
> >>>>
> >>>> what am I missing?
> >> It's not about PM at all, just a reference to the infinite
> >>
> >> [1] more code -> merge -> dammit -> fix -> [1]
> >>
> >> cycle.
> >>
> >>>>> While this might be a good enough band-aid, we should probably expl=
ore
> >>>>> how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hi=
de
> >>>>> issues.
> >>>> perhaps this indeed...
> >>>> perhaps the ones doing power state themselves are the ones declaring=
 'smart'?
> >>>>
> >>>> Well, on a dumb script here it looks we have over 110 drivers using =
pci_save_state
> >>>> and only 6 of those using DPM_FLAG_SMART_*
> >>>>
> >>>> So, I agree that it might be a good idea to explore things here and =
find the
> >>>> optimal settings.
> >>> See https://www.kernel.org/doc/html/latest/driver-api/pm/devices.html=
#the-dpm-flag-smart-suspend-driver-flag
> >>>
> >>> It's fairly accurate.
> >>>
> >>> The rule of thumb is to avoid mixing these with calling pci_save_stat=
e()
> >>> directly and setting device state from a driver callback.
> >> That's not what I meant here. There are multiple issues at play.
> >>
> >> 1. An AER is reported[*] on root port during system suspend even befor=
e we
> >>     reach any of the driver PM callback. From initial investigation it=
 seems
> >>     like a case of misbehaviour by some child device, but this is a di=
fferent
> >>     issue entirely.
> >>
> >> [*] irq/120-aerdrv-145     [002] .....  1264.981023: <stack trace>
> >> =3D> xe_pm_runtime_resume
> >> =3D> xe_pci_runtime_resume
> >> =3D> pci_pm_runtime_resume
> >> =3D> __rpm_callback
> >> =3D> rpm_callback
> >> =3D> rpm_resume
> >> =3D> __pm_runtime_resume
> >> =3D> pci_pm_runtime_get_sync
> >> =3D> __pci_walk_bus
> >> =3D> pci_walk_bus
> >> =3D> pcie_do_recovery
> >> =3D> aer_process_err_devices
> >> =3D> aer_isr
> >>
> >> 2. Setting explicit pci_set_power_state(pdev, PCI_D3cold) from xe_pm_s=
uspend().
> >>     Although we see many drivers do it for their case, it's quite a qu=
estionable
> >>     choice (atleast IMHO) to hard suspend the device from driver PM ca=
llback
> >>     without any regard to runtime_usage counter. It can hide potential=
 issues
> >>     like AER during system suspend (regardless of whether or not it is=
 supported
> >>     by the driver, since it is supposed to keep the device active on s=
uch a
> >>     catastrophic failure anyway), but I'll leave it to the experts to =
decide.
> > If the driver does not set DPM_FLAG_SMART_SUSPEND, and xe doesn't set
> > it AFAICS (at least not in the mainline), pci_pm_suspend() will resume
> > the device from runtime suspend before invoking its driver's callback.
> >
> > This guarantees that the device is always RPM_ACTIVE when
> > xe_pci_suspend() runs and it cannot be runtime-suspended because the
> > core is holding a runtime PM reference on it (and so the runtime PM
> > usage counter is always greater than zero when xe_pci_suspend() runs).
> >
> > This means that neither xe_pci_runtime_suspend() nor
> > xe_pci_runtime_resume() can run concurrently with respect to it, so
> > xe_pci_suspend() can change the power state of the device etc. safely.
> > Of course, it needs to call pci_save_state() before doing any of that,
> > but it does so.
> >
> > This is expected to work, but resuming the device from runtime suspend
> > during a system suspend transition can be avoided (see below).
> >
> > However, on the resume side, pci_pm_resume_noirq() runs first and
> > because dev_pm_skip_resume() returns 'false' (since
> > DPM_FLAG_SMART_SUSPEND is unset) and skip_bus_pm is 'false' (since the
> > device is not in D0), it will call pci_pm_default_resume_early() which
> > will (1) put the device into D0 unconditionally and (2) restore its
> > state.
> >
> > This means that by the time when xe_pci_resume() runs, the power state
> > of the device is already D0 and its state has already been restored,
> > so the initial part of it is arguably redundant.
> >
> > There also appears to be a problem with calling pci_disable_device()
> > after pci_save_state() in xe_pci_suspend() because restoring the
> > device's state in pci_pm_default_resume_early() will inadvertently
> > cause it to be enabled AFAICS.  I would call pci_save_state() after
> > pci_disable_device(), so the device would still be disabled after
> > running pci_pm_default_resume_early() and xe_pci_resume() would enable
> > it as appropriate.
> >
> >> 2. Since we're already setting D0 and D3 states in our runtime PM call=
backs,
> >>     utilizing DPM_FLAG_SMART_* flags will allow us to skip unnecessary
> >>     runtime_resume during system suspend and let PCI PM take care of a=
ll
> >>     the PCI stuff in a smarter way (even skip D3hot/cold if it's alrea=
dy in it)
> >>     without us needing to duplicate code and do everything manually.
> > That's true in principle, but care needs to be taken.
> >
> > First of all, DPM_FLAG_SMART_PREPARE and DPM_FLAG_SMART_SUSPEND are
> > about different things.
> >
> > DPM_FLAG_SMART_PREPARE is about the direct-complete optimization that
> > allows the suspend and resume of the device to be skipped completely
> > if some additional conditions are met and it allows the driver to
> > control the behavior related to this optimization (see "Entering
> > System Suspend" in Documentation/driver-api/pm/devices.rst for
> > details).  The bottom line here is that because xe doesn't provide a
> > ->prepare() callback in xe_pm_ops, this flag will have no effect.  xe
> > may want to set DPM_FLAG_NO_DIRECT_COMPLETE to disable the
> > direct-complete optimization completely, though (i915 does this for
> > some reason unclear to me).
> >
> > DPM_FLAG_SMART_SUSPEND is about leaving the device in runtime suspend
> > across the entire system suspend transition if it is still
> > runtime-suspended after running its driver's ->suspend() callback.
> >
> > This means in particular that if DPM_FLAG_SMART_SUSPEND is set, the
> > ->suspend() callback may run in parallel with xe_pci_runtime_resume(),
> > so it cannot be the current xe_pci_suspend() because it cannot
> > manipulate the device or call pci_save_state() on it or similar.  The
> > most straightforward way to overcome this would be to point
> > ->suspend_late() to xe_pci_suspend(), but this would cause the device
> > to be suspended later unless it was runtime-suspended already.  In
> > turn, suspending it later may cause the total duration of the system
> > suspend transition to increase (because the device will now be
> > suspended in a different phase of the transition).
> >
> > The suspend time can be distributed somewhat differently if the core
> > is allowed to take care of putting the device into a low-power state.
> > Simply removing the pci_save_state() and pci_set_power_state() calls
> > from xe_pci_suspend() should be sufficient to make this happen and
> > that would be my first step (after fixing the device disable/enable
> > issue described above).
> >
> > Next, you can point ->suspend_late(), instead of ->suspend(), to
> > xe_pci_suspend() and that is still expected to work, but the total
> > system suspend timing will change.
> >
> > If this works, you'll be ready to set DPM_FLAG_SMART_SUSPEND.
>
>  From above what I understand, setting DPM_FLAG_SMART_SUSPEND enforces
> the requirement that the device must be
> runtime suspended in order to be suspended.

No, it doesn't.

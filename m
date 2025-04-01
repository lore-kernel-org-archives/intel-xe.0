Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C9C36017
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 19:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9E210E661;
	Tue,  1 Apr 2025 19:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h4hTEfO4";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCBF10E661
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:36:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 63E80A41301
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B8CC4CEE4
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 19:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743536161;
 bh=uZmGEmbD4YA5mIc17uNQ5/xgj0zYq+XYisT+Iv+qs2g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h4hTEfO4+uiZYnq08jlIsSJCq2LnosJX9gsdBT+we5bQcQ+jAPl6rXYpPlnYYk7RZ
 NjYiEZ3B+//kkuUvkeEYU+rbO9OF0W9/UECis5+E8Pjr70b9WyTsOyaQ5TQgao8npN
 0zL+b8BHLWZmkxeun422ZjVdzzizFasD9c3iXofK0DKMyrJ9+VfeVgklZ85A6ik24I
 AJ30xrBPaJfhbIKkEDO/4jB7jHD+YJU9AAa3ACQaVsbtJjfWrmBSYFPcg8BAOBCD/+
 e4a83uSKLkSQLzbQG1SiCsCq11/1KJ0flMpngGyMjG0AttXve89kq+dC2YbY+2bUI+
 frd40FMdQq4KA==
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2c787506611so1779987fac.3
 for <intel-xe@lists.freedesktop.org>; Tue, 01 Apr 2025 12:36:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUrz+NU7fD0U/DlNqIH90ka12UpJdvlNO2at5ma/JxIkIWiWdVdfQSVQZfYB42wD1G3LtKU1LMxQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymjb+m06FKfblpIm3B7NFnaWQIzz9RUDsCF7Bg4Brapwd55AdU
 FBJIYUCInFOJxCH5FFFr48OgkDNFyUIlVjEuY0+nxcpt8UGArMLze1seLn18DcQxjDy9Bmf02jN
 g89VVZN7arRyim/aGlayygHOoN6M=
X-Google-Smtp-Source: AGHT+IFYMOK/Gc0O8V9n7PIzZpIbf7yLiBicjJJp7Jh6neAaa2o+KDq+tmbNiXbpYRDPXDjZ08AGeymbf2TPm34c4FI=
X-Received: by 2002:a05:6870:610e:b0:29f:a0b8:6f7f with SMTP id
 586e51a60fabf-2cbcf503f3amr8091404fac.12.1743536161053; Tue, 01 Apr 2025
 12:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com> <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
In-Reply-To: <Z-woHnrukI7qtB4m@black.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 1 Apr 2025 21:35:49 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jo-gkfGu_0sPGCidEoXMsJtt25-ju4W4-LcuZr1Y6gIYuAHfpFN4OIpMIo
Message-ID: <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
To: Raag Jadav <raag.jadav@intel.com>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, "Nilawar, Badal" <badal.nilawar@intel.com>, 
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Tue, Apr 1, 2025 at 7:53=E2=80=AFPM Raag Jadav <raag.jadav@intel.com> wr=
ote:
>
> On Mon, Mar 31, 2025 at 10:18:16PM +0200, Wysocki, Rafael J wrote:
> > On 3/31/2025 6:15 PM, Rodrigo Vivi wrote:
> > > On Sat, Mar 29, 2025 at 07:20:37AM +0200, Raag Jadav wrote:
> > > > On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
> > > > > On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
> > > > > > On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> > > > > > > On 27-03-2025 21:49, Badal Nilawar wrote:
> > > > > > > Hi Rodrigo,
> > > > > > >
> > > > > > > > According to pci core guidelines, pci_save_config is recomm=
ended when the
> > > > > > > > driver explicitly needs to set the pci power state. As of n=
ow xe kmd is
> > > > > > > > only doing pci_save_config while entering to s2idle/s3 stat=
e, which makes
> > > > > > > > pci core think that device driver has already applied requi=
red pci power
> > > > > > > > state. This leads to GPU remain in D0 state. To fix the iss=
ue setting
> > > > > > > > the pci power state to D3Cold.
> > > > > > > >
> > > > > > > > Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for=
 Intel GPUs")
> > > > > > > > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > > > > ---
> > > > > > > >    drivers/gpu/drm/xe/xe_pci.c | 1 +
> > > > > > > >    1 file changed, 1 insertion(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/=
xe/xe_pci.c
> > > > > > > > index 7046e7e9a6c7..3317d475be79 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > > @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device=
 *dev)
> > > > > > > >           pci_save_state(pdev);
> > > > > > > >           pci_disable_device(pdev);
> > > > > > > > + pci_set_power_state(pdev, PCI_D3cold);
> > > > > > > Another approach to avoid calling pci_save_state and pci_set_=
power_state,
> > > > > > > allowing the PCI core to manage this.
> > > > > > > Currently, the above change aligns with the Xe RPM suspend fl=
ow.
> > > > > > Either way is fine it seems. Or we don't save the state and let=
 pci subsystem
> > > > > > handle that for us or we save and set explicitly. So, let's mov=
e quickly
> > > > > > with this option here that is already fixing our current issue.
> > > > On our way to become another i915 now, are we?
> > > could you please expand on this?
> > >
> > > A simple git grep on pci_set_power_state and on pci_save_state
> > > return many more entries than i915.
> > >
> > > what am I missing?
>
> It's not about PM at all, just a reference to the infinite
>
> [1] more code -> merge -> dammit -> fix -> [1]
>
> cycle.
>
> > > > While this might be a good enough band-aid, we should probably expl=
ore
> > > > how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hi=
de
> > > > issues.
> > > perhaps this indeed...
> > > perhaps the ones doing power state themselves are the ones declaring =
'smart'?
> > >
> > > Well, on a dumb script here it looks we have over 110 drivers using p=
ci_save_state
> > > and only 6 of those using DPM_FLAG_SMART_*
> > >
> > > So, I agree that it might be a good idea to explore things here and f=
ind the
> > > optimal settings.
> >
> > See https://www.kernel.org/doc/html/latest/driver-api/pm/devices.html#t=
he-dpm-flag-smart-suspend-driver-flag
> >
> > It's fairly accurate.
> >
> > The rule of thumb is to avoid mixing these with calling pci_save_state(=
)
> > directly and setting device state from a driver callback.
>
> That's not what I meant here. There are multiple issues at play.
>
> 1. An AER is reported[*] on root port during system suspend even before w=
e
>    reach any of the driver PM callback. From initial investigation it see=
ms
>    like a case of misbehaviour by some child device, but this is a differ=
ent
>    issue entirely.
>
> [*] irq/120-aerdrv-145     [002] .....  1264.981023: <stack trace>
> =3D> xe_pm_runtime_resume
> =3D> xe_pci_runtime_resume
> =3D> pci_pm_runtime_resume
> =3D> __rpm_callback
> =3D> rpm_callback
> =3D> rpm_resume
> =3D> __pm_runtime_resume
> =3D> pci_pm_runtime_get_sync
> =3D> __pci_walk_bus
> =3D> pci_walk_bus
> =3D> pcie_do_recovery
> =3D> aer_process_err_devices
> =3D> aer_isr
>
> 2. Setting explicit pci_set_power_state(pdev, PCI_D3cold) from xe_pm_susp=
end().
>    Although we see many drivers do it for their case, it's quite a questi=
onable
>    choice (atleast IMHO) to hard suspend the device from driver PM callba=
ck
>    without any regard to runtime_usage counter. It can hide potential iss=
ues
>    like AER during system suspend (regardless of whether or not it is sup=
ported
>    by the driver, since it is supposed to keep the device active on such =
a
>    catastrophic failure anyway), but I'll leave it to the experts to deci=
de.

If the driver does not set DPM_FLAG_SMART_SUSPEND, and xe doesn't set
it AFAICS (at least not in the mainline), pci_pm_suspend() will resume
the device from runtime suspend before invoking its driver's callback.

This guarantees that the device is always RPM_ACTIVE when
xe_pci_suspend() runs and it cannot be runtime-suspended because the
core is holding a runtime PM reference on it (and so the runtime PM
usage counter is always greater than zero when xe_pci_suspend() runs).

This means that neither xe_pci_runtime_suspend() nor
xe_pci_runtime_resume() can run concurrently with respect to it, so
xe_pci_suspend() can change the power state of the device etc. safely.
Of course, it needs to call pci_save_state() before doing any of that,
but it does so.

This is expected to work, but resuming the device from runtime suspend
during a system suspend transition can be avoided (see below).

However, on the resume side, pci_pm_resume_noirq() runs first and
because dev_pm_skip_resume() returns 'false' (since
DPM_FLAG_SMART_SUSPEND is unset) and skip_bus_pm is 'false' (since the
device is not in D0), it will call pci_pm_default_resume_early() which
will (1) put the device into D0 unconditionally and (2) restore its
state.

This means that by the time when xe_pci_resume() runs, the power state
of the device is already D0 and its state has already been restored,
so the initial part of it is arguably redundant.

There also appears to be a problem with calling pci_disable_device()
after pci_save_state() in xe_pci_suspend() because restoring the
device's state in pci_pm_default_resume_early() will inadvertently
cause it to be enabled AFAICS.  I would call pci_save_state() after
pci_disable_device(), so the device would still be disabled after
running pci_pm_default_resume_early() and xe_pci_resume() would enable
it as appropriate.

> 2. Since we're already setting D0 and D3 states in our runtime PM callbac=
ks,
>    utilizing DPM_FLAG_SMART_* flags will allow us to skip unnecessary
>    runtime_resume during system suspend and let PCI PM take care of all
>    the PCI stuff in a smarter way (even skip D3hot/cold if it's already i=
n it)
>    without us needing to duplicate code and do everything manually.

That's true in principle, but care needs to be taken.

First of all, DPM_FLAG_SMART_PREPARE and DPM_FLAG_SMART_SUSPEND are
about different things.

DPM_FLAG_SMART_PREPARE is about the direct-complete optimization that
allows the suspend and resume of the device to be skipped completely
if some additional conditions are met and it allows the driver to
control the behavior related to this optimization (see "Entering
System Suspend" in Documentation/driver-api/pm/devices.rst for
details).  The bottom line here is that because xe doesn't provide a
->prepare() callback in xe_pm_ops, this flag will have no effect.  xe
may want to set DPM_FLAG_NO_DIRECT_COMPLETE to disable the
direct-complete optimization completely, though (i915 does this for
some reason unclear to me).

DPM_FLAG_SMART_SUSPEND is about leaving the device in runtime suspend
across the entire system suspend transition if it is still
runtime-suspended after running its driver's ->suspend() callback.

This means in particular that if DPM_FLAG_SMART_SUSPEND is set, the
->suspend() callback may run in parallel with xe_pci_runtime_resume(),
so it cannot be the current xe_pci_suspend() because it cannot
manipulate the device or call pci_save_state() on it or similar.  The
most straightforward way to overcome this would be to point
->suspend_late() to xe_pci_suspend(), but this would cause the device
to be suspended later unless it was runtime-suspended already.  In
turn, suspending it later may cause the total duration of the system
suspend transition to increase (because the device will now be
suspended in a different phase of the transition).

The suspend time can be distributed somewhat differently if the core
is allowed to take care of putting the device into a low-power state.
Simply removing the pci_save_state() and pci_set_power_state() calls
from xe_pci_suspend() should be sufficient to make this happen and
that would be my first step (after fixing the device disable/enable
issue described above).

Next, you can point ->suspend_late(), instead of ->suspend(), to
xe_pci_suspend() and that is still expected to work, but the total
system suspend timing will change.

If this works, you'll be ready to set DPM_FLAG_SMART_SUSPEND.

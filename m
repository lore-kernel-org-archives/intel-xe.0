Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207C9C36014
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 10:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B924710E02B;
	Wed,  2 Apr 2025 10:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T7ovHqA1";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F3B10E02B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:32:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 86E61A4404A
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1266AC4CEDD
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743589921;
 bh=KSMMUMoYozxHC1VPbmOOw74GUhytRfSP7o0CuBbt53k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T7ovHqA1karmGIivS1CbyHoataj4aWcPB6Cx5bQMnFGOBdS6YEw6PHwMnSCtukHAG
 kl5SjbY9kCKMj6wIJ/EeFRcFxlbTcNVCRnJmv/TrurrX6L9S45tEJ6e/18LqI9ymvF
 onSaPZLaknosJXVpUxuSaM+Hnivg/yc+zZECSp3AyNBj93OygzzxFoKrOsk1yeGZrh
 HE4oXpLsM+5NqJfKJu5FvDHUJXhPplheki07RJJpW4ffSW5kj0Xgcqa6D3/28mD+mH
 FL8eEmRaEoRlsCakRqtXxgv9CChEDsiU4wLcGdRj1V9WfHOvNy+L4xbS8opv4qpzlo
 5kOyVMUoaBl4g==
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-2c1c9b7bd9aso3937175fac.0
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 03:32:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXn7Szdi5vbOaqVVhYDi2PT845pYmAZ1/5WVqrfyhsw657jhmFA0J7Jobn6IAGbKVvxD1tgp6sDKA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgD6NktahqlvFetWo0KK9B1Cmml2jUNBSLiHd8OHNZRJzi3c80
 vtED3Z+aOe5wlBRRa0COzmwQLy0Kdfx3UfHHdTAyPaRnY/eEbYv/MTX0QCpa4bFQKb6T3utc4NO
 85nhf8SXj58OBMH/qEKc1/1esfdQ=
X-Google-Smtp-Source: AGHT+IH9lKtbUXipHarSX3bWt0xft/Vo0GaCJr41WGNVpgfm5Cjo1sDLJ56+mbT8f5c/MdWExt4yAiBGR7JtBDRlBUs=
X-Received: by 2002:a05:6870:ff8a:b0:2c8:340d:1076 with SMTP id
 586e51a60fabf-2cbcf7e01e5mr9932575fac.32.1743589920348; Wed, 02 Apr 2025
 03:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com> <Z-WHYbhu1QdjUFPR@intel.com>
 <Z-bICZUBN_Fk0_mM@intel.com> <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
 <Z-q_n1g9wIEZc-dm@intel.com> <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
 <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
 <Z-znv8D3qIcVX-p1@black.fi.intel.com> <Z-z2fz97RwX2kBya@black.fi.intel.com>
In-Reply-To: <Z-z2fz97RwX2kBya@black.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Apr 2025 12:31:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hpkjH_Q7V70jWpC68YQxKkmh0wpwrPrHcUwQJ6uRGrOQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrdMI1m7uqi3T2eAZmJbYjGEPRQvIzT9wyh7neWfOqQXvq6X_MCmOrMHRY
Message-ID: <CAJZ5v0hpkjH_Q7V70jWpC68YQxKkmh0wpwrPrHcUwQJ6uRGrOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
To: Raag Jadav <raag.jadav@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 "Nilawar, Badal" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org, 
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

On Wed, Apr 2, 2025 at 10:34=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> On Wed, Apr 02, 2025 at 10:31:16AM +0300, Raag Jadav wrote:
> > On Tue, Apr 01, 2025 at 09:35:49PM +0200, Rafael J. Wysocki wrote:
> > > On Tue, Apr 1, 2025 at 7:53=E2=80=AFPM Raag Jadav <raag.jadav@intel.c=
om> wrote:
> >
> > ...
> >
> > > > That's not what I meant here. There are multiple issues at play.
> > > >
> > > > 1. An AER is reported[*] on root port during system suspend even be=
fore we
> > > >    reach any of the driver PM callback. From initial investigation =
it seems
> > > >    like a case of misbehaviour by some child device, but this is a =
different
> > > >    issue entirely.
> > > >
> > > > [*] irq/120-aerdrv-145     [002] .....  1264.981023: <stack trace>
> > > > =3D> xe_pm_runtime_resume
> > > > =3D> xe_pci_runtime_resume
> > > > =3D> pci_pm_runtime_resume
> > > > =3D> __rpm_callback
> > > > =3D> rpm_callback
> > > > =3D> rpm_resume
> > > > =3D> __pm_runtime_resume
> > > > =3D> pci_pm_runtime_get_sync
> > > > =3D> __pci_walk_bus
> > > > =3D> pci_walk_bus
> > > > =3D> pcie_do_recovery
> > > > =3D> aer_process_err_devices
> > > > =3D> aer_isr
> > > >
> > > > 2. Setting explicit pci_set_power_state(pdev, PCI_D3cold) from xe_p=
m_suspend().
> > > >    Although we see many drivers do it for their case, it's quite a =
questionable
> > > >    choice (atleast IMHO) to hard suspend the device from driver PM =
callback
> > > >    without any regard to runtime_usage counter. It can hide potenti=
al issues
> > > >    like AER during system suspend (regardless of whether or not it =
is supported
> > > >    by the driver, since it is supposed to keep the device active on=
 such a
> > > >    catastrophic failure anyway), but I'll leave it to the experts t=
o decide.
> > >
> > > If the driver does not set DPM_FLAG_SMART_SUSPEND, and xe doesn't set
> > > it AFAICS (at least not in the mainline), pci_pm_suspend() will resum=
e
> > > the device from runtime suspend before invoking its driver's callback=
.
> > >
> > > This guarantees that the device is always RPM_ACTIVE when
> > > xe_pci_suspend() runs and it cannot be runtime-suspended because the
> > > core is holding a runtime PM reference on it (and so the runtime PM
> > > usage counter is always greater than zero when xe_pci_suspend() runs)=
.
> > >
> > > This means that neither xe_pci_runtime_suspend() nor
> > > xe_pci_runtime_resume() can run concurrently with respect to it, so
> > > xe_pci_suspend() can change the power state of the device etc. safely=
.
> >
> > Ah, I failed to notice that __pm_runtime_resume() is taking a spin_lock=
_irqsave().
> > Thanks for clearing this up.
>
> On second thought, pcie_do_recovery() can still race with xe_pci_suspend(=
),
> is this understanding correct?

Yes, it can, but this is an AER issue.

Apparently, somebody took runtime PM into account, but they failed to
take system suspend into account.

There are many drivers that do PCI PM in their ->suspend() callbacks
and this predates pcie_do_recovery() AFAICS.  Some of them don't even
support runtime PM.

> I'm assuming this is why it's much safer to do pci_save_state() and
> pci_prepare_to_sleep() only in ->noirq() callbacks like originally done
> by PCI PM, right?

Not really, but close.

The noirq phases were introduced because drivers often failed to
prevent their interrupt handlers from messing up with devices after
powering them down.

Recovery is kind of like hot-add, doing any of them during system
suspend is a bad idea because the outcome is hard to predict.

AER needs to be fixed.

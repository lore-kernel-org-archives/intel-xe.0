Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C705C88E56
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 12:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA7D10F5D0;
	Fri, 11 Sep 2026 12:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA6+c3Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA8410F5C7;
 Fri, 11 Sep 2026 12:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789130843; x=1820666843;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SCbtAi+u9vHzwxQzx2jsGMI9nDFzUe1EuUY4SVd09KA=;
 b=hA6+c3WfK8gZNB0HYj8WRjwP9RfQBv467DfqUt24XjhSTgXmIB4mfOX7
 wk05dobo6RaET8z7IVV6Fr491T9YbjaJEUnEFYNtUGqhPD5MA6Ozwms0m
 8BarvMtnZboVQfOamGRkH6POw/HvEtsP3N3gj8Yd3s9HP87x+zkNw3EAu
 RoLVkXf4xCQti3E29Cuc2bzjT4jPeG0mAL/3Nesjdd52xPdM+nALfg0Is
 TMmoYkE1v0pKq5I2xFylVeLqm1Kkz/VCPX0VSBfRMYNjsLKZ/NaAB4rwH
 32g5TWWWDKimMio+PbFXEMYYmRcMv/R9MmJpj2WU/3vmmBF/7Cy7CPkjt g==;
X-CSE-ConnectionGUID: rfBjpFDXS4SLO5tc+maE2w==
X-CSE-MsgGUID: k+CMDkFKQ9eKLDoeKeKHXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93285077"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93285077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 05:47:23 -0700
X-CSE-ConnectionGUID: 4ijEimhoSo66umxCiw2b0w==
X-CSE-MsgGUID: wFfUAAVRReSkG/Plt4uhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="295395888"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.127])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 05:47:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/pm: handle the PME capability and runtime
 pm routines
In-Reply-To: <83e32e6c3fafdc6a5da34593718a8a403ccd3695.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
 <20260903080410.489411-6-vinod.govindapillai@intel.com>
 <f5e074540e36b2c9fee11a9bfd14beabcc8cf016@intel.com>
 <83e32e6c3fafdc6a5da34593718a8a403ccd3695.camel@intel.com>
Date: Fri, 11 Sep 2026 15:47:18 +0300
Message-ID: <ac1db55f3e2c4ea59e790d0253a106b3fe2d22be@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue, 08 Sep 2026, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> On Fri, 2026-09-04 at 13:03 +0300, Jani Nikula wrote:
>> On Thu, 03 Sep 2026, Vinod Govindapillai
>> <vinod.govindapillai@intel.com> wrote:
>> > During the runtime suspend, check if device is capable of wakeup
>> > from PME. If yes update the helper so that IRQ reset and HPD
>> > polling can be handled accordingly. For PME capable devices,
>> > HPD related IRQs are not reset during runtime suspend and
>> > do not start polling for HPDs every 10s. Instead PME can be
>> > generated from HPDs and corresponding runtime resume calls
>> > can be invoked by PME.
>> >=20
>> > Bspec: 52979, 52980, 68857, 68867, 68970
>> > Assisted-by: GitHub_Copilot:claude-opus-5
>> > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> > ---
>> > =C2=A0drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++++++
>> > =C2=A0drivers/gpu/drm/xe/display/xe_display.h |=C2=A0 4 ++++
>> > =C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++++++++++++++-
>> > =C2=A03 files changed, 29 insertions(+), 1 deletion(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>> > b/drivers/gpu/drm/xe/display/xe_display.c
>> > index 7b25c0814674..ff4a74c5c763 100644
>> > --- a/drivers/gpu/drm/xe/display/xe_display.c
>> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> > @@ -236,6 +236,16 @@ void xe_display_irq_postinstall(struct
>> > xe_device *xe)
>> > =C2=A0	intel_display_irq_postinstall(display);
>> > =C2=A0}
>> > =C2=A0
>> > +void xe_display_set_pme_capable(struct xe_device *xe, bool
>> > pme_from_hpd)
>> > +{
>> > +	struct intel_display *display =3D xe->display;
>> > +
>> > +	if (!xe->info.probe_display)
>> > +		return;
>> > +
>> > +	intel_hpd_set_pme_capable(display, pme_from_hpd);
>>=20
>> The downside with this is that I've been trying hard to *reduce* the
>> number of direct low-level calls from i915 and xe core to display.
>>=20
>> There are 100+ calls already. IMO we need to drop them to the
>> ballpark
>> of less than half.
>>=20
>> This would go directly to a TODO list of things to refactor and clean
>> up.
>>=20
>> Feels like it would be more clean with a parent interface for the
>> display to ask if pme is available, when needed, even though the
>> parent
>> interface is also too big...
>
> Would it be ok to solve this by doing all this in display runtime
> callbacks?
>
> Possible d3cold entry could be found out by using pci_target_state.
>
> Is it ok to acces pci device (pci_enable_wake and pci_target_state) in
> display pm runtime callbacks.

Full disclosure: I really don't know how this xe d3cold runtime
suspend/resume path is supposed to work. i915 disables PCI d3cold before
runtime suspend, and enables it again at runtime resume.

The display part should be unified for both (though its fine if i915
disables it like it does now), and xe really should stop calling
low-level display functions directly from the xe_display_enable_d3cold()
and xe_display_disable_d3cold() functions.

BR,
Jani.









>
> BR,
> Jouni H=C3=B6gander
>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>>=20
>> > +}
>> > +
>> > =C2=A0static bool suspend_to_idle(void)
>> > =C2=A0{
>> > =C2=A0#if IS_ENABLED(CONFIG_ACPI_SLEEP)
>> > diff --git a/drivers/gpu/drm/xe/display/xe_display.h
>> > b/drivers/gpu/drm/xe/display/xe_display.h
>> > index 0babb50bfc77..a77a8fa1d802 100644
>> > --- a/drivers/gpu/drm/xe/display/xe_display.h
>> > +++ b/drivers/gpu/drm/xe/display/xe_display.h
>> > @@ -37,6 +37,8 @@ void xe_display_irq_enable(struct xe_device *xe,
>> > u32 gu_misc_iir);
>> > =C2=A0void xe_display_irq_reset(struct xe_device *xe);
>> > =C2=A0void xe_display_irq_postinstall(struct xe_device *xe);
>> > =C2=A0
>> > +void xe_display_set_pme_capable(struct xe_device *xe, bool
>> > pme_from_hpd);
>> > +
>> > =C2=A0void xe_display_pm_suspend(struct xe_device *xe);
>> > =C2=A0void xe_display_pm_suspend_late(struct xe_device *xe);
>> > =C2=A0void xe_display_pm_resume_early(struct xe_device *xe);
>> > @@ -75,6 +77,8 @@ static inline void xe_display_irq_enable(struct
>> > xe_device *xe, u32 gu_misc_iir)
>> > =C2=A0static inline void xe_display_irq_reset(struct xe_device *xe) {}
>> > =C2=A0static inline void xe_display_irq_postinstall(struct xe_device
>> > *xe) {}
>> > =C2=A0
>> > +static inline void xe_display_set_pme_capable(struct xe_device
>> > *xe, bool pme_from_hpd) {}
>> > +
>> > =C2=A0static inline void xe_display_pm_suspend(struct xe_device *xe) {}
>> > =C2=A0static inline void xe_display_pm_suspend_late(struct xe_device
>> > *xe) {}
>> > =C2=A0static inline void xe_display_pm_resume_early(struct xe_device
>> > *xe) {}
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> > b/drivers/gpu/drm/xe/xe_pci.c
>> > index f8e16aefd2f8..46a33956c5b4 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -1385,6 +1385,8 @@ static int xe_pci_runtime_suspend(struct
>> > device *dev)
>> > =C2=A0{
>> > =C2=A0	struct pci_dev *pdev =3D to_pci_dev(dev);
>> > =C2=A0	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>> > +	pci_power_t state =3D xe->d3cold.allowed ? PCI_D3cold :
>> > PCI_D3hot;
>> > +	bool pme_capable =3D pci_enable_wake(pdev, state, true) =3D=3D
>> > 0;
>> > =C2=A0	int err;
>> > =C2=A0
>> > =C2=A0	/*
>> > @@ -1396,9 +1398,17 @@ static int xe_pci_runtime_suspend(struct
>> > device *dev)
>> > =C2=A0	xe_assert(xe, !IS_SRIOV_VF(xe));
>> > =C2=A0	xe_assert(xe, !pci_num_vf(pdev));
>> > =C2=A0
>> > +	xe_display_set_pme_capable(xe, pme_capable);
>> > +
>> > =C2=A0	err =3D xe_pm_runtime_suspend(xe);
>> > -	if (err)
>> > +	if (err) {
>> > +		if (pme_capable) {
>> > +			pci_enable_wake(pdev, state, false);
>> > +			xe_display_set_pme_capable(xe, false);
>> > +		}
>> > +
>> > =C2=A0		return err;
>> > +	}
>> > =C2=A0
>> > =C2=A0	pci_save_state(pdev);
>> > =C2=A0
>> > @@ -1419,12 +1429,16 @@ static int xe_pci_runtime_resume(struct
>> > device *dev)
>> > =C2=A0{
>> > =C2=A0	struct pci_dev *pdev =3D to_pci_dev(dev);
>> > =C2=A0	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>> > +	pci_power_t state =3D xe->d3cold.allowed ? PCI_D3cold :
>> > PCI_D3hot;
>> > =C2=A0	int err;
>> > =C2=A0
>> > =C2=A0	err =3D pci_set_power_state(pdev, PCI_D0);
>> > =C2=A0	if (err)
>> > =C2=A0		return err;
>> > =C2=A0
>> > +	pci_enable_wake(pdev, state, false);
>> > +	xe_display_set_pme_capable(xe, false);
>> > +
>> > =C2=A0	pci_restore_state(pdev);
>> > =C2=A0
>> > =C2=A0	if (xe->d3cold.allowed) {
>>=20
>

--=20
Jani Nikula, Intel

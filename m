Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA2C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 07:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B4D10E6CA;
	Wed,  2 Apr 2025 07:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPkxxLtJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A0210E6CA
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743579078; x=1775115078;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BorAvBhJ6pyx6byKErZvwL8GOOCaP7P2HeJEv2um6n8=;
 b=TPkxxLtJOixr8xWU890E+/MSOGdNK8x3LPKLtHtUuf7rrHL+kXYZ66BU
 WmPdEfTWtpTamdq9IrSOYBZw35zWwgewgWf78d0Eyv/jE1aXdBY9Wj0U0
 Z2ocBkAUyK8ZJWt16kwT069axpX77+tbYvISuudapxisKfk9icKp7Zckx
 Y1a6PAA/liTWYdeIwrOoPeXJgTLeBdmyHHdJ6PUmlCCu7lnCJzzePeoZB
 cfER64OxSEOfWmS/qRtuCQDfwyal78XFpuYWuSCSUJIN5TbiXVrKri3Al
 1APDxN2M+xJFRcut+e8Vd3rjz0lTJm9nz0uTknZRCmD5RqKKj+s6yWvj0 g==;
X-CSE-ConnectionGUID: xvUiPxuKS/6q9cj5lArvFQ==
X-CSE-MsgGUID: Pu6jDZz1Rxem5ALa/gwZMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44938305"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="44938305"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 00:31:17 -0700
X-CSE-ConnectionGUID: lQL9TPF9S5GcqWYIqNxfkA==
X-CSE-MsgGUID: GQZqEc1/T264rnnig4IJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="131481692"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 00:31:14 -0700
Date: Wed, 2 Apr 2025 10:31:11 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Message-ID: <Z-znv8D3qIcVX-p1@black.fi.intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
 <Z-WHYbhu1QdjUFPR@intel.com> <Z-bICZUBN_Fk0_mM@intel.com>
 <Z-eDJUtxjzIjGlJT@black.fi.intel.com> <Z-q_n1g9wIEZc-dm@intel.com>
 <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
 <Z-woHnrukI7qtB4m@black.fi.intel.com>
 <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0j7ob4YQ9weQ6e5iVbHyRwf-6Vk2MU4r9mK11-8wD09RQ@mail.gmail.com>
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

On Tue, Apr 01, 2025 at 09:35:49PM +0200, Rafael J. Wysocki wrote:
> On Tue, Apr 1, 2025 at 7:53 PM Raag Jadav <raag.jadav@intel.com> wrote:

...

> > That's not what I meant here. There are multiple issues at play.
> >
> > 1. An AER is reported[*] on root port during system suspend even before we
> >    reach any of the driver PM callback. From initial investigation it seems
> >    like a case of misbehaviour by some child device, but this is a different
> >    issue entirely.
> >
> > [*] irq/120-aerdrv-145     [002] .....  1264.981023: <stack trace>
> > => xe_pm_runtime_resume
> > => xe_pci_runtime_resume
> > => pci_pm_runtime_resume
> > => __rpm_callback
> > => rpm_callback
> > => rpm_resume
> > => __pm_runtime_resume
> > => pci_pm_runtime_get_sync
> > => __pci_walk_bus
> > => pci_walk_bus
> > => pcie_do_recovery
> > => aer_process_err_devices
> > => aer_isr
> >
> > 2. Setting explicit pci_set_power_state(pdev, PCI_D3cold) from xe_pm_suspend().
> >    Although we see many drivers do it for their case, it's quite a questionable
> >    choice (atleast IMHO) to hard suspend the device from driver PM callback
> >    without any regard to runtime_usage counter. It can hide potential issues
> >    like AER during system suspend (regardless of whether or not it is supported
> >    by the driver, since it is supposed to keep the device active on such a
> >    catastrophic failure anyway), but I'll leave it to the experts to decide.
> 
> If the driver does not set DPM_FLAG_SMART_SUSPEND, and xe doesn't set
> it AFAICS (at least not in the mainline), pci_pm_suspend() will resume
> the device from runtime suspend before invoking its driver's callback.
> 
> This guarantees that the device is always RPM_ACTIVE when
> xe_pci_suspend() runs and it cannot be runtime-suspended because the
> core is holding a runtime PM reference on it (and so the runtime PM
> usage counter is always greater than zero when xe_pci_suspend() runs).
> 
> This means that neither xe_pci_runtime_suspend() nor
> xe_pci_runtime_resume() can run concurrently with respect to it, so
> xe_pci_suspend() can change the power state of the device etc. safely.

Ah, I failed to notice that __pm_runtime_resume() is taking a spin_lock_irqsave().
Thanks for clearing this up.

> Of course, it needs to call pci_save_state() before doing any of that,
> but it does so.
> 
> This is expected to work, but resuming the device from runtime suspend
> during a system suspend transition can be avoided (see below).
> 
> However, on the resume side, pci_pm_resume_noirq() runs first and
> because dev_pm_skip_resume() returns 'false' (since
> DPM_FLAG_SMART_SUSPEND is unset) and skip_bus_pm is 'false' (since the
> device is not in D0), it will call pci_pm_default_resume_early() which
> will (1) put the device into D0 unconditionally and (2) restore its
> state.
> 
> This means that by the time when xe_pci_resume() runs, the power state
> of the device is already D0 and its state has already been restored,
> so the initial part of it is arguably redundant.
> 
> There also appears to be a problem with calling pci_disable_device()
> after pci_save_state() in xe_pci_suspend() because restoring the
> device's state in pci_pm_default_resume_early() will inadvertently
> cause it to be enabled AFAICS.  I would call pci_save_state() after
> pci_disable_device(), so the device would still be disabled after
> running pci_pm_default_resume_early() and xe_pci_resume() would enable
> it as appropriate.
> 
> > 2. Since we're already setting D0 and D3 states in our runtime PM callbacks,
> >    utilizing DPM_FLAG_SMART_* flags will allow us to skip unnecessary
> >    runtime_resume during system suspend and let PCI PM take care of all
> >    the PCI stuff in a smarter way (even skip D3hot/cold if it's already in it)
> >    without us needing to duplicate code and do everything manually.
> 
> That's true in principle, but care needs to be taken.
> 
> First of all, DPM_FLAG_SMART_PREPARE and DPM_FLAG_SMART_SUSPEND are
> about different things.
> 
> DPM_FLAG_SMART_PREPARE is about the direct-complete optimization that
> allows the suspend and resume of the device to be skipped completely
> if some additional conditions are met and it allows the driver to
> control the behavior related to this optimization (see "Entering
> System Suspend" in Documentation/driver-api/pm/devices.rst for
> details).  The bottom line here is that because xe doesn't provide a
> ->prepare() callback in xe_pm_ops, this flag will have no effect.  xe
> may want to set DPM_FLAG_NO_DIRECT_COMPLETE to disable the
> direct-complete optimization completely, though (i915 does this for
> some reason unclear to me).
> 
> DPM_FLAG_SMART_SUSPEND is about leaving the device in runtime suspend
> across the entire system suspend transition if it is still
> runtime-suspended after running its driver's ->suspend() callback.
> 
> This means in particular that if DPM_FLAG_SMART_SUSPEND is set, the
> ->suspend() callback may run in parallel with xe_pci_runtime_resume(),
> so it cannot be the current xe_pci_suspend() because it cannot
> manipulate the device or call pci_save_state() on it or similar.  The
> most straightforward way to overcome this would be to point
> ->suspend_late() to xe_pci_suspend(), but this would cause the device
> to be suspended later unless it was runtime-suspended already.  In
> turn, suspending it later may cause the total duration of the system
> suspend transition to increase (because the device will now be
> suspended in a different phase of the transition).
> 
> The suspend time can be distributed somewhat differently if the core
> is allowed to take care of putting the device into a low-power state.
> Simply removing the pci_save_state() and pci_set_power_state() calls
> from xe_pci_suspend() should be sufficient to make this happen and
> that would be my first step (after fixing the device disable/enable
> issue described above).
> 
> Next, you can point ->suspend_late(), instead of ->suspend(), to
> xe_pci_suspend() and that is still expected to work, but the total
> system suspend timing will change.
> 
> If this works, you'll be ready to set DPM_FLAG_SMART_SUSPEND.

Excellent. While I did some experimentation of my own, this definitely makes
things more clear. Thank you for your detailed feedback.

I'm still trying to wrap my head around the total suspend duration argument.
Do you mean the time taken by xe_pci_suspend() itself can change with
->suspend_late()? Or are there any other side-effects to it?

Raag

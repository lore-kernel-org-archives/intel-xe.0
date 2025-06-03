Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3556C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 08:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950E510E6C5;
	Tue,  3 Jun 2025 08:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeAhTUFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDC810E6C5
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748938756; x=1780474756;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tAAFs9hWXuhd7pRhOTTCFEUftmbQ5EfFpSZNYzUsXmk=;
 b=LeAhTUFtYXDdPIl/mQF9kqhInoojAHuTbIbU9blW2/qBchtA18eN1lxR
 /B11JuxEzgolYmiUFDDekD1axwoJNhR63KGMuEgLIyfisV29AV3+fmzB0
 6ciz1hklZu/L0iKNCHfuZHfw6kNhdHoCx7Ccqw4UmP0PyLZ0fu/Lnupc/
 alh1i8xP79Piving3SLgCDtxCoWavZTD8DpammZUeM3rIhXRecCByRDTX
 7SKUbr2eDu6daPI9sGtnIvPr/bRQiBl4vLxSgDysrRMNyUFVVhRlxlA3a
 RjBDjWzm7YYr6E/DQe3pgqrG8N6JHZhrzm0fqmPoFh9lFfbcLy+yKno8i Q==;
X-CSE-ConnectionGUID: h/mM/sRcSMy7n+uijoU5rA==
X-CSE-MsgGUID: gGxinfguQ/WZ7ca6G69UhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50884865"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50884865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:19:16 -0700
X-CSE-ConnectionGUID: EVilLpkQS6KJM/SjEETuRQ==
X-CSE-MsgGUID: xHIOxehXQGqxKaOqCSgw1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144761346"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:19:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs
 with no display
In-Reply-To: <IA0PR11MB7185A38AE8BC13D4B6CAEBA7F86DA@IA0PR11MB7185.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
 <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
 <IA0PR11MB7185A38AE8BC13D4B6CAEBA7F86DA@IA0PR11MB7185.namprd11.prod.outlook.com>
Date: Tue, 03 Jun 2025 11:19:12 +0300
Message-ID: <13b240abd3144e1830bf18d133cfabeca3261653@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 03 Jun 2025, "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:
> Hi Matt,
>
>> Subject: Re: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs
>> with no display
>> 
>> On Mon, Jun 02, 2025 at 03:11:18PM -0700, Vivek Kasireddy wrote:
>> > Some SKUs (or variants) of BMG do not have display capabilities and
>> > are intended to be used as compute-only devices. The Xe driver is
>> > expected to work with such devices by probing/initializing all
>> > other capabilities except display. However, the following crash is
>> > seen when Xe tries to load:
>> 
>> Can you provide the full dmesg log?  It's not clear exactly what "no
>> display" means in this case.  What's making the driver think there's no
>> display?  Display GMD_ID reads back as 0?  GMD_ID is normal but all
>> pipes are fused off?  Something else?
> At-least with the BMG SKU I am testing with, GMD_ID_DISPLAY reads back 0,
> and as a result, probe_gmdid_display() returns NULL.

Hmm, do we not have BMG in xe CI? Why did this not blow up then? Did I
miss something?

>> 
>> We already support other platforms with various flavors of "no display"
>> so I'm trying to understand what makes this one different.
> It looks like this is a regression that is caused by a recent patch. Specifically, reverting
> 5a9f299f956e ("drm/xe/display: use xe->display to decide whether to do anything")
> also seems to avoid the crash.

Right. Xe sets

	xe->info.probe_display = false;

for all no display cases, and uses that in subsequent checks.

i915 OTOH retains non-NULL display pointer, and uses HAS_DISPLAY() for
the checks.

I don't think the patch at hand is the right fix for i915, and will need
more work. This was also not sent to intel-gfx and thus lacks i915 CI.

This might be the minimal, safer xe fix for starters:

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 3f92bf51813e..87262acc9513 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -538,10 +538,10 @@ int xe_display_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->display = display;
-
-	if (has_display(xe))
+	if (has_display(xe)) {
+		xe->display = display;
 		return 0;
+	}
 
 no_display:
 	xe->info.probe_display = false;

---

The alternative is to revert 5a9f299f956e ("drm/xe/display: use
xe->display to decide whether to do anything").

No matter what, xe and i915 need unification for no display cases. Xe
oopses on display being non-NULL for no display, and i915 oopses on
display being NULL for no display. ;D

Further comments below inline.

>> What is the
>> actual NULL pointer you're hitting here?
> I believe this is a bit vague, but inside xe_display_flush_cleanup_work(), the line
> spin_lock(&crtc->base.commit_lock);
> appears to be causing the Null-ptr-deref as the crtc object holds some garbage value. 
>
> Thanks,
> Vivek 
>
>> 
>> 
>> Matt
>> 
>> >
>> > [  115.582833] BUG: kernel NULL pointer dereference, address:
>> 00000000000005d0
>> > [  115.589775] #PF: supervisor write access in kernel mode
>> > [  115.594976] #PF: error_code(0x0002) - not-present page
>> > [  115.600088] PGD 0 P4D 0
>> > [  115.602617] Oops: Oops: 0002 [#1] SMP
>> > [  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G     U
>> E       6.15.0-local+ #62 PREEMPT(voluntary)
>> > [  115.617332] Tainted: [U]=USER, [E]=UNSIGNED_MODULE
>> > [  115.622100] Hardware name: Intel Corporation Meteor Lake Client
>> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS
>> MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
>> > [  115.635314] Workqueue: pm pm_runtime_work
>> > [  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
>> > [  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
>> > [  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX:
>> 0000000000000002
>> > [  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI:
>> 00000000000005d0
>> > [  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09:
>> ffff8beb0c1b06c0
>> > [  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12: fffffffffffffff0
>> > [  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15:
>> 00000000000005d0
>> > [  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000)
>> knlGS:0000000000000000
>> > [  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > [  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4:
>> 0000000000f72ef0
>> > [  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>> 0000000000000000
>> > [  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
>> 0000000000000400
>> > [  115.738113] PKRU: 55555554
>> > [  115.740816] Call Trace:
>> > [  115.743258]  <TASK>
>> > [  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
>> > [  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
>> > [  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
>> > [  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
>> > [  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
>> > [  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
>> > [  115.774797]  __rpm_callback+0x48/0x1e0
>> > [  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
>> > [  115.782614]  rpm_callback+0x66/0x70
>> > [  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
>> > [  115.790173]  rpm_suspend+0xe1/0x5e0
>> > [  115.793647]  ? psi_task_switch+0xb8/0x200
>> > [  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
>> > [  115.802502]  pm_runtime_work+0xa6/0xc0
>> > [  115.806238]  process_one_work+0x186/0x350
>> > [  115.810234]  worker_thread+0x33a/0x480
>> > [  115.813968]  ? process_one_work+0x350/0x350
>> > [  115.818132]  kthread+0x10c/0x220
>> > [  115.821350]  ? kthreads_online_cpu+0x120/0x120
>> > [  115.825774]  ret_from_fork+0x3a/0x60
>> > [  115.829339]  ? kthreads_online_cpu+0x120/0x120
>> > [  115.833768]  ret_from_fork_asm+0x11/0x20
>> > [  115.829339]  ? kthreads_online_cpu+0x120/0x120
>> > [  115.833768]  ret_from_fork_asm+0x11/0x20
>> > [  115.837680]  </TASK>
>> > [  115.839907]  acpi_tad(E) drm(E)
>> > [  115.931629] CR2: 00000000000005d0
>> > [  115.934935] ---[ end trace 0000000000000000 ]---
>> > [  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30
>> >
>> > Therefore, to fix this issue, we need to make intel_display_device_probe()
>> > return NULL if it does not detect the presence of display and ensure
>> > that its callers check for non-NULL display object before probing other
>> > display related capabilities.
>> >
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++---
>> >  drivers/gpu/drm/i915/i915_driver.c                  | 4 ++--
>> >  drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 4 ++--
>> >  drivers/gpu/drm/xe/display/xe_display.c             | 2 ++
>> >  4 files changed, 8 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c
>> b/drivers/gpu/drm/i915/display/intel_display_device.c
>> > index 1d8c2036d967..c9494cbf5ba7 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
>> > @@ -1705,9 +1705,8 @@ struct intel_display
>> *intel_display_device_probe(struct pci_dev *pdev)
>> >  	return display;
>> >
>> >  no_display:
>> > -	DISPLAY_INFO(display) = &no_display;
>> > -
>> > -	return display;
>> > +	kfree(display);
>> > +	return NULL;

I quite dislike functions that return distinct error and NULL pointers
for different cases. It should probably return -ENODEV for no display,
and callers can handle that as an okay condition, instead of special
casing NULL for that.

>> >  }
>> >
>> >  void intel_display_device_remove(struct intel_display *display)
>> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
>> b/drivers/gpu/drm/i915/i915_driver.c
>> > index 3b0bda74697d..0bf8125aee8b 100644
>> > --- a/drivers/gpu/drm/i915/i915_driver.c
>> > +++ b/drivers/gpu/drm/i915/i915_driver.c
>> > @@ -757,8 +757,8 @@ i915_driver_create(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>> >  	display = intel_display_device_probe(pdev);
>> >  	if (IS_ERR(display))
>> >  		return ERR_CAST(display);
>> > -
>> > -	i915->display = display;
>> > +	if (display)
>> > +		i915->display = display;

Right now, i915 has never been tested with i915->display being
NULL. It *will* oops.

After that's been fixed, and it may be a bunch of work, I think this
should be something along the lines of:

	display = intel_display_device_probe(pdev);
	if (PTR_ERR(display) == -ENODEV)
		display = NULL;
	if (IS_ERR(display))
		return ERR_CAST(display);

i.e. returning ERR_PTR(-ENODEV) instead of NULL from
intel_display_device_probe().


BR,
Jani.


>> >
>> >  	return i915;
>> >  }
>> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> > index fb8751bd5df0..cb1928d52869 100644
>> > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> > @@ -186,8 +186,8 @@ struct drm_i915_private *mock_gem_device(void)
>> >  	display = intel_display_device_probe(pdev);
>> >  	if (IS_ERR(display))
>> >  		goto err_device;
>> > -
>> > -	i915->display = display;
>> > +	if (display)
>> > +		i915->display = display;
>> >
>> >  	dev_pm_domain_set(&pdev->dev, &pm_domain);
>> >  	pm_runtime_enable(&pdev->dev);
>> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>> b/drivers/gpu/drm/xe/display/xe_display.c
>> > index 3f92bf51813e..027690e4992b 100644
>> > --- a/drivers/gpu/drm/xe/display/xe_display.c
>> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> > @@ -533,6 +533,8 @@ int xe_display_probe(struct xe_device *xe)
>> >  	display = intel_display_device_probe(pdev);
>> >  	if (IS_ERR(display))
>> >  		return PTR_ERR(display);
>> > +	if (!display)
>> > +		goto no_display;
>> >
>> >  	err = drmm_add_action_or_reset(&xe->drm, display_device_remove,
>> display);
>> >  	if (err)
>> > --
>> > 2.49.0
>> >
>> 
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation

-- 
Jani Nikula, Intel

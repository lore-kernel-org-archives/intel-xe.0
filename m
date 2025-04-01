Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3231C36010
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 17:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9437210E63F;
	Tue,  1 Apr 2025 17:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHuEweCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705F10E63F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743530020; x=1775066020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Deh3PI/a3VYfaVn6KchldYYO98CXX7Uk2e990qBme8Q=;
 b=jHuEweCbYDB791X4x07bwOlveYG/MRGsfMlAyXJ4hGm3pSmy06u3uRLJ
 x/GNnS57ztLSJ711tAk3eRYhxo1349ljQx5wxpz+XXMgQj03u+p1/f0+C
 IqgDzc2WotlmgeA3nTDLawJzhWkA4uRA6iB71ggPh+6TSN1+hKLq513e7
 nWq+2tcrQ9mPztRpt0Rqup/lpYX30K5jtZEAgqsN1StcAyEcj5YlGYvFd
 p/orNHVRdLjX+0Bp6tOvKL6yugs4sSehNUIwutjovmTdBjud4wdMxpg5d
 Cq+XG85iKi+74sGehAjUutlWJqYF2o46VbIRXtIRPmNJ5uO0Z+Xbe7Nt0 Q==;
X-CSE-ConnectionGUID: 7vaiMSO4QZSMNILwknLIgg==
X-CSE-MsgGUID: G/5ufv30RRiJoy6EHqUmgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45016171"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="45016171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:53:39 -0700
X-CSE-ConnectionGUID: kJ1TUPcETsKDNUvDjOBeSg==
X-CSE-MsgGUID: /mxjJ9JETduoXET1m0sogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126289644"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 10:53:37 -0700
Date: Tue, 1 Apr 2025 20:53:34 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Message-ID: <Z-woHnrukI7qtB4m@black.fi.intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
 <Z-WHYbhu1QdjUFPR@intel.com> <Z-bICZUBN_Fk0_mM@intel.com>
 <Z-eDJUtxjzIjGlJT@black.fi.intel.com> <Z-q_n1g9wIEZc-dm@intel.com>
 <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d3f3cbe-c33d-4ded-8c19-e2bd2e76a68b@intel.com>
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

On Mon, Mar 31, 2025 at 10:18:16PM +0200, Wysocki, Rafael J wrote:
> On 3/31/2025 6:15 PM, Rodrigo Vivi wrote:
> > On Sat, Mar 29, 2025 at 07:20:37AM +0200, Raag Jadav wrote:
> > > On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
> > > > On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
> > > > > On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> > > > > > On 27-03-2025 21:49, Badal Nilawar wrote:
> > > > > > Hi Rodrigo,
> > > > > > 
> > > > > > > According to pci core guidelines, pci_save_config is recommended when the
> > > > > > > driver explicitly needs to set the pci power state. As of now xe kmd is
> > > > > > > only doing pci_save_config while entering to s2idle/s3 state, which makes
> > > > > > > pci core think that device driver has already applied required pci power
> > > > > > > state. This leads to GPU remain in D0 state. To fix the issue setting
> > > > > > > the pci power state to D3Cold.
> > > > > > > 
> > > > > > > Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > > > ---
> > > > > > >    drivers/gpu/drm/xe/xe_pci.c | 1 +
> > > > > > >    1 file changed, 1 insertion(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > index 7046e7e9a6c7..3317d475be79 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
> > > > > > >    	pci_save_state(pdev);
> > > > > > >    	pci_disable_device(pdev);
> > > > > > > +	pci_set_power_state(pdev, PCI_D3cold);
> > > > > > Another approach to avoid calling pci_save_state and pci_set_power_state,
> > > > > > allowing the PCI core to manage this.
> > > > > > Currently, the above change aligns with the Xe RPM suspend flow.
> > > > > Either way is fine it seems. Or we don't save the state and let pci subsystem
> > > > > handle that for us or we save and set explicitly. So, let's move quickly
> > > > > with this option here that is already fixing our current issue.
> > > On our way to become another i915 now, are we?
> > could you please expand on this?
> > 
> > A simple git grep on pci_set_power_state and on pci_save_state
> > return many more entries than i915.
> > 
> > what am I missing?

It's not about PM at all, just a reference to the infinite

[1] more code -> merge -> dammit -> fix -> [1]

cycle.

> > > While this might be a good enough band-aid, we should probably explore
> > > how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hide
> > > issues.
> > perhaps this indeed...
> > perhaps the ones doing power state themselves are the ones declaring 'smart'?
> > 
> > Well, on a dumb script here it looks we have over 110 drivers using pci_save_state
> > and only 6 of those using DPM_FLAG_SMART_*
> > 
> > So, I agree that it might be a good idea to explore things here and find the
> > optimal settings.
> 
> See https://www.kernel.org/doc/html/latest/driver-api/pm/devices.html#the-dpm-flag-smart-suspend-driver-flag
> 
> It's fairly accurate.
> 
> The rule of thumb is to avoid mixing these with calling pci_save_state()
> directly and setting device state from a driver callback.

That's not what I meant here. There are multiple issues at play.

1. An AER is reported[*] on root port during system suspend even before we
   reach any of the driver PM callback. From initial investigation it seems
   like a case of misbehaviour by some child device, but this is a different
   issue entirely.

[*] irq/120-aerdrv-145     [002] .....  1264.981023: <stack trace>
=> xe_pm_runtime_resume
=> xe_pci_runtime_resume
=> pci_pm_runtime_resume
=> __rpm_callback
=> rpm_callback
=> rpm_resume
=> __pm_runtime_resume
=> pci_pm_runtime_get_sync
=> __pci_walk_bus
=> pci_walk_bus
=> pcie_do_recovery
=> aer_process_err_devices
=> aer_isr

2. Setting explicit pci_set_power_state(pdev, PCI_D3cold) from xe_pm_suspend().
   Although we see many drivers do it for their case, it's quite a questionable
   choice (atleast IMHO) to hard suspend the device from driver PM callback
   without any regard to runtime_usage counter. It can hide potential issues
   like AER during system suspend (regardless of whether or not it is supported
   by the driver, since it is supposed to keep the device active on such a
   catastrophic failure anyway), but I'll leave it to the experts to decide.

2. Since we're already setting D0 and D3 states in our runtime PM callbacks,
   utilizing DPM_FLAG_SMART_* flags will allow us to skip unnecessary
   runtime_resume during system suspend and let PCI PM take care of all
   the PCI stuff in a smarter way (even skip D3hot/cold if it's already in it)
   without us needing to duplicate code and do everything manually.

So let's hold on to our horses for a bit and think these through.

Raag

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBE2CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 06:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4C610E144;
	Thu, 21 May 2026 06:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5zaZhi1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE7310E144
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 06:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779344230; x=1810880230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8L9PRGzhm3CzwLr26dmd+A+zoOqO4zsnIWHw9Pq8jCw=;
 b=Z5zaZhi1N2rrccnADMJL1vmYvcmlAC4xxX8JWm3YPl2Tzp3kDr/FNRy2
 8p4//uqkVTIfxwp8bTbadSULnUEcQDBcIPRYTj7x+YnCsa8h6sBjSbwkP
 9bionLnJ4CSU4mJKXex8lo8U2fSD2QuAJF8xacNZGP9gesqReibqU0jhQ
 436EgZJec9psl1zZxGC19TQ3pejlqeAgWTzxwxmVNne2e8gDAXPlCu76j
 5P0ry7CNELUGpanXQQXBUbC91n2n4ik9gdmpqUnWPeVWjL8o1y5kmoTE7
 iP93AE/1vTiIlHzF/SbImA2VE/Sk4ylWwHXD/0BnLT93V866K+fiqooDR Q==;
X-CSE-ConnectionGUID: NgWBiO2fQUG8Krq9DzyA+g==
X-CSE-MsgGUID: QKs/ZLviQ7u1uJU89FgLEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80111343"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80111343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:17:09 -0700
X-CSE-ConnectionGUID: LThXc2ArQHKOukHy9MU38g==
X-CSE-MsgGUID: JtfPhpgbRIKf6459uz6Ymw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 23:17:07 -0700
Date: Thu, 21 May 2026 08:17:04 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v5 06/14] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
Message-ID: <ag6jYGZFzK4L6mF5@black.igk.intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-22-riana.tauro@intel.com>
 <agYJDqkslpMvjprk@black.igk.intel.com>
 <6fe6f3e9-6779-4949-acac-3d73a9bca571@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fe6f3e9-6779-4949-acac-3d73a9bca571@intel.com>
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

On Thu, May 21, 2026 at 10:28:16AM +0530, Tauro, Riana wrote:
> On 5/14/2026 11:10 PM, Raag Jadav wrote:
> > On Mon, May 11, 2026 at 10:59:13PM +0530, Riana Tauro wrote:
> > > Uncorrectable errors from different endpoints in the device are steered to
> > > the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
> > > Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
> > > bus driver from triggering a Secondary Bus Reset (SBR). This allows error
> > > detection, containment and recovery in the driver.
> > > 
> > > The Uncorrectable Error Severity Register has the 'Uncorrectable
> > > Internal Error Severity' set to fatal by default. Set this to
> > > non-fatal and unmask the error.
> > > 
> > > Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> > > ---
> > > v2: clear stale uncorrectable internal status in status register
> > > (Aravind)
> > > 
> > > v3: abbrevate TLA's (Raag)
> > >      add a info message if USP does not support AER
> > > 
> > > v4: add a success log (Raag)
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c |  3 ++
> > >   drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_ras.h    |  2 +-
> > >   3 files changed, 82 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 4b45b617a039..200d6bbb1b70 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -62,6 +62,7 @@
> > >   #include "xe_psmi.h"
> > >   #include "xe_pxp.h"
> > >   #include "xe_query.h"
> > > +#include "xe_ras.h"
> > >   #include "xe_shrinker.h"
> > >   #include "xe_soc_remapper.h"
> > >   #include "xe_survivability_mode.h"
> > > @@ -1048,6 +1049,8 @@ int xe_device_probe(struct xe_device *xe)
> > >   	if (err)
> > >   		goto err_unregister_display;
> > > +	xe_ras_init(xe);
> > > +
> > >   	err = xe_device_sysfs_init(xe);
> > >   	if (err)
> > >   		goto err_unregister_display;
> > > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > > index 4cb16b419b0c..24642c309967 100644
> > > --- a/drivers/gpu/drm/xe/xe_ras.c
> > > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > > @@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> > >   			comp_to_str(component), sev_to_str(severity));
> > >   	}
> > >   }
> > > +
> > > +#ifdef CONFIG_PCIEAER
> > I think all the PCI stuff should be part of xe_pci_error.c but I'll leave
> > it to you all.
> 
> xe_pci_error has PCI generic error handlers. However this is not a general
> PCI policy.
> This is to enable RAS flows for devices having a sysctrl to steer errors as
> uncorrectable
> internal errors. According to me this is more suitable here.

Then perhaps let's add a xe_pci_config.c? We have a bunch of similar
stuff incoming[1], so probably worth having a dedicated component.

[1] https://lore.kernel.org/intel-xe/20260520113351.171119-12-mallesh.koujalagi@intel.com/

Raag

> > > +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > +	struct pci_dev *vsp, *usp;
> > > +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
> > > +	u16 aer_cap;
> > > +
> > > +	/*
> > > +	 * Device Hierarchy:
> > > +	 *
> > > +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
> > > +	 */
> > > +	vsp = pci_upstream_bridge(pdev);
> > > +	if (!vsp)
> > > +		return;
> > > +
> > > +	usp = pci_upstream_bridge(vsp);
> > > +	if (!usp)
> > > +		return;
> > > +
> > > +	aer_cap = usp->aer_cap;
> > > +
> > > +	if (!aer_cap) {
> > > +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
> > > +	 * Status Register.
> > > +	 */
> > > +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
> > > +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
> > > +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
> > > +
> > > +	/*
> > > +	 * All errors are steered to USP which is a PCIe AER Compliant device.
> > > +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> > > +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> > > +	 * detection, containment and recovery in the driver.
> > > +	 *
> > > +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> > > +	 * Internal Error Severity' set to fatal by default. Set this to
> > > +	 * non-fatal and unmask the error.
> > > +	 */
> > > +
> > > +	/* Initialize Uncorrectable Error Severity Register */
> > > +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> > > +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> > > +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> > > +
> > > +	/* Initialize Uncorrectable Error Mask Register */
> > > +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> > > +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> > > +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
> > > +
> > > +	pci_save_state(usp);
> > > +	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
> > > +}
> > > +#endif
> > > +
> > > +/**
> > > + * xe_ras_init - Initialize Xe RAS
> > > + * @xe: xe device instance
> > > + *
> > > + * Initialize Xe RAS
> > > + */
> > > +void xe_ras_init(struct xe_device *xe)
> > > +{
> > > +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> > > +		return;
> > > +
> > > +#ifdef CONFIG_PCIEAER
> > > +	aer_unmask_and_downgrade_internal_error(xe);
> > > +#endif
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> > > index ea90593b62dc..a88ea0a46766 100644
> > > --- a/drivers/gpu/drm/xe/xe_ras.h
> > > +++ b/drivers/gpu/drm/xe/xe_ras.h
> > > @@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
> > >   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
> > >   				      struct xe_sysctrl_event_response *response);
> > > -
> > > +void xe_ras_init(struct xe_device *xe);
> > >   #endif
> > > -- 
> > > 2.47.1
> > > 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80662FF8864
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 07:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A3B10E5E5;
	Mon, 27 Apr 2026 07:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0Wg7MAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FB210E5E5
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777276595; x=1808812595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hgn5euI5XQhVdgq5NfzvgT12zbu3aAseQaQfrTVjbIo=;
 b=R0Wg7MACqjXsMzEDYi0ETOmBIMBS6jibT3/fMAhJYNU0q0skZ2sjv0I8
 XXSKL76igH9E7tMIQf7B+q7yaiLslSTli9HNt9fRNO21YHVfCpSArPvFz
 u5AMPhTcBnGyDHZ7f4s+oI236Lq/EOpIW3ejCkyjD4ikS5DHXPMZPr2ic
 /1jqD7nfZcbrLgltPlhv+5TfiFvr7tNlNNpInsEfxP/jGBhHrmaDnAogB
 MUPQhLzCMZul1wEd5I6NzZj+zADPEsC5fLN0tN+L3EThYdiS18ZoAl6/e
 N4E4nqtx0co/Ta6ctLcz5t3TXI1fEKZD9BlWBlqHM4icYtwlchCRVPOEH w==;
X-CSE-ConnectionGUID: 4vMBtnIZTBC2p8khu4HO1Q==
X-CSE-MsgGUID: 4yId9FyKQMauSpfz+kXlhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78175370"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78175370"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 00:56:35 -0700
X-CSE-ConnectionGUID: K+o2ZvHCRiWPTF25srAN1A==
X-CSE-MsgGUID: IUi7gwY7R0+Nn5dk6QtS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="256873530"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 00:56:32 -0700
Date: Mon, 27 Apr 2026 09:56:29 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v4 05/13] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
Message-ID: <ae8WrfTLjnJiSW4C@black.igk.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-20-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417085812.4013309-20-riana.tauro@intel.com>
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

On Fri, Apr 17, 2026 at 02:28:17PM +0530, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
> 
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: clear stale uncorrectable internal status in status register
> (Aravind)
> 
> v3: Abbrevate TLA's (Raag)
>     Add a info message if USP does not support AER
> ---
>  drivers/gpu/drm/xe/Makefile    |  1 +
>  drivers/gpu/drm/xe/xe_device.c |  3 ++
>  drivers/gpu/drm/xe/xe_ras.c    | 84 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h    | 13 ++++++
>  4 files changed, 101 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 69c233d9a488..e29a4ae99ac6 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>  	xe_pxp_debugfs.o \
>  	xe_pxp_submit.o \
>  	xe_query.o \
> +	xe_ras.o \
>  	xe_range_fence.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cbdf7426e09c..c1c54836ac73 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1074,6 +1075,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	xe_ras_init(xe);
> +
>  	err = xe_sriov_init_late(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..4f705deaeefa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device_types.h"
> +#include "xe_ras.h"
> +
> +#ifdef CONFIG_PCIEAER
> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
> +	u16 aer_cap;
> +
> +	/*
> +	 * Device Hierarchy:
> +	 *
> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
> +	 */
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return;
> +
> +	usp = pci_upstream_bridge(vsp);
> +	if (!usp)
> +		return;
> +
> +	aer_cap = usp->aer_cap;
> +
> +	if (!aer_cap) {
> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
> +		return;
> +	}
> +
> +	/*
> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
> +	 * Status Register.
> +	 */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
> +
> +	/*
> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */
> +
> +	/* Initialize Uncorrectable Error Severity Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> +
> +	/* Initialize Uncorrectable Error Mask Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
> +
> +	pci_save_state(usp);
> +}
> +#endif
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +#ifdef CONFIG_PCIEAER
> +	aer_unmask_and_downgrade_internal_error(xe);

If we fail silently we'd most likely be clueless why RAS isn't working.
So either add error log here or have an explicit success log inside
downgrade function.

Raag

> +#endif
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif
> -- 
> 2.47.1
> 

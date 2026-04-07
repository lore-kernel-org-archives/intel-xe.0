Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1862FB5197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 05:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5F610E32D;
	Tue,  7 Apr 2026 05:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fp5f1yB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF97E10E32D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775541017; x=1807077017;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6dRmoMTxLAd+zaqu2sDaZN9KebGZcCtLYP2uSRju72I=;
 b=fp5f1yB1gNoKS0umLTS+MOXaqhCVMemtZBldSHaGF9ZuVhdgIrc+7nfr
 dIeDBoZQuvvi3hWOfN47pdBTOIRIXsfnsuveWAdU2hKfcaDPONZOLz9mV
 JVuix081eY+1wKEO9Zkbf5TCVUtgRSjvi0J/zXNxCFpcKe10oyyYOWxpk
 6k6aIB8ZaVjIh+6D7/I+8wA382k9nZfje42eJdcZfRINHsUNGNL1JIlQz
 jHrlD7Dn2aF8Hm0M/GkJJfHco+gmtWMactsTECV01kUciwlWtY97Kl+Il
 GoMaAziYtG8qObUptx/A969LX37xw8LXLleFYWPYexgxbSy/jWJGnIjtj A==;
X-CSE-ConnectionGUID: DwoHm7HyQKG4vk91CRzQ0w==
X-CSE-MsgGUID: XdLH7dfrRdOHSVJ2Ve14Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76685407"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76685407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:50:16 -0700
X-CSE-ConnectionGUID: ++A/gjOPQlG5kazrobXfrQ==
X-CSE-MsgGUID: tP6j0PbkSD+hp+ukhCRmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="223765735"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:50:14 -0700
Date: Tue, 7 Apr 2026 07:50:11 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 05/10] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
Message-ID: <adSbE-2u2fAdJj6q@black.igk.intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-17-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402070131.1603828-17-riana.tauro@intel.com>
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

On Thu, Apr 02, 2026 at 12:31:36PM +0530, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP which is a PCI Advanced Error Reporting (AER) Compliant device.

See below.

> Downgrade all the errors to non-fatal to prevent PCIe bus driver
> from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
> 
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.

...

> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
> +	u16 aer_cap;
> +
> +	 /* Gfx Device Hierarchy: USP-->VSP-->SGunit */

What are these TLAs and why is everyone expected to know them?

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
> +	if (!aer_cap)
> +		return;
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

Ditto.

Raag

> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697D3C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0787010E0D6;
	Tue,  8 Sep 2026 10:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0GQd45F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D808F10E0D6
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862359; x=1820398359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RojSC81fT8Uenj2/uiSK1kxPgp8HmKz5iTr8hNiXTTg=;
 b=Y0GQd45FPZRIFBMjWqhkyIp7gi+LHnXY3rXB5xAoOJAaUBc6JHjw7See
 Zvv2RHzn1e9mlFDWw2j+8eDDONir4aFbjWEinvodjoFADHdQhpFfpJhMc
 O4W+hZ2Vw+CEYt98gChN6LRXT761UFGXEvdatl637GBQd4sGsKYeku+/r
 iLjYkaxbHjU1sJ08h7pEEJVOjvQ0zCa4htSfQRHk1dR7bMIKA5FqUaLDN
 sE6vgoP2gD3J4QEq+r5Vvj3VX70fh7chEDPNlWqqyrToa+J/yXyAip1Pr
 WwAvKlDYnPKwwrHdwo1/TPNS84vdiuySW/0FP5bJDHeUl2OaQpzrDOZ8P g==;
X-CSE-ConnectionGUID: QEWdLa+WSnGdaZ+2+3JDiQ==
X-CSE-MsgGUID: oerZ2TpfQBGTOFxidA/96Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114799546"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="114799546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:12:36 -0700
X-CSE-ConnectionGUID: U8Qh+ZKITf27slFePY2QYA==
X-CSE-MsgGUID: TSe+SzwbRuOvtVM1KYYaxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="271464602"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:12:34 -0700
Date: Tue, 8 Sep 2026 12:12:30 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 01/12] drm/xe/cper: Hardware error CPER reporting from
 xe_log
Message-ID: <ap_fjltTIY1mXyXF@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-15-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906172604.2215987-15-badal.nilawar@intel.com>
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

On Sun, Sep 06, 2026 at 10:56:06PM +0530, Badal Nilawar wrote:
> Introduce xe_emit_hardware_error_cper() as public entry point
> for CPER reporting.
> 
> Wire xe_log to route hardware SIGIDs through the new helper.
> No functional change is intended yet, as the CPER emission logic
> is added in follow-up patches.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile  |  2 ++
>  drivers/gpu/drm/xe/xe_cper.c | 37 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper.h | 25 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.c  | 17 +++++++++++------
>  4 files changed, 75 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67b8b5477639..06b064add77d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -166,6 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>  
> +xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o

Why x86?

>  # graphics virtualization (SR-IOV) support
>  xe-y += \
>  	xe_gt_sriov_vf.o \
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> new file mode 100644
> index 000000000000..e8017e3ee3a0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_cper.h"
> +#include "xe_device.h"
> +#include "xe_ras_types.h"
> +
> +/**
> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
> + * @pdev: PCI device associated with the Xe device
> + * @cper_sev: CPER severity
> + * @sigid: Error signature identifier
> + * @error_class: Hardware error classification details
> + * @response: Response of get counter
> + *
> + * Emit a CPER record for a hardware error
> + */
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,

Why the long names? Can't this be simply xe_cper_hw_emit()?

> +				 struct xe_ras_error_class *counter,
> +				 struct xe_ras_get_counter_response *response)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (!xe)
> +		return;
> +
> +	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
> +		return;
> +
> +	/* TODO */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
> new file mode 100644
> index 000000000000..c4be7f25a369
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_H_
> +#define _XE_CPER_H_
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +struct xe_ras_error_class;
> +struct xe_ras_get_counter_response;
> +
> +#if IS_REACHABLE(CONFIG_UEFI_CPER_X86)
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +				 struct xe_ras_error_class *counter,
> +				 struct xe_ras_get_counter_response *response);
> +#else
> +static inline void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev,
> +					       enum xe_sigid sigid,
> +					       struct xe_ras_error_class *counter,
> +					       struct xe_ras_get_counter_response *response) {}
> +#endif
> +#endif /* _XE_CPER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 5549ef6966fd..2957adec41aa 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -8,17 +8,27 @@
>  
>  #include "abi/xe_log_abi.h"
>  
> +#include "xe_cper.h"
>  #include "xe_device.h"
>  #include "xe_log.h"
>  #include "xe_printk.h"
>  
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;

Shouldn't this be

	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_GPU_XE_HARDWARE_END);

> +}
> +
>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>  			  u32 component, u32 location, const void *data, size_t len,
>  			  struct va_format *vaf)
>  {
>  	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>  				   component, location, data, len, vaf);
> -	/* TODO */
> +
> +	if (is_hw_sigid(sigid) && !IS_ERR(data))

Why not !IS_ERR_OR_NULL(data)?

Raag

> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
> +					    (struct xe_ras_error_class *)data, NULL);
> +	/* TODO software CPER */
>  }
>  
>  static const char *log_unknown_component_prefix(u32 component)
> @@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>  	return buf;
>  }
>  
> -static bool is_hw_sigid(enum xe_sigid sigid)
> -{
> -	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> -}
> -
>  static bool is_sev_error(int cper_sev)
>  {
>  	return cper_sev != CPER_SEV_INFORMATIONAL;
> -- 
> 2.54.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A519CCC6B24
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 07:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FD710FB80;
	Wed, 14 Oct 2026 07:27:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6A710FB7E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791962833; x=1823498833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zYsiwOhkD8jM7xgjJvBhaaFyOSRZg2Lw5LywWxZ09CM=;
 b=b5YfEqO7RG/aHOUjMfBdSd2xZuu+MxbAwZiZgK8vv0adtuozBbolLLmr
 RTvkYzzh4eZ5RI7OxYGXLoas7RGUppzJl7y7v88gpjuHV6xJRpopACH44
 vOsS27GB4XroNQzzsFK0OlZgllH+EZ3/byZrjWV18JzEql9MKbeYh4n3L
 RHL68M+khitFKafaPAgQ9fQjbYFrqQT94IR6XqMFHHiXHcX6iKGGPxzel
 rWoKG28TvqXLXRlfLxkMsqfPStpP830L2fKMfM6+j00KHYWqdLeRZZJEh
 k0kYPOlZrod0UHjAE0+9uQ+ZazWNIeKuOiMLX8I0KE59IOBfN/ADEsj57 g==;
X-CSE-ConnectionGUID: XGtNGSyeToa7JAINdvRK+g==
X-CSE-MsgGUID: a1mN/qJERN6crX8CMz9NwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="585702"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="585702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 00:27:13 -0700
X-CSE-ConnectionGUID: Z5tJAoAxQcWxy/kmdbiC8A==
X-CSE-MsgGUID: miymjp8PSVWWMC7ejD27zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1460871"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 00:27:10 -0700
Date: Wed, 14 Oct 2026 09:27:06 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 03/12] drm/xe/cper: Initialize Intel-specific error
 section header
Message-ID: <as8uythXLgwkWbrN@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-17-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009104602.1075405-17-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:06PM +0530, Badal Nilawar wrote:
> Define the Intel-specific CPER error section header and initialize it

Nit: redundant 'error'.

> from the error counter record for Intel GPU hardware errors.
> 
> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v4:
>  - Split from "drm/xe/cper: Prepare CPER record" (Raag)
>  - Add dedicated struct xe_cper_error_class (Michal)
>  - Drop empty fill_fw_id() stub, leave a TODO instead
> v2:
>  - Guard against NULL THIS_MODULE->srcversion (sashiko)
> ---
>  drivers/gpu/drm/xe/xe_cper.c       | 43 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper_types.h | 72 ++++++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 4f0ed5096aac..e7cae449b349 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -6,8 +6,10 @@
>  #include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/minmax.h>
> +#include <linux/pci.h>
>  
>  #include "xe_cper.h"
> +#include "xe_cper_types.h"
>  #include "xe_device.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
> @@ -18,9 +20,47 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>  	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>  }
>  
> +static void xe_cper_init_intel_err_hdr(struct xe_device *xe,

'err' is redundant. Let's not invent unnecessarily long names that warrant
ugly wrapping.

> +				       const struct xe_ras_error_class *error_class,

Ditto, 'counter'.

> +				       u64 first_timestamp, u32 sig_id, u32 error_count,
> +				       struct xe_cper_sec_intel_err_hdr *ihdr)
> +{
> +	ihdr->error_class.error_type = error_class->common.severity;
> +	ihdr->error_class.error_component = error_class->common.component;
> +	ihdr->error_class.tile = error_class->product.unit.tile;
> +	ihdr->error_class.instance = error_class->product.unit.instance;
> +	ihdr->error_class.cause = error_class->product.cause.cause;
> +	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
> +
> +	if (first_timestamp) {
> +		ihdr->first_timestamp = first_timestamp;
> +		ihdr->validation_bits |= XE_CPER_VALID_FIRST_TIMESTAMP;
> +	}
> +
> +	if (sig_id != U32_MAX) {

Shouldn't this be is_sigid_valid() or something?

> +		ihdr->sig_id = sig_id;
> +		ihdr->validation_bits |= XE_CPER_VALID_SIG_ID;
> +	}
> +
> +	ihdr->error_count = error_count;
> +
> +	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
> +	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
> +
> +#ifdef MODULE
> +	if (THIS_MODULE->srcversion) {
> +		strscpy(ihdr->drv_version, THIS_MODULE->srcversion, sizeof(ihdr->drv_version));
> +		ihdr->validation_bits |= XE_CPER_VALID_DRV_VERSION;
> +	}
> +#endif
> +
> +	/* TODO: fill fw_id and set XE_CPER_VALID_FW_ID */
> +}
> +
>  static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>  				const struct xe_ras_error_class *error_class)
>  {
> +	struct xe_cper_sec_intel_err_hdr ihdr = {};
>  	struct xe_ras_get_counter_response local_resp;
>  
>  	/* Fetching the counter sends a sysctrl command */
> @@ -31,6 +71,9 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
>  		xe_err(xe, "CPER: failed to get counter, skipping record\n");
>  		return;
>  	}
> +
> +	xe_cper_init_intel_err_hdr(xe, error_class, local_resp.timestamp,
> +				   sigid, local_resp.value, &ihdr);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> new file mode 100644
> index 000000000000..74307e7f78a2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_TYPES_H_
> +#define _XE_CPER_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * Validation bits definition for validation_bits in struct
> + * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
> + * contains valid data
> + */
> +#define XE_CPER_VALID_LOCATION		0x0001
> +#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
> +#define XE_CPER_VALID_SIG_ID		0x0004
> +#define XE_CPER_VALID_PCI_BDF		0x0008
> +#define XE_CPER_VALID_DRV_VERSION	0x0010
> +#define XE_CPER_VALID_FW_ID		0x0020

Introduce in the patch you actually use it.

> +#pragma pack(push, 1)

I'd rather use __packed for individual structs, so I know it's an ABI
without fumbling through the header without my coffee :)

Although the long term plan is to move all of them inside xe/abi directory,
but only when they become stable.

> +/**
> + * struct xe_cper_error_class - Intel GPU CPER error classification
> + */
> +struct xe_cper_error_class {
> +	/** @error_type: RAS error severity */
> +	u8  error_type;
> +	/** @error_component: IP block that raised the error */
> +	u8  error_component;
> +	/** @tile: Tile number */
> +	u8  tile;
> +	/** @instance: Instance within the tile */
> +	u32 instance;
> +	/** @cause: Error cause code */
> +	u32 cause;
> +	/** @reserved: Reserved, must be zero */
> +	u8  reserved;
> +};
> +
> +/**
> + * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
> + *
> + * Fixed-size header for the Intel GPU error section of a CPER record.
> + * All multi-byte fields are little-endian; the structure is packed.
> + */
> +struct xe_cper_sec_intel_err_hdr {

Same as above, drop the 'err'.

> +	/** @error_class: Error classification (type, component, location, cause) */
> +	struct xe_cper_error_class error_class;

Why not just reuse struct xe_ras_error_class?

Raag

> +	/** @first_timestamp: First occurrence of this error class, in ticks */
> +	u64 first_timestamp;
> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
> +	u32 sig_id;
> +	/** @error_count: Number of times this error has been observed */
> +	u32 error_count;
> +	/** @validation_bits: Raw u16 view of all valid bits */
> +	u16 validation_bits;
> +	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
> +	char pci_bdf[16];
> +	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
> +	char drv_version[25];
> +	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
> +	char fw_id[256];
> +	/** @reserved: Reserved for future use, must be zero */
> +	u8 reserved[5];
> +};
> +
> +#pragma pack(pop)
> +
> +#endif
> -- 
> 2.54.0
> 

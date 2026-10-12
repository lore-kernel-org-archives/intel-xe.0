Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F00DCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD31F10EEF6;
	Mon, 12 Oct 2026 06:19:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613FC10EEF3
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791785934; x=1823321934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d55FQviqJbn70ptdV/zBU7Cs98nNZSFJqpzzb8AkwZw=;
 b=JvEchRbLYx9V117NRGxwcd+HfPDuhbrdLoFkoFv/bJIGxyNsU6i7x2th
 IRB/xnYBoLsCHf56B8vCO/TBkAcWv3ofIQARHQLmN2MLgNWKEFxJzVGWh
 ly5IvmUUT9vNTttL9a53C3V522goEkjKjsx1MwxJB2ZweZyHHok4S6YP/
 OHoXQvHtAaDYBkLyxob+ZO8EI2XTDD7vHeuTBQKmcY47vETKWOVZnrBln
 CzeGvh1BOpN2Wv2Lv9/3Scv309b4gYz8kEXYcZOq9XdnQMPBpPlriS/DG
 7xcdCmNDcm4JD6xTyu3msK1sH2t4bhXQq6NVNdkoPeUfBZdjrg7Ny07om w==;
X-CSE-ConnectionGUID: etYXHvAHS/mQSoyOm6zBNA==
X-CSE-MsgGUID: ezb+J+4MRdm+TywGVbqOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="388513"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="388513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:18:54 -0700
X-CSE-ConnectionGUID: U6xsRB9hThaGcIRVXTFK7A==
X-CSE-MsgGUID: NdJctU9eRjSDzHFxiBCNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="749262"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:18:51 -0700
Date: Mon, 12 Oct 2026 08:18:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 01/12] drm/xe/cper: Add CPER reporting entry point for
 xe_log
Message-ID: <asx7yDsCNigALkzh@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-15-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009104602.1075405-15-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:04PM +0530, Badal Nilawar wrote:
> Introduce xe_cper_emit() as the single entry point for emitting
> CPER records from xe_log. xe_log now forwards every SIGID log entry
> with its full context (component, location, data/len and formatted
> message), and xe_cper decides how to report it. Hardware SIGIDs are
> routed to a hardware error helper, software SIGIDs are left as TODO.
> 
> No functional change is intended yet, as the CPER emission logic
> is added in follow-up patches.

This line isn't telling me anything and redundant for this patch.

> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v4:
>   - s/CONFIG_UEFI_CPER_X86/CONFIG_UEFI_CPER/ (Raag)
>   - Use in_range() for hardware SIGID check in xe_cper (Raag)
>   - Drop unused response param and constify error_class
>   - Check data len against struct xe_ras_error_class before use (Michal)
> ---
>  drivers/gpu/drm/xe/Makefile  |  2 ++
>  drivers/gpu/drm/xe/xe_cper.c | 51 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper.h | 26 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.c  |  5 +++-
>  4 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 10930c924070..da78026b0bb4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -168,6 +168,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>  
> +xe-$(CONFIG_UEFI_CPER) += xe_cper.o
> +
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
>  	xe_gt_sriov_vf.o \
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> new file mode 100644
> index 000000000000..c5caa0e8f496
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/err.h>
> +#include <linux/minmax.h>
> +
> +#include "xe_cper.h"
> +#include "xe_device.h"
> +#include "xe_ras_types.h"
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
> +}
> +
> +static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +				const struct xe_ras_error_class *error_class)
> +{
> +	/* TODO */
> +}
> +
> +/**
> + * xe_cper_emit() - Emit a CPER record for a SIGID log entry
> + * @xe: The &xe_device
> + * @cper_sev: CPER severity
> + * @sigid: Error signature identifier
> + * @component: Component identifier
> + * @location: Location details of the @component
> + * @data: Pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: Length of the @data in bytes, or 0 if not applicable
> + * @vaf: Formatted log message
> + *
> + * Emit a CPER record for a SIGID log entry
> + */
> +void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +		  u32 component, u32 location, const void *data, size_t len,
> +		  struct va_format *vaf)
> +{
> +	if (!xe)

Why? Do we plan to shoot in out foot?

> +		return;
> +
> +	if (is_hw_sigid(sigid)) {
> +		if (!IS_ERR_OR_NULL(data) && len == sizeof(struct xe_ras_error_class))

Why the 'len' check?

Note: Any caller with incorrect length is abusing xe_log and will fail
silently here, so let's not hide bugs.

Raag

> +			xe_cper_emit_hw_err(xe, cper_sev, sigid, data);
> +		return;
> +	}
> +
> +	/* TODO software CPER */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
> new file mode 100644
> index 000000000000..84676c7645a5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_H_
> +#define _XE_CPER_H_
> +
> +#include <linux/types.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct va_format;
> +struct xe_device;
> +
> +#if IS_ENABLED(CONFIG_UEFI_CPER)
> +void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +		  u32 component, u32 location, const void *data, size_t len,
> +		  struct va_format *vaf);
> +#else
> +static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +				u32 component, u32 location, const void *data, size_t len,
> +				struct va_format *vaf) {}
> +#endif
> +
> +#endif /* _XE_CPER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 29eb16db3320..80e2b1724ceb 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -8,6 +8,7 @@
>  
>  #include "abi/xe_log_abi.h"
>  
> +#include "xe_cper.h"
>  #include "xe_device.h"
>  #include "xe_log.h"
>  #include "xe_pci_types.h"
> @@ -19,7 +20,9 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
>  {
>  	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>  				   component, location, data, len, vaf);
> -	/* TODO */
> +
> +	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
> +		     component, location, data, len, vaf);
>  }
>  
>  static const char *log_unknown_component_prefix(u32 component)
> -- 
> 2.54.0
> 

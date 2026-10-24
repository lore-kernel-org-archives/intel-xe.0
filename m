Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555A606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 24 Oct 2026 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nZ32eObw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF8F10E02D;
	Sat, 24 Oct 2026 11:38:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCF210E02D
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Oct 2026 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792841925; x=1824377925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gCzmrz/o2K4xLabpf5ikzS/ES4LV/yeE6+AL31gHA6U=;
 b=nZ32eObwNDs5QwhEdROceqwMhurdbdUfVd1xNHnkeYMV/7fBdbP92XKQ
 pojcZvObXPiHnOZ3s7jtecw5wXf/Q5Rg+44vkcV98yF1X4SVQzr33rush
 rxnSNidsMWDE4vTIWQf5kMM6cK/LCprUk8O1D5UJYKTLcV/ClIy9kq0LK
 dAtFEdJDqCo3mMEyPOFbPf8FSAqt3RnnD5HSBtrWIWIlKwTrT9zxCtIAz
 WYLpRX5KYduC93yDvo+pwbF1+Ouyy4uve7OWzKltORy0n/KYReBzpaTI+
 CEXlEwYOKANYO/ZYYr4tjKY67V5Cznq4iIqQ1HesIKvQaPt3VcRVN2xCr g==;
X-CSE-ConnectionGUID: GxvnzEUQTqamAeszYJAHAA==
X-CSE-MsgGUID: q/UqVcL2QQSonPMtyCSOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1597992"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1597992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2026 04:38:45 -0700
X-CSE-ConnectionGUID: 0ACkvQnBS6ewMQR3x8D/aA==
X-CSE-MsgGUID: AnWE3qJMR3K1kNg3E/4exA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3725313"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2026 04:38:42 -0700
Date: Sat, 24 Oct 2026 13:38:38 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 01/13] drm/xe/cper: Add CPER reporting entry point for
 xe_log
Message-ID: <atyYvpmdrEG02VhK@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-16-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023043422.681260-16-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:23AM +0530, Badal Nilawar wrote:
> Introduce xe_cper_emit() as the single entry point for emitting
> CPER records from xe_log. xe_log now forwards every SIGID log entry
> with its full context (component, location, data/len and formatted
> message), and xe_cper decides how to report it. Hardware SIGIDs are
> routed to a hardware error helper, software SIGIDs are left as TODO.
> 
> Assisted-by: LLM
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v5:
>   - Drop xe and len check (Raag)
>   - s/*error_class/*counter
>   - drop xe_ from static function to shorten function name
> v4:
>   - s/CONFIG_UEFI_CPER_X86/CONFIG_UEFI_CPER/ (Raag)
>   - Use in_range() for hardware SIGID check in xe_cper (Raag)
>   - Drop unused response param and constify error_class
>   - Check data len against struct xe_ras_error_class before use (Michal)
> ---
>  drivers/gpu/drm/xe/Makefile  |  2 ++
>  drivers/gpu/drm/xe/xe_cper.c | 48 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper.h | 26 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.c  |  5 +++-
>  4 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6fb916f1699b..ec463018f77d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -169,6 +169,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
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
> index 000000000000..8b52752c067f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -0,0 +1,48 @@
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
> +static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +			     const struct xe_ras_error_class *counter)
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
> +	if (is_hw_sigid(sigid)) {
> +		if (!IS_ERR_OR_NULL(data))

What is data expectation for sw cper? If it's same as hw cper, you can
early return from this function using IS_ERR_OR_NULL() check. Otherwise
this can be a simple if (is_hw_sigid() && !IS_ERR_OR_NULL()) for hw cper
case.

Raag

> +			cper_emit_hw_err(xe, cper_sev, sigid, data);
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

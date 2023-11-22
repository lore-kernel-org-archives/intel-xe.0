Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED03C27C40
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 23:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C7A10E14C;
	Wed, 22 Nov 2023 23:09:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229B810E31E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 23:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700694563; x=1732230563;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/L8R8jwKjMsgYET8d5aFWZgeb+u5WjFJRr6rzrR0Vro=;
 b=URrF6dBs36jQE00W+0Ij8DSY3zY1PrJvokUCxfhpuuZKAuELT6nylvs0
 m8PSuFT2jZ9+TNcsEnXCZyHWIDSyTuhspo2cMnKBOWIkJ/xpQ0RTm3+eH
 0vX55tFa5lgfQK/ils7kFnLXoWlS5LJAHBSkXtsDnRSI+4UBjXILgCb/o
 Bi6+ABuoV4UVXiK4YEemZM3xER526MxED/2GGx84VCZOAWEV4B1gl1RiQ
 7b7hzLgTu0ROqeWCV9lbGqSNntQoQob/cQMymUL23dEv9kSSONPXVlNSY
 uIrdylNa6vMjAXp+idLj86P1ZQBPlxMES7wqLUle6yVKZ6GGLteLzatsb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478361342"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="478361342"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 15:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910998109"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="910998109"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 15:09:20 -0800
Received: from [10.249.154.210] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.154.210])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4C32A38185;
 Wed, 22 Nov 2023 23:09:19 +0000 (GMT)
Message-ID: <6299c22d-5ebf-4b05-9c4a-53844701ff69@intel.com>
Date: Thu, 23 Nov 2023 00:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
 <20231115073804.1861-2-michal.wajdeczko@intel.com>
 <20231122194740.GP1327160@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231122194740.GP1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Prepare for running in different
 SR-IOV modes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 22.11.2023 20:47, Matt Roper wrote:
> On Wed, Nov 15, 2023 at 08:38:03AM +0100, Michal Wajdeczko wrote:
>> We will be adding support for the SR-IOV and driver might be then
>> running, in addition to existing non-virtualized bare-metal mode,
>> also in Physical Function (PF) or Virtual Function (VF) mode.
>>
>> Since these additional modes require some changes to the driver,
>> define enum flag to represent different SR-IOV modes and add a
>> function where we will detect the actual mode in the runtime.
>>
>> We start with a forced bare-metal mode as it is sufficient to
>> enable basic functionality and ensures no impact to existing code.
> 
> For platforms that support SRIOV, can you describe what the benefit is
> of running in bare-metal mode vs just running in PF mode with no VFs
> active?  Will we wind up needing to do extra initialization in PF mode
> that could be counter-productive if someone didn't actually want to use
> any virtualization?  Will the system have additional limitations in PF
> mode that we can avoid in bare-metal mode?

In general, there should be no major differences between running as PF
without VFs and bare-metal. However, on some platforms we simply can't
enable SR-IOV with other mega features (like on PVC it won't work with
XeLink enabled).

If for future platforms above won't hold, then explicit decision whether
PF functionality is needed should be done at deployment time using
modparam. This was shortly discussed in RFC [1].

While our preliminary SR-IOV support on i915 put some restriction on PF
in number of available GuC context IDs, the Xe implementation should not
have such problems.

Most of significant allocations or resources to support VFs will be done
either as part of explicit VFs provisioning or implicit auto
provisioning done when VFs are being enabled. Any other mandatory SR-IOV
specific allocations (for HW or sysfs) should be negligible.

Note that we will try to hide all PF code under CONFIG_PCI_IOV but, if
desired, and discussed in [1], we can also use XE specific config to
hide both PF and VF code independently.

> 
> Aside from adding some explanation for that,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks,
Michal

[1] https://patchwork.freedesktop.org/series/126289/

> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |  3 ++
>>  drivers/gpu/drm/xe/xe_device_types.h |  7 ++++
>>  drivers/gpu/drm/xe/xe_pci.c          |  3 ++
>>  drivers/gpu/drm/xe/xe_sriov.c        | 55 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov.h        | 42 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_types.h  | 28 ++++++++++++++
>>  6 files changed, 138 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cb41b4fead08..fbba74d9a330 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -123,6 +123,9 @@ xe-y += xe_bb.o \
>>  # graphics hardware monitoring (HWMON) support
>>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>>  
>> +# graphics virtualization (SR-IOV) support
>> +xe-y += xe_sriov.o
>> +
>>  # i915 Display compat #defines and #includes
>>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>  	-I$(srctree)/$(src)/display/ext \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index f2ba4f746fa2..2712905c7a91 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>>  #include "xe_platform_types.h"
>>  #include "xe_pt_types.h"
>>  #include "xe_pmu.h"
>> +#include "xe_sriov_types.h"
>>  #include "xe_step_types.h"
>>  
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> @@ -299,6 +300,12 @@ struct xe_device {
>>  		struct ttm_resource_manager sys_mgr;
>>  	} mem;
>>  
>> +	/** @sriov: device level virtualization data */
>> +	struct {
>> +		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
>> +		enum xe_sriov_mode __mode;
>> +	} sriov;
>> +
>>  	/** @usm: unified memory state */
>>  	struct {
>>  		/** @asid: convert a ASID to VM */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index c1c8048bbc0f..3030b223e4a0 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -24,6 +24,7 @@
>>  #include "xe_module.h"
>>  #include "xe_pci_types.h"
>>  #include "xe_pm.h"
>> +#include "xe_sriov.h"
>>  #include "xe_step.h"
>>  
>>  enum toggle_d3cold {
>> @@ -706,6 +707,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  
>>  	pci_set_master(pdev);
>>  
>> +	xe_sriov_probe_early(xe, desc->has_sriov);
>> +
>>  	err = xe_info_init(xe, desc, subplatform_desc);
>>  	if (err)
>>  		goto err_pci_disable;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> new file mode 100644
>> index 000000000000..42a0e0c917a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_assert.h"
>> +#include "xe_sriov.h"
>> +
>> +/**
>> + * xe_sriov_mode_to_string - Convert enum value to string.
>> + * @mode: the &xe_sriov_mode to convert
>> + *
>> + * Returns: SR-IOV mode as a user friendly string.
>> + */
>> +const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>> +{
>> +	switch (mode) {
>> +	case XE_SRIOV_MODE_NONE:
>> +		return "none";
>> +	case XE_SRIOV_MODE_PF:
>> +		return "SR-IOV PF";
>> +	case XE_SRIOV_MODE_VF:
>> +		return "SR-IOV VF";
>> +	default:
>> +		return "<invalid>";
>> +	}
>> +}
>> +
>> +/**
>> + * xe_sriov_probe_early - Probe a SR-IOV mode.
>> + * @xe: the &xe_device to probe mode on
>> + * @has_sriov: flag indicating hardware support for SR-IOV
>> + *
>> + * This function should be called only once and as soon as possible during
>> + * driver probe to detect whether we are running a SR-IOV Physical Function
>> + * (PF) or a Virtual Function (VF) device.
>> + *
>> + * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
>> + * SR-IOV VF mode detection is based on dedicated MMIO register read.
>> + */
>> +void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
>> +{
>> +	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>> +
>> +	/* TODO: replace with proper mode detection */
>> +	xe_assert(xe, !has_sriov);
>> +
>> +	xe_assert(xe, !xe->sriov.__mode);
>> +	xe->sriov.__mode = mode;
>> +	xe_assert(xe, xe->sriov.__mode);
>> +
>> +	if (has_sriov)
>> +		drm_info(&xe->drm, "Running in %s mode\n",
>> +			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
>> new file mode 100644
>> index 000000000000..5af73a3172b0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_H_
>> +#define _XE_SRIOV_H_
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device_types.h"
>> +#include "xe_sriov_types.h"
>> +
>> +const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>> +
>> +void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
>> +
>> +static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
>> +{
>> +	xe_assert(xe, xe->sriov.__mode);
>> +	return xe->sriov.__mode;
>> +}
>> +
>> +static inline bool xe_device_is_sriov_pf(struct xe_device *xe)
>> +{
>> +	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
>> +}
>> +
>> +static inline bool xe_device_is_sriov_vf(struct xe_device *xe)
>> +{
>> +	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
>> +}
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +#define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
>> +#else
>> +#define IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false)
>> +#endif
>> +#define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
>> +
>> +#define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
>> new file mode 100644
>> index 000000000000..999a4311b98b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
>> @@ -0,0 +1,28 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_TYPES_H_
>> +#define _XE_SRIOV_TYPES_H_
>> +
>> +#include <linux/build_bug.h>
>> +
>> +/**
>> + * enum xe_sriov_mode - SR-IOV mode
>> + * @XE_SRIOV_MODE_NONE: bare-metal mode (non-virtualized)
>> + * @XE_SRIOV_MODE_PF: SR-IOV Physical Function (PF) mode
>> + * @XE_SRIOV_MODE_VF: SR-IOV Virtual Function (VF) mode
>> + */
>> +enum xe_sriov_mode {
>> +	/*
>> +	 * Note: We don't use default enum value 0 to allow catch any too early
>> +	 * attempt of checking the SR-IOV mode prior to the actual mode probe.
>> +	 */
>> +	XE_SRIOV_MODE_NONE = 1,
>> +	XE_SRIOV_MODE_PF,
>> +	XE_SRIOV_MODE_VF,
>> +};
>> +static_assert(XE_SRIOV_MODE_NONE);
>> +
>> +#endif
>> -- 
>> 2.25.1
>>
> 

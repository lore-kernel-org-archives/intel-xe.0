Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86E4C25B75
	for <intel-xe@archiver.kernel.org>; Sun, 26 May 2024 17:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560BB10E087;
	Sun, 26 May 2024 17:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRs9PpyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6571010E087
 for <intel-xe@lists.freedesktop.org>; Sun, 26 May 2024 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716743313; x=1748279313;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=53QCbYL3t7kHpgSDjeFIOkDqonKU2wz3f1Ld7Swq9og=;
 b=eRs9PpyLt5wn2smfYtkKZFfyVFCbrJcyn8PkuDbi7IWGJwnwJZLSI9Ve
 FJDbLNwqCVcB1uj8rjqpUSKBLu2aY7eFaOdKpOWgwOwowRyGE90ke73rL
 ZDRJlWJAul0BigKOHM3M+KhN6cSmTe7w63b7MW5yzNgWyBvXP0Fn0KfO7
 m2mr/G1yd1WBGq3o0fN1GRgAZnQk0wLRhN3il5zpoKgJnGSDruy++1OTm
 UtuMWflNqTNfMLpaAixArbZRcm+Szl4flZlqEjShon+FQfuSCWP/4DEoM
 iASKelKPjihQFnm3yuNKahyOIMi5kVK1UvuhkAJu7S9cv+vPEb5S8TO8B w==;
X-CSE-ConnectionGUID: PTxmXJhMTQWkHcn2g1I7XA==
X-CSE-MsgGUID: eYcoY2lfTqOBVDYHVPgowA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23725886"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; d="scan'208";a="23725886"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 10:08:32 -0700
X-CSE-ConnectionGUID: ukm/PABeQk2As2ZPJ9NkYw==
X-CSE-MsgGUID: 8WhIjRsPRN2vRsZrqUFp0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; d="scan'208";a="34420678"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 26 May 2024 10:08:30 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 415AF3683F;
 Sun, 26 May 2024 18:08:28 +0100 (IST)
Message-ID: <d89a2d96-25bd-498f-b787-0d52a00c0f35@intel.com>
Date: Sun, 26 May 2024 19:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add device CXL capabilities identification
To: Farah Kassabri <fkassabri@habana.ai>, intel-xe@lists.freedesktop.org
References: <20240526130254.706783-1-fkassabri@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240526130254.706783-1-fkassabri@habana.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 26.05.2024 15:02, Farah Kassabri wrote:
> As future Intel GPUs will use CXL interface with the host
> servers, this patch will add check if the xe device has CXL
> capabilities or not, by reading the PCIe standard DVSEC register
> and identify the CXL vendor id.
> 
> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> Reviewed by: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>

please scratch that, giving comments does not imply r-b, you need
explicit r-b statement, see [1]

[1]
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> ---
> changes in v2:
> fixes following review
> 
>  drivers/gpu/drm/xe/Makefile          |  3 ++-
>  drivers/gpu/drm/xe/xe_cxl.c          | 35 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cxl.h          | 26 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       |  5 ++++
>  drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++
>  5 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_cxl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cxl.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a5959bb7b1fb..5f35dff98238 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -65,6 +65,7 @@ $(uses_generated_oob): $(generated_oob)
>  xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
> +	xe_cxl.o \
>  	xe_debugfs.o \
>  	xe_devcoredump.o \
>  	xe_device.o \
> @@ -146,7 +147,7 @@ xe-y += xe_bb.o \
>  	xe_vram_freq.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \

this is now an unrelated change

>  
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_cxl.c b/drivers/gpu/drm/xe/xe_cxl.c
> new file mode 100644
> index 000000000000..13c4bf7fe35e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cxl.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_cxl.h"
> +
> +int xe_cxl_init_capabilities(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u16 ctrl, cxl_dvsec;
> +	int rc;
> +
> +	cxl_dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL, CXL_DVSEC_PCIE_DEVICE);
> +	if (!cxl_dvsec)
> +		return 0;
> +
> +	xe->info.has_cxl_cap = true;
> +	xe->cxl.dvsec = cxl_dvsec;
> +
> +	rc = pci_read_config_word(pdev, cxl_dvsec + CXL_DVSEC_CTRL_OFFSET, &ctrl);


> +	if (rc < 0) {
> +		drm_err(&xe->drm, "Failed to read dvsec ctrl register(%d)\n", rc);
> +		return rc;

is it ok to have xe->info.has_cxl_cap set but with invalid xe->cxl.type?

> +	}
> +
> +	if (ctrl & CXL_DVSEC_MEM_ENABLE)
> +		xe->cxl.type = (ctrl & BIT(0)) ? CXL_DEV_TYPE_TWO : CXL_DEV_TYPE_THREE;
> +	else
> +		xe->cxl.type = CXL_DEV_TYPE_ONE;
> +
> +	drm_dbg(&xe->drm, "The device has CXL capability, type %u\n", xe->cxl.type);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_cxl.h b/drivers/gpu/drm/xe/xe_cxl.h
> new file mode 100644
> index 000000000000..6ba89d527c84
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cxl.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_CXL_H_
> +#define _XE_CXL_H_
> +
> +#include "xe_device.h"
> +#include "../drivers/cxl/cxlpci.h"

again, you likely need them in .c but not in .h

btw, it looks that cxlpci.h is private, unlikely to be meant to be
included by other modules, are we doing right thing ?

> +
> +enum {
> +	CXL_DEV_TYPE_ONE = 1,
> +	CXL_DEV_TYPE_TWO = 2,
> +	CXL_DEV_TYPE_THREE = 3,
> +};

kind of still cryptic without any kernel-doc

if not used beyond xe_cxl.c then maybe move it there?

or define it inside xe_device.cxl as cxl.type ?

> +
> +/**
> + * xe_cxl_init_capabilities - set CXL device capabilities
> + * @xe: xe device structure
> + *
> + * Set CXL capabilities and information of the xe device.

also document "Return:"

> + */

nit: in Xe driver I can see that most (all?) function kernel-doc are
placed together with the implementation, not near the declaration

> +int xe_cxl_init_capabilities(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5acf2c92789f..04677c9ff10f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -50,6 +50,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_cxl.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -312,6 +313,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (WARN_ON(err))
>  		goto err;
>  
> +	err = xe_cxl_init_capabilities(xe);
> +	if (err)
> +		goto err;

btw, do we want to treat an error from CXL pci_read_config_word() as a
reason to abort driver load ?

> +
>  	return xe;
>  
>  err:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8e7048ff3ee5..323c3d57fdb8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -285,6 +285,8 @@ struct xe_device {
>  		u8 has_atomic_enable_pte_bit:1;
>  		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>  		u8 has_device_atomics_on_smem:1;
> +		/** @info.has_cxl_cap: device has CXL capabilities */
> +		u8 has_cxl_cap:1;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> @@ -321,6 +323,14 @@ struct xe_device {
>  		struct ttm_resource_manager sys_mgr;
>  	} mem;
>  
> +	/** @cxl: CXL info for device */
> +	struct {
> +		/** @cxl.dvsec: offset to device DVSEC */
> +		u16 dvsec;
> +		/** @cxl.type: CXL device type */
> +		u16 type;
> +	} cxl;
> +
>  	/** @sriov: device level virtualization data */
>  	struct {
>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */

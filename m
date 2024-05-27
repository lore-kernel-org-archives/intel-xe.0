Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3BAC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 16:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5E710E3F2;
	Mon, 27 May 2024 16:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvqOYKD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EE410E3F2
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716828243; x=1748364243;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hFdeeMPrSFLwt3+qvMBUYKIuPS2f7iVl5sAc4ptKIZU=;
 b=ZvqOYKD7JGOuSA/ZYx4Ci1WqcZfXBNQsLZtxY1gVPqaFEPICWnkx3cdt
 hpm7JDGqCHaJ8H0gR8IsYkCSSzWs0BwVjZcism5Mur8mu4ScH4ED93H4z
 sH+nn4TBBdUuwcRQkg6N0qfG4KpLbNyntEI5FR45VHy11hbgIjVWNpc7O
 OqoLF4JLae0LiNv2hjpKBYAn/hoQY/H/3+fwx4ar4ivFDGjeqWqdmnmCw
 Mi/KSU03hDBN2yc9h5mPZIzaedFoCq+hJrO0oeFkO9Xkc4rg86qJvlLiH
 I43Q0eMwab6Py994/45Pvvq5J2n2IldF840iyLtpEHoUm2xfU1L9ZifTv Q==;
X-CSE-ConnectionGUID: 8qDDiNyyQpSUfauoDIZjlw==
X-CSE-MsgGUID: wiUicij6SyueTwpYkUBkrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38540306"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="38540306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 09:44:02 -0700
X-CSE-ConnectionGUID: 0b3BAHgWStuOTJEWEKdfQw==
X-CSE-MsgGUID: rdsljojhS+OF2xfhKSSx9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="65623561"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 27 May 2024 09:44:01 -0700
Received: from [10.246.33.240] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.33.240])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CF407332BA;
 Mon, 27 May 2024 17:43:59 +0100 (IST)
Message-ID: <4ccd9997-328e-4f03-b38c-706e46771bdc@intel.com>
Date: Mon, 27 May 2024 18:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add device CXL capabilities identification
To: Farah Kassabri <fkassabri@habana.ai>, intel-xe@lists.freedesktop.org
References: <20240527084031.840699-1-fkassabri@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240527084031.840699-1-fkassabri@habana.ai>
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



On 27.05.2024 10:40, Farah Kassabri wrote:
> As future Intel GPUs will use CXL interface with the host
> servers, this patch will add check if the xe device has CXL
> capabilities or not, by reading the PCIe standard DVSEC register
> and identify the CXL vendor id.
> 
> Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
> ---
> Changes in v3:
> fixes following review.
> 
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_cxl.c          | 51 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cxl.h          | 13 +++++++
>  drivers/gpu/drm/xe/xe_device.c       |  5 +++
>  drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_cxl.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cxl.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a5959bb7b1fb..65c0a0317ee7 100644
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
> diff --git a/drivers/gpu/drm/xe/xe_cxl.c b/drivers/gpu/drm/xe/xe_cxl.c
> new file mode 100644
> index 000000000000..78e4179e965a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cxl.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_cxl.h"
> +#include "xe_device.h"

btw, likely you only need "xe_device_types.h"

> +#include "../drivers/cxl/cxlpci.h"

and this still doesn't look good
can you double check with maintainers ?

> +
> +enum {
> +	CXL_DEV_TYPE_ONE = 1,
> +	CXL_DEV_TYPE_TWO,
> +	CXL_DEV_TYPE_THREE
> +};
> +
> +/**
> + * xe_cxl_init_capabilities - set CXL device capabilities
> + * @xe: xe device structure
> + *
> + * Set CXL capabilities and information of the xe device.
> + *
> + * Return: 0 on success, negative value on failure.

usually on failure we return "negative error code (errno)"
but ...

> + */
> +int xe_cxl_init_capabilities(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	u16 ctrl, cxl_dvsec;
> +	int rc;
> +
> +	cxl_dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL, CXL_DVSEC_PCIE_DEVICE);

   (btw, this line doesn't compile on KUnit)

> +	if (!cxl_dvsec)
> +		return -1;

... here it's a plain number (while likely should be an -errno value)
and ...

> +
> +	rc = pci_read_config_word(pdev, cxl_dvsec + CXL_DVSEC_CTRL_OFFSET, &ctrl);
> +	if (rc < 0) {

   (btw, pci_read_config_word() will return > 0 on error)

> +		drm_err(&xe->drm, "Failed to read DVSEC_CTRL register(%d)\n", rc);
> +		return rc;

... here it will be non-negative PCI error code

> +	}
> +
> +	xe->info.has_cxl_cap = true;
> +	xe->cxl.dvsec = cxl_dvsec;
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
> index 000000000000..82e36285c383
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cxl.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_CXL_H_
> +#define _XE_CXL_H_
> +
> +struct xe_device;
> +
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

includes shall also be sorted

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

are you 100% sure that we should abort driver load on init failure?

and now it will fail on every platform without cxl caps

was this patch tested ?

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

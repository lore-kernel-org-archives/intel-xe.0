Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCA8CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 18:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F3A112ECB;
	Tue,  9 Apr 2024 18:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clvpgCnd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077B1112D54
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 18:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712687982; x=1744223982;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FGzYc8c3//1mZQlzfh4xAWntdkTlFDTJdrb8gR0xxTI=;
 b=clvpgCnd/88m4KZs3U0S89HgcrHIvdyIk/j9Xr7wDaAKlbni/kX14bbl
 r6/QtV8XONXGkIn6wBoR/0B5V7PDRB535gC33obhlc1RQQwzsoKqWbn/c
 uH7mOMMBr0OAHClac02XvN+YzYDq1WCROGOyJgLdUZmtJlzX1WeI4npXe
 bHINu2O5A1D7k1u4dmIH/+msRXJYeKgU00Qzh5d/BiyGkXqGV5b+bBNhD
 Su4m2PpC5U/J0k4uQU+JL0gBOiExnsSIatIb4KopKQvN3tqSMXlfmF1lf
 KrwYGtLiHrZpkWadbFGJ4Tl/8KY2Jji8HjKioEF+zuDsKJgreYWzvQINJ g==;
X-CSE-ConnectionGUID: 5JziwBHXR0a6XHpHmBR9mw==
X-CSE-MsgGUID: 0X9espY3S62pxhEs7hKXnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7884056"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7884056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 11:39:41 -0700
X-CSE-ConnectionGUID: LqI/Asj0QMSPOuxTkPQFpw==
X-CSE-MsgGUID: qn5GQ6MUQZeY/xAkL8t5Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51298487"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 11:39:39 -0700
Received: from [10.249.158.230] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.158.230])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E485F284FE;
 Tue,  9 Apr 2024 19:39:37 +0100 (IST)
Message-ID: <e231b006-cd0c-4cd8-a401-2bca79ca13d8@intel.com>
Date: Tue, 9 Apr 2024 20:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Add proper detection of the SR-IOV PF mode
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
 <20240404154431.583-3-michal.wajdeczko@intel.com>
 <ZhV_KLj-fMeX2Ggc@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZhV_KLj-fMeX2Ggc@intel.com>
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



On 09.04.2024 19:47, Rodrigo Vivi wrote:
> On Thu, Apr 04, 2024 at 05:44:30PM +0200, Michal Wajdeczko wrote:
>> SR-IOV PF mode detection is based on PCI capability as reported by
>> the PCI dev_is_pf() function and additionally on 'max_vfs' module
>> parameter which could be also used to disable PF capability even
>> if SR-IOV PF capability is reported by the hardware.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |  3 +-
>>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>>  drivers/gpu/drm/xe/xe_sriov.c        |  3 +
>>  drivers/gpu/drm/xe/xe_sriov_pf.c     | 89 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf.h     | 24 ++++++++
>>  drivers/gpu/drm/xe/xe_sriov_types.h  | 15 +++++
>>  6 files changed, 137 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e5b1715f721e..8d79df05b84f 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -159,7 +159,8 @@ xe-$(CONFIG_PCI_IOV) += \
>>  	xe_gt_sriov_pf_control.o \
>>  	xe_lmtt.o \
>>  	xe_lmtt_2l.o \
>> -	xe_lmtt_ml.o
>> +	xe_lmtt_ml.o \
>> +	xe_sriov_pf.o
>>  
>>  # include helpers for tests even when XE is built-in
>>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index c710cec835a7..8244b177a6a3 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -321,6 +321,10 @@ struct xe_device {
>>  	struct {
>>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
>>  		enum xe_sriov_mode __mode;
>> +
>> +		/** @sriov.pf: PF specific data */
>> +		struct xe_device_pf pf;
>> +
>>  		/** @sriov.wq: workqueue used by the virtualization workers */
>>  		struct workqueue_struct *wq;
>>  	} sriov;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index 3e103edf7174..94fa98d8206e 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -11,6 +11,7 @@
>>  #include "xe_device.h"
>>  #include "xe_mmio.h"
>>  #include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>>  
>>  /**
>>   * xe_sriov_mode_to_string - Convert enum value to string.
>> @@ -58,6 +59,8 @@ void xe_sriov_probe_early(struct xe_device *xe)
>>  	if (has_sriov) {
>>  		if (test_is_vf(xe))
>>  			mode = XE_SRIOV_MODE_VF;
>> +		else if (xe_sriov_pf_readiness(xe))
>> +			mode = XE_SRIOV_MODE_PF;
>>  	}
>>  
>>  	xe_assert(xe, !xe->sriov.__mode);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> new file mode 100644
>> index 000000000000..030c2b69ecc4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_module.h"
>> +#include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>> +#include "xe_sriov_printk.h"
>> +
>> +static unsigned int wanted_max_vfs(struct xe_device *xe)
>> +{
>> +	return xe_modparam.max_vfs;
>> +}
>> +
>> +static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	int err;
>> +
>> +	err = pci_sriov_set_totalvfs(pdev, limit);
>> +	if (err)
>> +		xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
>> +				limit, ERR_PTR(err));
>> +	return err;
>> +}
>> +
>> +static bool pf_continue_as_native(struct xe_device *xe, const char *why)
>> +{
>> +	xe_sriov_dbg(xe, "%s, continuing as native\n", why);
>> +	pf_reduce_totalvfs(xe, 0);
>> +	return false;
>> +}
>> +
>> +/**
>> + * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
>> + * @xe: the &xe_device to check
>> + *
>> + * This function is called as part of the SR-IOV probe to validate if all
>> + * PF prerequisites are satisfied and we can continue with enabling PF mode.
>> + *
>> + * Return: true if the PF mode can be turned on.
>> + */
>> +bool xe_sriov_pf_readiness(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	int totalvfs = pci_sriov_get_totalvfs(pdev);
>> +	int newlimit = min_t(u16, wanted_max_vfs(xe), totalvfs);
>> +
>> +	xe_assert(xe, totalvfs <= U16_MAX);
> 
> perhaps we should do this check before the min_t?

this assert is just to express/confirm SLA with the PCI function

> 
> should we also check what we are getting from the params?

we don't care, param could be any number up to U32_MAX, as we will just
use it to limit what PCI function (and thus our HW) reports

> 
>> +
>> +	if (!dev_is_pf(dev))
>> +		return false;
>> +
>> +	if (!xe_device_uc_enabled(xe))
>> +		return pf_continue_as_native(xe, "Guc submission disabled");
>> +
>> +	if (!newlimit)
>> +		return pf_continue_as_native(xe, "all VFs disabled");
>> +
>> +	pf_reduce_totalvfs(xe, newlimit);
> 
> do we really need to always call this or only when newlimit != totalvfs?

it's harmless to call it even if there is no change as this just updates
internal data in PCI core, does not touch any HW, so one "if" spared

> 
>> +
>> +	xe->sriov.pf.device_total_vfs = totalvfs;
>> +	xe->sriov.pf.driver_max_vfs = newlimit;
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>> + * @xe: the &xe_device to print info from
>> + * @p: the &drm_printer
>> + *
>> + * Print SR-IOV PF related information into provided DRM printer.
>> + */
>> +void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +
>> +	drm_printf(p, "total: %u\n", xe->sriov.pf.device_total_vfs);
>> +	drm_printf(p, "supported: %u\n", xe->sriov.pf.driver_max_vfs);
>> +	drm_printf(p, "enabled: %u\n", pci_num_vf(pdev));
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> new file mode 100644
>> index 000000000000..ebef2e01838a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_PF_H_
>> +#define _XE_SRIOV_PF_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_printer;
>> +struct xe_device;
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +bool xe_sriov_pf_readiness(struct xe_device *xe);
>> +void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>> +#else
>> +static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
>> +{
>> +	return false;
>> +}
> 
> missing the vfs_summary function in this block?!

only xe_sriov_pf_readiness() function will be used regardless of the
CONFIG_PCI_IOV, the other xe_sriov_pf_print_vfs_summary() function and
few more functions (coming soon) will be used only for CONFIG_PCI_IOV=y
and thus will not require empty stubs

> 
>> +#endif
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
>> index 1a138108d139..fa583e8fa0c2 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
>> @@ -7,6 +7,7 @@
>>  #define _XE_SRIOV_TYPES_H_
>>  
>>  #include <linux/build_bug.h>
>> +#include <linux/types.h>
>>  
>>  /**
>>   * VFID - Virtual Function Identifier
>> @@ -37,4 +38,18 @@ enum xe_sriov_mode {
>>  };
>>  static_assert(XE_SRIOV_MODE_NONE);
>>  
>> +/**
>> + * struct xe_device_pf - Xe PF related data
>> + *
>> + * The data in this structure is valid only if driver is running in the
>> + * @XE_SRIOV_MODE_PF mode.
>> + */
>> +struct xe_device_pf {
>> +	/** @device_total_vfs: Maximum number of VFs supported by the device. */
>> +	u16 device_total_vfs;
>> +
>> +	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
>> +	u16 driver_max_vfs;
>> +};
>> +
>>  #endif
>> -- 
>> 2.43.0
>>

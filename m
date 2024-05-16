Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EC4C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 10:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80F810E502;
	Thu, 16 May 2024 10:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrXb654l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07A10E502
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715855213; x=1747391213;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SE6S0g/xwdzEf0XkWo+uhAgHzgDqaWVyV1vvBg9kWOI=;
 b=IrXb654l57zYXFY3T1+kQT8vbIkQ6Zu27cdj8v0mbw9SlF00RbIh+8FX
 OGJP/nGedDH1bQGiYlkJON3T1+IMh5Ku9t4TvdQA5tIiePRRH5Gfail5a
 g9on6qeaWo0SRzdMJXPxvMaJ+umsC0QWbiIgrmIt/gFaDJKqy0J0f83Vd
 rnlFjIqAFxmWatA0w8jBzyKPxCmHIYt7cRrjLxfJEyDRTLls1TYS+EYtM
 OnW6ZaJKSmCmVqFh3tBA+2uAHQrH7sCvyi/2Q/2F97AMnKGdvmHExSh5P
 J/PO6yRcuzdCMRtQygpOxi646WuIkILZy8PWMHV7mS1dOl2GAi+ysOryo w==;
X-CSE-ConnectionGUID: 4NHvtXfpSqm1hCuOHMQliQ==
X-CSE-MsgGUID: B/wUheibSCyR19yJ2zlz2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23093597"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="23093597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:26:52 -0700
X-CSE-ConnectionGUID: Xxw0qxs+R1Kl4Vm1b4f3aQ==
X-CSE-MsgGUID: Ny9HavUVRdOAzAMlTyQamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31421890"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 16 May 2024 03:26:48 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9214727BD9;
 Thu, 16 May 2024 11:26:45 +0100 (IST)
Message-ID: <fecdbc3e-a6c8-4e08-94f2-26fadd173f89@intel.com>
Date: Thu, 16 May 2024 12:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/vf: Add support for VF to query its
 configuration
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-5-michal.wajdeczko@intel.com>
 <20240516100821.kpnkys3cjbbzica6@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240516100821.kpnkys3cjbbzica6@intel.com>
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



On 16.05.2024 12:08, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:13 +0200]:
>> The VF driver doesn't know which GuC firmware was loaded by the PF
>> driver and must perform GuC ABI version handshake prior to sending
>> any other H2G actions to the GuC to submit workloads.
>>
>> The VF driver also doesn't have access to the fuse registers and
>> must rely on the runtime info, which includes values of the fuse
>> registers, that the PF driver is exposing to the VFs.
>>
>> Add functions to cover that functionality. We will use these
>> functions in upcoming patches.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile               |   1 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 747 ++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  23 +
>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  82 +++
>>  drivers/gpu/drm/xe/xe_gt_types.h          |   3 +
>>  5 files changed, 856 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b620389761d5..aaa3bce7390f 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -155,6 +155,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>  
>>  # graphics virtualization (SR-IOV) support
>>  xe-y += \
>> +	xe_gt_sriov_vf.o \
>>  	xe_guc_relay.o \
>>  	xe_memirq.o \
>>  	xe_sriov.o
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> new file mode 100644
>> index 000000000000..378dde5ad4f9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -0,0 +1,747 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_sriov_abi.h"
>> +#include "abi/guc_communication_mmio_abi.h"
>> +#include "abi/guc_klvs_abi.h"
>> +#include "abi/guc_relay_actions_abi.h"
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_sriov_printk.h"
>> +#include "xe_gt_sriov_vf.h"
>> +#include "xe_gt_sriov_vf_types.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_hxg_helpers.h"
>> +#include "xe_guc_relay.h"
>> +#include "xe_sriov.h"
>> +
>> +#define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
> 
> I have déjà vu
> drivers/gpu/drm/xe/xe_guc_klv_helpers.c:
> 
> #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))

see discussion at [1], trust me, I was trying to fix that

[1] https://patchwork.freedesktop.org/patch/578134/?series=129854&rev=1

> 
> 
>> +static int guc_action_vf_reset(struct xe_guc *guc)
>> +{
>> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_VF_RESET),
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int vf_reset_guc_state(struct xe_gt *gt)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	int err;
>> +
>> +	err = guc_action_vf_reset(guc);
>> +	if (unlikely(err))
>> +		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
>> +	return err;
>> +}
>> +
>> +static int guc_action_match_version(struct xe_guc *guc,
>> +				    u32 wanted_branch, u32 wanted_major, u32 wanted_minor,
>> +				    u32 *branch, u32 *major, u32 *minor, u32 *patch)
>> +{
>> +	u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>> +			   GUC_ACTION_VF2GUC_MATCH_VERSION),
>> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted_branch) |
>> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted_major) |
>> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted_minor),
>> +	};
>> +	u32 response[GUC_MAX_MMIO_MSG_LEN];
> 
> Why not VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN ?

because by the current Xe driver design (different from what we had on
i915 driver) the xe_guc_mmio_send_recv() function doesn't take size of
the response buffer so we have to pass response buffer that would fit
maximum MMIO HXG response message, regardless what we expect to receive

> 
>> +	int ret;
>> +
>> +	BUILD_BUG_ON(VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN > GUC_MAX_MMIO_MSG_LEN);
>> +
>> +	ret = xe_guc_mmio_send_recv(guc, request, ARRAY_SIZE(request), response);
>> +	if (unlikely(ret < 0))
>> +		return ret;
>> +
>> +	if (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ, response[0])))
>> +		return -EPROTO;
>> +
>> +	*branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>> +	*major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
>> +	*minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
>> +	*patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
>> +
>> +	return 0;
>> +}
>> +
>> +static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	switch (xe->info.platform) {
>> +	case XE_TIGERLAKE ... XE_PVC:
>> +		/* 1.1 this is current baseline for Xe driver */
>> +		*branch = 0;
>> +		*major = 1;
>> +		*minor = 1;
>> +		break;
>> +	default:
>> +		/* 1.2 has support for the GMD_ID KLV */
>> +		*branch = 0;
>> +		*major = 1;
>> +		*minor = 2;
>> +		break;
>> +	}
>> +}
>> +
>> +static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
>> +{
>> +	/* for now it's the same as minimum */
>> +	return vf_minimum_guc_version(gt, branch, major, minor);
>> +}
>> +
>> +static int vf_handshake_with_guc(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	u32 wanted_branch, wanted_major, wanted_minor;
>> +	u32 branch, major, minor, patch;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	/* select wanted version - prefer previous (if any) */
>> +	if (guc_version->major || guc_version->minor) {
>> +		wanted_branch = guc_version->branch;
>> +		wanted_major = guc_version->major;
>> +		wanted_minor = guc_version->minor;
>> +	} else {
>> +		vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
>> +		xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
>> +	}
>> +
>> +	err = guc_action_match_version(guc, wanted_branch, wanted_major, wanted_minor,
>> +				       &branch, &major, &minor, &patch);
>> +	if (unlikely(err))
>> +		goto fail;
>> +
>> +	/* we don't support interface version change */
>> +	if ((guc_version->major || guc_version->minor) &&
>> +	    (guc_version->branch != branch || guc_version->major != major ||
>> +	     guc_version->minor != minor)) {
>> +		xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
>> +				branch, major, minor, patch);
>> +		xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
>> +				 guc_version->branch, guc_version->major,
>> +				 guc_version->minor, guc_version->patch);
>> +		err = -EREMCHG;
>> +		goto fail;
>> +	}
>> +
>> +	/* illegal */
>> +	if (major > wanted_major) {
>> +		err = -EPROTO;
>> +		goto unsupported;
>> +	}
>> +
>> +	/* there's no fallback on major version. */
>> +	if (major != wanted_major) {
>> +		err = -ENOPKG;
>> +		goto unsupported;
>> +	}
>> +
>> +	/* check against minimum version supported by us */
>> +	vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
>> +	xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
>> +	if (major < wanted_major || (major == wanted_major && minor < wanted_minor)) {
>> +		err = -ENOKEY;
>> +		goto unsupported;
>> +	}
>> +
>> +	xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.%u\n",
>> +			branch, major, minor, patch);
>> +
>> +	guc_version->branch = branch;
>> +	guc_version->major = major;
>> +	guc_version->minor = minor;
>> +	guc_version->patch = patch;
>> +	return 0;
>> +
>> +unsupported:
>> +	xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u (%pe)\n",
>> +			branch, major, minor, patch, ERR_PTR(err));
>> +fail:
>> +	xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u (%pe)\n",
>> +			wanted_major, wanted_minor, ERR_PTR(err));
>> +
>> +	/* try again with *any* just to query which version is supported */
>> +	if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
>> +				      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
>> +				      &branch, &major, &minor, &patch))
>> +		xe_gt_sriov_notice(gt, "GuC reports interface version %u.%u.%u.%u\n",
>> +				   branch, major, minor, patch);
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_bootstrap - Query and setup GuC ABI interface version.
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + * It requires functional `GuC MMIO based communication`_.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
>> +{
>> +	int err;
>> +
>> +	err = vf_reset_guc_state(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	err = vf_handshake_with_guc(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>> +				       u32 *value, u32 value_len)
>> +{
>> +	u32 request[VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>> +			   GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV),
>> +		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, key),
>> +	};
>> +	u32 response[GUC_MAX_MMIO_MSG_LEN];
> Why not VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MAX_LEN ?

see above explanation

> 
>> +	u32 length;
>> +	int ret;
>> +
>> +	BUILD_BUG_ON(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MAX_LEN > GUC_MAX_MMIO_MSG_LEN);
> 
> If we use VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MAX_LEN this BUILD_BUG_ON
> is needed ?

we can't so this works as additional guard

>> +	ret = xe_guc_mmio_send_recv(guc, request, ARRAY_SIZE(request), response);
>> +	if (unlikely(ret < 0))
>> +		return ret;
>> +
>> +	if (unlikely(FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ, response[0])))
>> +		return -EPROTO;
>> +
>> +	length = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH, response[0]);
>> +	if (unlikely(length > value_len))
>> +		return -EOVERFLOW;
>> +	if (unlikely(length < value_len))
>> +		return -ENODATA;
>> +
>> +	switch (value_len) {
>> +	default:
>> +		xe_gt_WARN_ON(guc_to_gt(guc), value_len > 3);
>> +		fallthrough;
>> +	case 3:
>> +		value[2] = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_3_VALUE96, response[3]);
>> +		fallthrough;
>> +	case 2:
>> +		value[1] = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64, response[2]);
>> +		fallthrough;
>> +	case 1:
>> +		value[0] = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32, response[1]);
>> +		fallthrough;
>> +	case 0:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int guc_action_query_single_klv32(struct xe_guc *guc, u32 key, u32 *value32)
>> +{
>> +	return guc_action_query_single_klv(guc, key, value32, hxg_sizeof(u32));
>> +}
>> +
>> +static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value64)
>> +{
>> +	u32 value[2];
>> +	int err;
>> +
>> +	err = guc_action_query_single_klv(guc, key, value, hxg_sizeof(value));
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	*value64 = make_u64_from_u32(value[1], value[0]);
>> +	return 0;
>> +}
>> +
>> +static int vf_get_ggtt_info(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	u64 start, size;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	if (config->ggtt_size && config->ggtt_size != size) {
>> +		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>> +				size / SZ_1K, config->ggtt_size / SZ_1K);
>> +		return -EREMCHG;
>> +	}
>> +
>> +	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>> +				start, start + size - 1, size / SZ_1K);
>> +
>> +	config->ggtt_base = start;
>> +	config->ggtt_size = size;
>> +
>> +	return config->ggtt_size ? 0 : -ENODATA;
>> +}
>> +
>> +static int vf_get_lmem_info(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	char size_str[10];
>> +	u64 size;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	if (config->lmem_size && config->lmem_size != size) {
>> +		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>> +				size / SZ_1M, config->lmem_size / SZ_1M);
>> +		return -EREMCHG;
>> +	}
>> +
>> +	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>> +	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>> +
>> +	config->lmem_size = size;
>> +
>> +	return config->lmem_size ? 0 : -ENODATA;
>> +}
>> +
>> +static int vf_get_submission_cfg(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	u32 num_ctxs, num_dbs;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>> +		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>> +				num_ctxs, config->num_ctxs);
>> +		return -EREMCHG;
>> +	}
>> +	if (config->num_dbs && config->num_dbs != num_dbs) {
>> +		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>> +				num_dbs, config->num_dbs);
>> +		return -EREMCHG;
>> +	}
>> +
>> +	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
>> +
>> +	config->num_ctxs = num_ctxs;
>> +	config->num_dbs = num_dbs;
>> +
>> +	return config->num_ctxs ? 0 : -ENODATA;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int err;
>> +
>> +	err = vf_get_ggtt_info(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
>> +		err = vf_get_lmem_info(gt);
>> +		if (unlikely(err))
>> +			return err;
>> +	}
>> +
> 

you likely wanted to ask why we skip asking for the LMEM, so the answer
is that LMEM is per-tile, not actually used by any GuC (render/media) so
PF is mandated to provision LMEM only on the render GuC, from which VF
can query that info

> 
> 
>> +	err = vf_get_submission_cfg(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>> +{
>> +	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_RELAY_ACTION_VF2PF_HANDSHAKE),
>> +		FIELD_PREP(VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR, *major) |
>> +		FIELD_PREP(VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR, *minor),
>> +	};
>> +	u32 response[VF2PF_HANDSHAKE_RESPONSE_MSG_LEN];
>> +	int ret;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	ret = xe_guc_relay_send_to_pf(&gt->uc.guc.relay,
>> +				      request, ARRAY_SIZE(request),
>> +				      response, ARRAY_SIZE(response));
>> +	if (unlikely(ret < 0))
>> +		return ret;
>> +
>> +	if (unlikely(ret != VF2PF_HANDSHAKE_RESPONSE_MSG_LEN))
>> +		return -EPROTO;
>> +
>> +	if (unlikely(FIELD_GET(VF2PF_HANDSHAKE_RESPONSE_MSG_0_MBZ, response[0])))
>> +		return -EPROTO;
>> +
>> +	*major = FIELD_GET(VF2PF_HANDSHAKE_RESPONSE_MSG_1_MAJOR, response[1]);
>> +	*minor = FIELD_GET(VF2PF_HANDSHAKE_RESPONSE_MSG_1_MINOR, response[1]);
>> +
>> +	return 0;
>> +}
>> +
>> +static void vf_connect_pf(struct xe_gt *gt, u16 major, u16 minor)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	gt->sriov.vf.pf_version.major = major;
>> +	gt->sriov.vf.pf_version.minor = minor;
>> +}
>> +
>> +static void vf_disconnect_pf(struct xe_gt *gt)
>> +{
>> +	vf_connect_pf(gt, 0, 0);
>> +}
>> +
>> +static int vf_handshake_with_pf(struct xe_gt *gt)
>> +{
>> +	u32 major_wanted = GUC_RELAY_VERSION_LATEST_MAJOR;
>> +	u32 minor_wanted = GUC_RELAY_VERSION_LATEST_MINOR;
>> +	u32 major = major_wanted, minor = minor_wanted;
>> +	int err;
>> +
>> +	err = relay_action_handshake(gt, &major, &minor);
>> +	if (unlikely(err))
>> +		goto failed;
>> +
>> +	if (!major && !minor) {
>> +		err = -ENODATA;
>> +		goto failed;
>> +	}
>> +
>> +	xe_gt_sriov_dbg(gt, "using VF/PF ABI %u.%u\n", major, minor);
>> +	vf_connect_pf(gt, major, minor);
>> +	return 0;
>> +
>> +failed:
>> +	xe_gt_sriov_err(gt, "Unable to confirm VF/PF ABI version %u.%u (%pe)\n",
>> +			major, minor, ERR_PTR(err));
>> +	vf_disconnect_pf(gt);
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_connect - Establish connection with the PF driver.
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>> +{
>> +	int err;
>> +
>> +	err = vf_handshake_with_pf(gt);
>> +	if (unlikely(err))
>> +		goto failed;
>> +
>> +	return 0;
>> +
>> +failed:
>> +	xe_gt_sriov_err(gt, "Failed to get version info (%pe)\n", ERR_PTR(err));
>> +	return err;
>> +}
>> +
>> +static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	return major == gt->sriov.vf.pf_version.major &&
>> +	       minor <= gt->sriov.vf.pf_version.minor;
>> +}
>> +
>> +static int vf_prepare_runtime_info(struct xe_gt *gt, unsigned int num_regs)
>> +{
>> +	struct vf_runtime_reg *regs = gt->sriov.vf.runtime.regs;
>> +	unsigned int regs_size = round_up(num_regs, 4);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>> +
>> +	if (regs) {
>> +		if (num_regs <= gt->sriov.vf.runtime.regs_size) {
>> +			memset(regs, 0, num_regs * sizeof(*regs));
>> +			gt->sriov.vf.runtime.num_regs = num_regs;
>> +			return 0;
>> +		}
>> +
>> +		drmm_kfree(&xe->drm, regs);
>> +		gt->sriov.vf.runtime.regs = NULL;
>> +		gt->sriov.vf.runtime.num_regs = 0;
>> +		gt->sriov.vf.runtime.regs_size = 0;
>> +	}
>> +
>> +	regs = drmm_kcalloc(&xe->drm, regs_size, sizeof(*regs), GFP_KERNEL);
>> +	if (unlikely(!regs))
>> +		return -ENOMEM;
>> +
>> +	gt->sriov.vf.runtime.regs = regs;
>> +	gt->sriov.vf.runtime.num_regs = num_regs;
>> +	gt->sriov.vf.runtime.regs_size = regs_size;
>> +	return 0;
>> +}
>> +
>> +static int vf_query_runtime_info(struct xe_gt *gt)
>> +{
>> +	u32 request[VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN];
>> +	u32 response[VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + 32]; /* up to 16 regs */
>> +	u32 limit = (ARRAY_SIZE(response) - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2;
>> +	u32 count, remaining, num, i;
>> +	u32 start = 0;
>> +	int ret;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, limit);
>> +
>> +	/* this is part of the 1.0 PF/VF ABI */
>> +	if (!vf_is_negotiated(gt, 1, 0))
>> +		return -ENOPKG;
>> +
>> +	request[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		     FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>> +				GUC_RELAY_ACTION_VF2PF_QUERY_RUNTIME) |
>> +		     FIELD_PREP(VF2PF_QUERY_RUNTIME_REQUEST_MSG_0_LIMIT, limit);
>> +
>> +repeat:
>> +	request[1] = FIELD_PREP(VF2PF_QUERY_RUNTIME_REQUEST_MSG_1_START, start);
>> +	ret = xe_guc_relay_send_to_pf(&gt->uc.guc.relay,
>> +				      request, ARRAY_SIZE(request),
>> +				      response, ARRAY_SIZE(response));
>> +	if (unlikely(ret < 0))
>> +		goto failed;
>> +
>> +	if (unlikely(ret < VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN)) {
>> +		ret = -EPROTO;
>> +		goto failed;
>> +	}
>> +	if (unlikely((ret - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) % 2)) {
>> +		ret = -EPROTO;
>> +		goto failed;
>> +	}
>> +
>> +	num = (ret - VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN) / 2;
>> +	count = FIELD_GET(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_0_COUNT, response[0]);
>> +	remaining = FIELD_GET(VF2PF_QUERY_RUNTIME_RESPONSE_MSG_1_REMAINING, response[1]);
>> +
>> +	xe_gt_sriov_dbg_verbose(gt, "count=%u num=%u ret=%d start=%u remaining=%u\n",
>> +				count, num, ret, start, remaining);
>> +
>> +	if (unlikely(count != num)) {
>> +		ret = -EPROTO;
>> +		goto failed;
>> +	}
>> +
>> +	if (start == 0) {
>> +		ret = vf_prepare_runtime_info(gt, num + remaining);
>> +		if (unlikely(ret < 0))
>> +			goto failed;
>> +	} else if (unlikely(start + num > gt->sriov.vf.runtime.num_regs)) {
>> +		ret = -EPROTO;
>> +		goto failed;
>> +	}
>> +
>> +	for (i = 0; i < num; ++i) {
>> +		struct vf_runtime_reg *reg = &gt->sriov.vf.runtime.regs[start + i];
>> +
>> +		reg->offset = response[VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + 2 * i];
>> +		reg->value = response[VF2PF_QUERY_RUNTIME_RESPONSE_MSG_MIN_LEN + 2 * i + 1];
>> +	}
>> +
>> +	if (remaining) {
>> +		start += num;
>> +		goto repeat;
>> +	}
>> +
>> +	return 0;
>> +
>> +failed:
>> +	vf_prepare_runtime_info(gt, 0);
>> +	return ret;
>> +}
>> +
>> +static void vf_show_runtime_info(struct xe_gt *gt)
>> +{
>> +	struct vf_runtime_reg *vf_regs = gt->sriov.vf.runtime.regs;
>> +	unsigned int size = gt->sriov.vf.runtime.num_regs;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	for (; size--; vf_regs++)
>> +		xe_gt_sriov_dbg(gt, "runtime(%#x) = %#x\n",
>> +				vf_regs->offset, vf_regs->value);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_query_runtime - Query SR-IOV runtime data.
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>> +{
>> +	int err;
>> +
>> +	err = vf_query_runtime_info(gt);
>> +	if (unlikely(err))
>> +		goto failed;
>> +
>> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
>> +		vf_show_runtime_info(gt);
>> +
>> +	return 0;
>> +
>> +failed:
>> +	xe_gt_sriov_err(gt, "Failed to get runtime info (%pe)\n",
>> +			ERR_PTR(err));
>> +	return err;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_print_config - Print VF self config.
>> + * @gt: the &xe_gt
>> + * @p: the &drm_printer
>> + *
>> + * This function is for VF use only.
>> + */
>> +void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	char buf[10];
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
>> +		   config->ggtt_base,
>> +		   config->ggtt_base + config->ggtt_size - 1);
>> +
>> +	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>> +	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
>> +
>> +	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
>> +		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>> +		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
>> +	}
>> +
>> +	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
>> +	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_print_runtime - Print VF's runtime regs received from PF.
>> + * @gt: the &xe_gt
>> + * @p: the &drm_printer
>> + *
>> + * This function is for VF use only.
>> + */
>> +void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct vf_runtime_reg *vf_regs = gt->sriov.vf.runtime.regs;
>> +	unsigned int size = gt->sriov.vf.runtime.num_regs;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	for (; size--; vf_regs++)
>> +		drm_printf(p, "%#x = %#x\n", vf_regs->offset, vf_regs->value);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_print_version - Print VF ABI versions.
>> + * @gt: the &xe_gt
>> + * @p: the &drm_printer
>> + *
>> + * This function is for VF use only.
>> + */
>> +void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
>> +	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
>> +	u32 branch, major, minor;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	drm_printf(p, "GuC ABI:\n");
>> +
>> +	vf_minimum_guc_version(gt, &branch, &major, &minor);
>> +	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
>> +
>> +	vf_wanted_guc_version(gt, &branch, &major, &minor);
>> +	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
>> +
>> +	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>> +		   guc_version->branch, guc_version->major,
>> +		   guc_version->minor, guc_version->patch);
>> +
>> +	drm_printf(p, "PF ABI:\n");
>> +
>> +	drm_printf(p, "\tbase:\t%u.%u\n",
>> +		   GUC_RELAY_VERSION_BASE_MAJOR, GUC_RELAY_VERSION_BASE_MINOR);
>> +	drm_printf(p, "\twanted:\t%u.%u\n",
>> +		   GUC_RELAY_VERSION_LATEST_MAJOR, GUC_RELAY_VERSION_LATEST_MINOR);
>> +	drm_printf(p, "\thandshake:\t%u.%u\n",
>> +		   pf_version->major, pf_version->minor);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> new file mode 100644
>> index 000000000000..997cb7541036
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_SRIOV_VF_H_
>> +#define _XE_GT_SRIOV_VF_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_printer;
>> +struct xe_gt;
>> +
>> +int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>> +
>> +void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>> +void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>> +void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> new file mode 100644
>> index 000000000000..f151408797ec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -0,0 +1,82 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_SRIOV_VF_TYPES_H_
>> +#define _XE_GT_SRIOV_VF_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
>> + */
>> +struct xe_gt_sriov_vf_guc_version {
>> +	/* @branch: branch version. */
> 
> If it is In-line member documentation comments, then i guess you should use comments: "/**".
> 
> You also use a single "*" character below.

my mistake due to a last minute change from the top-level doc to inline
style; this was also noticed by the CI.hooks:

drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h:24: warning: Function
parameter or struct member 'branch' not described in
'xe_gt_sriov_vf_guc_version'
...

> 
>> +	u8 branch;
>> +	/* @major: major version. */
>> +	u8 major;
>> +	/* @minor: minor version. */
>> +	u8 minor;
>> +	/* @patch: patch version. */
>> +	u8 patch;
>> +};
>> +
>> +/**
>> + * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
>> + */
>> +struct xe_gt_sriov_vf_relay_version {
>> +	/* @major: major version. */
>> +	u16 major;
>> +	/* @minor: minor version. */
>> +	u16 minor;
>> +};
>> +
>> +/**
>> + * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
>> + */
>> +struct xe_gt_sriov_vf_selfconfig {
>> +	/* @ggtt_base: assigned base offset of the GGTT region. */
>> +	u64 ggtt_base;
>> +	/* @ggtt_size: assigned size of the GGTT region. */
>> +	u64 ggtt_size;
>> +	/* @lmem_size: assigned size of the LMEM. */
>> +	u64 lmem_size;
>> +	/* @num_ctxs: assigned number of GuC submission context IDs. */
>> +	u16 num_ctxs;
>> +	/* @num_dbs: assigned number of GuC doorbells IDs. */
>> +	u16 num_dbs;
>> +};
>> +
>> +/**
>> + * struct xe_gt_sriov_vf_runtime - VF runtime data.
>> + */
>> +struct xe_gt_sriov_vf_runtime {
>> +	/* @regs_size: size of runtime register array. */
>> +	u32 regs_size;
>> +	/* @num_regs: number of runtime registers in the array. */
>> +	u32 num_regs;
>> +	/* @regs: pointer to array of register offset/value pairs. */
>> +	struct vf_runtime_reg {
>> +		/* @regs.offset: register offset. */
>> +		u32 offset;
>> +		/* @regs.value: register value. */
>> +		u32 value;
>> +	} *regs;
>> +};
>> +
>> +/**
>> + * struct xe_gt_sriov_vf - GT level VF virtualization data.
>> + */
>> +struct xe_gt_sriov_vf {
>> +	/* @guc_version: negotiated GuC ABI version. */
>> +	struct xe_gt_sriov_vf_guc_version guc_version;
>> +	/* @self_config: resource configurations. */
>> +	struct xe_gt_sriov_vf_selfconfig self_config;
>> +	/* @guc_version: negotiated VF/PF ABI version. */
>> +	struct xe_gt_sriov_vf_relay_version pf_version;
>> +	/* @runtime: runtime data retrieved from the PF. */
>> +	struct xe_gt_sriov_vf_runtime runtime;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 8dc203413a27..ac2fcfa94e8a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -9,6 +9,7 @@
>>  #include "xe_force_wake_types.h"
>>  #include "xe_gt_idle_types.h"
>>  #include "xe_gt_sriov_pf_types.h"
>> +#include "xe_gt_sriov_vf_types.h"
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_hw_fence_types.h"
>>  #include "xe_reg_sr_types.h"
>> @@ -149,6 +150,8 @@ struct xe_gt {
>>  	union {
>>  		/** @sriov.pf: PF data. Valid only if driver is running as PF */
>>  		struct xe_gt_sriov_pf pf;
>> +		/** @sriov.vf: VF data. Valid only if driver is running as VF */
>> +		struct xe_gt_sriov_vf vf;
>>  	} sriov;
>>  
>>  	/**
> 
> Thanks
> Piotr
> 
>> -- 
>> 2.43.0
>>
> 

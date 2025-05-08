Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F29BC3ABC6
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 20:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119EA10E21B;
	Thu,  8 May 2025 20:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aO+eSUes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4510E21B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746737890; x=1778273890;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RAtgjDza64NvurqA67U0Wx2+oSHrbiLISCptzIuhGAo=;
 b=aO+eSUes5bTLrgZ1B8S755NO7D2UufC3dtC787Sk363cor1ktZfCdTDK
 8JlAl8gDErJxbVL7XpETqcpcFH7CUspENp2raMJok9EM4dBub3rxLgRge
 WKUfu4yBX0l04M95D6eXXtWLCMFij8cvjBzKz8OBQ78nCUsRW6gydfdwj
 yckaqhFar+MXbSRM/Xtn98aidjLZRZgJ/f69XKjVw5siaI/sCkTmdp+ad
 dkdAK8s3cicWSLzM/ORX3DSsbDV6XnhYksKxE+1PorrI6VLIrLhs8R3LZ
 MS9wWSqC3mYyVFvbUJtXeC2LmILR6HaiK4KexIZONV4HU1MdhndBwelKC w==;
X-CSE-ConnectionGUID: H9TYy2nPSXWj3IhvAErvHw==
X-CSE-MsgGUID: SWDSm/ciSNG8OZtbZoaI/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48659133"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="48659133"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 13:58:10 -0700
X-CSE-ConnectionGUID: gsYpNEytRk6FafMMB7XFGA==
X-CSE-MsgGUID: YXSZfBa+QHClotZOBA8zOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="159706997"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 13:58:08 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 19FFD27BBA;
 Thu,  8 May 2025 21:58:06 +0100 (IST)
Message-ID: <842c9156-5878-4e0a-8615-0b4b7f07eefb@intel.com>
Date: Thu, 8 May 2025 22:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/vf: use uc_fw_version to store the negotiated
 GuC ABI
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
 <20250408213146.793855-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250408213146.793855-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 08.04.2025 23:31, Daniele Ceraolo Spurio wrote:
> Instead of using a VF-specific type, we can use the common uc_fw_version
> structure. This also means that we can use the available macros to
> compare ABI versions.
> 
> While at it, exit early from the bootstrap if this is not the first time
> we're doing it and the version hasn't changed, so we don't end up
> logging it multiple times.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

some nits below

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 137 +++++++++++---------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  17 +--
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c |   2 +-
>  drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
>  4 files changed, 81 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a439261bf4d7..68714e607b10 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -82,17 +82,17 @@ int xe_gt_sriov_vf_reset(struct xe_gt *gt)
>  }
>  
>  static int guc_action_match_version(struct xe_guc *guc,
> -				    u32 wanted_branch, u32 wanted_major, u32 wanted_minor,
> -				    u32 *branch, u32 *major, u32 *minor, u32 *patch)
> +				    struct xe_uc_fw_version *wanted,
> +				    struct xe_uc_fw_version *found)
>  {
>  	u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>  		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>  			   GUC_ACTION_VF2GUC_MATCH_VERSION),
> -		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted_branch) |
> -		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted_major) |
> -		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted_minor),
> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted->branch) |
> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted->major) |
> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted->minor),
>  	};
>  	u32 response[GUC_MAX_MMIO_MSG_LEN];
>  	int ret;
> @@ -106,120 +106,135 @@ static int guc_action_match_version(struct xe_guc *guc,
>  	if (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ, response[0])))
>  		return -EPROTO;
>  
> -	*branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
> -	*major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
> -	*minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
> -	*patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
> +	memset(found, 0, sizeof(struct xe_uc_fw_version));
> +	found->branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
> +	found->major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
> +	found->minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
> +	found->patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
>  
>  	return 0;
>  }
>  
> -static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
> +static int guc_action_match_version_any(struct xe_guc *guc,
> +					struct xe_uc_fw_version *found)
> +{
> +	struct xe_uc_fw_version wanted = {
> +		.branch = GUC_VERSION_BRANCH_ANY,
> +		.major = GUC_VERSION_MAJOR_ANY,
> +		.minor = GUC_VERSION_MINOR_ANY,
> +		.patch = 0
> +	};
> +
> +	return guc_action_match_version(guc, &wanted, found);
> +}
> +
> +static void vf_minimum_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> +	memset(ver, 0, sizeof(struct xe_uc_fw_version));
> +
>  	switch (xe->info.platform) {
>  	case XE_TIGERLAKE ... XE_PVC:
>  		/* 1.1 this is current baseline for Xe driver */
> -		*branch = 0;
> -		*major = 1;
> -		*minor = 1;
> +		ver->branch = 0;
> +		ver->major = 1;
> +		ver->minor = 1;
>  		break;
>  	default:
>  		/* 1.2 has support for the GMD_ID KLV */
> -		*branch = 0;
> -		*major = 1;
> -		*minor = 2;
> +		ver->branch = 0;
> +		ver->major = 1;
> +		ver->minor = 2;
>  		break;
>  	}
>  }
>  
> -static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
> +static void vf_wanted_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver)
>  {
>  	/* for now it's the same as minimum */
> -	return vf_minimum_guc_version(gt, branch, major, minor);
> +	return vf_minimum_guc_version(gt, ver);
>  }
>  
>  static int vf_handshake_with_guc(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
> +	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
> +	struct xe_uc_fw_version wanted = {0};
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u32 wanted_branch, wanted_major, wanted_minor;
> -	u32 branch, major, minor, patch;
> +	bool old = false;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
>  	/* select wanted version - prefer previous (if any) */
>  	if (guc_version->major || guc_version->minor) {
> -		wanted_branch = guc_version->branch;
> -		wanted_major = guc_version->major;
> -		wanted_minor = guc_version->minor;
> +		wanted = *guc_version;
> +		old = true;
>  	} else {
> -		vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
> -		xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
> +		vf_wanted_guc_version(gt, &wanted);
> +		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
>  	}
>  
> -	err = guc_action_match_version(guc, wanted_branch, wanted_major, wanted_minor,
> -				       &branch, &major, &minor, &patch);
> +	err = guc_action_match_version(guc, &wanted, guc_version);
>  	if (unlikely(err))
>  		goto fail;
>  
> -	/* we don't support interface version change */
> -	if ((guc_version->major || guc_version->minor) &&
> -	    (guc_version->branch != branch || guc_version->major != major ||
> -	     guc_version->minor != minor)) {
> -		xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
> -				branch, major, minor, patch);
> -		xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
> -				 guc_version->branch, guc_version->major,
> -				 guc_version->minor, guc_version->patch);
> -		err = -EREMCHG;
> -		goto fail;
> +	if (old) {
> +		/* we don't support interface version change */
> +		if (MAKE_GUC_VER_STRUCT(*guc_version) != MAKE_GUC_VER_STRUCT(wanted)) {
> +			xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
> +					guc_version->branch, guc_version->major,
> +					guc_version->minor, guc_version->patch);
> +			xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
> +					 wanted.branch, wanted.major,
> +					 wanted.minor, wanted.patch);
> +			err = -EREMCHG;
> +			goto fail;
> +		} else {
> +			/* version is unchanged, no need to re-verify it */
> +			return 0;
> +		}
>  	}
>  
>  	/* illegal */
> -	if (major > wanted_major) {
> +	if (guc_version->major > wanted.major) {
>  		err = -EPROTO;
>  		goto unsupported;
>  	}
>  
>  	/* there's no fallback on major version. */
> -	if (major != wanted_major) {
> +	if (guc_version->major != wanted.major) {
>  		err = -ENOPKG;
>  		goto unsupported;
>  	}
>  
>  	/* check against minimum version supported by us */
> -	vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
> -	xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
> -	if (major < wanted_major || (major == wanted_major && minor < wanted_minor)) {
> +	vf_minimum_guc_version(gt, &wanted);
> +	xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
> +	if (MAKE_GUC_VER_STRUCT(*guc_version) < MAKE_GUC_VER_STRUCT(wanted)) {
>  		err = -ENOKEY;
>  		goto unsupported;
>  	}
>  
>  	xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.%u\n",
> -			branch, major, minor, patch);
> +			guc_version->branch, guc_version->major,
> +			guc_version->minor, guc_version->patch);
>  
> -	guc_version->branch = branch;
> -	guc_version->major = major;
> -	guc_version->minor = minor;
> -	guc_version->patch = patch;
>  	return 0;
>  
>  unsupported:
>  	xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u (%pe)\n",
> -			branch, major, minor, patch, ERR_PTR(err));
> +			guc_version->branch, guc_version->major,
> +			guc_version->minor, guc_version->patch,
> +			ERR_PTR(err));
>  fail:
>  	xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u (%pe)\n",
> -			wanted_major, wanted_minor, ERR_PTR(err));
> +			wanted.major, wanted.minor, ERR_PTR(err));
>  
>  	/* try again with *any* just to query which version is supported */
> -	if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
> -				      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
> -				      &branch, &major, &minor, &patch))
> +	if (!guc_action_match_version_any(guc, &wanted))
>  		xe_gt_sriov_notice(gt, "GuC reports interface version %u.%u.%u.%u\n",
> -				   branch, major, minor, patch);
> +				   wanted.branch, wanted.major, wanted.minor, wanted.patch);
>  	return err;
>  }
>  
> @@ -1079,19 +1094,19 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
>   */
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
> +	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
>  	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
> -	u32 branch, major, minor;
> +	struct xe_uc_fw_version ver;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
>  	drm_printf(p, "GuC ABI:\n");
>  
> -	vf_minimum_guc_version(gt, &branch, &major, &minor);
> -	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
> +	vf_minimum_guc_version(gt, &ver);
> +	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>  
> -	vf_wanted_guc_version(gt, &branch, &major, &minor);
> -	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
> +	vf_wanted_guc_version(gt, &ver);
> +	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>  
>  	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>  		   guc_version->branch, guc_version->major,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index a57f13b5afcd..f1b5e523ddf0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -7,20 +7,7 @@
>  #define _XE_GT_SRIOV_VF_TYPES_H_
>  
>  #include <linux/types.h>
> -
> -/**
> - * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
> - */
> -struct xe_gt_sriov_vf_guc_version {
> -	/** @branch: branch version. */
> -	u8 branch;
> -	/** @major: major version. */
> -	u8 major;
> -	/** @minor: minor version. */
> -	u8 minor;
> -	/** @patch: patch version. */
> -	u8 patch;
> -};
> +#include "xe_uc_fw_types.h"
>  
>  /**
>   * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
> @@ -72,7 +59,7 @@ struct xe_gt_sriov_vf_runtime {
>   */
>  struct xe_gt_sriov_vf {
>  	/** @guc_version: negotiated GuC ABI version. */
> -	struct xe_gt_sriov_vf_guc_version guc_version;
> +	struct xe_uc_fw_version guc_version;
>  	/** @self_config: resource configurations. */
>  	struct xe_gt_sriov_vf_selfconfig self_config;
>  	/** @pf_version: negotiated VF/PF ABI version. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index b96fea78df8b..4d39fdaf806f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -124,7 +124,7 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>  static bool is_engine_activity_supported(struct xe_guc *guc)
>  {
>  	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> -	struct xe_uc_fw_version required = { 1, 14, 1 };
> +	struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch = 1 };

this could be done in separate patch

>  	struct xe_gt *gt = guc_to_gt(guc);
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index ad3b35a0e6eb..914026015019 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -65,6 +65,8 @@ enum xe_uc_fw_type {
>   * struct xe_uc_fw_version - Version for XE micro controller firmware
>   */
>  struct xe_uc_fw_version {
> +	/** @branch: branch version of the FW (not always available) */
> +	u16 branch;

and same here as next separate preparation patch (as now the commit
message is not even mentioning that we had to update fw_version struct
to make it work with VF)

>  	/** @major: major version of the FW */
>  	u16 major;
>  	/** @minor: minor version of the FW */


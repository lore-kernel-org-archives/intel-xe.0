Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE0EC5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 13:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B56110E872;
	Fri, 30 May 2025 13:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRj1TAdg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C38110E813
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748613373; x=1780149373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=guvRe4FPAtnPY6mK+VaSMAImHPTPV9z487CX81lv+Lg=;
 b=YRj1TAdg7js6OiiX0cJ98+2FRE+vkJWxlYjwKf6NLpjFMlu3fcwp9m89
 ihmawNJM2KSVQGGFg21jDH1Qe61QoD7vunBLvlkJwKfAovB56JdzbIf2z
 wDVN2moW9nqDZQzUU4lJKDLEBheB67vu1ddji4szQNWilRELLUAkSc4xi
 L6RzVYj1BGC7+pQT5sg+qtALpG5QgO5SpT8SDurIjFmbaAkBgjyWh+tym
 iVnVUV2C1sLUu60z9L/vi7jg5vgrcgWyf4ULn3rLdTR6Z0dXk1kZ5kevC
 ZvnhiwEdDHJ84Y9dIzeasFY4fgdiqw7PbAlzV6msqhKP3CkmQ4SrVwhgN g==;
X-CSE-ConnectionGUID: PrK3cn4pRbW48ygvSKpoFQ==
X-CSE-MsgGUID: UlXAAw5JSxuBYvNKeoNzLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256328"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="68256328"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:56:02 -0700
X-CSE-ConnectionGUID: 4B8tBy2XSiu4s6WG+24xQA==
X-CSE-MsgGUID: TuvAAd7zTbyt54pRimGifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="174763947"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:56:01 -0700
Received: from [10.245.84.121] (unknown [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2CA0233EB0;
 Fri, 30 May 2025 14:56:00 +0100 (IST)
Message-ID: <b0c8aff1-0037-41da-bbb3-89cfa6cfcfb4@intel.com>
Date: Fri, 30 May 2025 15:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/vf: Store the GuC FW info in guc->fw
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
 <20250528234229.4185039-10-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250528234229.4185039-10-daniele.ceraolospurio@intel.com>
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



On 29.05.2025 01:42, Daniele Ceraolo Spurio wrote:
> The GuC compatibility version that we read from the CSS header in
> native/PF and the GuC VF version that we get when a VF handshakes with
> the GuC are the same version number, so we should store it into the same
> structure. This makes all the checks based on the compatibility version
> automatically work for VFs without having to copy the value over.
> 
> For completion, also copy the wanted version and set the path to a known
> string to indicate that the FW is PF-loaded. This way all the info will
> be coherent when dumped from debugfs.
> 
> v2: several code cleanups and style changes (Michal), rebase on
> bootstrap changes.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with few nits below

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 32 ++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  4 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_uc_fw.c             | 37 ++++++++++++++++++-----
>  4 files changed, 65 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 8aed27904c58..148076435a12 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -173,6 +173,9 @@ static int vf_handshake_with_guc(struct xe_gt *gt)
>  	} else {
>  		vf_wanted_guc_version(gt, &wanted);
>  		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
> +
> +		/* First time we handshake, so record the minimum wanted */
> +		gt->sriov.vf.wanted_guc_version = wanted;
>  	}
>  
>  	err = guc_action_match_version(guc, &wanted, guc_version);
> @@ -265,6 +268,30 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_guc_versions - Minimum required and found GuC ABI versions
> + * @gt: the &xe_gt
> + * @min: pointer to the xe_uc_fw_version to be filled with the min version

in all related code we use term "wanted" so maybe use the same here?

	@wanted: pointer to the &xe_uc_fw_version to be filled with
	the minimal wanted GuC ABI version

> + * @found: pointer to the xe_uc_fw_version to be filled with the found version
> + *
> + * This function is for VF use only.

"Can only be used after successful version handshake with the GuC."

due to the assert below

> + */
> +void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> +				 struct xe_uc_fw_version *min,
> +				 struct xe_uc_fw_version *found)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);

        ^^^^

> +
> +	if (min)
> +		*min =  gt->sriov.vf.wanted_guc_version;
> +
> +	if (found)
> +		*found = gt->sriov.vf.guc_version;
> +
> +	return;
> +}
> +
>  static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> @@ -1259,6 +1286,7 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
> +	struct xe_uc_fw_version *wanted = &gt->sriov.vf.wanted_guc_version;
>  	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
>  	struct xe_uc_fw_version ver;
>  
> @@ -1269,8 +1297,8 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  	vf_minimum_guc_version(gt, &ver);
>  	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>  
> -	vf_wanted_guc_version(gt, &ver);
> -	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
> +	drm_printf(p, "\twanted:\t%u.%u.%u.*\n",
> +		   wanted->branch, wanted->major, wanted->minor);
>  
>  	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>  		   guc_version->branch, guc_version->major,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 9db41afddd5a..a35576d1e5c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -11,9 +11,13 @@
>  struct drm_printer;
>  struct xe_gt;
>  struct xe_reg;
> +struct xe_uc_fw_version;
>  
>  int xe_gt_sriov_vf_reset(struct xe_gt *gt);
>  int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> +void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> +				 struct xe_uc_fw_version *min,
> +				 struct xe_uc_fw_version *found);
>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index d614acbe0b5f..ef041679e9d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -60,6 +60,8 @@ struct xe_gt_sriov_vf_runtime {
>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
>   */
>  struct xe_gt_sriov_vf {
> +	/** @wanted_guc_version: minimum wanted GuC ABI version. */
> +	struct xe_uc_fw_version wanted_guc_version;
>  	/** @guc_version: negotiated GuC ABI version. */
>  	struct xe_uc_fw_version guc_version;
>  	/** @self_config: resource configurations. */
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 7b2d01d39b86..074e29057495 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -16,6 +16,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> @@ -665,6 +666,33 @@ do { \
>  			  ver_->major, ver_->minor, ver_->patch); \
>  } while (0)
>  
> +static void uc_fw_vf_override(struct xe_uc_fw *uc_fw)
> +{
> +	struct xe_uc_fw_version *compat = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
> +
> +	/* Only GuC/HuC are supported */
> +	if (uc_fw->type != XE_UC_FW_TYPE_GUC && uc_fw->type != XE_UC_FW_TYPE_HUC)
> +		uc_fw->path = NULL;
> +
> +	/* VF will support only firmwares that driver can autoselect */
> +	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
> +			       XE_UC_FIRMWARE_PRELOADED :
> +			       XE_UC_FIRMWARE_NOT_SUPPORTED);
> +
> +	if (!xe_uc_fw_is_supported(uc_fw))
> +		return;
> +
> +	/* PF is doing the loading, so we don't need a path on the VF */
> +	uc_fw->path = "Loaded by PF";
> +
> +	/* The GuC versions are set up during the VF bootstrap */
> +	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
> +		uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
> +		xe_gt_sriov_vf_guc_versions(uc_fw_to_gt(uc_fw), wanted, compat);
> +	}
> +}
> +
>  static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
>  {
>  	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> @@ -684,14 +712,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  	uc_fw_auto_select(xe, uc_fw);
>  
>  	if (IS_SRIOV_VF(xe)) {
> -		/* Only GuC/HuC are supported */
> -		if (uc_fw->type != XE_UC_FW_TYPE_GUC &&
> -		    uc_fw->type != XE_UC_FW_TYPE_HUC)
> -			uc_fw->path = NULL;
> -		/* VF will support only firmwares that driver can autoselect */
> -		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
> -				       XE_UC_FIRMWARE_PRELOADED :
> -				       XE_UC_FIRMWARE_NOT_SUPPORTED);
> +		uc_fw_vf_override(uc_fw);
>  		return 0;
>  	}
>  


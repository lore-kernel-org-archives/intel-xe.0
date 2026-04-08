Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C97CFD5F79
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF4D10E611;
	Wed,  8 Apr 2026 11:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJRQijfJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C154C10E611
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 11:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775647114; x=1807183114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S9OIB8f4T91+e/l6su3O4lZNgjv48PP9HEC4y/ereiY=;
 b=GJRQijfJDt/XiIm9DXHpWr6n30X2vs0WgHUKJSHwzoMYPRKDo1zVFRZH
 DbJDX6Ksjqm4xahkPGx2540PW2Udey8bHUlukb0rOVD/gMjJ2UlCnp6HW
 VcbALElbY+XoMz7ktoQoGt67sdfGSGYVFsOLUuxV8co+vRpjQwvvII74F
 dNE5LBXBVrFJJ54oqd7y9N8n6hqOjkoBoZL5t+ckRcYLSBzoGE5xVGbsZ
 /y3t8Nx1CENDYWJ2uq67NLhuQr+6Q2ZrhYodaOZXvzaxlrO25IzmdfKpL
 4rS1oRnskqmw8IO9Ajjt7U4jgBtzXboGFgsZkDJSleVk16EDDkRyLRPIP Q==;
X-CSE-ConnectionGUID: sAjN6S3yQOu1diG8+2BOuw==
X-CSE-MsgGUID: wRRnd4tlSzGdWIUjf12x7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76504258"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76504258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:18:34 -0700
X-CSE-ConnectionGUID: +5yt+11RQQyI9QethN745A==
X-CSE-MsgGUID: 0dbS8KZZTqq34KdpqRH8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251769774"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:18:31 -0700
Date: Wed, 8 Apr 2026 13:18:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 08/10] drm/xe/xe_ras: Add structures for SoC Internal
 errors
Message-ID: <adY5hH7l-HiXt-Fu@black.igk.intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-20-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402070131.1603828-20-riana.tauro@intel.com>
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

On Thu, Apr 02, 2026 at 12:31:39PM +0530, Riana Tauro wrote:
> Add response structures for SoC Internal errors.

This looks like should be squashed with next patch, or did I miss something?

Raag

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: simplify soc structures
> ---
>  drivers/gpu/drm/xe/xe_ras_types.h | 51 +++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index e37dd12bffa3..65158bf716a7 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>  
>  #define XE_RAS_NUM_ERROR_ARR		3
>  #define XE_RAS_MAX_ERROR_DETAILS	16
> +#define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
>  
>  /**
>   * enum xe_ras_recovery_action - RAS recovery actions
> @@ -149,4 +150,54 @@ struct xe_ras_compute_error {
>  	u32 spare_log3;
>  } __packed;
>  
> +/**
> + * struct xe_ras_soc_error_source - Source of SOC error
> + */
> +struct xe_ras_soc_error_source {
> +	/** @csc: CSC error */
> +	u32 csc:1;
> +	/** @soc: SOC error */
> +	u32 soc:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +} __packed;
> +
> +/**
> + * struct xe_ras_soc_error - SOC error details
> + */
> +struct xe_ras_soc_error {
> +	/** @error_source: Error Source */
> +	struct xe_ras_soc_error_source error_source;
> +	/** @additional_details: Additional details */
> +	u32 additional_details[15];
> +} __packed;
> +
> +/**
> + * struct xe_ras_csc_error - CSC error details
> + */
> +struct xe_ras_csc_error {
> +	/** @hec_uncorr_err_status: CSC error */
> +	u32 hec_uncorr_err_status;
> +	/** @hec_uncorr_fw_err_dw0: CSC f/w error */
> +	u32 hec_uncorr_fw_err_dw0;
> +} __packed;
> +
> +/**
> + * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) details
> + */
> +struct xe_ras_ieh_error {
> +	/** @ieh_instance: IEH instance */
> +	u32 ieh_instance:2;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +	/** @global_error_status: Global error status */
> +	u32 global_error_status;
> +	/** @local_error_status: Local error status */
> +	u32 local_error_status;
> +	/** @gerr_mask: Global error mask */
> +	u32 gerr_mask;
> +	/** @additional_info: Additional information */
> +	u32 additional_info[10];
> +} __packed;
> +
>  #endif
> -- 
> 2.47.1
> 

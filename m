Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0249C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 10:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9746B10E2B2;
	Wed, 16 Sep 2026 10:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoogM8VN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1C10E2B2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789554140; x=1821090140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EMcBl2lrJKKwfGDL6xNxxyBFbG/NWXY7oC2ShHkRXDU=;
 b=JoogM8VNuLmys0t5F3QDvRu0yI/rhbcg8gVZ/Ak2yGlQ1h+RRrjLEuT/
 oiLbd0CActCSA+ObrnGxBnW1H9OJCfCh8Xn2Bq+DibjWyGbJChvJLU2hi
 Q5gnzIAJ1j9kCt6LiJ4+4mrlTVlEU36gQ9IZdLJ01GtjXd5et5XrMnSID
 jGrQYvZGw7f2cxT53xeUb4Bf7nYLy3Aq3IGxbYJQ/Wkh5FhlNpd4YaALS
 ka38tqib67Q0x2QHg0PzEKWA4HVgbSZo/FX5T2XsM6cKRMhntBe01ASqP
 FU9wvF3BbaLWAVcQ2VHB6lNghb9H+uezDRI2HXopoUYCoQudvpOAbXZLM g==;
X-CSE-ConnectionGUID: pu4yhQvkSgKvciTQrU9HxA==
X-CSE-MsgGUID: pEGb8TToRmqPfwxcIbRklA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77489599"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77489599"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:22:20 -0700
X-CSE-ConnectionGUID: q5N2si2bSfiqQJbA2vWXiA==
X-CSE-MsgGUID: MQwqx1UwShm8lAlN8pZOWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1700860"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:22:18 -0700
Date: Wed, 16 Sep 2026 12:22:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add support for PCIe error
 component handling
Message-ID: <aqpt1-v5d3feuBIY@black.igk.intel.com>
References: <20260916052836.2953509-4-riana.tauro@intel.com>
 <20260916052836.2953509-6-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916052836.2953509-6-riana.tauro@intel.com>
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

On Wed, Sep 16, 2026 at 10:58:39AM +0530, Riana Tauro wrote:
> Add support for handling PCIe subsystem errors. PCIe subsystem power
> management errors require a Seconday bus reset(SBR) for recovery. Treat all
> others as recovered and take no further action.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add mapping to cper severity (Badal, Rodrigo)
>     add abbreviations
>     fix punctuations (Raag)
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 19 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index c1939fd71f2d..83adcd211864 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -409,6 +409,22 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  }
>  
> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +	u8 severity = arr->counter.common.severity;
> +
> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA) {
> +		xe_log_comp(xe, ras_sev_to_cper_sev(severity), PCIE, &arr->counter,
> +			    sizeof(arr->counter), "GPMA error detected\n");
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
> +
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,

Haven't you got a local 'severity'?

Raag

> +		    sizeof(arr->counter), "Errors detected\n");
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>  static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>  {
>  	struct xe_ras_error_product *product = &arr->counter.product;
> @@ -588,6 +604,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>  			case XE_RAS_COMP_DEVICE_MEMORY:
>  				action = handle_device_memory_errors(xe, arr);
>  				break;
> +			case XE_RAS_COMP_PCIE:
> +				action = handle_pcie_errors(xe, arr);
> +				break;
>  			case XE_RAS_COMP_FABRIC:
>  				action = handle_fabric_errors(xe, arr);
>  				break;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4a8cd6fc5ba2..324e9754742b 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,7 @@
>  #define XE_RAS_NUM_ERROR_ARR			3
>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
>  /* Bits 16-31 represent individual SAF MHB unit */
>  #define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
>  
> -- 
> 2.47.1
> 

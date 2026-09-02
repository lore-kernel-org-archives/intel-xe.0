Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64374C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4C310EFFC;
	Wed,  2 Sep 2026 07:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brTZFWXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0838110EFFC
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 07:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788332862; x=1819868862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xcfpeW7zk+VmOYpi0Kk6eFzL1rHL7z8uyuQhj7AfiBs=;
 b=brTZFWXLVD+2R9I4jtXCnaQwXFDeRpCqm5pXUcZsh165u6oXTE3JifY0
 oTZ8wnog9J+3L5t+E5PqY6PCylhLISzfjN8ugJB/5gjityAbcFV/liZdY
 exh5xzPc5nwwrREA9MpBbHuZus8N5+PJnCOk1SR+4YUJ3cagKi8gCvCrb
 26i4Egv3DSFbvsWY7fQomFjN1/PA8aVkjFsTWxkoF/ZW4fFbbyVYJqomA
 ngC1fjo9eZDK8apKMnDmPF9grQxEhWMkD9idC0Vl8igCw5KwnHXQULp4u
 uDsxuiauYB/1LktcebxKRvk7LjaLpvh881IwT7iWCjcGATvitqxsA8PGO w==;
X-CSE-ConnectionGUID: SK7hGUj5Q92aHRl6VUy3yg==
X-CSE-MsgGUID: OgIOH2tRRSmZOO8C+031UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88828824"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88828824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:07:41 -0700
X-CSE-ConnectionGUID: B5PnX23FS7ez4FPNKNBOHQ==
X-CSE-MsgGUID: zvV9CKz2SDSWdU/Zruq0vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269893696"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:07:39 -0700
Date: Wed, 2 Sep 2026 09:07:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH 2/2] drm/xe/xe_ras: Add support for PCIe error component
 handling
Message-ID: <apfLOAxy1690muzY@black.igk.intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-6-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825141109.3797483-6-riana.tauro@intel.com>
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

On Tue, Aug 25, 2026 at 07:41:12PM +0530, Riana Tauro wrote:
> PCIe Subsystem GPMA errors and other uncorrectable non-fatal usp errors
> are collected and classified by system controller under component PCIe.
> For PCIe SS GPMA errors, request a Secondary Bus Reset.

Again, can you please elaborate? I'm struggling to keep up :(

> All other PCIe errors are treated as recovered with no further action.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 586dc28a638a..39e5fdb9770d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -394,6 +394,21 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  }
>  
> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA) {
> +		xe_log_comp_fatal(xe, PCIE, &arr->counter, sizeof(arr->counter),
> +				  "GPMA error detected\n");
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
> +
> +	xe_log_comp_recoverable(xe, PCIE, &arr->counter, sizeof(arr->counter),
> +				"Other errors detected\n");

Ditto for 'unknown'.

Raag

> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>  static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>  {
>  	struct xe_ras_error_product *product = &arr->counter.product;
> @@ -572,6 +587,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
> index 73517fd0d415..0a9747df8a69 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,7 @@
>  #define XE_RAS_NUM_ERROR_ARR			3
>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
>  /* Bits 16-31 represent individual SAF MHB unit */
>  #define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
>  /* Fabric Data payload parity errors */
> -- 
> 2.47.1
> 

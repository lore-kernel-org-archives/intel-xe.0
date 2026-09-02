Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C42DC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740B10E463;
	Wed,  2 Sep 2026 07:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EztwKpwg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A845510E463
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788332712; x=1819868712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5K4f0o69lxiTy/jJAfmPBgMsTbJ3SIJURnRiKvJgdlg=;
 b=EztwKpwgbcmSSZ/PemNyQNZXrLGJZEgA3HND0EdizmXZUogb9gSFPwU5
 ExBx/Y71r1xgFekf1Z63GSv4YTHexbiKl3vWST1qubMDZ261OXPQL7jd8
 bYP4HhO/Dj/MHxKjLaxZeA/iU+jTQrxjTicHdKXRhfrYQfxX/0s80+yLg
 HRtDChGL0SmwYqFSp79njGk+pCmeN9RF5/8Vz1gx0//dCZw+517pTXzG9
 zuWXV7XPiLvOd5wddJFrHqw5X/fQ5QuO+68P1YyI2Z4nUO88PIPGKZA/H
 xckeDcR8a/H1a283dc/2d/WjMEeqY3skeapRU22L9DC3zP5SRXEmwjrky Q==;
X-CSE-ConnectionGUID: Gx1FLzQ/QeC+wgELXC8QAg==
X-CSE-MsgGUID: KII3+bsuRB2c116uiRNLfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88658399"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88658399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:05:12 -0700
X-CSE-ConnectionGUID: cEjbIawlSTqEsV+fBhKyNg==
X-CSE-MsgGUID: ulJpeu9OTD6gNRscZAUVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="292837951"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:05:10 -0700
Date: Wed, 2 Sep 2026 09:05:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
Message-ID: <apfKo6aTMGFrcJ8p@black.igk.intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825141109.3797483-5-riana.tauro@intel.com>
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

On Tue, Aug 25, 2026 at 07:41:11PM +0530, Riana Tauro wrote:
> SAF MHB errors are collected and classifed under Fabric error component

Is 'SAF MHB' expected to be something obvious? For mere mortals like
me it's definitely not. Could you please elaborate?

> by System controller. For SAF_MHB errors, if the cause is data
> payload parity error then log and return.
> 
> For all other errors and causes, request a Secondary Bus Reset (SBR)

Punctuation please!

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..586dc28a638a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  }
>  
> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_error_product *product = &arr->counter.product;
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> +					"SAF MHB error detected\n");
> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +	}
> +
> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> +			  "Other errors detected\n");

'Other' errors isn't telling me anything, nor they are documented here.
If we don't know what they are can we use 'unknown' instead?

> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response)
>  {
> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>  			case XE_RAS_COMP_DEVICE_MEMORY:
>  				action = handle_device_memory_errors(xe, arr);
>  				break;
> +			case XE_RAS_COMP_FABRIC:
> +				action = handle_fabric_errors(xe, arr);
> +				break;
>  			default:
>  				/* For any other component, reset */
>  				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 99b2466e2062..73517fd0d415 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,10 @@
>  #define XE_RAS_NUM_ERROR_ARR			3
>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +/* Bits 16-31 represent individual SAF MHB unit */
> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
> +/* Fabric Data payload parity errors */
> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)

Nit: Better to have a blank line between defs if they're unrelated,
otherwise they look like part of same register.

Raag

>  /* Device memory error categories */
>  #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>  #define XE_RAS_MEMORY_POISON			BIT(2)
> -- 
> 2.47.1
> 

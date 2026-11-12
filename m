Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69747606A8A8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wg5uVIkx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B6F10E00C;
	Thu, 12 Nov 2026 05:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B8310E00C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 05:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794461692; x=1825997692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x4cUeXk15RaPt+dpXbKGjWB10ZnrxBddeuQTzGYzxJU=;
 b=Wg5uVIkxUWjQOnE9jHTaXS9In+CavHhIVYvDe72P3xLzGWbhWsp58h7w
 qKtKgQ6NyAiDMdSZPdo7/UAqg5KZnMmXTajA/R/eCocbhhgibdSkOj14H
 tES60dpF7/eU0g6eqJfKTvqJqUZcAfbj965PGOcJ7sW2geoCm01OBt2Dj
 7jAiYVffg8XcrcxnXLwGa0O/bMdvIggc/hcK6EUiOVMuUpyS6tmffswbI
 d0v41pCcmf2pqg68lS/E+oXxxEiPITBDki5jf4BUTodzLgM+0wP44Tklu
 3TEYDywjUugh1TK25NIcsfpZN9e1piOTD+lq+ugIoK1HtZ7gVUDTucj+S w==;
X-CSE-ConnectionGUID: 4ANHGt2BSBS09nD79LawwA==
X-CSE-MsgGUID: NrNdvazLQ/eqOQYfMUXrlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3268342"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3268342"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 21:34:52 -0800
X-CSE-ConnectionGUID: DORwjzAKQuG49Vy/7pe8QA==
X-CSE-MsgGUID: iiNltbtzQ/exnmPj7UMZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8491140"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 21:34:50 -0800
Date: Thu, 12 Nov 2026 06:34:47 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH v3] drm/xe/xe_ras: Add support for PCIe error component
 handling
Message-ID: <avVP928MsZSVlFx3@black.igk.intel.com>
References: <20261111123021.3253044-2-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111123021.3253044-2-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 06:00:22PM +0530, Riana Tauro wrote:
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
>  drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..bd3ad017f013 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  }
>  
> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
> +		    sizeof(arr->counter), "error detected\n");

Worth logging global_error_status as well, so we know what actually
happened here. Please use full format for registers like we've done
in other similar cases, i.e. 0x%08x

Raag

> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response)
>  {
> @@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>  			case XE_RAS_COMP_DEVICE_MEMORY:
>  				action = handle_device_memory_errors(xe, arr);
>  				break;
> +			case XE_RAS_COMP_PCIE:
> +				action = handle_pcie_errors(xe, arr);
> +				break;
>  			default:
>  				/* For any other component, reset */
>  				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index a86f9d2b8c92..36435a3f52e7 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -14,6 +14,8 @@
>  #define XE_RAS_NUM_PAGES			25
>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
> +
>  /* Device memory error categories */
>  #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>  #define XE_RAS_MEMORY_POISON			BIT(2)
> -- 
> 2.47.1
> 

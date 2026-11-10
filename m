Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70D36073B34
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ombv4Jxi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22A510E1DC;
	Tue, 10 Nov 2026 13:18:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3AF10E1DC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 13:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794316733; x=1825852733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vrePQgAFyCbDw54cGLakZG07TlbLV/aUAG6Tr5UDGTs=;
 b=Ombv4JxiG41pXK6OxLsOlfqiMkXV03qzvGCG+kyrltmUHdGO1373ct/q
 hCr7p9/0Qc6cbwrvCzgH+WFWzkXwWqL8kbU+oP6tmsla+7E3CgOEomp8P
 Ed4GCCGq8KAdjUlglXfN3l6ciyCptpvBHOss/BAbTnf7PcTY2HdaK7n4j
 60KettToLcg92/RNUnljIqm7eU1RnBDzOEJDQ1hLBmtF5/l2+JQjBpwhA
 oDKXITP64mlz+AraIiAufcwXC5U5EmEoJ1F/z/GKRpWWQvigDVy8M0E+e
 G/iqf6T5CqCOL+W3h7hVDEjSzUOXpjx8mEVaR9q7z0NuHRP2cbrcJq8pT A==;
X-CSE-ConnectionGUID: cKg8uLnvQWGjcKTjUexZRA==
X-CSE-MsgGUID: SglbsvOmRS+Ob/leXTrEBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2947825"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2947825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:18:52 -0800
X-CSE-ConnectionGUID: 7CRhjCusSfOWDyrjiC/ZXA==
X-CSE-MsgGUID: XaP1pIOxQ82Hw//zLM/akA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8037381"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 05:18:50 -0800
Date: Tue, 10 Nov 2026 14:18:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe: Add support for wa_14028434957
Message-ID: <avMZtuz1RZ0NR9Qb@black.igk.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-17-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106071944.2693854-17-riana.tauro@intel.com>
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

On Fri, Nov 06, 2026 at 12:49:52PM +0530, Riana Tauro wrote:
> Add support for wa_14028434957 on platform CRI.
> 
> Non-fatal device errors are reported via a direct IRQ, while fatal
> device errors are downgraded to non-fatal uncorrectable internal
> errors and reported via AER.
> 
> Add support to process and log non-fatal errors routed via the direct
> IRQ path. Most non-fatal errors require no reset, except double-bit
> ECC errors affecting a critical BO, for which the device is wedged
> with a bus reset as the recovery action.
> 
> For uncorrectable internal errors reported via AER, request a
> secondary bus reset to recover. To avoid a race between the two
> paths, if non-fatal error processing is in progress when an
> uncorrectable internal error occurs, flush and disable the worker
> to prevent further processing, since a reset is
> imminent.
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use platform instead of graphics version (Gustavo)
>     combine patches (Tejas, Mallesh)
>     remove 1sec delayed worker (Andi)
> 
> v3: re-order disable hw error worker before wedged check (Sashiko)
> ---
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>  drivers/gpu/drm/xe/xe_hw_error.c          | 41 +++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_hw_error.h          |  1 +
>  drivers/gpu/drm/xe/xe_pci_error.c         | 19 +++++++++--
>  drivers/gpu/drm/xe/xe_ras.c               | 21 ++++++++++--
>  5 files changed, 72 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 753b2a4a1006..300207596893 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -7,3 +7,4 @@
>  14026746987	PLATFORM(CRESCENTISLAND)
>  14026779378	PLATFORM(CRESCENTISLAND)
>  14028586678	PLATFORM(CRESCENTISLAND)
> +14028434957	PLATFORM(CRESCENTISLAND)
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index f7031b341ce0..86b29f282837 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -5,6 +5,8 @@
>  
>  #include <linux/bitmap.h>
>  
> +#include <generated/xe_device_wa_oob.h>
> +
>  #include "regs/xe_gsc_regs.h"
>  #include "regs/xe_hw_error_regs.h"
>  #include "regs/xe_irq_regs.h"
> @@ -15,7 +17,11 @@
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> +#include "xe_ras.h"
>  #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
> +#include "xe_wedge.h"
> +
>  
>  #define GT_HW_ERROR_MAX_ERR_BITS		16
>  #define HEC_UNCORR_FW_ERR_BITS			4
> @@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
>  	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>  	struct xe_device *xe = tile_to_xe(tile);
>  
> +	/* Skip hw error processing if device is already wedged */
> +	if (xe_wedged(xe))

This is a weak check and actually doesn't achieve anything, i.e. the state
can change immediate after this check :)

> +		return;
> +
>  	guard(xe_pm_runtime)(xe);
> +
> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
> +		/*
> +		 * Skip handling if an uncorrectable internal error is reported as
> +		 * reset is imminent
> +		 */
> +		if (xe_ras_is_aer_internal_error(xe))
> +			return;
> +
> +		xe_ras_process_errors(xe);
> +		return;
> +	}
> +
>  	xe_survivability_mode_runtime_enable(xe);
>  }
>  
> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>  		return;
>  
>  	/*
> -	 * Hardware errors are reported through System Controller on the platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
> -	 * here for those platforms.
> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
> +	 * system controller.

How the turntables :D

I really hope (and I mean _really_) the required due diligence has been
done here before opening this can of worms.

Raag

>  	 */
>  	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
> +		schedule_work(&tile->hw_error_work);
>  		return;
>  	}
>  
> @@ -537,7 +560,13 @@ static void process_hw_errors(struct xe_device *xe)
>  	}
>  }
>  
> -static void hw_error_fini(void *arg)
> +/**
> + * xe_hw_error_work_disable - Disable hw error work
> + * @arg: xe device instance
> + *
> + * This function disables work for hardware error handling for all tiles.
> + */
> +void xe_hw_error_work_disable(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  	struct xe_tile *tile;
> @@ -569,5 +598,5 @@ void xe_hw_error_init(struct xe_device *xe)
>  		INIT_WORK(&tile->hw_error_work, hw_error_work);
>  
>  	process_hw_errors(xe);
> -	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 5e3a11424108..c2c0bfa6d9f9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -12,4 +12,5 @@ struct xe_device;
>  
>  void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>  void xe_hw_error_init(struct xe_device *xe);
> +void xe_hw_error_work_disable(void *arg);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 472b85d0ccc3..67920751ecf1 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -5,8 +5,11 @@
>  
>  #include <linux/pci.h>
>  
> +#include <generated/xe_device_wa_oob.h>
> +
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_hw_error.h"
>  #include "xe_log.h"
>  #include "xe_pci.h"
>  #include "xe_pcode.h"
> @@ -14,6 +17,7 @@
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_survivability_mode.h"
> +#include "xe_wa.h"
>  #include "xe_wedge.h"
>  
>  static void prepare_device_for_reset(struct pci_dev *pdev)
> @@ -87,12 +91,21 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>  	if (state == pci_channel_io_perm_failure)
>  		return PCI_ERS_RESULT_DISCONNECT;
>  
> -	/* If the device is already wedged or in survivability mode, do not attempt recovery */
> -	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
> +	/* If the device is already in survivability mode, do not attempt recovery */
> +	if (xe_survivability_mode_is_boot_enabled(xe))
>  		return PCI_ERS_RESULT_DISCONNECT;
>  
> -	if (is_aer_internal_error(pdev))
> +	/*
> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>  		xe_ras_set_aer_internal_error(xe);
> +		xe_hw_error_work_disable(xe);
> +	}
> +
> +	if (xe_wedged(xe))
> +		return PCI_ERS_RESULT_DISCONNECT;
>  
>  	switch (state) {
>  	case pci_channel_io_normal:
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 58a0b5fa676d..1809c3c893de 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -5,6 +5,8 @@
>  
>  #include <linux/bitfield.h>
>  
> +#include <generated/xe_device_wa_oob.h>
> +
>  #include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_configfs.h"
> @@ -23,6 +25,7 @@
>  #include "xe_sysctrl_mailbox.h"
>  #include "xe_sysctrl_mailbox_types.h"
>  #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
>  #include "xe_wedge.h"
>  
>  /* Any non-null entry marks the page as offlined by firmware */
> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>  			    "Double-bit ECC error detected at sw address 0x%llx\n",
>  			    info->sw_address);
> -		if (ret)
> +		/*
> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
> +		 * TODO: Trigger SBR using pci_reset_bus
> +		 */
> +		if (ret) {
> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>  			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
>  		break;
>  	default:
>  		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> @@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>  		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  
>  	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
> -	/* Default action */
> +	/* Default action for PCIe bus errors */
>  	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>  
> +	/*
> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
> +	 * internal error. Set the default action to reset.
> +	 */
> +	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
> +
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>  				  NULL, 0, &response, sizeof(response));
>  
> -- 
> 2.47.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B659FFF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 08:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DF010E174;
	Mon, 27 Apr 2026 08:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBVZNAlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E141D10E174
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 08:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777278302; x=1808814302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P4lAvbGucDyfWj+hKtaO9Pjc+O5rotyud1U98MKQzyE=;
 b=QBVZNAlbuieDvsE143j2+aqa1MvLd9BzmMjGWCZHVnUSRAK3uyjaoJRS
 M6QcbiF7VgMhtGReGq6fhasbw+xYeru1DDiWS14YlXApYdDNfdZ3UFOWR
 p4+WNxPetHEAm9tXml+Zr6rIg6e383dvbp0M6JXS2/mZZNmJyyjaTaXo5
 Lf7Gko3xcBmJ+cHLHmwjFVPMRFgcKoVCbhKguf5KiaDYGuhhkjPEm6OBL
 tRiSISIBfrkvZmznopEV9SMIY5MaZ/c2Eyz49Ge8WwIlySDI2ZduOeFu2
 0dBNFY+waGNgOc0N95hZQEhLbH9bS47N4o40ydlvQf++NufEOkCa8IZpI w==;
X-CSE-ConnectionGUID: IqmFACjPR4W3AHWLVVt71Q==
X-CSE-MsgGUID: STbXhuZ6RdKTGpiOL8YXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="81769125"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="81769125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:25:01 -0700
X-CSE-ConnectionGUID: HdXG2lZTQieFZqMj7qXmfg==
X-CSE-MsgGUID: glowRXHKTDuPnpdlfy1wiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="238613975"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:24:59 -0700
Date: Mon, 27 Apr 2026 10:24:56 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v4 07/13] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
Message-ID: <ae8dWCGV-5XOumUH@black.igk.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-22-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417085812.4013309-22-riana.tauro@intel.com>
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

On Fri, Apr 17, 2026 at 02:28:19PM +0530, Riana Tauro wrote:
> Uncorrectable Core-Compute errors are classified into Global and Local
> errors.
> 
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
> 
> A Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without distrupting the rest of the device.
> 
> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> generated and GuC is notified of the error which triggers a engine reset.
> Return Recovered from PCI error callbacks for these errors.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add newline and fix log
>     add bounds check (Mallesh)
>     add ras specific enum (Raag)
>     helper for sysctrl prepare command
>     process all errors before deciding recovery action
> 
> v3: remove TODO from commit message
>     remove redundant rlen check
>     fix loop
>     add check for sysctrl flooding (Raag)
>     do not use xe_ras prefix for static functions (Soham)
> 
> v4: remove rlen initialization to 0
>     remove local variable
>     add error message for length mismatch (Raag)
>     reset on sysctrl flooding
>     fix sysctrl flood condition
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 133 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h       |   3 +
>  drivers/gpu/drm/xe/xe_ras_types.h |  55 ++++++++++++
>  3 files changed, 191 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index bf780e953925..0cc7b3a6b13f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -5,7 +5,16 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device_types.h"
> +#include "xe_printk.h"
>  #include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)

I thought we used REG_ variants?

> +#define GLOBAL_UNCORR_ERROR			2
> +/* Modify as needed */
> +#define XE_SYSCTRL_ERROR_FLOOD			16
>  
>  /* Severity classification of detected errors */
>  enum xe_ras_severity {
> @@ -63,6 +72,130 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>  	return xe_ras_components[comp];
>  }
>  
> +static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
> +							 struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
> +	struct xe_ras_error_common common = arr->error_class.common;
> +	u8 uncorr_type;
> +
> +	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);

Ditto.

> +	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
> +	       comp_to_str(xe, common.component));
> +
> +	/* Request a RESET if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/* Local errors are recovered using a engine reset by GuC */
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
> +				    u32 cmd_mask, void *request, size_t request_len,
> +				    void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +
> +	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +			   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);

Ditto.

> +
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +/**
> + * xe_ras_process_errors() - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: recovery action to be taken
> + */
> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_error_response response;
> +	enum xe_ras_recovery_action final_action;
> +	u32 count = 0;
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/* Default action */
> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
> +				&response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);

We'll likely have more users of xe_sysctrl_send_command(), so probably
worth spelling out what exactly failed.

> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected %zu, got %zu\n",

Ditto.

> +			       sizeof(response), rlen);
> +			goto err;
> +		}
> +
> +		/* Report if number of errors exceeds the maximum errors supported*/
> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
> +			xe_err(xe, "[RAS]: sysctrl: number of errors received %d out of bound (%d)\n",
> +			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
> +
> +		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++) {
> +			struct xe_ras_error_array arr = response.error_arr[i];

Do we need this on the stack (again)? Why not just access response memory
using a pointer?

> +			enum xe_ras_recovery_action action;
> +			struct xe_ras_error_class error_class;
> +			u8 component;
> +
> +			error_class = arr.error_class;
> +			component = error_class.common.component;
> +
> +			switch (component) {
> +			case XE_RAS_COMPONENT_CORE_COMPUTE:
> +				action = handle_compute_errors(xe, &arr);
> +				break;
> +			default:
> +				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
> +				action = XE_RAS_RECOVERY_ACTION_RESET;
> +				break;
> +			}
> +
> +			/*
> +			 * Retain the highest severity action. Process and log all errors
> +			 * and then take appropriate recovery action.
> +			 */
> +			if (action > final_action)
> +				final_action = action;
> +		}
> +
> +		/* Treat flooding as an system controller error */
> +		if (++count >= XE_SYSCTRL_ERROR_FLOOD) {

Nit: I know this does the job, but I'd make the logic consistent with
while(), i.e. start from flood value and return on count == 0.

> +			xe_err(xe, "[RAS]: sysctrl: response flooding\n");
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
> +
> +	} while (response.additional_errors);
> +
> +	return final_action;
> +
> +err:
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>  #ifdef CONFIG_PCIEAER
>  static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 14cb973603e7..e191ab80080c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,8 +6,11 @@
>  #ifndef _XE_RAS_H_
>  #define _XE_RAS_H_
>  
> +#include "xe_ras_types.h"
> +
>  struct xe_device;
>  
>  void xe_ras_init(struct xe_device *xe);
> +enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device *xe);

Extra whitespace.

>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 3d0f9e94a404..8bebe958b8e8 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -11,6 +11,24 @@
>  #define XE_RAS_NUM_ERROR_ARR		3
>  #define XE_RAS_MAX_ERROR_DETAILS	16
>  
> +/**
> + * enum xe_ras_recovery_action - RAS recovery actions
> + *
> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
> + *
> + * This enum defines the possible recovery actions that can be taken in response
> + * to RAS errors.
> + */
> +enum xe_ras_recovery_action {
> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
> +	XE_RAS_RECOVERY_ACTION_RESET,
> +	XE_RAS_RECOVERY_ACTION_DISCONNECT,
> +	XE_RAS_RECOVERY_ACTION_MAX
> +};
> +
>  /**
>   * struct xe_ras_error_common - Common RAS error class
>   *
> @@ -93,4 +111,41 @@ struct xe_ras_get_error_response {
>  	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
>  } __packed;
>  
> +/**
> + * struct xe_ras_compute_error - Error details of Core Compute error
> + */
> +struct xe_ras_compute_error {
> +	/** @error_log_header: Error Source and type */
> +	u32 error_log_header;
> +	/** @internal_error_log: Internal Error log */
> +	u32 internal_error_log;
> +	/** @fabric_log: Fabric Error log */
> +	u32 fabric_log;
> +	/** @internal_error_addr_log0: Internal Error addr log */
> +	u32 internal_error_addr_log0;
> +	/** @internal_error_addr_log1: Internal Error addr log */
> +	u32 internal_error_addr_log1;
> +	/** @packet_log0: Packet log */
> +	u32 packet_log0;
> +	/** @packet_log1: Packet log */
> +	u32 packet_log1;
> +	/** @packet_log2: Packet log */
> +	u32 packet_log2;
> +	/** @packet_log3: Packet log */
> +	u32 packet_log3;
> +	/** @packet_log4: Packet log */
> +	u32 packet_log4;
> +	/** @misc_log0: Misc log */
> +	u32 misc_log0;
> +	/** @misc_log1: Misc log */
> +	u32 misc_log1;
> +	/** @spare_log0: Spare log */
> +	u32 spare_log0;
> +	/** @spare_log1: Spare log */
> +	u32 spare_log1;
> +	/** @spare_log2: Spare log */
> +	u32 spare_log2;
> +	/** @spare_log3: Spare log */
> +	u32 spare_log3;
> +} __packed;

Unless we use the fields on code, let's mark it as reserved.

Also curious, should we be using these for cper or should be relying
on info queue?

Raag

>  #endif
> -- 
> 2.47.1
> 

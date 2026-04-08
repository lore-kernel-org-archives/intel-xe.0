Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBB5FD5F79
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FC788FF9;
	Wed,  8 Apr 2026 11:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i95+gEeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6FB88FF9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775646932; x=1807182932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AbNbIXdZcQSDPReyvvW/mYH8N5m2Hh1WPR+6lrOnykQ=;
 b=i95+gEeoiRKc2su60xvL3l0nUyH35OtcfO702p9HG4pOSW9HQL5B19tw
 mXodiMHWJ64FsVxMQLUAI5+KobOrz4AZzeZD2Zc/hBKi7OUfEP3bLCygN
 4MzxMJXDJHGidq6PgvMliG1EvAHPp6l6ojkqdyN/VUBpWVPXtlGRAGJPE
 leiHd4G0E41KgHPjpw3GLCkRpNiVW58Wd7U6C9kDyiWdQaphRDnVvjO9b
 5Q80iynFrdio2sgvixz88Oe363FxmPJ0SoodMY9bGIkMDCBmik8laym8l
 xEtx4kBjAaP8A1x+ljwaPvxwpUZJRANWJGWj37SW+HGb+rp1mH22EigVt Q==;
X-CSE-ConnectionGUID: okIyaSbcSImW6kPFiiBJyA==
X-CSE-MsgGUID: mH/Lf8BGRQ2g6gsPhv8tHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75796705"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="75796705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:15:31 -0700
X-CSE-ConnectionGUID: ahTDw9mhQFaE3k70cb9EFA==
X-CSE-MsgGUID: In7j+JbUSmevE1Q+kUd2kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233394637"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:15:21 -0700
Date: Wed, 8 Apr 2026 13:15:19 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 07/10] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Message-ID: <adY4x7iYSfs04ufg@black.igk.intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-19-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402070131.1603828-19-riana.tauro@intel.com>
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

On Thu, Apr 02, 2026 at 12:31:38PM +0530, Riana Tauro wrote:
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
> ---
>  drivers/gpu/drm/xe/xe_ras.c       | 131 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h       |   3 +
>  drivers/gpu/drm/xe/xe_ras_types.h |  18 ++++
>  3 files changed, 152 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 515c28167a69..6542ed4a6a24 100644
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
> +#define GLOBAL_UNCORR_ERROR			2
> +/* Modify as needed */
> +#define XE_SYSCTRL_ERROR_FLOOD			16
>  
>  /* Severity classification of detected errors */
>  enum xe_ras_severity {
> @@ -61,6 +70,128 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>  	return comp < XE_RAS_COMPONENT_MAX ? xe_ras_components[comp] : "Unknown";
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
> +
> +	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
> +	       comp_to_str(xe, common.component));
> +
> +	/* Request a RESET if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/* Local errors are recovered using a engine reset by GuC */

So do we need to synchronization with GuC before returning?

> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
> +				    u32 cmd_mask, void *request, size_t request_len,
> +				    void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +	u32 req_hdr;

With a single member, not sure if it's worth having a local variable.

> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |

Can simply be hdr.data.

> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> +
> +	hdr.data = req_hdr;

With above in place, this won't be needed.

> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +/**
> + * xe_ras_process_errors - Process and contain hardware errors
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
> +	/* Default action */
> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
> +
> +	if (!xe->info.has_sysctrl)

This looks like should be at the top.

> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
> +				&response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		rlen = 0;

Is this needed? This is guaranteed to be updated if command succeeds.

> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
> +			       sizeof(response), rlen);
> +			goto err;
> +		}
> +
> +		for (int i = 0; i < response.num_errors &&  i < XE_RAS_NUM_ERROR_ARR; i++) {

I know this was my suggestion, but Mallesh later suggested that we fail on
out of spec behavior, which is not guaranteed here. So we can go back to
v2 implementation if it makes more sense. I'll leave it to you all.

Raag

> +			struct xe_ras_error_array arr = response.error_arr[i];
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
> +		/* Break if system controller floods responses */
> +		if (++count > XE_SYSCTRL_ERROR_FLOOD) {
> +			xe_err(xe, "[RAS]: Sysctrl response flooding\n");
> +			break;
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
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index ed69654e5bae..e37dd12bffa3 100644
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
> -- 
> 2.47.1
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB3BEBFD22
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75EA89C7F;
	Mon, 13 Apr 2026 09:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9XRRykm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CD89C7F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776072004; x=1807608004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N5H+7f7S4bNaDyPTum5CF1NufBHRXVv5UrVdinGtio0=;
 b=i9XRRykmXzluODgp69YwM0O8UKvOsJGvf1pLUnbDDR9bBX78FnY5dJ7A
 /ixAy7KuGlyfss/9jllew5yfpnZLtdvlfbxoxdUL5ZxRirm71Gw0RS2mW
 dWauV9HXTX7oKePodvSy5BY53eVwJYRXgJpu/w/Aqwyg0BCIgjIEctNV0
 vMDXW4kDH5Lj4SZE27mBw4qrICbhBbZpU7uUF4/f9hUqj2iS4TwRBhBYC
 QZl6P+lTALrYaCwP+r5OKFeKHFMTXxtctq7gmsExxBh0Pd9V1tUDBeJbi
 qK4+NAVLW3/b1kTZlHAHElOkooTYKgXjx9294ZDNWPg4hkV4J6uVvqf1I A==;
X-CSE-ConnectionGUID: A3C1lmbsTG+Zg14kU+xX7w==
X-CSE-MsgGUID: GWMieEjASluswhoLIoJTdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88386693"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="88386693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:20:04 -0700
X-CSE-ConnectionGUID: 30xIzATdRJaP6M1LzMFzvg==
X-CSE-MsgGUID: KHGGqoSeQHe7DN4Xb8uwWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="225012706"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:20:01 -0700
Date: Mon, 13 Apr 2026 11:19:59 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 3/5] drm/xe/xe_ras: Add support to query error counter
 for CRI
Message-ID: <ady1PyArv2MFbwz3@black.igk.intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406145440.2016065-10-riana.tauro@intel.com>
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

On Mon, Apr 06, 2026 at 08:24:42PM +0530, Riana Tauro wrote:
> Add support to get error counter value for CRI.
> 
> When userspace queries a drm_ras error counter, fetch the
> latest counter value from system controller.
> 
> Integrate this with XE drm_ras.
> 
> Usage :
> 
> Query all error counter value using ynl
> 
> $ sudo ynl --family drm_ras --dump get-error-counter --json \
> '{"node-id":0}'
> [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
>  {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
>  {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
>  {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
>  {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]
> 
> Query single error counter value using ynl
> 
> $ sudo ynl --family drm_ras  --do get-error-counter --json \
>   '{"node-id":1, "error-id":1}'
> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: split functions
>     fix commit message (Raag)
> ---
>  drivers/gpu/drm/xe/Makefile     |   1 +
>  drivers/gpu/drm/xe/xe_drm_ras.c |  22 +++---
>  drivers/gpu/drm/xe/xe_ras.c     | 123 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h     |  16 +++++
>  4 files changed, 154 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 110fef511fe2..8fcd676ab41c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -111,6 +111,7 @@ xe-y += xe_bb.o \
>  	xe_pxp_debugfs.o \
>  	xe_pxp_submit.o \
>  	xe_query.o \
> +	xe_ras.o \
>  	xe_range_fence.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index e07dc23a155e..b334881e034a 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -11,17 +11,27 @@
>  
>  #include "xe_device_types.h"
>  #include "xe_drm_ras.h"
> +#include "xe_ras.h"
>  
>  static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>  static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>  
> -static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> -				  u32 error_id, const char **name, u32 *val)
> +static int hw_query_error_counter(struct xe_device *xe,
> +				  const enum drm_xe_ras_error_severity severity, u32 error_id,
> +				  const char **name, u32 *val)
>  {
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +
>  	if (!info || !info[error_id].name)
>  		return -ENOENT;
>  
>  	*name = info[error_id].name;
> +
> +	/* Fetch counter from system controller if supported */
> +	if (xe->info.has_sysctrl)
> +		return xe_ras_get_error_counter(xe, severity, error_id, val);

Hm, this looks like should be a separate patch which hooks CRI pieces
to DRM RAS.

> +
>  	*val = atomic_read(&info[error_id].counter);
>  
>  	return 0;
> @@ -31,20 +41,16 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
>  					     const char **name, u32 *val)
>  {
>  	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>  
> -	return hw_query_error_counter(info, error_id, name, val);
> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id, name, val);
>  }
>  
>  static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
>  					   const char **name, u32 *val)
>  {
>  	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>  
> -	return hw_query_error_counter(info, error_id, name, val);
> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE,  error_id, name, val);
>  }
>  
>  static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..b5fdad2c801d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device_types.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +/* Severity classification of detected errors */
> +enum xe_ras_severity {
> +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
> +	XE_RAS_SEVERITY_CORRECTABLE,
> +	XE_RAS_SEVERITY_UNCORRECTABLE,
> +	XE_RAS_SEVERITY_INFORMATIONAL,
> +	XE_RAS_SEVERITY_MAX
> +};
> +
> +/* major IP blocks where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMPONENT_NOT_SUPPORTED = 0,
> +	XE_RAS_COMPONENT_DEVICE_MEMORY,
> +	XE_RAS_COMPONENT_CORE_COMPUTE,
> +	XE_RAS_COMPONENT_RESERVED,
> +	XE_RAS_COMPONENT_PCIE,
> +	XE_RAS_COMPONENT_FABRIC,
> +	XE_RAS_COMPONENT_SOC_INTERNAL,
> +	XE_RAS_COMPONENT_MAX
> +};
> +
> +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
> +static const int drm_to_xe_ras_component[] = {
> +	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMPONENT_CORE_COMPUTE,
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMPONENT_SOC_INTERNAL,
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMPONENT_DEVICE_MEMORY,
> +	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMPONENT_PCIE,
> +	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMPONENT_FABRIC
> +};
> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

Curious, should we also reuse uapi names for logging?

> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
> +static const int drm_to_xe_ras_severity[] = {
> +	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEVERITY_CORRECTABLE,
> +	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEVERITY_UNCORRECTABLE
> +};
> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);

Ditto.

> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
> +				    u32 cmd_mask, void *request, size_t request_len,
> +				    void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +	u32 req_hdr;
> +
> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);

Same comments as earlier patch[1].

[1] https://lore.kernel.org/intel-xe/adY4x7iYSfs04ufg@black.igk.intel.com/

> +	hdr.data = req_hdr;
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +static int get_error_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
> +			     u32 *value)
> +{
> +	struct xe_ras_get_counter_response response = {0};
> +	struct xe_ras_get_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	request.error_class = *error_class;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
> +				&response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);

This gives the impression of RAS error, but is it really?

> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",

Ditto.

> +		       sizeof(response), rlen);
> +		return -EINVAL;

Is this propagated back to the user? If yes, is this the correct error
code for the scenario?

Raag

> +	}
> +
> +	*value = response.counter_value;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_get_error_counter() - Get error counter value
> + * @xe: xe device instance
> + * @severity: Error severity level to be queried
> + * @error_id: Error component to be queried
> + * @value: Counter value
> + *
> + * This function retrieves the value of a specific RAS error counter based on
> + * the provided severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
> +			     u32 error_id, u32 *value)
> +{
> +	struct xe_ras_error_class error_class = {0};
> +
> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
> +	error_class.common.component = drm_to_xe_ras_component[error_id];
> +
> +	guard(xe_pm_runtime)(xe);
> +	return get_error_counter(xe, &error_class, value);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..e468c414148e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +#include <uapi/drm/xe_drm.h>
> +
> +struct xe_device;
> +
> +int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
> +			     u32 error_id, u32 *value);
> +
> +#endif
> -- 
> 2.47.1
> 

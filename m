Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD3CCD37B2
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A95110E541;
	Mon, 11 May 2026 15:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2r6Cgmd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B80310E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778513254; x=1810049254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Riq7MVJ2SBVrNEkNUPYEG2mEzFeD2zwyNW3BytYMM5c=;
 b=c2r6CgmdNsxLYkLN4MXB930b5FJq3tXD+llwzOsVfErnSXqjBvUzxWN3
 rRovSwL0oVkgYujs4qbgEwsNVH1gmFxO5k7/3DoLP6DPrM792pcs3z+Ti
 X3VMBtcq2n8ixy9B5Q//IzOkmVainnqDyhnBOSW5OGfG6Vklm6rmHFKKc
 gDkNWp6qs0r9LRJrx3Im2FHrBbr6WO/ZiCSM9QEkHNAu4rDzGFkFA6PLB
 n4ReTqI9Y+FMGm3+FKyqF6H/BuqCpi3Uzo/FEUy/bUHnf9So5V08o8zSf
 B+udRx3PNpugkdo1gvD+arBg6wnhhLnsQ9VLNs+TstIHU1Mh4AAnYFUgN A==;
X-CSE-ConnectionGUID: 4jW4u08NRDq431/jFkLfXw==
X-CSE-MsgGUID: txZpSmgDT2mVL+BY6mcSbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="96967551"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="96967551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:27:34 -0700
X-CSE-ConnectionGUID: k5z31PB2SUeUiPK5tYjQ7Q==
X-CSE-MsgGUID: Cikjl6bpT2yZih1TT+ziJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="275611807"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:27:30 -0700
Date: Mon, 11 May 2026 17:27:25 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v5 2/6] drm/xe/xe_ras: Add support to get error counter
 in CRI
Message-ID: <agH1Xch7B6Ube4_5@black.igk.intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504065614.3832331-10-riana.tauro@intel.com>
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

On Mon, May 04, 2026 at 12:26:17PM +0530, Riana Tauro wrote:
> Add request/response structures and helper functions to query system
> controller to get error counter value.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add structures for clear counter
>     move commands to sysctrl file
>     split functions
>     fix commit message (Raag)
> 
> v3: fix log message
>     squash patches
>     change error code for sysctrl error (Raag)
> 
> v4: rename function
>     remove unecessary macro (Raag)
>     add documentation for enum
> 
> v5: rebase
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 91 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |  4 +
>  drivers/gpu/drm/xe/xe_ras_types.h             | 30 ++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>  4 files changed, 127 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..47a58ce3b3ca 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,14 @@
>   */
>  
>  #include "xe_device.h"
> +#include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_ras_types.h"
>  #include "xe_sysctrl.h"
>  #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>  
>  /* Severity of detected errors  */
>  enum xe_ras_severity {
> @@ -50,6 +53,23 @@ static const char *const xe_ras_components[] = {
>  };
>  static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>  
> +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
> +static const int drm_to_xe_ras_component[] = {
> +	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMP_SOC_INTERNAL,
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMP_DEVICE_MEMORY,
> +	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMP_PCIE,
> +	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMP_FABRIC
> +};
> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);
> +
> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
> +static const int drm_to_xe_ras_severity[] = {
> +	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEV_CORRECTABLE,
> +	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEV_UNCORRECTABLE
> +};
> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);

So we don't accept new entries unless also added in uapi and vice versa
which is good, but if you feel the need to have bounds checking just
switch() instead.

>  static inline const char *sev_to_str(u8 severity)
>  {
>  	if (severity >= XE_RAS_SEV_MAX)
> @@ -66,6 +86,22 @@ static inline const char *comp_to_str(u8 component)
>  	return xe_ras_components[component];
>  }
>  
> +static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,

This looks like it should be a sysctrl helper (for non-RAS mailbox users).

> +				u32 cmd, void *request, size_t request_len,
> +				void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response)
>  {
> @@ -91,3 +127,58 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  			comp_to_str(component), sev_to_str(severity));
>  	}
>  }
> +
> +static int get_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,

s/error_class/counter

Single word parameters usually help with wrapping but ofcourse it's a
personal preference.

> +		       u32 *value)
> +{
> +	struct xe_ras_get_counter_response response = {0};
> +	struct xe_ras_get_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	request.error_class = *error_class;
> +
> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
> +			    &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	*value = response.counter_value;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_get_counter() - Get error counter value
> + * @xe: xe device instance
> + * @severity: Error severity level to be queried
> + * @error_id: Error component to be queried
> + * @value: Counter value
> + *
> + * This function retrieves the value of a specific error counter based on
> + * the error severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,

const for consistency.

Raag

> +		       u32 error_id, u32 *value)
> +{
> +	struct xe_ras_error_class error_class = {0};
> +
> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
> +	error_class.common.component = drm_to_xe_ras_component[error_id];
> +
> +	guard(xe_pm_runtime)(xe);
> +	return get_counter(xe, &error_class, value);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..74582c911b02 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,10 +6,14 @@
>  #ifndef _XE_RAS_H_
>  #define _XE_RAS_H_
>  
> +#include <uapi/drm/xe_drm.h>
> +
>  struct xe_device;
>  struct xe_sysctrl_event_response;
>  
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response *response);
> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> +		       u32 error_id, u32 *value);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..74d85875cd63 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -70,4 +70,34 @@ struct xe_ras_threshold_crossed {
>  	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>  } __packed;
>  
> +/**
> + * struct xe_ras_get_counter_request - Request for get error counter
> + */
> +struct xe_ras_get_counter_request {
> +	/** @error_class: Error class counter to be queried */
> +	struct xe_ras_error_class error_class;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_response - Response for get error counter
> + */
> +struct xe_ras_get_counter_response {
> +	/** @error_class: Error class counter that was queried */
> +	struct xe_ras_error_class error_class;
> +	/** @counter_value: Current counter value */
> +	u32 counter_value;
> +	/** @timestamp: Timestamp when counter was last updated */
> +	u64 timestamp;
> +	/** @threshold_value: Threshold value for the counter */
> +	u32 threshold_value;
> +	/** @counter_status: Status of the counter */
> +	u32 counter_status:8;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[56];
> +} __packed;
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..b315847cbf64 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>  /**
>   * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>   *
> + * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>   */
>  enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>  };
>  
> -- 
> 2.47.1
> 

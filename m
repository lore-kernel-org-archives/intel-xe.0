Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B09CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 09:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247B910EE58;
	Thu, 28 May 2026 09:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOgCbpUS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D2110EE58
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779958911; x=1811494911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Th6Wq/ktZhOq978gILkQIcYrkcQ5oNxPKELVvcfrJrg=;
 b=hOgCbpUS9EtH9EkwmNuIMNekOR7DDP6Ha1WzrTdqBP6q5+uk87GhVR3K
 2Mox1w8pu31Orqlykm0NGA4gYx+DrVCk4JPjtY4YZXO+rppNVzp2W7tW7
 0BZfqOYTA975eBI4J+h9THKRTWYBIM1ICyUnzTij/PqS6yey3Zmxofyul
 RsiZrX/TM+tIuF2NUdf4DGrArAN/s2EzuhARqqxEhDccrziaWKJaO1Njv
 z2VLjL1DRTiDvt67RU57Hkz88l1IHn0MEQb6wBH0UZwdB2McNWrci/KDp
 qc6NiCb3oboMSgtkNLiec/S4ArV5tJEnXpKdFlNH+RyO6lR5gLQCOU7K7 A==;
X-CSE-ConnectionGUID: nvQLDNyNSyOin1MWkmKpdg==
X-CSE-MsgGUID: Jl9pz4IvS7qvVOoBzUgYWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106250597"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="106250597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:01:50 -0700
X-CSE-ConnectionGUID: UBDsaiB2Tw6XFz2EK0P7TQ==
X-CSE-MsgGUID: kNa5KiVUSq65y7DoUx+ZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="246770309"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:01:47 -0700
Date: Thu, 28 May 2026 11:01:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v7 2/6] drm/xe/xe_ras: Add support to get error counter
 in CRI
Message-ID: <ahgEeXy-7frjGvdN@black.igk.intel.com>
References: <20260527060241.3351323-8-riana.tauro@intel.com>
 <20260527060241.3351323-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527060241.3351323-10-riana.tauro@intel.com>
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

On Wed, May 27, 2026 at 11:32:44AM +0530, Riana Tauro wrote:

Nit: You're using 'CRI' in subject here but not in patch 3. I personally
think it's redundant but whatever your preference please make it consistent
across patches.

> Add request/response structures and helper functions to query system
> controller to get error counter value.

...

> +static u8 drm_to_xe_ras_component(u8 component)
> +{
> +	switch (component) {
> +	case DRM_XE_RAS_ERR_COMP_CORE_COMPUTE:
> +		return XE_RAS_COMP_CORE_COMPUTE;
> +	case DRM_XE_RAS_ERR_COMP_SOC_INTERNAL:
> +		return XE_RAS_COMP_SOC_INTERNAL;
> +	case DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY:
> +		return XE_RAS_COMP_DEVICE_MEMORY;
> +	case DRM_XE_RAS_ERR_COMP_PCIE:
> +		return XE_RAS_COMP_PCIE;
> +	case DRM_XE_RAS_ERR_COMP_FABRIC:
> +		return XE_RAS_COMP_FABRIC;
> +	default:
> +		return XE_RAS_COMP_NOT_SUPPORTED;
> +	}
> +}
> +
> +static u8 drm_to_xe_ras_severity(u8 severity)
> +{
> +	switch (severity) {
> +	case DRM_XE_RAS_ERR_SEV_CORRECTABLE:
> +		return XE_RAS_SEV_CORRECTABLE;
> +	case DRM_XE_RAS_ERR_SEV_UNCORRECTABLE:
> +		return XE_RAS_SEV_UNCORRECTABLE;
> +	default:
> +		return XE_RAS_SEV_NOT_SUPPORTED;
> +	}
> +}

Nit: I'd make the ordering consistent with existing code, i.e.
drm_to_xe_ras_severity() at the top.

...

> +/**
> + * xe_ras_get_counter() - Get error counter value
> + * @xe: Xe device instance
> + * @severity: Error severity to be queried (&enum drm_xe_ras_error_severity)
> + * @component: Error component to be queried (&enum drm_xe_ras_error_component)
> + * @value: Counter value
> + *
> + * This function retrieves the value of a specific error counter based on
> + * the error severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
> +{
> +	struct xe_ras_error_class error_class = {0};

Make this consistent with the code, i.e. 'counter'

> +	error_class.common.severity = drm_to_xe_ras_severity(severity);
> +	error_class.common.component = drm_to_xe_ras_component(component);
> +
> +	guard(xe_pm_runtime)(xe);
> +	return get_counter(xe, &error_class, value);
> +}

...

> +/**
> + * struct xe_ras_get_counter_response - Response structure for get counter
> + */
> +struct xe_ras_get_counter_response {
> +	/** @counter: Error counter that was queried */
> +	struct xe_ras_error_class counter;
> +	/** @value: Current counter value */
> +	u32 value;
> +	/** @timestamp: Timestamp when counter was last updated */
> +	u64 timestamp;
> +	/** @threshold: Threshold value for the counter */
> +	u32 threshold;
> +	/** @reserved: Reserved */
> +	u32 reserved;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[56];

Why not 57 and do away with the duplicate?

> +} __packed;
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..bdb4611b5685 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>  	return 0;
>  }
>  
> +/**
> + * xe_sysctrl_build_command() - Build System controller command structure
> + * @command: Sysctrl command structure
> + * @group: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()
> + */
> +void xe_sysctrl_build_command(struct xe_sysctrl_mailbox_command *command, u8 group, u8 cmd_id,

I think a more suitable name would be xe_sysctrl_create_command(),
which is also a common pattern in some of the other parts of the driver.

PS: Also don't forget to update the doc accordingly.

> +			      void *request, size_t request_len, void *response,
> +			      size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group) |

Nit: I'd make this consistent with below, i.e. 'group_id'

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}

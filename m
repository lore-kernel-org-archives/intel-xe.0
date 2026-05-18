Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40964CD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 17:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2F10E92F;
	Mon, 18 May 2026 17:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLvmj+d5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DA410E92F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779125220; x=1810661220;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XM0qfcnfjybvrCdfHO4PFHQrj7egpXPoaUmFoW2zH1s=;
 b=GLvmj+d5IJCa5vcBMvEK4pRz3i72XiaJsMEqcVwzqw2JmRajQG9yO6J6
 JwIzjnvL/NDj7tUpUMFCojZi9Ud1Ub34+OoUlW/h9CGsW0zjzmDI0DSaP
 /v2GcjKtZMO2TkmnefpxXT2wEGM1/Ew8RKqGi0HE9GU+FMWKFN3cFNnQz
 4BGU3dbMlbxOXrNdSTl672wceYjO5HYNe2QxKWp7VD0xSikRDWTSCn0y1
 IjS7jNjNViLRGp7BZ5T9YUdLeAucWjNZ3j3h7fXs1XKjYYA7jKijN/ryN
 15wh8CT0qlesBaYtlCrzGJhYYXt/OeKQoNvkPSF+3q7bPyA47obNzfNrj Q==;
X-CSE-ConnectionGUID: qac9UPS/Qa25csF8HpuCRw==
X-CSE-MsgGUID: Oe4RTPj1RvuKWkVbd3G6+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80160125"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="80160125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 10:26:57 -0700
X-CSE-ConnectionGUID: WLH9XvMWQ82ou/ptJ6s9Yg==
X-CSE-MsgGUID: LtNJejYfTJuUjjgtttoIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="239751276"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 10:26:54 -0700
Date: Mon, 18 May 2026 19:26:52 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v6 2/6] drm/xe/xe_ras: Add support to get error counter
 in CRI
Message-ID: <agtL3NF1BFyEX841@black.igk.intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514052205.1340143-10-riana.tauro@intel.com>
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

On Thu, May 14, 2026 at 10:52:08AM +0530, Riana Tauro wrote:
> Add request/response structures and helper functions to query system
> controller to get error counter value.

...

> +	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", response.counter_value,
> +	       comp_to_str(response.counter.common.component),
> +	       sev_to_str(response.counter.common.severity));

A bit heavy handed with nesting :D
You can use a local counter which will also help remove the wrapping[1].

[1] https://lore.kernel.org/intel-xe/20260512191610.1817578-7-raag.jadav@intel.com/

...

> +/**
> + * struct xe_ras_get_counter_request - Request for get error counter
> + */
> +struct xe_ras_get_counter_request {
> +	/** @counter: Error counter to be queried */
> +	struct xe_ras_error_class counter;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_response - Response for get error counter
> + */
> +struct xe_ras_get_counter_response {
> +	/** @counter: Error counter that was queried */
> +	struct xe_ras_error_class counter;
> +	/** @counter_value: Current counter value */
> +	u32 counter_value;

Nit: It's already 'get_counter', so perhaps just 'value'?

> +	/** @timestamp: Timestamp when counter was last updated */
> +	u64 timestamp;
> +	/** @threshold_value: Threshold value for the counter */
> +	u32 threshold_value;

Ditto, 'threshold'?

> +	/** @counter_status: Status of the counter */
> +	u32 counter_status:8;

'status'?

We should probably make these consistent across series', so let me know
which ones you prefer.

> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[56];
> +} __packed;
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..b7c4d8c37819 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>  	return 0;
>  }
>  
> +/**
> + * xe_sysctrl_prepare_command() - Prepare System controller command structure
> + * @command: Sysctrl command structure
> + * @group: Command group ID
> + * @cmd_id: Command code
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to prepare sysctrl command to be sent via xe_sysctrl_send_command()
> + */
> +void xe_sysctrl_prepare_command(struct xe_sysctrl_mailbox_command *command, u8 group, u8 cmd_id,

There's already a sysctrl_prepare_command() in place, so let's make this
a bit distinguishable.

PS: I've used xe_sysctrl_populate_command() in my series but I'll leave
it to you.

Raag

> +				void *request, size_t request_len, void *response,
> +				size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}

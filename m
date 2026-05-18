Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B670CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 17:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5BA10E958;
	Mon, 18 May 2026 17:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaPvgULr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3953510E958
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779127093; x=1810663093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=syWOMjxWXTdOkgjLbCOi906uXs0WiR6Vpx+/dosS2bs=;
 b=CaPvgULrOMsXMEVP/GJUX4XZk6ayYrrSAGUUIIAtjZz7WXVADymng9ln
 G3cmcEyguJ3hQB9iUpEZO+NKlJxXtIVVqJqQkEke3cpmfNVClsx4XIUCS
 wj5M7XfYBtlobCG+ry27nCy/e6zS9TmV6VsSo++e4ZfLj2YEqL/lbI4GO
 moUWMSHK6XuTPChqqlw4LsZpEvK1DheWKroFl1ZpldLfSVac7cgXcPDH6
 tS3QFBvTFbmaGH56CUN7t9BpgjxkeB8vomPdzpbBs7KkFzHjIsQ86z5g+
 kJM/8x4uAvAM1XHvdrnmHwAaIfXlqdnUDlCXagtJ4IQXoS1adEkRAIyyv A==;
X-CSE-ConnectionGUID: Qxv3ubaYR0+JyY7b1NA36g==
X-CSE-MsgGUID: ZTRhljh/QEC0MEU5Tq06EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90572226"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90572226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 10:58:12 -0700
X-CSE-ConnectionGUID: un/0ztQaSI+M7GDQWI+YJw==
X-CSE-MsgGUID: AQuWZ0IqRSCHe++p8wtx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235051613"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 10:58:11 -0700
Date: Mon, 18 May 2026 19:58:08 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v6 3/6] drm/xe/xe_ras: Add support to clear error counter
Message-ID: <agtTMBeI6mk1d7Rd@black.igk.intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-11-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514052205.1340143-11-riana.tauro@intel.com>
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

On Thu, May 14, 2026 at 10:52:09AM +0530, Riana Tauro wrote:
> Add structures and helper function to clear error counter value.

...

> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> +	XE_RAS_STATUS_UNKNOWN_ERROR

Nit: 'UNKNOWN' is sufficient.

> +};
> +
>  static const char *const xe_ras_severities[] = {
>  	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>  	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>  };
>  static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>  
> +static const int ras_status_to_errno_map[] = {

Nit: Redundant 'map', just use 'xe' prefix.

> +	[XE_RAS_STATUS_SUCCESS]			= 0,
> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENOSPC,
> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EIO

-EPROTO?

> +};

I think switch() would be good enough but if you want to use array, let's
also have static_assert() against XE_RAS_STATUS_MAX.

...

> +static int ras_status_to_errno(enum xe_ras_response_status status)
> +{
> +	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)

With _MAX in place, we can make this consistent with other similar helpers.

> +		status = XE_RAS_STATUS_UNKNOWN_ERROR;
> +
> +	return ras_status_to_errno_map[status];
> +}

...

> +	xe_dbg(xe, "[RAS]: %s %s counter cleared\n",

Let's try to make this consistent across series.

How about "<component> <severity> <operation>:<value>"?

> +	       comp_to_str(response.counter.common.component),
> +	       sev_to_str(response.counter.common.severity));

Same comment as last patch.

...

> +/**
> + * struct xe_ras_clear_counter_request - Request for clearing an error counter
> + */
> +struct xe_ras_clear_counter_request {
> +	/** @counter: Counter class to be cleared */
> +	struct xe_ras_error_class counter;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_clear_counter_response - Response after clearing an error counter
> + */
> +struct xe_ras_clear_counter_response {
> +	/** @counter: Counter class that was cleared */
> +	struct xe_ras_error_class counter;
> +	/** @prev_value: Counter value before clearing */
> +	u32 prev_value;

Nit: Postfix is a bit more suitable for variants, i.e. value_prev.

> +	/** @clear_timestamp: Timestamp when the counter was cleared */
> +	u64 clear_timestamp;

It's already 'clear_counter', so perhaps just 'timestamp'?

Raag

> +	/** @status: Status of the clear operation */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved[3];
> +} __packed;

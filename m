Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C9AD35157
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 07:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B6D10ECB0;
	Wed,  1 Apr 2026 07:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5otSsWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7910ECB0
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775030343; x=1806566343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OG7LaQbbmwZu37j5D/oWb8xM+YEjI5FaaW3398xTieo=;
 b=G5otSsWPAKeCeG36oOQLyChJZPpVHBF3Bxi37Fxv+ttquITnJqYTQcVh
 8oBW32AcLHqXGqTkuhIkqdHQriwXnSn7/YBNnbubxCGpYkydxkftEJkqB
 b6gnCJbNtP0VX4Oe5ezLWjHj1U7Z1z9nzgcKdlZI0NPZOxpP5pS/JVnGv
 P6iwqPrtN5cyWHe9JL7ryalae2vdyaBMYeH0Jhg6pKNuIi9LSjh/DZu4P
 a+i0kRP1MQG4VG3yuulgSQKuOTnRYODQD9u4M7N/FyWmb/2SyEJiwZb6+
 2HuV8hRxWfbdIWyw51CamleIiL33pwPnq8KvOMaRrSKWYrW8jYn3AAB7q w==;
X-CSE-ConnectionGUID: qqTsgzORSaGTjE2EGklLuA==
X-CSE-MsgGUID: nqdqoK5LTs+ajsBDuhJk+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87136139"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87136139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:59:02 -0700
X-CSE-ConnectionGUID: lviSv8xYS8CUi7T0SpQCAg==
X-CSE-MsgGUID: jbRkn1qGQhiNh4jbOM0Wcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223725427"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:58:59 -0700
Date: Wed, 1 Apr 2026 09:58:56 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 4/5] drm/xe/xe_ras: Add structures and commands for get
 counter
Message-ID: <aczQQLhRCPdifEpA@black.igk.intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320102607.1017511-5-riana.tauro@intel.com>
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

On Fri, Mar 20, 2026 at 03:55:59PM +0530, Riana Tauro wrote:
> Add request and response structures for get counter command.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h |   9 ++
>  drivers/gpu/drm/xe/xe_ras_types.h       | 151 ++++++++++++++++++++++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> index 4cbde267ac44..fd4248b82f69 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -40,6 +40,15 @@
>   * between driver and System Controller firmware.
>   */
>  
> +/**
> + * enum xe_sysctrl_group - System Controller command groups
> + *
> + * @XE_SYSCTRL_GROUP_GFSP: GFSP group for RAS commands
> + */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP = 0x01

I thought we can add this to xe_sysctrl_mailbox.h but it seems I was
mistaken.

> +};
> +
>  /**
>   * struct xe_sysctrl_app_msg_hdr - Application layer message header
>   * @data: 32-bit header data
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..b3256a28221e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,151 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
> +
> +/**
> + * enum xe_ras_command - RAS Command IDs for GFSP group
> + *
> + * @XE_RAS_CMD_GET_COUNTER: Get RAS counter information
> + */
> +enum xe_ras_command {
> +	XE_RAS_CMD_GET_COUNTER = 0x03

We have commands like GET_PENDING_EVENT that are likely to be used for
wider usecases, so not if this is a suitable place for it.

> +};
> +
> +/**
> + * struct xe_ras_error_common - Common RAS error class
> + *
> + * This structure contains error severity and component information
> + * across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error Severity */
> +	u8 severity;
> +	/** @component: IP where the error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier within a component */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @error_cause: Cause/checker */
> +	struct xe_ras_error_cause error_cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Complete RAS Error Class
> + *
> + * This structure provides the complete error classification by combining
> + * the common error class with the product-specific error class.
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error severity and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_header - Info queue header
> + *
> + * This structure provides metadata about large info queue data
> + */
> +struct xe_ras_info_queue_header {
> +	/** @total_size: Total size of complete info queue data (bytes) */
> +	u32 total_size;
> +	/** @chunk_offset: Offset of this chunk within total data (bytes) */
> +	u32 chunk_offset;
> +	/** @chunk_size: Size of data in this chunk (bytes) */
> +	u32 chunk_size;
> +	/** @sequence_number: Sequence number of this chunk (Starts at 0) */
> +	u32 sequence_number;
> +	/** @flags: Info queue control flags */
> +	u32 flags:8;

Why not u8?

> +	/** @compression_type: Compression type used for this chunk */
> +	u32 compression_type:4;

Ditto.

> +	/** @reserved: Reserved for future use */
> +	u32 reserved:20;
> +	/** @checksum: Checksum of the chunk data */
> +	u32 checksum;
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_response - Info queue response
> + *
> + * This structure provides the response for commands with info queue
> + */
> +struct xe_ras_info_queue_response {
> +	/** @queue_header: Info queue metadata */
> +	struct xe_ras_info_queue_header queue_header;
> +	/** @queue_data: Info queue data chunk */
> +	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_request - Request for XE_RAS_CMD_GET_COUNTER
> + *
> + * This structure defines the request format for getting RAS counter values
> + */
> +struct xe_ras_get_counter_request {
> +	/** @counter_class: RAS error class */
> +	struct xe_ras_error_class counter_class;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_response - Response for XE_RAS_CMD_GET_COUNTER
> + *
> + * This structure defines the response format for getting RAS counter values
> + */
> +struct xe_ras_get_counter_response {
> +	/** @counter_class: RAS error class */
> +	struct xe_ras_error_class counter_class;
> +	/** @counter_value: Current counter value */
> +	u32 counter_value;
> +	/** @timestamp: Timestamp of the counter value */
> +	u64 timestamp;
> +	/** @threshold_value: Threshold value for the counter */
> +	u32 threshold_value;
> +	/** @counter_status: Status of the counter */
> +	u32 counter_status:8;

Ditto.

> +	/** @reserved: Reserved for future use */
> +	u32 reserved:1;

Ditto.

> +	/** @has_info_queue: Indicates if info queue is present */
> +	u32 has_info_queue:1;

Ditto.

Raag

> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:22;
> +	/** @info_queue: Info queue data */
> +	struct xe_ras_info_queue_response info_queue;
> +} __packed;
> +#endif
> -- 
> 2.47.1
> 

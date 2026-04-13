Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE88EEBFD1C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5F510E391;
	Mon, 13 Apr 2026 09:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BONAyPpy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D6E10E391
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776071020; x=1807607020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZomPqRWpC4Vv98VrPNk2wY2STC9R5tAqmHoMqfcnmns=;
 b=BONAyPpy6Pc/aQPr+SKe3nJDejFqG9Vytd+UTLfU8Z4RCeiUYXEUcXxd
 MTn2U6dkd4zWdiXlFfEV09Kk2sADmTMu8X0GxJayS39f08tWm94LGBeWb
 J7NyfLm9DhR7ECD8tuaoE+/SkpCwy1FKwvYEXRkY7cghHvABPVrmedJwk
 gKSVnl7iu36koK0byQOII0Eqdjz/46KvNwwDescbKpDTeo3mvNDDvAkVW
 0VC+lX+QEcpVlM73yFV6Kf5Q8WQs0cXT8hDgoJxJPFWyXqBNOGe3+dYW8
 EmBXzqQLk3YJCIFV0EJQ4iocCGSASRr9tNqXVexTTHe+Q0o7N698hpsM5 Q==;
X-CSE-ConnectionGUID: L7Jhas5eQfKvMyHxecRYWw==
X-CSE-MsgGUID: Vc8/Z/rFQYyeRcX+dTZy2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="94574889"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="94574889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:03:39 -0700
X-CSE-ConnectionGUID: 2km25U/7R32bEcNiltuxiQ==
X-CSE-MsgGUID: 7O4is0rBSY6bey/XtGrpkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="260173400"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:03:37 -0700
Date: Mon, 13 Apr 2026 11:03:34 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 2/5] drm/xe/xe_ras: Add structures and commands for
 get and clear counter
Message-ID: <adyxZnShDWNhNuaq@black.igk.intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-9-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406145440.2016065-9-riana.tauro@intel.com>
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

On Mon, Apr 06, 2026 at 08:24:41PM +0530, Riana Tauro wrote:
> Add request and response structures for get and clear counter command.

...

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
> +	/** @sequence_number: Sequence number of this chunk (starts at 0) */
> +	u32 sequence_number;
> +	/** @flags: Info queue control flags */
> +	u32 flags:8;
> +	/** @compression_type: Compression algorithm used (0 = none) */
> +	u32 compression_type:4;
> +	/** @num_headers: Number of detailed counter headers present at the beginning of queue data */
> +	u32 num_headers:5;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:15;
> +	/** @checksum: Checksum of the chunk data */
> +	u32 checksum;
> +} __packed;

Do we actually use this in the code?

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

Ditto.

> +
> +/**
> + * struct xe_ras_get_counter_request - Request for XE_SYSCTRL_CMD_GET_COUNTER
> + *
> + * This structure defines the request format to get error counter value.
> + */
> +struct xe_ras_get_counter_request {
> +	/** @error_class: RAS error class */
> +	struct xe_ras_error_class error_class;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_response - Response for XE_SYSCTRL_CMD_GET_COUNTER
> + *
> + * This structure defines the response format to get error counter value.
> + */
> +struct xe_ras_get_counter_response {
> +	/** @error_class: RAS error class */
> +	struct xe_ras_error_class error_class;
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
> +	/** @has_info_queue: Indicates if info queue is present */
> +	u32 has_info_queue:1;

Ditto.

> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:22;
> +	/** @info_queue: Info queue data */
> +	struct xe_ras_info_queue_response info_queue;

Hm, so I'm wondering if we can just add reserved padding for now and
introduce the struct when we actually use it in code? Will tidy up things
quite a bit ;)

Also, probably just squash it with next patch where we use the struct.

> +} __packed;
> +
> +/**
> + * struct xe_ras_clear_counter_request - Request for XE_SYSCTRL_CMD_CLEAR_COUNTER
> + *
> + * This structure defines the request format to clear an error counter.
> + */
> +struct xe_ras_clear_counter_request {
> +	/** @error_class: RAS error class */
> +	struct xe_ras_error_class error_class;
> +	/** @specific_counter: (1 = Specific counter, 0 = Aggregate counter) */
> +	u32 specific_counter:1;

Same as above.

Raag

> +	/** @reserved: Reserved for future use */
> +	u32 reserved:31;
> +} __packed;
> +
> +/**
> + * struct xe_ras_clear_counter_response - Response for XE_SYSCTRL_CMD_CLEAR_COUNTER
> + *
> + * This structure defines the response received on clearing an error counter.
> + */
> +struct xe_ras_clear_counter_response {
> +	/** @error_class: RAS error class */
> +	struct xe_ras_error_class error_class;
> +	/** @previous_counter_value: Counter value before clearing */
> +	u32 previous_counter_value;
> +	/** @clear_timestamp: Timestamp when the counter was cleared */
> +	u64 clear_timestamp;
> +	/** @status: Status of the clear operation (Success/Failure) */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved[3];
> +} __packed;
> +#endif

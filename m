Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC7DCC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 15:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F393F10FDF6;
	Wed, 14 Oct 2026 15:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB410E7E9
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791991167; x=1823527167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O3X32f66VDVZY9/C5J//LINbpYJLTprXLAeBL357d5Y=;
 b=NHeM/wiHRabVtJkZtvZ3m4rz0ziJiwY77cHLfuu0iqtIlUsFYH8hhfQi
 CNnTW51j5eZ1tfkgevSEqb7vioeFiIrChnCLvB0SysAIe5pWYUx46RX87
 3Mq61xtdvyWSHJme9uSxLgUuT48LsvSDjYKViOrbraPM1DkOu2hUpNWqW
 F+roUtOpt3ACgQ7E7UgUiGeuInQ9+iCVflzqTl79ofrXyUOkfwt+ckKnB
 TzD2Y7yqjzcwNqfQIu9XRUq0YRaB9rfaFCwpag2qiQyujWBcNBXTVDmDx
 YJp2Uk5UHMGD3ppfDh76q0QV7kCGQi+eBLpCEqhka9TL3skLu4/Yrts/k g==;
X-CSE-ConnectionGUID: u0a4QPZhT+qVFraFLon0LQ==
X-CSE-MsgGUID: ol3ketEYTEGuYfyySCdfbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="839208"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="839208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:19:26 -0700
X-CSE-ConnectionGUID: 4q05oatVSXCYmJpxwgO/8g==
X-CSE-MsgGUID: y6ykj/UcQ9CSU49C7vXG2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1540174"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:19:23 -0700
Date: Wed, 14 Oct 2026 17:19:20 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 05/12] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
Message-ID: <as-deM1jmVVLxCA4@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-19-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-19-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:08PM +0530, Badal Nilawar wrote:

Nit: Although this is only available on selected platforms, the
implementation is platform agnostic. So I'd remove CRI from subject.

> Retrieve the RAS info queue data, in multiple chunks, and assemble it into
> a flat buffer. A follow-up patch will use this data to prepare the CPER
> error info.

Again, no follow-up. Just describe this patch.

> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v4:
>  - Simplify info queue handling and validation (Raag)
>  - Clean up info queue naming and definitions (Raag)
>  - Validate each chunk against the requested offset
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 117 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |   3 +
>  drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  4 files changed, 238 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 5cfc9beff8c1..900319938fe5 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -788,6 +788,123 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
>  	return 0;
>  }
>  
> +static int get_info_queue_data(struct xe_device *xe,
> +			       struct xe_ras_get_info_queue_request *req,
> +			       struct xe_ras_get_info_queue_response *out)

'resp'.

> +{
> +	struct xe_ras_get_info_queue_response response = {0};

No need for local response, you already got it from caller.

> +	struct xe_sysctrl_mailbox_command command = {0};
> +	const struct xe_ras_info_queue_header *hdr;
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
> +				  req, sizeof(*req), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}

If we got a response status, we may want to look for failures here. You
can refer to clear_counter() and set_threshold() for examples.

> +	hdr = &response.queue_response.header;
> +	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
> +	       response.operation_status, hdr->chunk_size, hdr->flags);

Looking at the header definition, we may want to log more details.
At the bare minimum, we should have total_size, chunk_offset and
chunk_size. The rest are upto you.

> +	*out = response;
> +	return 0;
> +}
> +
> +static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
> +			   u32 expected_offset, u32 dest_size)
> +{
> +	u32 end;
> +
> +	return hdr->chunk_offset == expected_offset &&
> +	       hdr->chunk_size && hdr->chunk_size <= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
> +	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
> +	       end <= XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <= dest_size;

Curious, should I worry about termination byte?

> +}
> +
> +/**
> + * xe_ras_drain_info_queue_raw() - Drain the full RAS info queue into a flat buffer
> + * @xe: xe device
> + * @counter_resp: counter response carrying the first embedded chunk and the
> + *                counter identifier used as the source context for subsequent
> + *                GET_INFO_QUEUE fetches
> + * @dest_buf: destination buffer supplied by the caller
> + * @dest_size: size of @dest_buf in bytes; also caps the total amount of data
> + *             assembled from the info queue
> + *
> + * Copies the first chunk already embedded in @counter_resp, then loops
> + * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
> + * signals no more data or a transport/bounds error is encountered.  On
> + * transport or bounds errors the function stops and returns whatever has
> + * been assembled so far.
> + *
> + * Returns: number of valid bytes written into @dest_buf.  Zero if @dest_buf is

Nit: 'Number' with capital N.

> + *          NULL or @dest_size is 0.
> + */
> +u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *dest_buf, u32 dest_size)
> +{
> +	const struct xe_ras_info_queue_header *first_hdr = &counter_resp->first.header;
> +	struct xe_ras_get_info_queue_request req = {0};
> +	struct xe_ras_get_info_queue_response resp;

This one should be inside the while loop.

> +	u32 flags = first_hdr->flags;
> +	u32 offset = 0;
> +
> +	if (!dest_buf || !dest_size)
> +		return 0;
> +
> +	if (first_hdr->total_size > dest_size)
> +		xe_warn(xe, "[RAS]: info queue size %u exceeds %u, truncating\n",
> +			first_hdr->total_size, dest_size);

Why not return error here?

> +	/* Copy first chunk already embedded in the counter response */
> +	if (chunk_is_valid(first_hdr, offset, dest_size)) {

Ditto, why do we continue after invalid chunk?

> +		memcpy(dest_buf, counter_resp->first.data, first_hdr->chunk_size);
> +		offset = first_hdr->chunk_size;
> +	}
> +
> +	req.source_command = XE_SYSCTRL_CMD_GET_COUNTER;
> +	req.source_context = counter_resp->counter;
> +	req.queue_request.session_id = counter_resp->counter;

Why the duplication?

> +	/* Fetch any remaining chunks */
> +	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {
> +		const struct xe_ras_info_queue_header *hdr = &resp.queue_response.header;

memset(resp, 0)

> +		req.queue_request.offset = offset;
> +		req.queue_request.size = min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
> +
> +		if (get_info_queue_data(xe, &req, &resp)) {
> +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u failed\n",

... with "%d\n

> +			       offset);

, ret);

> +			return offset;
> +		}
> +
> +		if (!chunk_is_valid(hdr, offset, dest_size)) {
> +			xe_warn(xe, "[RAS]: invalid info queue chunk (offset=%u size=%u, expected offset=%u)\n",
> +				hdr->chunk_offset, hdr->chunk_size, offset);
> +			return offset;
> +		}
> +
> +		memcpy(dest_buf + offset, resp.queue_response.data, hdr->chunk_size);
> +		offset += hdr->chunk_size;
> +		flags = hdr->flags;
> +	}
> +
> +	return min(offset, first_hdr->total_size);
> +}
> +
>  static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct xe_ras_get_health_response response = {0};
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 84700ea63394..27ce6265ace5 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -22,5 +22,8 @@ void xe_ras_init(struct xe_device *xe);
>  enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>  int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>  				struct xe_ras_get_counter_response *out);
> +u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *dest_buf, u32 dest_size);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index fe6f3658a2a4..9901fd034e3f 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -17,6 +17,10 @@
>  #define XE_RAS_MEMORY_POISON			BIT(2)
>  #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>  
> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
> +#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
> +#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
> +
>  /**
>   * enum xe_ras_recovery_action - RAS recovery actions
>   *
> @@ -95,6 +99,110 @@ struct xe_ras_threshold_crossed {
>  	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>  } __packed;
>  
> +/**
> + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
> + *
> + * Provides chunk metadata for commands that support extended info queue
> + * functionality. Used when the total data exceeds a single mailbox response.
> + */
> +struct xe_ras_info_queue_header {
> +	/** @total_size: Total size of the complete info queue data in bytes */
> +	u32 total_size;
> +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
> +	u32 chunk_offset;
> +	/** @chunk_size: Size of the data in this chunk in bytes */
> +	u32 chunk_size;
> +	/** @reserved0: Reserved for future use */
> +	u32 reserved0;
> +	/** @flags: Info queue control flags (XE_RAS_INFO_QUEUE_FLAG_*) */
> +	u32 flags:8;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:4;
> +	/** @num_headers: Number of detailed counter headers at start of the data */
> +	u32 num_headers:5;

Is this actually used here?

> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2:15;
> +	/** @checksum: CRC32 checksum of this chunk data */
> +	u32 checksum;

Ditto.

> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_data_request - Request for a specific chunk of info queue data
> + *
> + * Allows the driver to request continuation of large info queue transfers
> + * by specifying an offset and size within the full data set.
> + */
> +struct xe_ras_info_queue_data_request {
> +	/** @offset: Byte offset of the requested data chunk */
> +	u32 offset;
> +	/** @size: Maximum size of the requested chunk in bytes */
> +	u32 size;
> +	/** @session_id: Session ID to correlate multi-chunk transfers */
> +	struct xe_ras_error_class session_id;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_data_response - Generic response for commands with info queues
> + *
> + * Standard response format for any command that returns an info queue
> + * payload. May be embedded in a command-specific response structure.
> + */
> +struct xe_ras_info_queue_data_response {
> +	/** @header: Info queue metadata for this chunk */
> +	struct xe_ras_info_queue_header header;
> +	/** @data: Info queue data for this chunk */
> +	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
> + *
> + * When a session requests aggregate counter data, one header per matching
> + * dynamic counter class is prepended to the queue data. The @counter field
> + * is the error count of this class; at most XE_RAS_NUM_COUNTERS error log
> + * entries follow for it.
> + */
> +struct xe_ras_info_queue_dynamic_counter_hdr {
> +	/** @error_class: Error class associated with this counter group */
> +	struct xe_ras_error_class error_class;

'counter'

> +	/** @counter: Error count of this class */
> +	u32 counter;

'count'

> +} __packed;
> +
> +/**
> + * struct xe_ras_error_log - Single error log entry following dynamic counter headers
> + */
> +struct xe_ras_error_log {
> +	/** @timestamp: Timestamp when the error was recorded */
> +	u64 timestamp;
> +	/** @error_details: Error-specific details */
> +	u32 error_details[16];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
> + */
> +struct xe_ras_get_info_queue_request {
> +	/** @queue_request: Info queue request parameters */
> +	struct xe_ras_info_queue_data_request queue_request;
> +	/** @source_command: Original command that generated the info queue */
> +	u32 source_command;
> +	/** @source_context: Context from original command, if applicable */
> +	struct xe_ras_error_class source_context;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
> + */
> +struct xe_ras_get_info_queue_response {
> +	/** @operation_status: Status of the retrieval operation */
> +	u32 operation_status;

'status'

> +	/** @queue_response: Info queue data chunk */
> +	struct xe_ras_info_queue_data_response queue_response;
> +} __packed;
> +
>  /**
>   * struct xe_ras_get_counter_request - Request structure for get counter
>   */
> @@ -117,8 +225,14 @@ struct xe_ras_get_counter_response {
>  	u64 timestamp;
>  	/** @threshold: Threshold value for the counter */
>  	u32 threshold;
> -	/** @reserved: Reserved  */
> -	u32 reserved[57];
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:9;
> +	/** @has_info_queue: Set if info queue is available */
> +	u32 has_info_queue:1;

Hmm...

> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:22;
> +	/** @first: First info queue chunk, if @has_info_queue is set */

... so where is this condition?

Raag

> +	struct xe_ras_info_queue_data_response first;
>  } __packed;
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index a0628eb47bff..299d12b94574 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -34,6 +34,7 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
> + * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
> @@ -44,6 +45,7 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>  	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>  	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> +	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
>  };
>  
>  /**
> -- 
> 2.54.0
> 

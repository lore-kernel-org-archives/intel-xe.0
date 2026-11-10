Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F106606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bmQNtrok
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F74710E093;
	Tue, 10 Nov 2026 10:53:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E0510E093
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794308029; x=1825844029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GZ74JzlM0aK8wrozDso3075qfTksa4fZ3UYdCGI3TFI=;
 b=bmQNtrokH75UYUdWM48/WM+RJrTs0ial0krXQLuxiLuCmGaHTExYsuKB
 IROyHLWPZxMIOf86nmQud/HFTxtcS2vTUf7vHK7K3a2j+DBGEtp0Kz0IJ
 BbcJd2u0I5GU4/b1Db7s4nsW2gyPZYcrPLuGmudr97lJJbjZwWoqbbe8S
 CYVg+5DscIU7mmSeO+23GA7NE+j8RRAcK0i1TubCaSH1qoo6Ne67fGWKq
 h4d44BXsO8Pdk/nDBCz8UXtBd0O90+D6rCDaCGI0mcBC95crlDp2EH2IT
 H4u69kIURxcAD2YkDCh0VpE7uTT1tnK0jWRgjqxUs5OgdqxuokK9DhjKy A==;
X-CSE-ConnectionGUID: CCbwfMYCT1C5QoU60efpsA==
X-CSE-MsgGUID: yq5FWNc4ReCC5Hq3F3BV0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3133179"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3133179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:53:44 -0800
X-CSE-ConnectionGUID: IeoCPRrUTmmx5pIuJBNjYg==
X-CSE-MsgGUID: b+cAPW2WSqi9W/6WPrXG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8119957"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:53:41 -0800
Date: Tue, 10 Nov 2026 11:53:38 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v6 1/2] drm/xe/xe_ras: Add support to retrieve info queue
 data
Message-ID: <avL3svpNuYn6l9C4@black.igk.intel.com>
References: <20261106185903.3570234-4-badal.nilawar@intel.com>
 <20261106185903.3570234-5-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106185903.3570234-5-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 12:29:05AM +0530, Badal Nilawar wrote:
> Retrieve the RAS info queue data, in multiple chunks, and assemble it into
> a flat buffer.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v6:
>   - Replace destination buffer checks with xe_assert() (Raag)
>   - Extract get_first_chunk() and get_remaining_chunks() helpers (Raag)
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 140 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |   4 +-
>  drivers/gpu/drm/xe/xe_ras_types.h             |  91 +++++++++++-
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  4 files changed, 234 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..7f218ab2bd1b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1106,6 +1106,146 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
>  	return 0;
>  }
>  
> +static int get_info_queue(struct xe_device *xe,
> +			  struct xe_ras_get_info_queue_request *request,
> +			  struct xe_ras_get_info_queue_response *response)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	const struct xe_ras_info_queue_header *hdr;
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
> +				  request, sizeof(*request), response, sizeof(*response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get info queue %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(*response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue response length %zu (expected %zu)\n",
> +		       rlen, sizeof(*response));
> +		return -EIO;
> +	}
> +
> +	ret = ras_status_to_errno(response->status);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: get info queue command failed with status %#x\n",
> +		       response->status);
> +		return ret;
> +	}
> +
> +	hdr = &response->queue_response.header;
> +	xe_dbg(xe, "[RAS] info queue: total_size=%u chunk_offset=%u chunk_size=%u flags=0x%x num_headers=%u\n",

"[RAS] get info queue". Also, "flags=%#x".

> +	       hdr->total_size, hdr->chunk_offset, hdr->chunk_size,
> +	       hdr->flags, hdr->num_headers);

Can be less lines?

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

Should we also check hdr->total_size <= XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE?

> +	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
> +	       end <= XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <= dest_size;

With above in place, you can replace XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE
with hdr->total_size.

> +}
> +
> +static u32 get_first_chunk(struct xe_device *xe,
> +			   const struct xe_ras_get_counter_response *response,

'counter_resp'

> +			   u8 *dest_buf, u32 dest_size, u32 *flags)
> +{
> +	const struct xe_ras_info_queue_header *hdr = &response->first.header;
> +
> +	if (!chunk_is_valid(hdr, 0, dest_size)) {
> +		xe_warn(xe, "[RAS]: invalid first info queue chunk (offset=%u size=%u, expected offset=%u)\n",

With hdr->total_size check above, we'd probably also need to log
total_size here. Use the same ordering as get_info_queue() log,
i.e. "total=%u offset=%u size=%u, ..."

> +			hdr->chunk_offset, hdr->chunk_size, 0);
> +		return 0;
> +	}
> +
> +	memcpy(dest_buf, response->first.data, hdr->chunk_size);
> +	*flags = hdr->flags;
> +
> +	return hdr->chunk_size;
> +}
> +
> +static u32 get_remaining_chunks(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *response,

'counter_resp'

> +				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
> +{
> +	int ret;
> +
> +	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {

This fails silently on offset > dest_size, so let chunk_is_valid()
take care of this.

> +		struct xe_ras_get_info_queue_request request = {};
> +		struct xe_ras_get_info_queue_response queue_response = {};

'response'

> +		struct xe_ras_info_queue_header *hdr;
> +
> +		request.queue_request.offset = offset;
> +		request.queue_request.size = min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE,
> +						 dest_size - offset);
> +		request.queue_request.session_id = response->counter;

Use a local qdata_request pointer, this'll help remove the wrapping.

> +		ret = get_info_queue(xe, &request, &queue_response);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n",
> +			       offset, ret);
> +			return offset;
> +		}
> +
> +		hdr = &queue_response.queue_response.header;
> +
> +		if (!chunk_is_valid(hdr, offset, dest_size)) {
> +			xe_warn(xe, "[RAS]: invalid info queue chunk (offset=%u size=%u, expected offset=%u)\n",

Same as above, also log total_size here.

> +				hdr->chunk_offset, hdr->chunk_size, offset);
> +			return offset;
> +		}

History has been evidence that we shouldn't blindly trust the firmware,
especially inside a loop. We've introduce XE_SYSCTRL_FLOOD_LIMIT for
this reason, which looks like also should be used here.

> +		memcpy(dest_buf + offset, queue_response.queue_response.data, hdr->chunk_size);
> +		offset += hdr->chunk_size;
> +		flags = hdr->flags;
> +	}
> +
> +	return min(offset, response->first.header.total_size);
> +}
> +
> +/**
> + * xe_ras_drain_info_queue() - Drain the full RAS info queue into a flat buffer
> + * @xe: xe device
> + * @response: counter response carrying the first embedded chunk
> + * @dest_buf: destination buffer supplied by the caller
> + * @dest_size: size of @dest_buf in bytes; also caps the total amount of data
> + *             assembled from the info queue

Not sure if I follow, is the capping done here or is it caller responsibility?

> + * Copies the first chunk already embedded in @response, then loops
> + * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
> + * signals no more data or a transport/bounds error is encountered.  On
> + * transport or bounds errors the function stops and returns whatever has
> + * been assembled so far.
> + *
> + * Returns: Number of valid bytes written into @dest_buf.
> + */
> +u32 xe_ras_drain_info_queue(struct xe_device *xe,
> +			    const struct xe_ras_get_counter_response *response,
> +			    u8 *dest_buf, u32 dest_size)
> +{
> +	u32 flags, offset;
> +
> +	xe_assert(xe, response->has_info_queue);

I think this can be explicit if() condition, so the caller doesn't
need to worry about this.

> +	xe_assert(xe, dest_buf);
> +	xe_assert(xe, dest_size);
> +
> +	offset = get_first_chunk(xe, response, dest_buf, dest_size, &flags);
> +	if (!offset)
> +		return 0;
> +
> +	return get_remaining_chunks(xe, response, dest_buf, dest_size, offset, flags);
> +}
> +
>  static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct xe_ras_get_health_response response = {0};
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index c44fa172011f..5bdac147098f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -25,5 +25,7 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>  u32 xe_ras_get_max_pages(struct xe_device *xe);
>  int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>  				struct xe_ras_get_counter_response *response);
> -
> +u32 xe_ras_drain_info_queue(struct xe_device *xe,
> +			    const struct xe_ras_get_counter_response *response,
> +			    u8 *dest_buf, u32 dest_size);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index a86f9d2b8c92..67d57182aac9 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -19,6 +19,10 @@
>  #define XE_RAS_MEMORY_POISON			BIT(2)
>  #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>  
> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
> +#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
> +#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
> +
>  /**
>   * enum xe_ras_page_action - Page offline actions for page offline request
>   *
> @@ -110,6 +114,83 @@ struct xe_ras_threshold_crossed {
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
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2:15;
> +	/** @reserved3: Reserved for future use */
> +	u32 reserved3;
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
> + * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
> + */
> +struct xe_ras_get_info_queue_request {
> +	/** @queue_request: Info queue request parameters */
> +	struct xe_ras_info_queue_data_request queue_request;

'qdata_request'

> +	/** @reserved: Reserved for future use */
> +	u32 reserved[16];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
> + */
> +struct xe_ras_get_info_queue_response {
> +	/** @status: Status of the retrieval operation */
> +	u32 status;
> +	/** @queue_response: Info queue data chunk */
> +	struct xe_ras_info_queue_data_response queue_response;

'qdata_response'

Raag

> +} __packed;
> +
>  /**
>   * struct xe_ras_get_counter_request - Request structure for get counter
>   */
> @@ -132,8 +213,14 @@ struct xe_ras_get_counter_response {
>  	u64 timestamp;
>  	/** @threshold: Threshold value for the counter */
>  	u32 threshold;
> -	/** @reserved: Reserved  */
> -	u32 reserved[57];
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:9;
> +	/** @has_info_queue: Set if info queue is available */
> +	u32 has_info_queue:1;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:22;
> +	/** @first: First info queue chunk, if @has_info_queue is set */
> +	struct xe_ras_info_queue_data_response first;
>  } __packed;
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index cdacceebca06..50b1d9abaf1f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -37,6 +37,7 @@ enum xe_sysctrl_group {
>   * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
>   * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>   * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
> + * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
> @@ -50,6 +51,7 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>  	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>  	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> +	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
>  };
>  
>  /**
> -- 
> 2.56.0
> 

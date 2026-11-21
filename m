Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EAA606A325
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TNxPsOfF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80E10E0A9;
	Sat, 21 Nov 2026 11:55:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D710E0A9
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795262117; x=1826798117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oCWKoq3obZoZGIFyDtT+ZT17YZ/6Uo/Rrdb1yi0Dnjw=;
 b=TNxPsOfFPTme8b8B48K+07Dzyp1zkRsYvEIWUu6pf77GgiXo1WzWO0gg
 s11dEwuWvJdUnGu0aMOt3ioCJi9VI9BYoykwzGtMz/XlqOivC3lOupPru
 YUH9GDXugktjAe4SW/QyQWecKfchcTBggOvJhQLFkWSezAp0WeQnCwN7F
 2KI84/RhVHbInymU0ltjf2lLg065nlP2oxSUblBxZCWaZ087jC4tZc3Zm
 TosSyq/SCApuIc08nB4tE8wqkx0gzBiIIsKpSRyWffyg007oBDXOzRiVz
 6PDQPobi/brcmEQVxyYZl92r3fG5ISUh17ljH1Zz+owTyPnvq5NFpX50j w==;
X-CSE-ConnectionGUID: ff7rGAGvSSu+F9KH2dp1ow==
X-CSE-MsgGUID: R4o2uR1xTVWPPLkd5gx+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4021342"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4021342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 03:55:16 -0800
X-CSE-ConnectionGUID: OYfi8BJOTZWy0ELDK2gMTw==
X-CSE-MsgGUID: We9XNtGWQ5aFnGuZXCVHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="10886680"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 03:55:13 -0800
Date: Sat, 21 Nov 2026 12:55:10 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v9 2/3] drm/xe/xe_ras: Add support to retrieve info queue
 data
Message-ID: <awGGnkZvDvpAwAEu@black.igk.intel.com>
References: <20261121064545.168470-5-badal.nilawar@intel.com>
 <20261121064545.168470-7-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121064545.168470-7-badal.nilawar@intel.com>
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

On Sat, Nov 21, 2026 at 12:15:48PM +0530, Badal Nilawar wrote:
> Retrieve the RAS info queue data, in multiple chunks, and assemble it into
> a flat buffer.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v6:
>   - Replace destination buffer checks with xe_assert() (Raag)
>   - Extract get_first_chunk() and get_remaining_chunks() helpers (Raag)
> v7:
>   - Move RAS has_info_queue check from CPER to RAS (Raag)
>   - Also check that the reported total size is consistent across all chunks
>   - Limit info queue fetches to 2x XE_SYSCTRL_FLOOD_LIMIT (Raag)
> v8:
>   - Align info queue logs with existing messages (Raag)
>   - Assert buffer bounds on each iteration and simplify the loop (Raag)
>   - Use min_t() for chunk-size and returned-size calculations (Raag)
>   - Assert has_info_queue and return early when the first chunk fills
>     the buffer (Raag)
>   - Check for an incomplete drain on loop exit (Raag)
> v9:
>   - Stop draining when the destination buffer is full (Sashiko)
>   - Validate and reuse the first chunk's total size for subsequent chunks (Raag)
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 185 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |   6 +-
>  drivers/gpu/drm/xe/xe_ras_types.h             |  91 ++++++++-
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  4 files changed, 281 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index e8984c966876..953d40c1c393 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1123,6 +1123,191 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
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
> +	hdr = &response->qdata_resp.header;
> +	xe_dbg(xe, "[RAS]: get info queue: total=%u offset=%u size=%u flags=%#x num_headers=%u\n",
> +	       hdr->total_size, hdr->chunk_offset, hdr->chunk_size, hdr->flags, hdr->num_headers);
> +
> +	return 0;
> +}
> +
> +static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
> +			   u32 expected_offset, u32 total_size, u32 dest_size)
> +{
> +	u32 end;
> +
> +	return hdr->total_size && hdr->total_size == total_size &&
> +	       hdr->chunk_offset == expected_offset &&
> +	       hdr->chunk_size && hdr->chunk_size <= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
> +	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
> +	       end <= min_t(u32, total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) &&
> +	       end <= dest_size;
> +}
> +
> +static u32 get_first_chunk(struct xe_device *xe,
> +			   const struct xe_ras_get_counter_response *counter_resp,
> +			   u8 *dest_buf, u32 dest_size, u32 *flags)
> +{
> +	const struct xe_ras_info_queue_header *hdr = &counter_resp->first.header;
> +
> +	if (!chunk_is_valid(hdr, 0, hdr->total_size, dest_size)) {
> +		xe_warn(xe, "[RAS]: invalid first info queue chunk (total=%u offset=%u size=%u, expected offset=0)\n",
> +			hdr->total_size, hdr->chunk_offset, hdr->chunk_size);
> +		return 0;
> +	}
> +
> +	memcpy(dest_buf, counter_resp->first.data, hdr->chunk_size);
> +	*flags = hdr->flags;
> +
> +	return hdr->chunk_size;
> +}
> +
> +static u32 get_remaining_chunks(struct xe_device *xe,
> +				const struct xe_ras_get_counter_response *counter_resp,
> +				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
> +{
> +	u32 total_size = counter_resp->first.header.total_size;
> +	u32 requests_left = XE_SYSCTRL_FLOOD_LIMIT * 2;
> +	int ret;
> +
> +	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {

As I already mentioned[1], if MORE_DATA is set with out of bounds offset
it's more likely a firmware bug which you're now hiding here. Just go
ahead with get_info_queue() and let it fail.

Raag

[1] https://lore.kernel.org/intel-xe/avL3svpNuYn6l9C4@black.igk.intel.com/

> +		struct xe_ras_info_queue_data_request *qdata_req;
> +		struct xe_ras_get_info_queue_response response = {};
> +		struct xe_ras_get_info_queue_request request = {};
> +		struct xe_ras_info_queue_header *hdr;
> +
> +		xe_assert(xe, offset <= dest_size);
> +
> +		qdata_req = &request.qdata_req;
> +		qdata_req->offset = offset;
> +		qdata_req->size = min_t(u32, XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
> +		qdata_req->session_id = counter_resp->counter;
> +
> +		ret = get_info_queue(xe, &request, &response);
> +		if (ret) {
> +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n",
> +			       offset, ret);
> +			return offset;
> +		}
> +
> +		hdr = &response.qdata_resp.header;
> +
> +		if (!chunk_is_valid(hdr, offset, total_size, dest_size)) {
> +			xe_warn(xe, "[RAS]: invalid info queue chunk (total=%u offset=%u size=%u, expected offset=%u)\n",
> +				hdr->total_size, hdr->chunk_offset, hdr->chunk_size, offset);
> +			return offset;
> +		}
> +
> +		memcpy(dest_buf + offset, response.qdata_resp.data, hdr->chunk_size);
> +		offset += hdr->chunk_size;
> +		flags = hdr->flags;
> +
> +		if (!--requests_left) {
> +			xe_warn(xe, "[RAS]: info queue flooding, aborted at offset=%u\n", offset);
> +			break;
> +		}
> +	}
> +
> +	if (offset != dest_size) {
> +		xe_warn(xe, "[RAS]: info queue drain incomplete, missed %u size\n",
> +			dest_size - offset);
> +	}
> +
> +	return min_t(u32, offset, total_size);
> +}
> +
> +/**
> + * xe_ras_get_info_queue_size() - Get the total size of the RAS info queue
> + * @xe: xe device
> + * @response: Counter response carrying the first info queue chunk
> + *
> + * Return: Info queue size in bytes, capped at the supported maximum, or zero
> + * if no usable info queue is present.
> + */
> +u32 xe_ras_get_info_queue_size(struct xe_device *xe,
> +			       const struct xe_ras_get_counter_response *response)
> +{
> +	u32 total_size;
> +
> +	if (!response->has_info_queue)
> +		return 0;
> +
> +	total_size = response->first.header.total_size;
> +	if (!total_size) {
> +		xe_warn(xe, "[RAS]: info queue reports zero size\n");
> +		return 0;
> +	}
> +
> +	if (total_size > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {
> +		xe_warn(xe, "[RAS]: info queue size %u exceeds max size %u, truncating\n",
> +			total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
> +		total_size = XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE;
> +	}
> +	return total_size;
> +}
> +
> +/**
> + * xe_ras_drain_info_queue() - Drain the full RAS info queue into a flat buffer
> + * @xe: xe device
> + * @response: counter response carrying the first embedded chunk
> + * @dest_buf: destination buffer supplied by the caller
> + * @dest_size: size of @dest_buf in bytes
> + *
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
> +	xe_assert(xe, dest_buf);
> +	xe_assert(xe, dest_size);
> +
> +	offset = get_first_chunk(xe, response, dest_buf, dest_size, &flags);
> +	if (!offset || offset == dest_size)
> +		return offset;
> +
> +	return get_remaining_chunks(xe, response, dest_buf, dest_size, offset, flags);
> +}
> +
>  static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct xe_ras_get_health_response response = {0};
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index f7b587ac84e3..5d41c4543c55 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -25,7 +25,11 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>  u32 xe_ras_get_max_pages(struct xe_device *xe);
>  int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>  				struct xe_ras_get_counter_response *response);
> +u32 xe_ras_get_info_queue_size(struct xe_device *xe,
> +			       const struct xe_ras_get_counter_response *response);
> +u32 xe_ras_drain_info_queue(struct xe_device *xe,
> +			    const struct xe_ras_get_counter_response *response,
> +			    u8 *dest_buf, u32 dest_size);
>  bool xe_ras_is_aer_internal_error(struct xe_device *xe);
>  void xe_ras_set_aer_internal_error(struct xe_device *xe);
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 0ff5803d495b..1a03de84074c 100644
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
> +	/** @qdata_req: Info queue request parameters */
> +	struct xe_ras_info_queue_data_request qdata_req;
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
> +	/** @qdata_resp: Info queue data chunk */
> +	struct xe_ras_info_queue_data_response qdata_resp;
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

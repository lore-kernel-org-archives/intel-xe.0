Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BE606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H/J7fSu4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E7C896EC;
	Thu, 19 Nov 2026 08:47:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603E31121A2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795078067; x=1826614067;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CzW6msQx7wq7cHChkVEjsZOkNstIrFPmVQFluk7zkG8=;
 b=H/J7fSu4xKkqpq0ZRBWg/rfmOQbRefG1OCL/Q0TWVpsFBvVqXsuqKnnk
 b5dSK/LnIvD7S6jezgyTf9qWRfErcE0UK4K1ghJ4yL7WdIcY806f+OMN8
 NP3FlBAmYy4vik5HHbVDebl8ESFrm0QCPiB6kNOJT3bHL2CyRcZDlfQ7P
 51vfTtBc3cHXXJWmCa6zZR2AcAYLpomlW7eT2PaDPaOLnY+SR5UJbCVKW
 D78GGqmt4P8JevWIsAXyi4oYoqJwky7fJyVDzWRdl1F++KEtkG2aYinwZ
 0khfCdPlZVf5vWCLApA1W8x60j49vNHrIamnTR1nbMQ2MGLanXv1hS7aB w==;
X-CSE-ConnectionGUID: GNpEdY2JRFOGsg68rXeDNw==
X-CSE-MsgGUID: E0bM8FWOSEGUaYnKtZci5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3763505"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3763505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:47:47 -0800
X-CSE-ConnectionGUID: CQ8SboMoTYq3EonI1HmiGQ==
X-CSE-MsgGUID: g6nN+UIJScqBORqEJ9PLRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10937524"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:47:44 -0800
Date: Thu, 19 Nov 2026 09:47:41 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v7 3/3] drm/xe/cper: Prepare Intel CPER info records
Message-ID: <av63rcZLKUuT8BJt@black.igk.intel.com>
References: <20261117072118.4051706-5-badal.nilawar@intel.com>
 <20261117072118.4051706-8-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117072118.4051706-8-badal.nilawar@intel.com>
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

On Tue, Nov 17, 2026 at 12:51:22PM +0530, Badal Nilawar wrote:
> The RAS info queue contains error logs for detail counters, or dynamic
> counter headers followed by error logs for aggregate counters.
> 
> Build CPER info records from the queue data, converting each error log
> into an CPER event. For aggregate counters, group logs by their dynamic
> counter header and build one info record per header.
> 
> Emit a CPER record for each generated info record.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v6:
>   - Reintroduce event_ prefixes
>   - %s/einfo/info/
>   - Split cper_prepare_einfo() into queue-fetch and info-array
>     construction helpers (Raag)
>   - Rename the dynamic counter header's count field to error_count (Raag)
> v7:
>   - Retain einfo for existing payload variables and length parameter
>   - Rework cper_prepare_info() to return the number of entrie and info
>     array as an output argument. (Raag)
> ---
>  drivers/gpu/drm/xe/xe_cper.c       | 263 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_cper_types.h |  59 ++++++-
>  drivers/gpu/drm/xe/xe_ras_types.h  |  26 +++
>  3 files changed, 340 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index dda82eb4690c..7a74fe3aed6e 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -89,7 +89,7 @@ static u64 cper_timestamp_now(void)
>  
>  static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
>  				u64 first_timestamp, u32 sig_id, u32 error_count,
> -				struct xe_cper_intel_hdr *ihdr)
> +				u32 info_size, struct xe_cper_intel_hdr *ihdr)
>  {
>  	ihdr->counter = *counter;
>  	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
> @@ -106,6 +106,7 @@ static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_
>  	}
>  
>  	ihdr->error_count = error_count;
> +	ihdr->info_log_size = info_size;
>  
>  	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
>  	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
> @@ -200,6 +201,227 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>  	kfree(rec);
>  }
>  
> +static struct xe_cper_intel_info *
> +build_info(const struct xe_ras_error_class *counter, u32 error_count,

The names seems got swapped here, this should be fill_info(). Also, why
the wrapping? Can be less lines?

> +	   const struct xe_ras_error_log *logs, u32 num_logs)
> +{
> +	struct xe_cper_intel_event *entry;
> +	struct xe_cper_intel_info *info;

Use 'einfo' as xe_cper_intel_info variable names (not to be confused with
xe_cper_info_entry) to make it consistent with existing code (and in all
other places where applicable).

> +	u32 event_queue_size, i;
> +
> +	event_queue_size = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
> +	info = kzalloc_flex(*info, event_queue, event_queue_size);
> +	if (!info)
> +		return NULL;
> +
> +	info->error_count = error_count;
> +	info->event_queue_size = event_queue_size;
> +	info->event_queue_count = num_logs;
> +	info->counter = *counter;
> +
> +	entry = (struct xe_cper_intel_event *)info->event_queue;
> +	for (i = 0; i < num_logs; i++) {
> +		entry->size = sizeof_field(struct xe_ras_error_log, details);
> +		entry->timestamp = logs[i].timestamp;
> +		memcpy(entry->metadata, logs[i].details, sizeof(logs[i].details));
> +		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
> +	}
> +
> +	return info;
> +}
> +
> +static void free_info_arr(struct xe_cper_info_entry *info_arr, u32 num_entries)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < num_entries; i++)
> +		kfree(info_arr[i].info);
> +	kfree(info_arr);
> +}
> +
> +static bool fill_info(struct xe_cper_info_entry *entry,

build_info()

> +		      const struct xe_ras_error_class *counter, u32 error_count,
> +		      const struct xe_ras_error_log *logs, u32 num_logs)
> +{
> +	entry->info = build_info(counter, error_count, logs, num_logs);
> +	if (!entry->info)
> +		return false;
> +
> +	entry->info_size = struct_size(entry->info, event_queue,
> +				       entry->info->event_queue_size);

Can be less lines?

> +	/* The first log is the first occurrence of the error */
> +	entry->timestamp = logs[0].timestamp;
> +	entry->hdr.counter = *counter;
> +	entry->hdr.error_count = error_count;
> +	return true;
> +}
> +
> +static u32 build_detailed_info(const struct xe_ras_error_class *counter, u32 error_count,
> +			       const struct xe_ras_error_log *logs, u32 num_logs,
> +			       struct xe_cper_info_entry *info_arr)
> +{
> +	/* All logs belong to the queried class; the error count may exceed the logs kept */
> +	if (!num_logs)
> +		return 0;
> +
> +	num_logs = min_t(u32, num_logs, XE_RAS_NUM_COUNTERS);
> +
> +	return fill_info(&info_arr[0], counter, error_count, logs, num_logs) ? 1 : 0;
> +}
> +
> +static u32 build_aggregate_info(struct xe_device *xe,
> +				const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs,
> +				u32 num_hdrs, const struct xe_ras_error_log *logs,
> +				u32 avail_logs, struct xe_cper_info_entry *info_arr)
> +{
> +	u32 log_offset = 0, num_entries = 0, i;

'log_offset' should be inside the loop.

> +	for (i = 0; i < num_hdrs; i++) {
> +		u32 num_logs = min_t(u32, hdrs[i].error_count, XE_RAS_NUM_COUNTERS);
> +
> +		if (num_logs > avail_logs - log_offset) {
> +			xe_warn(xe, "CPER: header[%u] claims %u logs but only %u remain\n",
> +				i, num_logs, avail_logs - log_offset);
> +			break;
> +		}
> +
> +		if (!num_logs)

Curious, is this really possible?

> +			continue;
> +
> +		if (!fill_info(&info_arr[num_entries], &hdrs[i].counter, hdrs[i].error_count,
> +			       &logs[log_offset], num_logs))
> +			break;
> +
> +		log_offset += num_logs;
> +		num_entries++;
> +	}
> +
> +	return num_entries;
> +}
> +
> +static u8 *cper_get_info_queue_buffer(struct xe_device *xe,

No, this will return raw_total and provide raw_buf as a pointer to the
caller.

> +				      const struct xe_ras_get_counter_response *counter_resp,

In cper layer we don't deal with any other responses, so let's keep
it as 'response' (in all other places where applicable).

> +				      u32 buf_size, u32 *raw_total)
> +{
> +	u8 *raw_buf;
> +
> +	raw_buf = kzalloc_objs(*raw_buf, buf_size);
> +	if (!raw_buf)
> +		return NULL;
> +
> +	*raw_total = xe_ras_drain_info_queue(xe, counter_resp, raw_buf, buf_size);
> +	if (!*raw_total) {
> +		kfree(raw_buf);
> +		return NULL;
> +	}
> +
> +	return raw_buf;
> +}
> +
> +static u32
> +cper_build_info_arr(struct xe_device *xe,

Less lines?

> +		    const struct xe_ras_get_counter_response *counter_resp,

'response'

> +		    const u8 *raw_buf, u32 raw_total,
> +		    struct xe_cper_info_entry **info_arr_out)

Ditto.

> +{
> +	const struct xe_ras_error_log *logs;
> +	struct xe_cper_info_entry *info_arr;
> +	u32 num_headers, headers_size, avail_logs, num_entries;
> +
> +	*info_arr_out = NULL;

No, the caller is responsible for this.

> +	num_headers = counter_resp->first.header.num_headers;
> +	headers_size = num_headers * sizeof(struct xe_ras_info_queue_dynamic_counter_hdr);
> +	if (headers_size > raw_total) {
> +		xe_warn(xe, "CPER: aggregate headers size (%u) exceeds raw total (%u)\n",
> +			headers_size, raw_total);
> +		return 0;
> +	}
> +
> +	logs = (const struct xe_ras_error_log *)(raw_buf + headers_size);
> +	avail_logs = (raw_total - headers_size) / sizeof(*logs);
> +
> +	info_arr = kzalloc_objs(*info_arr, num_headers ?: 1);
> +	if (!info_arr)
> +		return 0;
> +
> +	if (num_headers)
> +		num_entries = build_aggregate_info(xe, (const void *)raw_buf,
> +						   num_headers, logs, avail_logs,
> +						   info_arr);

Please check if this can be less lines.

> +	else
> +		num_entries = build_detailed_info(&counter_resp->counter,
> +						  counter_resp->value,
> +						  logs, avail_logs, info_arr);

Ditto

> +
> +	if (!num_entries) {
> +		kfree(info_arr);
> +		return 0;
> +	}
> +
> +	*info_arr_out = info_arr;
> +	return num_entries;
> +}
> +
> +/**
> + * cper_prepare_info() - Build the CPER error info records from RAS info queue data
> + * @xe: xe device instance
> + * @counter_resp: counter response containing the first embedded chunk
> + * @info_arr: output array of CPER info entries
> + *
> + * Assembles the complete raw info queue data from the first chunk already
> + * embedded in @counter_resp and any additional chunks fetched via
> + * GET_INFO_QUEUE.  Two use cases are supported based on num_headers in
> + * the info queue header:
> + *
> + * Detail error counter (num_headers == 0)::
> + *
> + *   [xe_ras_error_log * N]
> + *
> + *   Returns one xe_cper_info_entry covering up to XE_RAS_NUM_COUNTERS logs.
> + *
> + * Aggregate error counter (num_headers > 0)::
> + *
> + *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
> + *   [xe_ras_error_log * N]
> + *
> + *   Returns one xe_cper_info_entry per header. Each header's @counter
> + *   identifies its error class, and @error_count gives its error count. Up to
> + *   XE_RAS_NUM_COUNTERS xe_ras_error_log entries are associated with each
> + *   header. The header's counter populates the entry's info->counter.
> + *
> + * Returns: Number of entries in @info_arr, or zero if no info queue is
> + *          available or no error info could be built. The caller must free
> + *          @info_arr with free_info_arr() when the return value is nonzero.
> + */
> +static u32
> +cper_prepare_info(struct xe_device *xe,

Less lines?

> +		  const struct xe_ras_get_counter_response *counter_resp,

'response'

> +		  struct xe_cper_info_entry **info_arr)
> +{
> +	u32 buf_size, raw_total, num_entries;
> +	u8 *raw_buf;
> +
> +	buf_size = xe_ras_get_info_queue_size(xe, counter_resp);
> +	if (!buf_size)
> +		return 0;
> +
> +	raw_buf = cper_get_info_queue_buffer(xe, counter_resp, buf_size, &raw_total);
> +	if (!raw_buf) {
> +		xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
> +		return 0;
> +	}
> +
> +	num_entries = cper_build_info_arr(xe, counter_resp, raw_buf, raw_total, info_arr);
> +
> +	kfree(raw_buf);
> +	if (!num_entries) {
> +		xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
> +		return 0;
> +	}
> +
> +	return num_entries;
> +}
> +
>  /**
>   * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
>   * @xe: The &xe_device
> @@ -207,18 +429,47 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
>   * @sigid: Error signature identifier
>   * @response: Counter response returned by firmware
>   *
> - * Build and emit a CPER record from @response.
> + * Build and emit CPER records from @response, including any info queue data.
> + * Must be called from a sleepable context with a runtime PM reference held.

This is not true in if there's only first chunk present, so please drop
this. The code is self explanatory.

>   */
>  void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>  			  const struct xe_ras_get_counter_response *response)
>  {
> -	struct xe_cper_intel_hdr ihdr = {};
> +	struct xe_cper_info_entry *info_arr = NULL, *entries;
> +	struct xe_cper_info_entry single = {};
> +	u32 num_entries, count, i;
>  
>  	xe_assert(xe, is_hw_sigid(sigid));
>  
> -	cper_init_intel_hdr(xe, &response->counter, response->timestamp,
> -			    sigid, response->value, &ihdr);
> -	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
> +	/* Draining the info queue sends sysctrl commands */
> +	might_sleep();
> +	xe_device_assert_mem_access(xe);

This should be where we actually drain the info queue, i.e.
cper_get_info_queue_buffer()

> +	/* Without info queue data, emit a single record from the counter itself */
> +	single.hdr.counter = response->counter;
> +	single.hdr.error_count = response->value;
> +	single.timestamp = response->timestamp;
> +	entries = &single;
> +	count = 1;
> +
> +	num_entries = cper_prepare_info(xe, response, &info_arr);
> +	if (num_entries) {
> +		entries = info_arr;
> +		count = num_entries;
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		struct xe_cper_intel_hdr ihdr = {};
> +
> +		cper_init_intel_hdr(xe, &entries[i].hdr.counter, entries[i].timestamp,
> +				    sigid, entries[i].hdr.error_count,
> +				    entries[i].info_size, &ihdr);
> +
> +		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
> +				 entries[i].info, entries[i].info_size);
> +	}
> +
> +	free_info_arr(info_arr, num_entries);
>  }
>  
>  static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index 68e30df0440e..2502a73bd3f9 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -12,6 +12,11 @@
>  
>  #include "xe_ras_types.h"
>  
> +/* Entries built from RAS error logs carry fixed-size details */
> +#define XE_CPER_RAS_LOG_ENTRY_SIZE \
> +	(offsetof(struct xe_cper_intel_event, metadata) + \
> +	 sizeof_field(struct xe_ras_error_log, details))
> +
>  /*
>   * Validation bits definition for validation_bits in struct
>   * xe_cper_intel_hdr. When set, corresponding fields in header
> @@ -67,14 +72,50 @@ struct xe_cper_intel_hdr {
>  	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
>  	char drv_version[25];
>  	/** @reserved: Reserved for future use, must be zero */
> -	u8 reserved[261];
> +	u8 reserved[258];
> +	/** @info_log_size: Size of xe_cper_intel_info */
> +	u16 info_log_size;
> +	/** @reserved1: Reserved for future use, must be zero */
> +	u8 reserved1;
> +} __packed;
> +
> +/**
> + * struct xe_cper_intel_info - Variable-length Intel-specific CPER error information
> + *
> + * Contains the counter and event queue, and is appended after
> + * &xe_cper_intel_hdr when detailed error information is available.
> + */
> +struct xe_cper_intel_info {
> +	/** @counter: Error class (severity, component, location, cause) */
> +	struct xe_ras_error_class counter;
> +	/** @error_count: Total number of errors recorded */
> +	u32 error_count;
> +	/** @event_queue_size: Total size of @event_queue in bytes */
> +	u32 event_queue_size;
> +	/** @event_queue_count: Number of events in @event_queue */
> +	u32 event_queue_count;
> +	/** @event_queue: Packed array of xe_cper_intel_event records */
> +	u8 event_queue[];
> +} __packed;
> +
> +/**
> + * struct xe_cper_intel_event - Single error event in the CPER event queue
> + */
> +struct xe_cper_intel_event {
> +	/** @size: Byte size of the @metadata payload */
> +	u32 size;
> +	/** @timestamp: &xe_ras_error_log::timestamp */
> +	u64 timestamp;
> +	/** @metadata: &xe_ras_error_log::details */
> +	u8 metadata[];
>  } __packed;
>  
>  /**
>   * struct xe_cper_nonstd_record - Intel GPU CPER record
>   *
>   * Contains the standard CPER record header, section descriptor, and the
> - * Intel error section header.
> + * Intel section header. A &xe_cper_intel_info payload may be
> + * appended dynamically.
>   */
>  struct xe_cper_nonstd_record {
>  	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
> @@ -99,6 +140,20 @@ struct xe_device_guid_entry {
>  	guid_t    guid;
>  };
>  
> +/**
> + * struct xe_cper_info_entry - One CPER info payload and its source counter
> + */
> +struct xe_cper_info_entry {
> +	/** @hdr: Error class and error count used for the CPER section header */
> +	struct xe_ras_info_queue_dynamic_counter_hdr hdr;

Too long, just make it 'xe_ras_dynamic_counter_hdr'.

> +	/** @info: Allocated info payload, NULL if none */
> +	struct xe_cper_intel_info *info;

Use 'einfo' as xe_cper_intel_info variable names...

> +	/** @info_size: Byte size of @info including the event queue */
> +	u32 info_size;

... and 'einfo_size' for its respective size.

> +	/** @timestamp: Timestamp of the first occurrence of this error class */
> +	u64 timestamp;
> +};
> +
>  /**
>   * struct xe_cper - Xe CPER state
>   */
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index c6480a7035f6..621c801b3629 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,7 @@
>  #define XE_RAS_NUM_COUNTERS			16
>  #define XE_RAS_NUM_ERROR_ARR			3
>  #define XE_RAS_NUM_PAGES			25
> +#define XE_RAS_ERROR_DWORDS_MAX			16

Blank line here.

Raag

>  /* Error bits in IEH global error status register */
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>  /* Device memory error categories */
> @@ -171,6 +172,31 @@ struct xe_ras_info_queue_data_response {
>  	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
>  } __packed;
>  
> +/**
> + * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
> + *
> + * When a session requests aggregate counter data, one header per matching
> + * dynamic counter class is prepended to the queue data. The @counter field
> + * identifies the error class, and @error_count is its error count; at most
> + * XE_RAS_NUM_COUNTERS error log entries follow for it.
> + */
> +struct xe_ras_info_queue_dynamic_counter_hdr {
> +	/** @counter: Error class associated with this counter group */
> +	struct xe_ras_error_class counter;
> +	/** @error_count: Error count of this class */
> +	u32 error_count;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_log - Single error log entry following dynamic counter headers
> + */
> +struct xe_ras_error_log {
> +	/** @timestamp: Timestamp when the error was recorded */
> +	u64 timestamp;
> +	/** @details: Error-specific details */
> +	u32 details[XE_RAS_ERROR_DWORDS_MAX];
> +} __packed;
> +
>  /**
>   * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
>   */
> -- 
> 2.56.0
> 

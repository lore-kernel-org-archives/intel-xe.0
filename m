Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB1606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WX5V+LDt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE68610E4E0;
	Fri, 30 Oct 2026 12:16:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C679110E4E0
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793362608; x=1824898608;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gY9u9wj+th0o+CWiHECa/VaVvGncpHaEZvF+QoGcD3U=;
 b=WX5V+LDtz2803rRpGL2sBkDzx874GtNpwXW1DQhcOGk5yZrKa9EI2mAb
 IAdiLJ3S2NDRAK4RZltNwJJ4IbboXkHUflJnD+UGI6pkWxp3YpLW3hYvz
 Y2bM5mEsPwc1nP5oI7EoxlHLMFSkGFbt6faaSKES7UHwS/KZOeUAHfgQG
 4es9s6FwydiRdDHQG2iNus9jgWUy7Qz1ue1V09EyHXSwexPgSQnLQ7QOc
 /yvaddFBeA4OZXOIK/ecaIRXAmcgZ1CbCFacOG+Ew6P1N15/7fJeNasGH
 imFdp4wrhS/uWoRkGg2ld6BzX3LbOmbyQ3zj1S6MU+LUIBRmwWzYsYnDz A==;
X-CSE-ConnectionGUID: x9e9k8rKTOu6Kjs/OZS6Iw==
X-CSE-MsgGUID: eNvv2zmYR2G7uXHmfvp4fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2140091"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2140091"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:16:43 -0700
X-CSE-ConnectionGUID: QNMU/X7yTfSgjjY25DKiCA==
X-CSE-MsgGUID: /ycFf4o9Qiu5u0HRAtuoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5314224"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:16:42 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/cper: Prepare Intel CPER info records
Date: Fri, 30 Oct 2026 17:46:39 +0530
Message-ID: <20261030121636.2488868-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030121636.2488868-4-badal.nilawar@intel.com>
References: <20261030121636.2488868-4-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prepare xe_cper_intel_info records from RAS info queue data. Depending
on the error class type, detail or aggregate, one or more info records
may be generated and embedded in the CPER record.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_cper.c       | 247 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper_types.h |  54 ++++++-
 drivers/gpu/drm/xe/xe_ras_types.h  |  25 +++
 3 files changed, 318 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..910407b92812 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -89,7 +89,7 @@ static u64 cper_timestamp_now(void)
 
 static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
-				struct xe_cper_intel_hdr *ihdr)
+				u32 einfo_size, struct xe_cper_intel_hdr *ihdr)
 {
 	ihdr->counter = *counter;
 	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
@@ -106,6 +106,7 @@ static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_
 	}
 
 	ihdr->error_count = error_count;
+	ihdr->info_log_size = einfo_size;
 
 	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
 	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
@@ -200,6 +201,212 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	kfree(rec);
 }
 
+/* Entries built from RAS error logs carry fixed-size error_details */
+#define XE_CPER_RAS_LOG_ENTRY_SIZE \
+	(offsetof(struct xe_cper_intel_priv_event, metadata) + \
+	 sizeof_field(struct xe_ras_error_log, error_details))
+
+static struct xe_cper_intel_info *
+build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
+	    const struct xe_ras_error_class *ec, u32 error_count)
+{
+	struct xe_cper_intel_priv_event *entry;
+	struct xe_cper_intel_info *einfo;
+	u32 queue_size, i;
+
+	queue_size = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
+	einfo = kzalloc_flex(*einfo, queue, queue_size);
+	if (!einfo)
+		return NULL;
+
+	einfo->error_count        = error_count;
+	einfo->queue_size	  = queue_size;
+	einfo->queue_count        = num_logs;
+	einfo->counter		  = *ec;
+
+	entry = (struct xe_cper_intel_priv_event *)einfo->queue;
+	for (i = 0; i < num_logs; i++) {
+		entry->size       = sizeof_field(struct xe_ras_error_log, error_details);
+		entry->timestamp    = logs[i].timestamp;
+		memcpy(entry->metadata, logs[i].error_details, sizeof(logs[i].error_details));
+		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
+	}
+
+	return einfo;
+}
+
+static void free_einfo_arr(struct xe_cper_einfo_entry *einfo_arr, u32 count)
+{
+	u32 i;
+
+	for (i = 0; i < count; i++)
+		kfree(einfo_arr[i].einfo);
+	kfree(einfo_arr);
+}
+
+static bool fill_einfo_entry(struct xe_cper_einfo_entry *entry,
+			     const struct xe_ras_error_class *counter, u32 count,
+			     const struct xe_ras_error_log *logs, u32 num_logs)
+{
+	entry->einfo = build_einfo(logs, num_logs, counter, count);
+	if (!entry->einfo)
+		return false;
+
+	entry->einfo_size = struct_size(entry->einfo, queue,
+					entry->einfo->queue_size);
+	/* The first log is the first occurrence of the error */
+	entry->timestamp = logs[0].timestamp;
+	entry->hdr.counter = *counter;
+	entry->hdr.count = count;
+	return true;
+}
+
+static u32 build_detail_einfo(const struct xe_ras_error_class *counter, u32 count,
+			      const struct xe_ras_error_log *logs, u32 num_logs,
+			      struct xe_cper_einfo_entry *einfo_arr)
+{
+	/* All logs belong to the queried class; the error count may exceed the logs kept */
+	if (!num_logs)
+		return 0;
+
+	num_logs = min_t(u32, num_logs, XE_RAS_NUM_COUNTERS);
+
+	return fill_einfo_entry(&einfo_arr[0], counter, count, logs, num_logs) ? 1 : 0;
+}
+
+static u32 build_aggregate_einfo(struct xe_device *xe,
+				 const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs,
+				 u32 num_hdrs, const struct xe_ras_error_log *logs,
+				 u32 avail_logs, struct xe_cper_einfo_entry *einfo_arr)
+{
+	u32 log_offset = 0, count = 0, i;
+
+	for (i = 0; i < num_hdrs; i++) {
+		/* @count is the error count; firmware logs at most XE_RAS_NUM_COUNTERS */
+		u32 num_logs = min_t(u32, hdrs[i].count, XE_RAS_NUM_COUNTERS);
+
+		if (num_logs > avail_logs - log_offset) {
+			xe_warn(xe, "CPER: header[%u] claims %u logs but only %u remain\n",
+				i, num_logs, avail_logs - log_offset);
+			break;
+		}
+
+		if (!num_logs)
+			continue;
+
+		if (!fill_einfo_entry(&einfo_arr[count], &hdrs[i].counter, hdrs[i].count,
+				      &logs[log_offset], num_logs))
+			break;
+
+		log_offset += num_logs;
+		count++;
+	}
+
+	return count;
+}
+
+/**
+ * cper_prepare_einfo() - Build the CPER error info records from RAS info queue data
+ * @xe: xe device instance
+ * @counter_resp: counter response containing the first embedded chunk
+ * @counter: RAS error class used to populate the einfo error_class fields
+ * @count_out: output number of entries in the returned array
+ *
+ * Assembles the complete raw info queue data from the first chunk already
+ * embedded in @counter_resp and any additional chunks fetched via
+ * GET_INFO_QUEUE.  Two use cases are supported based on num_headers in
+ * the info queue header:
+ *
+ * Detail error counter (num_headers == 0)::
+ *
+ *   [xe_ras_error_log * N]
+ *
+ *   Returns one xe_cper_einfo_entry covering up to XE_RAS_NUM_COUNTERS logs.
+ *
+ * Aggregate error counter (num_headers > 0)::
+ *
+ *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
+ *   [xe_ras_error_log * N]
+ *
+ *   Returns one xe_cper_einfo_entry per header. Each header's @counter
+ *   identifies its error class, and @count gives its error count. Up to
+ *   XE_RAS_NUM_COUNTERS xe_ras_error_log entries are associated with each
+ *   header, and @counter populates the entry's einfo->error_class.
+ *
+ * Returns: allocated xe_cper_einfo_entry array on success (caller must free it
+ *          with free_einfo_arr()), NULL if no info queue is available or no
+ *          error info could be built. @count_out is set to the number of
+ *          entries in the array, or zero when returning NULL.
+ */
+static struct xe_cper_einfo_entry *
+cper_prepare_einfo(struct xe_device *xe,
+		   const struct xe_ras_get_counter_response *counter_resp,
+		   const struct xe_ras_error_class *counter, u32 *count_out)
+{
+	const struct xe_ras_info_queue_header *first_qhdr = &counter_resp->first.header;
+	struct xe_cper_einfo_entry *einfo_arr = NULL;
+	const struct xe_ras_error_log *logs;
+	u32 buf_size, raw_total, num_headers, headers_size;
+	u32 avail_logs, count = 0;
+	u8 *raw_buf = NULL;
+
+	*count_out = 0;
+	if (!counter_resp->has_info_queue)
+		return NULL;
+
+	if (!first_qhdr->total_size) {
+		xe_warn(xe, "CPER: info queue reports zero total size\n");
+		goto out;
+	}
+
+	if (first_qhdr->total_size > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE)
+		xe_warn(xe, "CPER: info queue size %u exceeds max %u, truncating\n",
+			first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+
+	buf_size = min(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+	raw_buf = kzalloc_objs(*raw_buf, buf_size);
+	if (!raw_buf)
+		goto out;
+
+	raw_total = xe_ras_drain_info_queue_raw(xe, counter_resp, raw_buf, buf_size);
+	if (!raw_total)
+		goto out;
+
+	num_headers = first_qhdr->num_headers;
+	headers_size = num_headers * sizeof(struct xe_ras_info_queue_dynamic_counter_hdr);
+	if (headers_size > raw_total) {
+		xe_warn(xe, "CPER: aggregate headers size (%u) exceeds raw total (%u)\n",
+			headers_size, raw_total);
+		goto out;
+	}
+
+	logs = (const struct xe_ras_error_log *)(raw_buf + headers_size);
+	avail_logs = (raw_total - headers_size) / sizeof(*logs);
+
+	einfo_arr = kzalloc_objs(*einfo_arr, num_headers ?: 1);
+	if (!einfo_arr)
+		goto out;
+
+	if (num_headers)
+		count = build_aggregate_einfo(xe, (const void *)raw_buf, num_headers,
+					      logs, avail_logs, einfo_arr);
+	else
+		count = build_detail_einfo(counter, counter_resp->value,
+					   logs, avail_logs, einfo_arr);
+
+	if (!count) {
+		kfree(einfo_arr);
+		einfo_arr = NULL;
+	}
+out:
+	kfree(raw_buf);
+	*count_out = count;
+	if (!einfo_arr)
+		xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
+
+	return einfo_arr;
+}
+
 /**
  * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
  * @xe: The &xe_device
@@ -208,19 +415,47 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
  * @counter: RAS error class
  * @response: Counter response returned by firmware for @counter
  *
- * Build and emit a CPER record from @response.
+ * Build and emit CPER records from @resp, including any info queue data.
+ * Must be called from a sleepable context with a runtime PM reference held.
  */
 void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response)
 {
-	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_einfo_entry *einfo_arr = NULL, *entries;
+	struct xe_cper_einfo_entry single = {};
+	u32 einfo_count = 0, count, i;
 
 	xe_assert(xe, is_hw_sigid(sigid));
 
-	cper_init_intel_hdr(xe, counter, response->timestamp,
-			    sigid, response->value, &ihdr);
-	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
+	/* Draining the info queue sends sysctrl commands */
+	might_sleep();
+	xe_device_assert_mem_access(xe);
+
+	/* Without info queue data, emit a single record from the counter itself */
+	single.hdr.counter = *counter;
+	single.hdr.count = response->value;
+	single.timestamp = response->timestamp;
+	entries = &single;
+	count = 1;
+
+	einfo_arr = cper_prepare_einfo(xe, response, counter, &einfo_count);
+	if (einfo_arr) {
+		entries = einfo_arr;
+		count = einfo_count;
+	}
+
+	for (i = 0; i < count; i++) {
+		struct xe_cper_intel_hdr ihdr = {};
+
+		cper_init_intel_hdr(xe, &entries[i].hdr.counter, entries[i].timestamp,
+				    sigid, entries[i].hdr.count, entries[i].einfo_size, &ihdr);
+
+		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
+				 entries[i].einfo, entries[i].einfo_size);
+	}
+
+	free_einfo_arr(einfo_arr, einfo_count);
 }
 
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 68e30df0440e..283eb15c870c 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -67,14 +67,50 @@ struct xe_cper_intel_hdr {
 	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
 	char drv_version[25];
 	/** @reserved: Reserved for future use, must be zero */
-	u8 reserved[261];
+	u8 reserved[258];
+	/** @info_log_size: Size of xe_cper_intel_info */
+	u16 info_log_size;
+	/** @reserved1: Reserved for future use, must be zero */
+	u8 reserved1;
+} __packed;
+
+/**
+ * struct xe_cper_intel_info - Variable-length Intel GPU error payload
+ *
+ * Appended after &xe_cper_intel_hdr when detailed error information
+ * is available.
+ */
+struct xe_cper_intel_info {
+	/** @counter: Error class (severity, component, location, cause) */
+	struct xe_ras_error_class counter;
+	/** @error_count: Total number of errors recorded */
+	u32 error_count;
+	/** @queue_size: Total byte size of the @queue array */
+	u32 queue_size;
+	/** @queue_count: Number of entries in @queue */
+	u32 queue_count;
+	/** @queue: Packed array of &xe_cper_intel_priv_event records */
+	u8 queue[];
+} __packed;
+
+/**
+ * struct xe_cper_intel_priv_event - Single event in the event queue
+ */
+struct xe_cper_intel_priv_event {
+	/** @size: Byte size of the @metadata payload */
+	u32 size;
+	/** @timestamp: Timestamp of this event, in firmware ticks */
+	u64 timestamp;
+	/** @metadata: Event-specific payload bytes */
+	u8 metadata[];
 } __packed;
 
 /**
  * struct xe_cper_nonstd_record - Intel GPU CPER record
  *
  * Contains the standard CPER record header, section descriptor, and the
- * Intel error section header.
+ * Intel section header. A &xe_cper_intel_info payload may be
+ * appended dynamically.
  */
 struct xe_cper_nonstd_record {
 	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
@@ -99,6 +135,20 @@ struct xe_device_guid_entry {
 	guid_t    guid;
 };
 
+/**
+ * struct xe_cper_einfo_entry - One CPER error info payload and its source counter
+ */
+struct xe_cper_einfo_entry {
+	/** @hdr: Error class and counter value used for the CPER section header */
+	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
+	/** @einfo: Allocated info payload, NULL if none */
+	struct xe_cper_intel_info *einfo;
+	/** @einfo_size: Byte size of @einfo including the event queue */
+	u32 einfo_size;
+	/** @timestamp: Timestamp of the first occurrence of this error class */
+	u64 timestamp;
+};
+
 /**
  * struct xe_cper - Xe CPER state
  */
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 67d57182aac9..903a122e468e 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -171,6 +171,31 @@ struct xe_ras_info_queue_data_response {
 	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
 } __packed;
 
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * identifies the error class, and @count is its error count; at most
+ * XE_RAS_NUM_COUNTERS error log entries follow for it.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @counter: Error class associated with this counter group */
+	struct xe_ras_error_class counter;
+	/** @count: Error count of this class */
+	u32 count;
+} __packed;
+
+/**
+ * struct xe_ras_error_log - Single error log entry following dynamic counter headers
+ */
+struct xe_ras_error_log {
+	/** @timestamp: Timestamp when the error was recorded */
+	u64 timestamp;
+	/** @error_details: Error-specific details */
+	u32 error_details[16];
+} __packed;
+
 /**
  * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
  */
-- 
2.56.0


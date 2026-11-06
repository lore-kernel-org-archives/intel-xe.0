Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E01606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nn9vJZsS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADE4112FAE;
	Fri,  6 Nov 2026 18:59:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B7A112FAE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793991558; x=1825527558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yALbPFZeA2vGoYVh5LtVKmOeMk7or/bnLsSgZLIdfwc=;
 b=nn9vJZsSn8X5HDp73Z8+avvrtngfbR3sjyqIUKr7H28b8gJR1X41ek4F
 B8v4Fe3aKZzo5dVk+dDEcDDlBTrtPyZW8msJYArXvAhitE8Dv1W5xACSu
 jdV4vcIuu4azuVxgUNfq4K8otHyUkOOpWwzevFpJN9vINmML5tGr8dz4X
 Ff2Pz7dgsYhvqY0YIbtVaoXZSvD8V7QjqxRuvFOrOutFBinkCBPLvOcDF
 zIh4xe9c3ztX/zzGV7qQXYopO65P6LcnZWbIrobNgjqCCof+xJq+GSrJQ
 Hw+YONQUiY30Vrb0aYDG6Z8pyScNjqic+Mh03pJn8cPlYjAeSIGBlN3vu g==;
X-CSE-ConnectionGUID: l3lL7E/8RYWxqQu1WbtSvg==
X-CSE-MsgGUID: aj3r+GeGQeScPnHA5TXH0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2839863"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2839863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:59:17 -0800
X-CSE-ConnectionGUID: U2HQdZW8Tg20ZtwHYFHZ8g==
X-CSE-MsgGUID: FXzewObuTx+bar58RnLR3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7679119"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:59:13 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v6 2/2] drm/xe/cper: Prepare Intel CPER info records
Date: Sat,  7 Nov 2026 00:29:06 +0530
Message-ID: <20261106185903.3570234-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106185903.3570234-4-badal.nilawar@intel.com>
References: <20261106185903.3570234-4-badal.nilawar@intel.com>
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

The RAS info queue contains error logs for detail counters, or dynamic
counter headers followed by error logs for aggregate counters.

Build CPER info records from the queue data, converting each error log
into an CPER event. For aggregate counters, group logs by their dynamic
counter header and build one info record per header.

Emit a CPER record for each generated info record.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v6:
  - Reintroduce event_ prefixes
  - %s/einfo/info/
  - Split cper_prepare_einfo() into queue-fetch and info-array construction helpers (Raag)
  - Rename the dynamic counter header's count field to error_count (Raag)
---
 drivers/gpu/drm/xe/xe_cper.c       | 287 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_cper_types.h |  59 +++++-
 drivers/gpu/drm/xe/xe_ras_types.h  |  26 +++
 3 files changed, 357 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..9e2d4240200e 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -89,7 +89,7 @@ static u64 cper_timestamp_now(void)
 
 static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
-				struct xe_cper_intel_hdr *ihdr)
+				u32 info_size, struct xe_cper_intel_hdr *ihdr)
 {
 	ihdr->counter = *counter;
 	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
@@ -106,6 +106,7 @@ static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_
 	}
 
 	ihdr->error_count = error_count;
+	ihdr->info_log_size = info_size;
 
 	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
 	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
@@ -147,11 +148,11 @@ static void cper_init_record_hdr(struct xe_device *xe, u8 severity,
 
 static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 				   struct cper_section_descriptor *sdesc,
-				   u32 einfo_len)
+				   u32 info_len)
 {
 	sdesc->section_offset   = sizeof(struct cper_record_header) +
 				  sizeof(struct cper_section_descriptor);
-	sdesc->section_length   = sizeof(struct xe_cper_intel_hdr) + einfo_len;
+	sdesc->section_length   = sizeof(struct xe_cper_intel_hdr) + info_len;
 	sdesc->revision         = CPER_SEC_REV;
 	sdesc->validation_bits  = 0;
 	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
@@ -166,14 +167,14 @@ static void cper_init_section_desc(struct xe_device *xe, u8 severity,
 static void cper_record_emit(struct xe_device *xe, u8 severity,
 			     const guid_t *notification_type,
 			     const struct xe_cper_intel_hdr *ihdr,
-			     const void *einfo, u32 einfo_len)
+			     const void *info, u32 info_len)
 {
 	struct cper_section_descriptor *sdesc;
 	struct xe_cper_nonstd_record *rec;
 	struct cper_record_header *rhdr;
 	u32 total_len;
 
-	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
+	total_len = sizeof(struct xe_cper_nonstd_record) + info_len;
 	rec = kzalloc(total_len, GFP_KERNEL);
 	if (!rec)
 		return;
@@ -185,14 +186,14 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	cper_init_record_hdr(xe, severity, notification_type, rhdr, total_len);
 
 	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
-	cper_init_section_desc(xe, severity, sdesc, einfo_len);
+	cper_init_section_desc(xe, severity, sdesc, info_len);
 
 	/* Copy the Intel-specific section header */
 	rec->intel_hdr = *ihdr;
 
 	/* Append optional variable-length error info */
-	if (einfo && einfo_len)
-		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
+	if (info && info_len)
+		memcpy((u8 *)rec + sizeof(*rec), info, info_len);
 
 	trace_xe_error_cper(xe, &rhdr->platform_id, &sdesc->fru_id, severity,
 			    &rec->intel_hdr, total_len, (u8 *)rec);
@@ -200,6 +201,237 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	kfree(rec);
 }
 
+static struct xe_cper_intel_info *
+build_info(const struct xe_ras_error_log *logs, u32 num_logs,
+	   const struct xe_ras_error_class *counter, u32 error_count)
+{
+	struct xe_cper_intel_event *entry;
+	struct xe_cper_intel_info *info;
+	u32 queue_size, i;
+
+	queue_size = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
+	info = kzalloc_flex(*info, event_queue, queue_size);
+	if (!info)
+		return NULL;
+
+	info->error_count        = error_count;
+	info->event_queue_size   = queue_size;
+	info->event_queue_count  = num_logs;
+	info->counter		  = *counter;
+
+	entry = (struct xe_cper_intel_event *)info->event_queue;
+	for (i = 0; i < num_logs; i++) {
+		entry->size       = sizeof_field(struct xe_ras_error_log, details);
+		entry->timestamp    = logs[i].timestamp;
+		memcpy(entry->metadata, logs[i].details, sizeof(logs[i].details));
+		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
+	}
+
+	return info;
+}
+
+static void free_info_arr(struct xe_cper_info_entry *info_arr, u32 num_entries)
+{
+	u32 i;
+
+	for (i = 0; i < num_entries; i++)
+		kfree(info_arr[i].info);
+	kfree(info_arr);
+}
+
+static bool fill_info_entry(struct xe_cper_info_entry *entry,
+			    const struct xe_ras_error_class *counter, u32 error_count,
+			    const struct xe_ras_error_log *logs, u32 num_logs)
+{
+	entry->info = build_info(logs, num_logs, counter, error_count);
+	if (!entry->info)
+		return false;
+
+	entry->info_size = struct_size(entry->info, event_queue,
+				       entry->info->event_queue_size);
+	/* The first log is the first occurrence of the error */
+	entry->timestamp = logs[0].timestamp;
+	entry->hdr.counter = *counter;
+	entry->hdr.error_count = error_count;
+	return true;
+}
+
+static u32 build_detail_info(const struct xe_ras_error_class *counter,
+			     u32 error_count,
+			     const struct xe_ras_error_log *logs, u32 num_logs,
+			     struct xe_cper_info_entry *info_arr)
+{
+	/* All logs belong to the queried class; the error count may exceed the logs kept */
+	if (!num_logs)
+		return 0;
+
+	num_logs = min_t(u32, num_logs, XE_RAS_NUM_COUNTERS);
+
+	return fill_info_entry(&info_arr[0], counter, error_count, logs, num_logs) ? 1 : 0;
+}
+
+static u32 build_aggregate_info(struct xe_device *xe,
+				const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs,
+				u32 num_hdrs, const struct xe_ras_error_log *logs,
+				u32 avail_logs, struct xe_cper_info_entry *info_arr)
+{
+	u32 log_offset = 0, num_entries = 0, i;
+
+	for (i = 0; i < num_hdrs; i++) {
+		u32 num_logs = min_t(u32, hdrs[i].error_count, XE_RAS_NUM_COUNTERS);
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
+		if (!fill_info_entry(&info_arr[num_entries], &hdrs[i].counter,
+				     hdrs[i].error_count, &logs[log_offset], num_logs))
+			break;
+
+		log_offset += num_logs;
+		num_entries++;
+	}
+
+	return num_entries;
+}
+
+static u8 *cper_get_info_queue_buffer(struct xe_device *xe,
+				      const struct xe_ras_get_counter_response *counter_resp,
+				      u32 *raw_total)
+{
+	const struct xe_ras_info_queue_header *first_qhdr = &counter_resp->first.header;
+	u32 buf_size;
+	u8 *raw_buf;
+
+	if (!first_qhdr->total_size) {
+		xe_warn(xe, "CPER: info queue reports zero total size\n");
+		return NULL;
+	}
+
+	if (first_qhdr->total_size > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE)
+		xe_warn(xe, "CPER: info queue size %u exceeds max %u, truncating\n",
+			first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+
+	buf_size = min(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+	raw_buf = kzalloc_objs(*raw_buf, buf_size);
+	if (!raw_buf)
+		return NULL;
+
+	*raw_total = xe_ras_drain_info_queue(xe, counter_resp, raw_buf, buf_size);
+	if (!*raw_total) {
+		kfree(raw_buf);
+		return NULL;
+	}
+
+	return raw_buf;
+}
+
+static struct xe_cper_info_entry *
+cper_build_info_arr(struct xe_device *xe,
+		    const struct xe_ras_get_counter_response *counter_resp,
+		    const struct xe_ras_error_class *counter,
+		    const u8 *raw_buf, u32 raw_total, u32 *num_entries)
+{
+	const struct xe_ras_error_log *logs;
+	struct xe_cper_info_entry *info_arr;
+	u32 num_headers, headers_size, avail_logs;
+
+	num_headers = counter_resp->first.header.num_headers;
+	headers_size = num_headers * sizeof(struct xe_ras_info_queue_dynamic_counter_hdr);
+	if (headers_size > raw_total) {
+		xe_warn(xe, "CPER: aggregate headers size (%u) exceeds raw total (%u)\n",
+			headers_size, raw_total);
+		return NULL;
+	}
+
+	logs = (const struct xe_ras_error_log *)(raw_buf + headers_size);
+	avail_logs = (raw_total - headers_size) / sizeof(*logs);
+
+	info_arr = kzalloc_objs(*info_arr, num_headers ?: 1);
+	if (!info_arr)
+		return NULL;
+
+	if (num_headers)
+		*num_entries = build_aggregate_info(xe, (const void *)raw_buf,
+						    num_headers, logs, avail_logs,
+						    info_arr);
+	else
+		*num_entries = build_detail_info(counter, counter_resp->value,
+						 logs, avail_logs, info_arr);
+
+	if (!*num_entries) {
+		kfree(info_arr);
+		return NULL;
+	}
+
+	return info_arr;
+}
+
+/**
+ * cper_prepare_info() - Build the CPER error info records from RAS info queue data
+ * @xe: xe device instance
+ * @counter_resp: counter response containing the first embedded chunk
+ * @counter: RAS error class used for info record of details counter
+ * @num_entries: output number of entries in the returned array
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
+ *   Returns one xe_cper_info_entry covering up to XE_RAS_NUM_COUNTERS logs.
+ *
+ * Aggregate error counter (num_headers > 0)::
+ *
+ *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
+ *   [xe_ras_error_log * N]
+ *
+ *   Returns one xe_cper_info_entry per header. Each header's @counter
+ *   identifies its error class, and @error_count gives its error count. Up to
+ *   XE_RAS_NUM_COUNTERS xe_ras_error_log entries are associated with each
+ *   header. The header's counter populates the entry's info->counter.
+ *
+ * Returns: allocated xe_cper_info_entry array on success (caller must free it
+ *          with free_info_arr()), NULL if no info queue is available or no
+ *          error info could be built. @num_entries is set to the number of
+ *          entries in the array, or zero when returning NULL.
+ */
+static struct xe_cper_info_entry *
+cper_prepare_info(struct xe_device *xe,
+		  const struct xe_ras_get_counter_response *counter_resp,
+		  const struct xe_ras_error_class *counter, u32 *num_entries)
+{
+	struct xe_cper_info_entry *info_arr = NULL;
+	u32 raw_total;
+	u8 *raw_buf = NULL;
+
+	*num_entries = 0;
+	if (!counter_resp->has_info_queue)
+		return NULL;
+
+	raw_buf = cper_get_info_queue_buffer(xe, counter_resp, &raw_total);
+	if (!raw_buf)
+		goto out;
+
+	info_arr = cper_build_info_arr(xe, counter_resp, counter, raw_buf,
+				       raw_total, num_entries);
+out:
+	kfree(raw_buf);
+	if (!info_arr)
+		xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
+
+	return info_arr;
+}
+
 /**
  * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
  * @xe: The &xe_device
@@ -208,19 +440,48 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
  * @counter: RAS error class
  * @response: Counter response returned by firmware for @counter
  *
- * Build and emit a CPER record from @response.
+ * Build and emit CPER records from @response, including any info queue data.
+ * Must be called from a sleepable context with a runtime PM reference held.
  */
 void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			  const struct xe_ras_error_class *counter,
 			  const struct xe_ras_get_counter_response *response)
 {
-	struct xe_cper_intel_hdr ihdr = {};
+	struct xe_cper_info_entry *info_arr = NULL, *entries;
+	struct xe_cper_info_entry single = {};
+	u32 num_entries = 0, count, i;
 
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
+				single.hdr.error_count = response->value;
+	single.timestamp = response->timestamp;
+	entries = &single;
+	count = 1;
+
+	info_arr = cper_prepare_info(xe, response, counter, &num_entries);
+	if (info_arr) {
+		entries = info_arr;
+		count = num_entries;
+	}
+
+	for (i = 0; i < count; i++) {
+		struct xe_cper_intel_hdr ihdr = {};
+
+		cper_init_intel_hdr(xe, &entries[i].hdr.counter, entries[i].timestamp,
+				    sigid, entries[i].hdr.error_count,
+				    entries[i].info_size, &ihdr);
+
+		cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
+				 entries[i].info, entries[i].info_size);
+	}
+
+	free_info_arr(info_arr, num_entries);
 }
 
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 68e30df0440e..2502a73bd3f9 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -12,6 +12,11 @@
 
 #include "xe_ras_types.h"
 
+/* Entries built from RAS error logs carry fixed-size details */
+#define XE_CPER_RAS_LOG_ENTRY_SIZE \
+	(offsetof(struct xe_cper_intel_event, metadata) + \
+	 sizeof_field(struct xe_ras_error_log, details))
+
 /*
  * Validation bits definition for validation_bits in struct
  * xe_cper_intel_hdr. When set, corresponding fields in header
@@ -67,14 +72,50 @@ struct xe_cper_intel_hdr {
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
+ * struct xe_cper_intel_info - Variable-length Intel-specific CPER error information
+ *
+ * Contains the counter and event queue, and is appended after
+ * &xe_cper_intel_hdr when detailed error information is available.
+ */
+struct xe_cper_intel_info {
+	/** @counter: Error class (severity, component, location, cause) */
+	struct xe_ras_error_class counter;
+	/** @error_count: Total number of errors recorded */
+	u32 error_count;
+	/** @event_queue_size: Total size of @event_queue in bytes */
+	u32 event_queue_size;
+	/** @event_queue_count: Number of events in @event_queue */
+	u32 event_queue_count;
+	/** @event_queue: Packed array of xe_cper_intel_event records */
+	u8 event_queue[];
+} __packed;
+
+/**
+ * struct xe_cper_intel_event - Single error event in the CPER event queue
+ */
+struct xe_cper_intel_event {
+	/** @size: Byte size of the @metadata payload */
+	u32 size;
+	/** @timestamp: &xe_ras_error_log::timestamp */
+	u64 timestamp;
+	/** @metadata: &xe_ras_error_log::details */
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
@@ -99,6 +140,20 @@ struct xe_device_guid_entry {
 	guid_t    guid;
 };
 
+/**
+ * struct xe_cper_info_entry - One CPER info payload and its source counter
+ */
+struct xe_cper_info_entry {
+	/** @hdr: Error class and error count used for the CPER section header */
+	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
+	/** @info: Allocated info payload, NULL if none */
+	struct xe_cper_intel_info *info;
+	/** @info_size: Byte size of @info including the event queue */
+	u32 info_size;
+	/** @timestamp: Timestamp of the first occurrence of this error class */
+	u64 timestamp;
+};
+
 /**
  * struct xe_cper - Xe CPER state
  */
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 67d57182aac9..cec6f8427973 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,7 @@
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_PAGES			25
+#define XE_RAS_ERROR_DWORDS_MAX			16
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 /* Device memory error categories */
@@ -171,6 +172,31 @@ struct xe_ras_info_queue_data_response {
 	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
 } __packed;
 
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * identifies the error class, and @error_count is its error count; at most
+ * XE_RAS_NUM_COUNTERS error log entries follow for it.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @counter: Error class associated with this counter group */
+	struct xe_ras_error_class counter;
+	/** @error_count: Error count of this class */
+	u32 error_count;
+} __packed;
+
+/**
+ * struct xe_ras_error_log - Single error log entry following dynamic counter headers
+ */
+struct xe_ras_error_log {
+	/** @timestamp: Timestamp when the error was recorded */
+	u64 timestamp;
+	/** @details: Error-specific details */
+	u32 details[XE_RAS_ERROR_DWORDS_MAX];
+} __packed;
+
 /**
  * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
  */
-- 
2.56.0


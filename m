Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F4ECA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7810C112058;
	Fri,  9 Oct 2026 10:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKWb5nXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B0E112057
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541772; x=1823077772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JggAqCskX+nduWwSeFJTPde70eJ3BsZKXktZIcMQpx4=;
 b=dKWb5nXd3j0/sqHpaC636dzwHNx0iAWQAcRJzNh4WUAfx35o6akNKv0A
 gz0MzPPyIVHuJWPg89isS64vov5twD3Nvn0dqrau57W0BgqMYTHrk5CNG
 eiqoXd2vobLfYQi9aTmkpC+mvKNN1yfeTsuys3xKHIT+xM123qnj5ijBd
 gHiYIevgAfQxGzQEFHxX2t/qb818fVHepD9rlFGupfqRnmGthNdMHVgQN
 dRwanscrVO82YfM3DokK5GdVECIsbcQFKA+v2pnpjM+Sei4exbTo43hbd
 RrVmzsMImjzHx16+nI9BC2tDDGQR5KVF6y141vfWUwFUOg988I+dzv3CW Q==;
X-CSE-ConnectionGUID: zNdLDGgCTXS/dmLGk4dJmA==
X-CSE-MsgGUID: CypBxpryS5q0726gkIARgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344092"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344092"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:32 -0700
X-CSE-ConnectionGUID: IiqvTSflSeyg9e7uht1CSQ==
X-CSE-MsgGUID: G87HPDUVSqu4+VREEXN0Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025587"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:28 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 06/12] drm/xe/cper: Prepare Intel CPER error info records
Date: Fri,  9 Oct 2026 16:16:09 +0530
Message-ID: <20261009104602.1075405-20-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Prepare xe_cper_sec_intel_error_info records from RAS info queue data.
Depending on the error class type, detail or aggregate, one or more error
info records may be generated and embedded in the CPER record.

Assisted-by: Copilot:Claude-Opus-5.5
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
 - Move struct xe_cper_einfo_entry to xe_cper_types.h (Raag)
 - Use kzalloc_flex()/kzalloc_objs() (Raag)
 - Allocate info queue buffer from reported total size (Raag)
---
 drivers/gpu/drm/xe/xe_cper.c       | 247 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_cper_types.h |  54 ++++++-
 2 files changed, 290 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 1000c78b41e9..7acb503efd11 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -78,16 +78,22 @@ static u64 cper_timestamp_now(void)
 	return ts;
 }
 
+static void fill_cper_error_class(struct xe_cper_error_class *dst,
+				  const struct xe_ras_error_class *src)
+{
+	dst->error_type = src->common.severity;
+	dst->error_component = src->common.component;
+	dst->tile = src->product.unit.tile;
+	dst->instance = src->product.unit.instance;
+	dst->cause = src->product.cause.cause;
+}
+
 static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
 				       const struct xe_ras_error_class *error_class,
 				       u64 first_timestamp, u32 sig_id, u32 error_count,
 				       struct xe_cper_sec_intel_err_hdr *ihdr)
 {
-	ihdr->error_class.error_type = error_class->common.severity;
-	ihdr->error_class.error_component = error_class->common.component;
-	ihdr->error_class.tile = error_class->product.unit.tile;
-	ihdr->error_class.instance = error_class->product.unit.instance;
-	ihdr->error_class.cause = error_class->product.cause.cause;
+	fill_cper_error_class(&ihdr->error_class, error_class);
 	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
 
 	if (first_timestamp) {
@@ -176,11 +182,209 @@ static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
 	kfree(rec);
 }
 
+/* Entries built from RAS error logs carry fixed-size error_details */
+#define XE_CPER_RAS_LOG_ENTRY_SIZE \
+	(offsetof(struct xe_intel_priv_event_entry, metadata) + \
+	 sizeof_field(struct xe_ras_error_log, error_details))
+
+static struct xe_cper_sec_intel_error_info *
+build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
+	    const struct xe_ras_error_class *ec, u32 error_count)
+{
+	u32 queue_len = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
+	struct xe_cper_sec_intel_error_info *einfo;
+	struct xe_intel_priv_event_entry *entry;
+	u32 i;
+
+	einfo = kzalloc_flex(*einfo, event_queue, queue_len);
+	if (!einfo)
+		return NULL;
+
+	einfo->error_count        = error_count;
+	einfo->event_queue_length = queue_len;
+	einfo->event_queue_count  = num_logs;
+	fill_cper_error_class(&einfo->error_class, ec);
+
+	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+	for (i = 0; i < num_logs; i++) {
+		entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
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
+			     const struct xe_ras_info_queue_dynamic_counter_hdr *hdr,
+			     const struct xe_ras_error_log *logs, u32 num_logs)
+{
+	entry->einfo = build_einfo(logs, num_logs, &hdr->error_class, hdr->counter);
+	if (!entry->einfo)
+		return false;
+
+	entry->einfo_size = struct_size(entry->einfo, event_queue,
+					entry->einfo->event_queue_length);
+	/* The first log is the first occurrence of the error */
+	entry->timestamp = logs[0].timestamp;
+	entry->hdr = *hdr;
+	return true;
+}
+
+static u32 build_detail_einfo(const struct xe_ras_error_class *error_class, u32 error_count,
+			      const struct xe_ras_error_log *logs, u32 num_logs,
+			      struct xe_cper_einfo_entry *einfo_arr)
+{
+	/* All logs belong to the queried class; the error count may exceed the logs kept */
+	const struct xe_ras_info_queue_dynamic_counter_hdr hdr = {
+		.error_class = *error_class,
+		.counter = error_count,
+	};
+
+	if (!num_logs)
+		return 0;
+
+	return fill_einfo_entry(&einfo_arr[0], &hdr, logs, num_logs) ? 1 : 0;
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
+		/* @counter is the error count; firmware logs at most XE_RAS_NUM_COUNTERS */
+		u32 num_logs = min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);
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
+		if (!fill_einfo_entry(&einfo_arr[count], &hdrs[i], &logs[log_offset], num_logs))
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
+ * xe_prepare_cper_error_info() - Build the CPER error info records from RAS info queue data
+ * @xe: xe device instance
+ * @counter_resp: counter response containing the first embedded chunk
+ * @error_class: RAS error class used to populate the einfo error_class fields
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
+ *   Returns one xe_cper_einfo_entry covering all N logs.
+ *
+ * Aggregate error counter (num_headers > 0)::
+ *
+ *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
+ *   [xe_ras_error_log * N]
+ *
+ *   Returns one xe_cper_einfo_entry per header.  Each header's @counter field
+ *   is the error count of its class; at most XE_RAS_NUM_COUNTERS
+ *   xe_ras_error_log entries follow it and its @error_class is used to
+ *   populate the entry's einfo->error_class.
+ *
+ * Returns: allocated xe_cper_einfo_entry array on success (caller must free it
+ *          with free_einfo_arr()), NULL if no error info could be built.
+ *          @count_out is set to the number of entries in the array.
+ */
+static struct xe_cper_einfo_entry *
+xe_prepare_cper_error_info(struct xe_device *xe,
+			   const struct xe_ras_get_counter_response *counter_resp,
+			   const struct xe_ras_error_class *error_class,
+			   u32 *count_out)
+{
+	const struct xe_ras_info_queue_header *first_qhdr = &counter_resp->first.header;
+	struct xe_cper_einfo_entry *einfo_arr = NULL;
+	const struct xe_ras_error_log *logs;
+	u32 buf_size, raw_total, num_headers, headers_size;
+	u32 avail_logs, count = 0;
+	u8 *raw_buf = NULL;
+
+	if (!first_qhdr->total_size) {
+		xe_warn(xe, "CPER: info queue reports zero total size\n");
+		goto out;
+	}
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
+		count = build_detail_einfo(error_class, counter_resp->value,
+					   logs, avail_logs, einfo_arr);
+
+	if (!count) {
+		kfree(einfo_arr);
+		einfo_arr = NULL;
+	}
+out:
+	kfree(raw_buf);
+	*count_out = count;
+	return einfo_arr;
+}
+
 static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 				const struct xe_ras_error_class *error_class)
 {
-	struct xe_cper_sec_intel_err_hdr ihdr = {};
+	struct xe_cper_einfo_entry *einfo_arr = NULL, *entries;
 	struct xe_ras_get_counter_response local_resp;
+	struct xe_cper_einfo_entry single = {};
+	u32 einfo_count = 0, count, i;
 
 	/* Fetching the counter sends a sysctrl command */
 	might_sleep();
@@ -191,11 +395,34 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
 		return;
 	}
 
-	xe_cper_init_intel_err_hdr(xe, error_class, local_resp.timestamp,
-				   sigid, local_resp.value, &ihdr);
+	/* Without info queue data, emit a single record from the counter itself */
+	single.hdr.error_class = *error_class;
+	single.hdr.counter = local_resp.value;
+	single.timestamp = local_resp.timestamp;
+	entries = &single;
+	count = 1;
+
+	if (local_resp.has_info_queue) {
+		einfo_arr = xe_prepare_cper_error_info(xe, &local_resp, error_class, &einfo_count);
+		if (einfo_arr) {
+			entries = einfo_arr;
+			count = einfo_count;
+		} else {
+			xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		struct xe_cper_sec_intel_err_hdr ihdr = {};
+
+		xe_cper_init_intel_err_hdr(xe, &entries[i].hdr.error_class, entries[i].timestamp,
+					   sigid, entries[i].hdr.counter, &ihdr);
+
+		xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
+				    entries[i].einfo, entries[i].einfo_size);
+	}
 
-	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
-			    &ihdr, NULL, 0);
+	free_einfo_arr(einfo_arr, einfo_count);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 7612518c9d47..627c7117f23e 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -10,6 +10,8 @@
 #include <linux/types.h>
 #include <linux/uuid.h>
 
+#include "xe_ras_types.h"
+
 /*
  * Validation bits definition for validation_bits in struct
  * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
@@ -91,11 +93,47 @@ struct xe_cper_sec_intel_err_hdr {
 	u8 reserved[5];
 };
 
+/**
+ * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
+ *
+ * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
+ * is available. The @event_queue flexible array holds @event_queue_count
+ * packed &xe_intel_priv_event_entry records.
+ */
+struct xe_cper_sec_intel_error_info {
+	/** @error_class: Error classification */
+	struct xe_cper_error_class error_class;
+	/** @error_count: Total number of errors recorded */
+	u32 error_count;
+	/** @event_queue_length: Total byte size of the @event_queue array */
+	u32 event_queue_length;
+	/** @event_queue_count: Number of entries in @event_queue */
+	u32 event_queue_count;
+	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
+	u8 event_queue[];
+};
+
+/**
+ * struct xe_intel_priv_event_entry - Single error event in the event queue
+ *
+ * Each entry is variable-length; @entry_length gives the byte size of
+ * @metadata only (not including @entry_length or @timestamp).
+ */
+struct xe_intel_priv_event_entry {
+	/** @entry_length: Byte length of the @metadata payload */
+	u32 entry_length;
+	/** @timestamp: Timestamp of this event, in firmware ticks */
+	u64 timestamp;
+	/** @metadata: Event-specific payload bytes */
+	u8  metadata[];
+};
+
 /**
  * struct xe_cper_nonstd_record - Intel GPU CPER record
  *
  * Contains the standard CPER record header, section descriptor, and the
- * Intel error section header.
+ * Intel error section header. A &xe_cper_sec_intel_error_info payload
+ * may be appended dynamically.
  */
 struct xe_cper_nonstd_record {
 	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
@@ -122,4 +160,18 @@ struct xe_platform_id_entry {
 	guid_t    platform_id;
 };
 
+/**
+ * struct xe_cper_einfo_entry - One CPER error info payload and its source counter
+ */
+struct xe_cper_einfo_entry {
+	/** @hdr: Error class and counter value used for the CPER section header */
+	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
+	/** @einfo: Allocated error info payload, NULL if none */
+	struct xe_cper_sec_intel_error_info *einfo;
+	/** @einfo_size: Byte size of @einfo including the event queue */
+	u32 einfo_size;
+	/** @timestamp: Timestamp of the first occurrence of this error class */
+	u64 timestamp;
+};
+
 #endif
-- 
2.54.0


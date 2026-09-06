Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52006C79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DA610E346;
	Sun,  6 Sep 2026 17:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKNa9wbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353C010E1F2
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714575; x=1820250575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T8jojMm4LowDk/MNJ/gamie0xR/axdKSKmmKtSDuvTI=;
 b=HKNa9wbHk6Bqr9X7Y2BrAO4HPWVQXvpfVajb3LPwZsPR6Wa4YNaLQ7aR
 TZ2WhTN2i3GIxxAQBg+2gpMZkJoKofKSefOjAncC7XD84TIjpKtY+4Vmo
 1L/+5nt+pBAhHMP+kvJqIDzrieBbSxCLMAknKbC5OUREC92gG+FxRsTXL
 aihxfU5Sg1U9h68PEvEmtj3NL0QrTC9TyCnbhK1tOA6qABjK6oMRNRjDl
 yJ4k5x2Smm9ZveKkhDQQNvYg9JX7LpwENyLxuDzDWjOpT0qrWIlcl2pWB
 393pBhCsqgXlPsBK3fEgQJEN2dyWXhbIhsMYPHIm1wDNstso0IvYWWiUb g==;
X-CSE-ConnectionGUID: RQluuMezRbuQADjndwdRqw==
X-CSE-MsgGUID: MEACALztRbaVNu0xwK4knA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071448"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:35 -0700
X-CSE-ConnectionGUID: QYcBsKzuSd2UqkAFBx3VxQ==
X-CSE-MsgGUID: pxsQ0LXiTEiWr1/3WB5Xhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996127"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:32 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 06/12] drm/xe/cper: Prepare Intel CPER error info records
Date: Sun,  6 Sep 2026 22:56:11 +0530
Message-ID: <20260906172604.2215987-20-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

Prepare xe_cper_sec_intel_error_info records from RAS
info queue data. Depending on the error class type,
detail or aggregate, one or more error info records
may be generated and embedded in the CPER record.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-opus-4.8
---
v2:
  - Fix sashiko warnings
---
 drivers/gpu/drm/xe/xe_cper.c | 272 +++++++++++++++++++++++++++++++++--
 1 file changed, 263 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 31ca53ce1aa7..ebf4dc4ab2bb 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -173,6 +173,233 @@ static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
 
 	kfree(rec);
 }
+
+/**
+ * struct xe_cper_einfo_entry - One CPER error-info buffer with its byte size
+ * @hdr: dynamic-counter header carrying the per-entry error_class and counter
+ *       value; used by the caller to build a dedicated xe_cper_sec_intel_err_hdr
+ *       for each CPER record
+ * @einfo: allocated error-info payload (caller must kfree)
+ * @einfo_size: byte size of @einfo including any event_queue data
+ * @timestamp: timestamp of first occurrence of dynamic-counter
+ */
+struct xe_cper_einfo_entry {
+	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
+	struct xe_cper_sec_intel_error_info *einfo;
+	u32 einfo_size;
+	u64 timestamp;
+};
+
+static void fill_einfo_error_class(struct xe_cper_sec_intel_error_info *einfo,
+				   const struct xe_ras_error_class *ec)
+{
+	einfo->error_class.error_type      = ec->common.severity;
+	einfo->error_class.error_component = ec->common.component;
+	einfo->error_class.tile            = ec->product.unit.tile;
+	einfo->error_class.instance        = ec->product.unit.instance;
+	einfo->error_class.cause           = ec->product.cause.cause;
+}
+
+static struct xe_cper_sec_intel_error_info *
+build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
+	    const struct xe_ras_error_class *ec, u32 error_count,
+	    u32 *size_out, u64 *ts_out)
+{
+	/*
+	 * Although xe_intel_priv_event_entry has a flexible metadata[] array,
+	 * every entry we emit carries the fixed-length error_details payload
+	 * from xe_ras_error_log, so the per-entry stride is constant here.
+	 */
+	u32 entry_size = offsetof(struct xe_intel_priv_event_entry, metadata) +
+			 sizeof_field(struct xe_ras_error_log, error_details);
+	struct xe_cper_sec_intel_error_info *einfo;
+	struct xe_intel_priv_event_entry *entry;
+	u32 einfo_size = sizeof(*einfo) + num_logs * entry_size;
+	u32 i;
+
+	einfo = kzalloc(einfo_size, GFP_KERNEL);
+	if (!einfo)
+		return NULL;
+
+	einfo->error_count        = error_count;
+	einfo->event_queue_length = num_logs * entry_size;
+	einfo->event_queue_count  = num_logs;
+	fill_einfo_error_class(einfo, ec);
+
+	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+	for (i = 0; i < num_logs; i++) {
+		entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
+		entry->timestamp    = logs[i].timestamp;
+		memcpy(entry->metadata, logs[i].error_details, sizeof(logs[i].error_details));
+		entry = (struct xe_intel_priv_event_entry *)((u8 *)entry + entry_size);
+	}
+
+	*size_out = einfo_size;
+	*ts_out   = logs[0].timestamp;
+	return einfo;
+}
+
+static void free_einfo_arr(struct xe_cper_einfo_entry *einfo_arr, u32 count)
+{
+	u32 i;
+
+	if (!einfo_arr)
+		return;
+
+	for (i = 0; i < count; i++)
+		kfree(einfo_arr[i].einfo);
+	kfree(einfo_arr);
+}
+
+/**
+ * xe_prepare_cper_error_info - Build the CPER error info records from RAS info queue data
+ * @xe: xe device instance
+ * @counter_resp: counter response containing the first embedded chunk
+ * @error_class: RAS error class used to populate the einfo error_class fields
+ * @einfo_size_out: output size of the allocated einfo buffer
+ *
+ * Assembles the complete raw info queue data from the first chunk already
+ * embedded in @counter_resp and any additional chunks fetched via
+ * GET_INFO_QUEUE_DATA.  Two use cases are supported based on num_headers in
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
+ *   gives the number of consecutive xe_ras_error_log entries belonging to it
+ *   and its @error_class is used to populate the entry's einfo->error_class.
+ *
+ * Returns: allocated xe_cper_einfo_entry array on success (caller must kfree
+ *          each entry's einfo then kfree the array), NULL on failure.
+ *          @count_out is set to the number of entries in the array.
+ */
+static struct xe_cper_einfo_entry *
+xe_prepare_cper_error_info(struct xe_device *xe,
+			   const struct xe_ras_get_counter_response *counter_resp,
+			   const struct xe_ras_error_class *error_class,
+			   u32 *count_out)
+{
+	const struct xe_ras_info_queue_header *first_qhdr =
+		&counter_resp->info_queue.queue_header;
+	struct xe_cper_einfo_entry *einfo_arr;
+	u32 num_headers, headers_size;
+	u32 raw_total;
+	u8 *raw_buf;
+	u32 i;
+
+	raw_buf = kzalloc(XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE, GFP_KERNEL);
+	if (!raw_buf)
+		return NULL;
+
+	raw_total = xe_ras_drain_info_queue_raw(xe, counter_resp, raw_buf,
+						XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+	if (!raw_total) {
+		kfree(raw_buf);
+		return NULL;
+	}
+
+	num_headers  = first_qhdr->num_headers;
+	headers_size = num_headers * sizeof(struct xe_ras_info_queue_dynamic_counter_hdr);
+
+	if (headers_size > raw_total) {
+		xe_warn(xe, "[RAS]: CPER: aggregate headers size (%u) exceeds raw total (%u)\n",
+			headers_size, raw_total);
+		kfree(raw_buf);
+		return NULL;
+	}
+
+	if (num_headers == 0) {
+		/* Detailed counter case: single einfo covering all log entries */
+		u32 num_logs = raw_total / sizeof(struct xe_ras_error_log);
+		const struct xe_ras_error_log *logs =
+			(const struct xe_ras_error_log *)raw_buf;
+		struct xe_cper_sec_intel_error_info *einfo;
+
+		if (!num_logs) {
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		einfo_arr = kzalloc_objs(*einfo_arr, 1, GFP_KERNEL);
+		if (!einfo_arr) {
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		einfo = build_einfo(logs, num_logs, error_class, counter_resp->value,
+				    &einfo_arr[0].einfo_size, &einfo_arr[0].timestamp);
+		if (!einfo) {
+			kfree(einfo_arr);
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		einfo_arr[0].hdr.error_class = *error_class;
+		einfo_arr[0].hdr.counter     = counter_resp->value;
+		einfo_arr[0].einfo           = einfo;
+		*count_out = 1;
+
+	} else {
+		/* Aggregate conter case: one einfo per dynamic-counter header */
+		const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs =
+			(const struct xe_ras_info_queue_dynamic_counter_hdr *)raw_buf;
+		const struct xe_ras_error_log *all_logs =
+			(const struct xe_ras_error_log *)(raw_buf + headers_size);
+		u32 avail_logs = (raw_total - headers_size) / sizeof(struct xe_ras_error_log);
+		u32 log_offset = 0;
+		u32 einfo_count = 0;
+
+		einfo_arr = kzalloc_objs(*einfo_arr, num_headers, GFP_KERNEL);
+		if (!einfo_arr) {
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		for (i = 0; i < num_headers; i++) {
+			u32 num_logs = min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);
+			struct xe_cper_sec_intel_error_info *einfo;
+
+			if (log_offset + num_logs > avail_logs) {
+				xe_warn(xe, "[RAS]: CPER: header[%u] claims %u logs but only %u remain\n",
+					i, num_logs, avail_logs - log_offset);
+				break;
+			}
+
+			if (!num_logs)
+				continue;
+
+			einfo = build_einfo(&all_logs[log_offset], num_logs,
+					    &hdrs[i].error_class, num_logs,
+					    &einfo_arr[einfo_count].einfo_size,
+					    &einfo_arr[einfo_count].timestamp);
+			if (!einfo) {
+				free_einfo_arr(einfo_arr, einfo_count);
+				kfree(raw_buf);
+				return NULL;
+			}
+
+			einfo_arr[einfo_count].hdr   = hdrs[i];
+			einfo_arr[einfo_count].einfo = einfo;
+			log_offset += num_logs;
+			einfo_count++;
+		}
+
+		*count_out = einfo_count;
+	}
+
+	kfree(raw_buf);
+	return einfo_arr;
+}
+
 /**
  * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
  * @pdev: PCI device associated with the Xe device
@@ -191,6 +418,9 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
 	struct xe_ras_get_counter_response local_resp = {};
 	struct xe_ras_get_counter_response *counter_response = response;
 	struct xe_cper_sec_intel_err_hdr ihdr = {};
+	struct xe_cper_einfo_entry *einfo_arr = NULL;
+	u32 einfo_count = 0;
+	u32 i;
 
 	if (!xe)
 		return;
@@ -209,15 +439,39 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
 		}
 	}
 
-	xe_cper_init_intel_err_hdr(xe,
-				   (const u8 *)counter,
-				   counter_response->timestamp,
-				   sigid,
-				   counter_response->value,
-				   &ihdr);
+	if (counter_response->has_info_queue) {
+		einfo_arr = xe_prepare_cper_error_info(xe, counter_response, counter, &einfo_count);
+		if (!einfo_arr)
+			xe_err(xe, "[RAS]: CPER: failed to build einfo from info queue\n");
+	}
+
+	if (einfo_count > 0) {
+		for (i = 0; i < einfo_count; i++) {
+			struct xe_cper_sec_intel_err_hdr entry_ihdr = {};
 
-	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
-			    &ihdr, NULL, 0);
+			xe_cper_init_intel_err_hdr(xe,
+						   (const u8 *)&einfo_arr[i].hdr.error_class,
+						   einfo_arr[i].timestamp,
+						   sigid, einfo_arr[i].hdr.counter,
+						   &entry_ihdr);
+
+			xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
+					    &entry_ihdr, einfo_arr[i].einfo,
+					    einfo_arr[i].einfo_size);
+		}
+	} else {
+		xe_cper_init_intel_err_hdr(xe,
+					   (const u8 *)counter,
+					   counter_response->timestamp,
+					   sigid, counter_response->value, &ihdr);
+
+		xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
+				    &ihdr, NULL, 0);
+	}
+
+	if (einfo_arr) {
+		free_einfo_arr(einfo_arr, einfo_count);
+		einfo_arr = NULL;
+	}
 
-	/* TODO */
 }
-- 
2.54.0


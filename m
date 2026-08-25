Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD68C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E902010EB28;
	Tue, 25 Aug 2026 17:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfQ3rGUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6039B10EB28
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679767; x=1819215767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzNFmXam/+2DcSzMUH501CWhEaQGjBxjF+TQ/tkNBn8=;
 b=WfQ3rGUYNdEvX3/xtjhMKlqNM2mGcNnQNA5xpgkgROUOANozP936OTAf
 R0eca8M4cgF0OF2LkI4i6XmkFbIGB7LApY2TTovl6sxCROQW6XwfjjLrZ
 i+DrrPxO1T0SWvB7yblHbN9TbUQ2173lyyZoG7mJFYcpHkawuKFyrFgpL
 aQCSVERb9sHaHXyp2Izuvkp1AARDFjLEtMBomUWAHDDKEs7TBiJPPBMKa
 ZyVqVAaWwPuOeFr50q55SHVs21jHpoRqQYIa6h+eSbd2EcGt3DAkTYUm2
 QWZ4qxR/7U0X0jeFWFAvfIerUycyvNmEWqE9wIviUVo4gGh0lZosH4bGs w==;
X-CSE-ConnectionGUID: hlsMftMeTUeeVPOn0Nl3Eg==
X-CSE-MsgGUID: HLFOFmzIT5eeFirSmO0Oqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210814"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210814"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:47 -0700
X-CSE-ConnectionGUID: rTWMUkrETS6VMWuWxKAxoA==
X-CSE-MsgGUID: kbnrGUzRQym4CzQuXb3esw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585102"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:44 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 05/11] drm/xe/cper: Prepare Intel CPER error info from info
 queue
Date: Tue, 25 Aug 2026 23:29:22 +0530
Message-ID: <20260825175916.1103841-18-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add prepare_cper_error_info() to xe_ras.c which assembles the raw info
queue data embedded in a GET_COUNTER response (and any subsequent chunks
fetched via GET_INFO_QUEUE_DATA) into a xe_cper_sec_intel_error_info
that can be passed directly to cper logging function.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_ras.c | 278 ++++++++++++++++++++++++++++++++++++
 1 file changed, 278 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index e913235e9cce..27c78800b5d2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,8 +3,11 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_cper.h"
+#include "xe_cper_types.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
+#include "xe_device_types.h"
 #include "xe_drm_ras.h"
 #include "xe_log.h"
 #include "xe_pm.h"
@@ -471,6 +474,281 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 	return 0;
 }
 
+static int get_info_queue_data(struct xe_device *xe,
+			       const struct xe_ras_get_info_queue_data_request *req,
+			       struct xe_ras_get_info_queue_data_response *out);
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
+/**
+ * prepare_cper_error_info - Assemble info queue chunks and convert to CPER einfo
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
+prepare_cper_error_info(struct xe_device *xe,
+			const struct xe_ras_get_counter_response *counter_resp,
+			const struct xe_ras_error_class *error_class,
+			u32 *count_out)
+{
+	const struct xe_ras_info_queue_header *first_qhdr =
+		&counter_resp->info_queue.queue_header;
+	struct xe_ras_get_info_queue_data_request iq_req = {0};
+	struct xe_ras_get_info_queue_data_response iq_response = {0};
+	struct xe_cper_einfo_entry *einfo_arr;
+	u32 num_headers, headers_size;
+	u32 raw_total, iq_offset = 0;
+	u32 entry_size;
+	u8 *raw_buf;
+	u32 i;
+
+	raw_buf = kzalloc(XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE, GFP_KERNEL);
+	if (!raw_buf)
+		return NULL;
+
+	/* Copy first chunk already embedded in the counter response */
+	if (first_qhdr->chunk_size &&
+	    first_qhdr->chunk_offset + first_qhdr->chunk_size <=
+	    XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {
+		memcpy(raw_buf + first_qhdr->chunk_offset,
+		       counter_resp->info_queue.queue_data,
+		       first_qhdr->chunk_size);
+		iq_offset = first_qhdr->chunk_size;
+	}
+
+	/* Fetch any remaining chunks */
+	if (first_qhdr->flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) {
+		iq_req.source_command			= XE_SYSCTRL_CMD_GET_COUNTER;
+		iq_req.source_context			= counter_resp->counter;
+		iq_req.queue_request.requested_size	= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE;
+		iq_req.queue_request.session_id		= counter_resp->counter;
+
+		do {
+			struct xe_ras_info_queue_header *qhdr;
+			u32 end;
+
+			iq_req.queue_request.requested_offset = iq_offset;
+
+			if (get_info_queue_data(xe, &iq_req, &iq_response))
+				break;
+
+			qhdr = &iq_response.queue_response.queue_header;
+			end  = qhdr->chunk_offset + qhdr->chunk_size;
+
+			if (end > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {
+				xe_warn(xe, "[RAS]: CPER: info queue chunk out of bounds (offset=%u size=%u)\n",
+					qhdr->chunk_offset, qhdr->chunk_size);
+				break;
+			}
+
+			memcpy(raw_buf + qhdr->chunk_offset,
+			       iq_response.queue_response.queue_data,
+			       qhdr->chunk_size);
+
+			if (!qhdr->chunk_size)
+				break;
+
+			iq_offset += qhdr->chunk_size;
+		} while (iq_response.queue_response.queue_header.flags &
+			 XE_RAS_INFO_QUEUE_FLAG_MORE_DATA);
+	}
+
+	raw_total = first_qhdr->total_size
+		  ? min(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE)
+		  : iq_offset;
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
+	/*
+	 * entry_size is constant for every xe_intel_priv_event_entry:
+	 *   entry_length (u32) + timestamp (u64) + metadata[] (error_details)
+	 */
+	entry_size = offsetof(struct xe_intel_priv_event_entry, metadata) +
+		     sizeof_field(struct xe_ras_error_log, error_details);
+
+	if (num_headers == 0) {
+		/* Detail case: single einfo covering all log entries */
+		u32 num_logs = raw_total / sizeof(struct xe_ras_error_log);
+		struct xe_cper_sec_intel_error_info *einfo;
+		struct xe_intel_priv_event_entry *entry;
+		const struct xe_ras_error_log *logs;
+		u32 einfo_size;
+
+		if (!num_logs) {
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		einfo_arr = kzalloc(sizeof(*einfo_arr), GFP_KERNEL);
+		if (!einfo_arr) {
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		einfo_size = sizeof(*einfo) + num_logs * entry_size;
+		einfo = kzalloc(einfo_size, GFP_KERNEL);
+		if (!einfo) {
+			kfree(einfo_arr);
+			kfree(raw_buf);
+			return NULL;
+		}
+
+		einfo->error_count        = counter_resp->value;
+		einfo->event_queue_length = num_logs * entry_size;
+		einfo->event_queue_count  = num_logs;
+		einfo->error_class.error_type		= error_class->common.severity;
+		einfo->error_class.error_component	= error_class->common.component;
+		einfo->error_class.tile			= error_class->product.unit.tile;
+		einfo->error_class.instance		= error_class->product.unit.instance;
+		einfo->error_class.cause		= error_class->product.cause.cause;
+
+		logs  = (const struct xe_ras_error_log *)raw_buf;
+		entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+
+		for (i = 0; i < num_logs; i++) {
+			entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
+			entry->timestamp    = logs[i].timestamp;
+			memcpy(entry->metadata, logs[i].error_details,
+			       sizeof(logs[i].error_details));
+			entry = (struct xe_intel_priv_event_entry *)((u8 *)entry + entry_size);
+		}
+
+		einfo_arr[0].hdr.error_class = *error_class;
+		einfo_arr[0].hdr.counter     = counter_resp->value;
+		einfo_arr[0].einfo           = einfo;
+		einfo_arr[0].einfo_size      = einfo_size;
+		einfo_arr[0].timestamp       = logs[0].timestamp;
+		*count_out = 1;
+
+	} else {
+		/* Aggregate case: one einfo per dynamic-counter header */
+		const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs =
+			(const struct xe_ras_info_queue_dynamic_counter_hdr *)raw_buf;
+		const struct xe_ras_error_log *all_logs =
+			(const struct xe_ras_error_log *)(raw_buf + headers_size);
+		u32 avail_logs = (raw_total - headers_size) / sizeof(struct xe_ras_error_log);
+		u32 log_offset = 0;
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
+			struct xe_intel_priv_event_entry *entry;
+			u32 einfo_size;
+			u32 j;
+
+			if (log_offset + num_logs > avail_logs) {
+				xe_warn(xe, "[RAS]: CPER: header[%u] claims %u logs but only %u remain\n",
+					i, num_logs, avail_logs - log_offset);
+				break;
+			}
+
+			if (!num_logs) {
+				log_offset += num_logs;
+				continue;
+			}
+
+			einfo_size = sizeof(*einfo) + num_logs * entry_size;
+			einfo = kzalloc(einfo_size, GFP_KERNEL);
+			if (!einfo) {
+				u32 k;
+
+				for (k = 0; k < i; k++)
+					kfree(einfo_arr[k].einfo);
+				kfree(einfo_arr);
+				kfree(raw_buf);
+				return NULL;
+			}
+
+			einfo->error_count		= num_logs;
+			einfo->event_queue_length	= num_logs * entry_size;
+			einfo->event_queue_count	= num_logs;
+			einfo->error_class.error_type	= hdrs[i].error_class.common.severity;
+			einfo->error_class.tile		= hdrs[i].error_class.product.unit.tile;
+			einfo->error_class.instance	= hdrs[i].error_class.product.unit.instance;
+			einfo->error_class.cause	= hdrs[i].error_class.product.cause.cause;
+			einfo->error_class.error_component = hdrs[i].error_class.common.component;
+
+			entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+			for (j = 0; j < num_logs; j++) {
+				const struct xe_ras_error_log *log = &all_logs[log_offset + j];
+
+				entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
+				entry->timestamp    = log->timestamp;
+				memcpy(entry->metadata, log->error_details,
+				       sizeof(log->error_details));
+				entry = (struct xe_intel_priv_event_entry *)((u8 *)entry + entry_size);
+
+				if (j == 0)
+					einfo_arr[i].timestamp  = log->timestamp;
+			}
+
+			einfo_arr[i].hdr        = hdrs[i];
+			einfo_arr[i].einfo      = einfo;
+			einfo_arr[i].einfo_size = einfo_size;
+			log_offset += num_logs;
+		}
+
+		*count_out = i;
+	}
+
+	kfree(raw_buf);
+	return einfo_arr;
+}
+
 /**
  * xe_ras_process_errors() - Process and contain hardware errors
  * @xe: xe device instance
-- 
2.54.0


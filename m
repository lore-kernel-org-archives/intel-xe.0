Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD3C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690910F2CD;
	Thu,  2 Jul 2026 11:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AX+vAnDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E68D10F2CD
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990185; x=1814526185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lsgAXgVBAYCCrj+pLaKtE6rgEQtQmZzDAwcDxHHMF0=;
 b=AX+vAnDGkzQon7B1dDyKhlCT+905qbqs2O67mdjA5tN2Wd85BTmLWW9e
 TonLzPbEX4KQyjd/6KlX9mSZGAV078GHHvonMxF8betQA9mCxlBspvmhB
 /cWNNuK3KYOVptAFrDhQW/ALqcezn0Y5GlqmrB6R6N5mQtwSFtmbXV2Im
 UtXvxdfE2KSEgtVAOgfz6WdV3s6vF2vvGqekyvRdknI6caAUV/Hmtafg7
 q2RNYsOVz1iSvve88QxjYWjhykKMy5UGrqy65nvxpqHyUbRni6OIppcuo
 xO8gBbUGtPn5PQKXnuYUzSnEPoy4MF8pEtbcmU5AazZAxqNehDSn+bZYb g==;
X-CSE-ConnectionGUID: 6QSiI8zBRZamA3kg+ZXN3A==
X-CSE-MsgGUID: 22W4eqROS5mYs5tyZNmRZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852902"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:03:05 -0700
X-CSE-ConnectionGUID: D5Q/4JaTThGYK2rQDrUzkw==
X-CSE-MsgGUID: GsEbBw8gTzy9fedcWTbXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738824"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:03:02 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 6/7] drm/xe/cper: Prepare Intel CPER error info from info
 queue
Date: Thu,  2 Jul 2026 16:44:08 +0530
Message-ID: <20260702111401.3680214-15-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c | 142 +++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index e594d4d3a23f..8579cde6a4bf 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_cper.h"
+#include "xe_cper_types.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
 #include "xe_pm.h"
@@ -218,7 +220,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 	if (ret)
 		return ret;
 
-	*value = response.counter_value;
+	*value = response.value;
 	return 0;
 }
 
@@ -311,6 +313,144 @@ static int get_info_queue_data(struct xe_device *xe,
 	return 0;
 }
 
+/**
+ * prepare_cper_error_info - Assemble info queue chunks and convert to CPER einfo
+ * @xe: xe device instance
+ * @counter_resp: counter response containing the first embedded chunk
+ * @error_class: RAS error class used to populate the einfo error_class fields
+ * @einfo_size_out: output size of the allocated einfo buffer
+ *
+ * Assembles the complete raw info queue data from the first chunk already
+ * embedded in @counter_resp and any additional chunks fetched via
+ * GET_INFO_QUEUE_DATA.  The raw data layout is:
+ *
+ *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
+ *   [xe_ras_error_log * N]
+ *
+ * Each xe_ras_error_log is translated into an xe_intel_priv_event_entry and
+ * appended to the returned xe_cper_sec_intel_error_info.event_queue[].
+ *
+ * Returns: allocated einfo on success (caller must kfree()), NULL on failure.
+ */
+static struct xe_cper_sec_intel_error_info *
+prepare_cper_error_info(struct xe_device *xe,
+			       const struct xe_ras_get_counter_response *counter_resp,
+			       const struct xe_ras_error_class *error_class,
+			       u32 *einfo_size_out)
+{
+	const struct xe_ras_info_queue_header *first_qhdr =
+		&counter_resp->info_queue.queue_header;
+	struct xe_ras_get_info_queue_data_request iq_req = {0};
+	struct xe_ras_get_info_queue_data_response iq_response = {0};
+	struct xe_cper_sec_intel_error_info *einfo;
+	struct xe_intel_priv_event_entry *entry;
+	const struct xe_ras_error_log *logs;
+	u32 entry_size, einfo_size;
+	u32 num_logs;
+	u32 raw_total, iq_offset = 0;
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
+	num_logs = raw_total / sizeof(struct xe_ras_error_log);
+	if (!num_logs) {
+		kfree(raw_buf);
+		return NULL;
+	}
+
+	/*
+	 * Each xe_intel_priv_event_entry holds:
+	 *   entry_length (u32) + timestamp (u64) + metadata[] (error_details)
+	 */
+	entry_size = offsetof(struct xe_intel_priv_event_entry, metadata) +
+		     sizeof_field(struct xe_ras_error_log, error_details);
+	einfo_size = sizeof(*einfo) + num_logs * entry_size;
+
+	einfo = kzalloc(einfo_size, GFP_KERNEL);
+	if (!einfo) {
+		kfree(raw_buf);
+		return NULL;
+	}
+
+	einfo->error_count        = counter_resp->value;
+	einfo->event_queue_length = num_logs * entry_size;
+	einfo->event_queue_count  = num_logs;
+	einfo->error_class.error_type		= error_class->common.severity;
+	einfo->error_class.error_component	= error_class->common.component;
+	einfo->error_class.tile			= error_class->product.unit.tile;
+	einfo->error_class.instance		= error_class->product.unit.instance;
+	einfo->error_class.cause		= error_class->product.cause.cause;
+
+	logs  = (const struct xe_ras_error_log *)raw_buf;
+	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+
+	for (i = 0; i < num_logs; i++) {
+		entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
+		entry->timestamp    = logs[i].timestamp;
+		memcpy(entry->metadata, logs[i].error_details,
+		       sizeof(logs[i].error_details));
+		entry = (struct xe_intel_priv_event_entry *)((u8 *)entry + entry_size);
+	}
+
+	kfree(raw_buf);
+	*einfo_size_out = einfo_size;
+	return einfo;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
-- 
2.54.0


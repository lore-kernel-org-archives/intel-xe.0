Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B113EC79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A4510E108;
	Sun,  6 Sep 2026 17:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSaR49eO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D614C10E108
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714572; x=1820250572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K4seNtsGb6NECwVcK5+1D8MOOaATz53fVFWAAgNG7lQ=;
 b=aSaR49eO4xsv0DRvPTYc8LhLPyy5W/ZsZmYoLaTjKuAJ6AxcJ710qJLO
 MVGCFu/FnECtRHIdqcEDTPxTXoQAJVsCvG1yXpfg3myuPB9Vn4zf67+OH
 3ITW8AqvXAlfRCwFU2+0Su06H0D03VMd0AeAfAAgji7fm75PTe7sRSPDM
 P/abHIT8qcbWl9cghPvYDszslCo2kkY9Kg5/VgDBaJxxPoEWdASMognux
 AUvnWrVqN2RVyujv65D/TRdP6cYfoTBe1ZPRXOtcovgcW7gwoxt1YSwCk
 DuwdnwPLobEczzBKNeiRIwakOERQWkHHKEhngdcYHmlX00qOQDJecJIT9 g==;
X-CSE-ConnectionGUID: JL7vWJwqQjiqWzqkqdUuIQ==
X-CSE-MsgGUID: zMgilG28QQqeYGLGLobUHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071447"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071447"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:32 -0700
X-CSE-ConnectionGUID: wUysG3zdS6O8A1Zgrg9H4w==
X-CSE-MsgGUID: x1YcWp4VRaGsNXvzUejjrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996124"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:29 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 05/12] drm/xe/xe_ras: Add support to retrieve info queue
 data for CRI
Date: Sun,  6 Sep 2026 22:56:10 +0530
Message-ID: <20260906172604.2215987-19-badal.nilawar@intel.com>
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

Retrieve the RAS info queue data, in multiple chunks, and assemble
it into flat raw buffer. Follow up patch will use this data to
prepare cper error info.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-opus-4.8
---
 drivers/gpu/drm/xe/xe_ras.c                   | 139 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 ++++++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 260 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0fb9065cdd76..7e3e62750448 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -797,6 +797,145 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 	return 0;
 }
 
+static int get_info_queue_data(struct xe_device *xe,
+			       const struct xe_ras_get_info_queue_data_request *req,
+			       struct xe_ras_get_info_queue_data_response *out)
+{
+	struct xe_ras_get_info_queue_data_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
+				  XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA,
+				  (void *)req, sizeof(*req), &response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
+	       response.operation_status,
+	       response.queue_response.queue_header.chunk_size,
+	       response.queue_response.queue_header.flags);
+
+	*out = response;
+	return 0;
+}
+
+/**
+ * xe_ras_drain_info_queue_raw - Drain the full RAS info queue into a flat buffer.
+ * @xe: xe device
+ * @counter_resp: counter response carrying the first embedded chunk and the
+ *                counter identifier used as the source context for subsequent
+ *                GET_INFO_QUEUE_DATA fetches
+ * @raw_buf: destination buffer supplied by the caller
+ * @raw_buf_size: size of @raw_buf in bytes; also caps the total amount of data
+ *                assembled from the info queue
+ *
+ * Copies the first chunk already embedded in @counter_resp, then loops
+ * issuing GET_INFO_QUEUE_DATA to fetch any remaining chunks until the queue
+ * signals no more data or a transport/bounds error is encountered.  On
+ * transport or bounds errors the function stops and returns whatever has
+ * been assembled so far.
+ *
+ * Returns: number of valid bytes written into @raw_buf.  Zero if @raw_buf is
+ *          NULL or @raw_buf_size is 0.
+ */
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *raw_buf, u32 raw_buf_size)
+{
+	const struct xe_ras_info_queue_header *first_qhdr =
+		&counter_resp->info_queue.queue_header;
+	struct xe_ras_get_info_queue_data_request iq_req = {0};
+	struct xe_ras_get_info_queue_data_response iq_response = {0};
+	u32 iq_offset = 0;
+	u32 end;
+	bool complete = true;
+
+	if (!raw_buf || !raw_buf_size)
+		return 0;
+
+	/* Copy first chunk already embedded in the counter response */
+	if (first_qhdr->chunk_size &&
+	    first_qhdr->chunk_size <= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
+	    !check_add_overflow(first_qhdr->chunk_offset, first_qhdr->chunk_size, &end) &&
+	    end <= XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <= raw_buf_size) {
+		memcpy(raw_buf + first_qhdr->chunk_offset,
+		       counter_resp->info_queue.queue_data, first_qhdr->chunk_size);
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
+			if (get_info_queue_data(xe, &iq_req, &iq_response)) {
+				complete = false;
+				xe_err(xe,
+				       "[RAS]: info queue drain aborted: fetch at offset=%u failed\n",
+				       iq_offset);
+				break;
+			}
+
+			qhdr = &iq_response.queue_response.queue_header;
+
+			if (!qhdr->chunk_size) {
+				complete = false;
+				break;
+			}
+
+			if (qhdr->chunk_size > XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE) {
+				complete = false;
+				xe_warn(xe,
+					"[RAS]: CPER: invalid chunk size %u\n", qhdr->chunk_size);
+				break;
+			}
+
+			if (check_add_overflow(qhdr->chunk_offset, qhdr->chunk_size, &end) ||
+			    end > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE || end > raw_buf_size) {
+				complete = false;
+				xe_warn(xe,
+					"[RAS]: info queue chunk out of bounds (offset=%u size=%u)\n",
+					qhdr->chunk_offset, qhdr->chunk_size);
+				break;
+			}
+
+			memcpy(raw_buf + qhdr->chunk_offset,
+			       iq_response.queue_response.queue_data,
+			       qhdr->chunk_size);
+
+			iq_offset += qhdr->chunk_size;
+		} while (iq_response.queue_response.queue_header.flags &
+			 XE_RAS_INFO_QUEUE_FLAG_MORE_DATA);
+	}
+
+	if (!complete)
+		return iq_offset;
+
+	return first_qhdr->total_size
+	       ? min3(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE, raw_buf_size)
+	       : iq_offset;
+}
+
 static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct xe_ras_get_health_response response = {0};
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index e83e022cd363..d31e093c0fe9 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -23,5 +23,8 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *out);
 bool xe_ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter);
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *raw_buf, u32 raw_buf_size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index fe6f3658a2a4..44fa5136cd81 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -16,6 +16,10 @@
 #define XE_RAS_MEMORY_DB_ECC			BIT(1)
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
+#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE	0x01
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -95,6 +99,109 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
+/**
+ * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
+ *
+ * Provides chunk metadata for commands that support extended info queue
+ * functionality. Used when the total data exceeds a single mailbox response.
+ */
+struct xe_ras_info_queue_header {
+	/** @total_size: Total size of the complete info queue data in bytes */
+	u32 total_size;
+	/** @chunk_offset: Offset of this chunk within the total data in bytes */
+	u32 chunk_offset;
+	/** @chunk_size: Size of the data in this chunk in bytes */
+	u32 chunk_size;
+	/** @sequence_number: Sequence number for this chunk, starts at 0 */
+	u32 sequence_number;
+	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
+	u32 flags:8;
+	/** @compression_type: Compression algorithm used; 0 = none */
+	u32 compression_type:4;
+	/** @num_headers: Number of detailed counter headers at start of queue_data */
+	u32 num_headers:5;
+	/** @reserved: Reserved for future use */
+	u32 reserved:15;
+	/** @checksum: CRC32 checksum of this chunk data */
+	u32 checksum;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_request - Request for a specific chunk of info queue data
+ *
+ * Allows the driver to request continuation of large info queue transfers
+ * by specifying an offset and size within the full data set.
+ */
+struct xe_ras_info_queue_request {
+	/** @requested_offset: Byte offset of the requested data chunk */
+	u32 requested_offset;
+	/** @requested_size: Maximum size of the requested chunk in bytes */
+	u32 requested_size;
+	/** @session_id: Session ID to correlate multi-chunk transfers */
+	struct xe_ras_error_class session_id;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_response - Generic response for commands with info queues
+ *
+ * Standard response format for any command that returns an info queue
+ * payload. May be embedded in a command-specific response structure.
+ */
+struct xe_ras_info_queue_response {
+	/** @queue_header: Info queue metadata for this chunk */
+	struct xe_ras_info_queue_header queue_header;
+	/** @queue_data: Info queue data for this chunk */
+	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * indicates how many subsequent error log entries belong to this class.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @error_class: Error class associated with this counter group */
+	struct xe_ras_error_class error_class;
+	/** @counter: Number of error log entries that follow for this class */
+	u32 counter;
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
+/**
+ * struct xe_ras_get_info_queue_data_request - Request for RAS_CMD_GET_INFO_QUEUE_DATA
+ */
+struct xe_ras_get_info_queue_data_request {
+	/** @queue_request: Info queue request parameters */
+	struct xe_ras_info_queue_request queue_request;
+	/** @source_command: Original command that generated the info queue */
+	u32 source_command;
+	/** @source_context: Context from original command, if applicable */
+	struct xe_ras_error_class source_context;
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_data_response - Response for RAS_CMD_GET_INFO_QUEUE_DATA
+ */
+struct xe_ras_get_info_queue_data_response {
+	/** @operation_status: Status of the retrieval operation */
+	u32 operation_status;
+	/** @queue_response: Info queue data chunk */
+	struct xe_ras_info_queue_response queue_response;
+} __packed;
+
 /**
  * struct xe_ras_get_counter_request - Request structure for get counter
  */
@@ -117,8 +224,14 @@ struct xe_ras_get_counter_response {
 	u64 timestamp;
 	/** @threshold: Threshold value for the counter */
 	u32 threshold;
-	/** @reserved: Reserved  */
-	u32 reserved[57];
+	/** @reserved: Reserved for future use */
+	u32 reserved:9;
+	/** @has_info_queue: Set if info queue is available */
+	u32 has_info_queue:1;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:22;
+	/** @info_queue: Initial info queue data (first chunk) if available */
+	struct xe_ras_info_queue_response info_queue;
 } __packed;
 
 /**
@@ -336,4 +449,5 @@ struct xe_ras_set_health_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[2];
 } __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 66e7cbcc3f91..c00fe0e69fda 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -30,6 +30,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -40,6 +41,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
 };
 
 /**
-- 
2.54.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB2DCA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0F0112054;
	Fri,  9 Oct 2026 10:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAamWYRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDC4112054
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541768; x=1823077768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DJ1cWWcarp8tr4cBAySDxXrVDET1u2HIJombb+dwghI=;
 b=OAamWYRtcq1+vhkn6fA9e047hzLOVHE77N0YAoseMs8kZixsl0G1sLqO
 6UYz3zii+F5L4DxyUNFFr6zZmRyalIVOmsJK15cUYNnmM0wHu0pQHm8kj
 6DvGo6wYaXh3CGmILAHkDMotY1sdOMU5jJfTa1EjWDfi6umOTVFLQCtd9
 Gxub3w3pV0VyRV0Do7ETc5LCXkF++soLBizQ/9f68ZKKWLbnaAXmEb9ZQ
 AbmlRP3VdRXu3ay7w8qYD7E9AJc9LPjYz/PyReNJ2c66FGawJHDZm+WVw
 7/1CMfgNI9iSZKXLm0zirpa3hY2pXpZQixp90H8hucXk3TyRpo++1zv4E w==;
X-CSE-ConnectionGUID: QmoZvoMwRRKFxkSvbTdoJw==
X-CSE-MsgGUID: NQenewupQtyz//3hQbNiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344082"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344082"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:28 -0700
X-CSE-ConnectionGUID: gaxTJtE0QQCCW1EDK7iddQ==
X-CSE-MsgGUID: SjQESfyERZWHeVrcz3rDbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025579"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:24 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 05/12] drm/xe/xe_ras: Add support to retrieve info queue
 data for CRI
Date: Fri,  9 Oct 2026 16:16:08 +0530
Message-ID: <20261009104602.1075405-19-badal.nilawar@intel.com>
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

Retrieve the RAS info queue data, in multiple chunks, and assemble it into
a flat buffer. A follow-up patch will use this data to prepare the CPER
error info.

Assisted-by: Copilot:Claude-Opus-5.5
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
 - Simplify info queue handling and validation (Raag)
 - Clean up info queue naming and definitions (Raag)
 - Validate each chunk against the requested offset
---
 drivers/gpu/drm/xe/xe_ras.c                   | 117 +++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 238 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 5cfc9beff8c1..900319938fe5 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -788,6 +788,123 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 	return 0;
 }
 
+static int get_info_queue_data(struct xe_device *xe,
+			       struct xe_ras_get_info_queue_request *req,
+			       struct xe_ras_get_info_queue_response *out)
+{
+	struct xe_ras_get_info_queue_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	const struct xe_ras_info_queue_header *hdr;
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
+				  req, sizeof(*req), &response, sizeof(response));
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
+	hdr = &response.queue_response.header;
+	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
+	       response.operation_status, hdr->chunk_size, hdr->flags);
+
+	*out = response;
+	return 0;
+}
+
+static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
+			   u32 expected_offset, u32 dest_size)
+{
+	u32 end;
+
+	return hdr->chunk_offset == expected_offset &&
+	       hdr->chunk_size && hdr->chunk_size <= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
+	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
+	       end <= XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <= dest_size;
+}
+
+/**
+ * xe_ras_drain_info_queue_raw() - Drain the full RAS info queue into a flat buffer
+ * @xe: xe device
+ * @counter_resp: counter response carrying the first embedded chunk and the
+ *                counter identifier used as the source context for subsequent
+ *                GET_INFO_QUEUE fetches
+ * @dest_buf: destination buffer supplied by the caller
+ * @dest_size: size of @dest_buf in bytes; also caps the total amount of data
+ *             assembled from the info queue
+ *
+ * Copies the first chunk already embedded in @counter_resp, then loops
+ * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
+ * signals no more data or a transport/bounds error is encountered.  On
+ * transport or bounds errors the function stops and returns whatever has
+ * been assembled so far.
+ *
+ * Returns: number of valid bytes written into @dest_buf.  Zero if @dest_buf is
+ *          NULL or @dest_size is 0.
+ */
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size)
+{
+	const struct xe_ras_info_queue_header *first_hdr = &counter_resp->first.header;
+	struct xe_ras_get_info_queue_request req = {0};
+	struct xe_ras_get_info_queue_response resp;
+	u32 flags = first_hdr->flags;
+	u32 offset = 0;
+
+	if (!dest_buf || !dest_size)
+		return 0;
+
+	if (first_hdr->total_size > dest_size)
+		xe_warn(xe, "[RAS]: info queue size %u exceeds %u, truncating\n",
+			first_hdr->total_size, dest_size);
+
+	/* Copy first chunk already embedded in the counter response */
+	if (chunk_is_valid(first_hdr, offset, dest_size)) {
+		memcpy(dest_buf, counter_resp->first.data, first_hdr->chunk_size);
+		offset = first_hdr->chunk_size;
+	}
+
+	req.source_command = XE_SYSCTRL_CMD_GET_COUNTER;
+	req.source_context = counter_resp->counter;
+	req.queue_request.session_id = counter_resp->counter;
+
+	/* Fetch any remaining chunks */
+	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {
+		const struct xe_ras_info_queue_header *hdr = &resp.queue_response.header;
+
+		req.queue_request.offset = offset;
+		req.queue_request.size = min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
+
+		if (get_info_queue_data(xe, &req, &resp)) {
+			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u failed\n",
+			       offset);
+			return offset;
+		}
+
+		if (!chunk_is_valid(hdr, offset, dest_size)) {
+			xe_warn(xe, "[RAS]: invalid info queue chunk (offset=%u size=%u, expected offset=%u)\n",
+				hdr->chunk_offset, hdr->chunk_size, offset);
+			return offset;
+		}
+
+		memcpy(dest_buf + offset, resp.queue_response.data, hdr->chunk_size);
+		offset += hdr->chunk_size;
+		flags = hdr->flags;
+	}
+
+	return min(offset, first_hdr->total_size);
+}
+
 static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct xe_ras_get_health_response response = {0};
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 84700ea63394..27ce6265ace5 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -22,5 +22,8 @@ void xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *out);
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index fe6f3658a2a4..9901fd034e3f 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -17,6 +17,10 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
+
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
  *
@@ -95,6 +99,110 @@ struct xe_ras_threshold_crossed {
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
+	/** @reserved0: Reserved for future use */
+	u32 reserved0;
+	/** @flags: Info queue control flags (XE_RAS_INFO_QUEUE_FLAG_*) */
+	u32 flags:8;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:4;
+	/** @num_headers: Number of detailed counter headers at start of the data */
+	u32 num_headers:5;
+	/** @reserved2: Reserved for future use */
+	u32 reserved2:15;
+	/** @checksum: CRC32 checksum of this chunk data */
+	u32 checksum;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_data_request - Request for a specific chunk of info queue data
+ *
+ * Allows the driver to request continuation of large info queue transfers
+ * by specifying an offset and size within the full data set.
+ */
+struct xe_ras_info_queue_data_request {
+	/** @offset: Byte offset of the requested data chunk */
+	u32 offset;
+	/** @size: Maximum size of the requested chunk in bytes */
+	u32 size;
+	/** @session_id: Session ID to correlate multi-chunk transfers */
+	struct xe_ras_error_class session_id;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_data_response - Generic response for commands with info queues
+ *
+ * Standard response format for any command that returns an info queue
+ * payload. May be embedded in a command-specific response structure.
+ */
+struct xe_ras_info_queue_data_response {
+	/** @header: Info queue metadata for this chunk */
+	struct xe_ras_info_queue_header header;
+	/** @data: Info queue data for this chunk */
+	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * is the error count of this class; at most XE_RAS_NUM_COUNTERS error log
+ * entries follow for it.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @error_class: Error class associated with this counter group */
+	struct xe_ras_error_class error_class;
+	/** @counter: Error count of this class */
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
+ * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_request {
+	/** @queue_request: Info queue request parameters */
+	struct xe_ras_info_queue_data_request queue_request;
+	/** @source_command: Original command that generated the info queue */
+	u32 source_command;
+	/** @source_context: Context from original command, if applicable */
+	struct xe_ras_error_class source_context;
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_response {
+	/** @operation_status: Status of the retrieval operation */
+	u32 operation_status;
+	/** @queue_response: Info queue data chunk */
+	struct xe_ras_info_queue_data_response queue_response;
+} __packed;
+
 /**
  * struct xe_ras_get_counter_request - Request structure for get counter
  */
@@ -117,8 +225,14 @@ struct xe_ras_get_counter_response {
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
+	/** @first: First info queue chunk, if @has_info_queue is set */
+	struct xe_ras_info_queue_data_response first;
 } __packed;
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index a0628eb47bff..299d12b94574 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -34,6 +34,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -44,6 +45,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
 };
 
 /**
-- 
2.54.0


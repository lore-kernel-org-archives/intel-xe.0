Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E492C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A2610EB28;
	Tue, 25 Aug 2026 17:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWdSgaMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507010EB28
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679754; x=1819215754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2yGVTEmj2BuWp0hPow2EvOtwEN1mCO2rfd0iWcX5RuA=;
 b=BWdSgaMiDduoRxP0YWWsuJ1lKzJOg7KZVCHicZcSeDU62aigwProj1ly
 f1YLca8KZyVp0SsTtu71YbJ1NKVXZoym3fCSaKh6V/GqsvyWtavEr5evn
 8HjvtADKRxcL33V31pGzrv663dKI3maL8YS899JXSrA5ZL3zw3clGPggq
 XUE+5uMQOltUoALGQRBVq01E7Q0gj8FiFu6WhMdOF3yfuM+dD2pR2Abl8
 FeVcNTAylMQzSYUjDHqhA6j2O54qCUiA8w4suExf72MrzWxVslfgOWdF4
 MxVTLg37G0CxwQd2toVxLNd9LxMK4kvBiyNHm6t3oLOEEjwcHrbkEGT17 w==;
X-CSE-ConnectionGUID: yS0YOHgeSGy4G4i0brEOCA==
X-CSE-MsgGUID: UAaiz38IQ16TUfvFobn0hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210807"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210807"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:34 -0700
X-CSE-ConnectionGUID: JIpTapnXQKCEmMVJrKBNwg==
X-CSE-MsgGUID: y05Zmp2YQ/+Ba8NeKDv5BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585071"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:31 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 01/11] drm/xe/xe_ras: Add support to retrieve info queue
 data for CRI
Date: Tue, 25 Aug 2026 23:29:18 +0530
Message-ID: <20260825175916.1103841-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

Add support to retrieve info queue data. While constructing CPER
record info queue data will be retrieved when has_info_queue=1 is
set in get_counter response.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
v2: Drop unused flags (Mallesh)
---
 drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 108 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 144 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..683087235482 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -661,6 +661,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
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
 static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct xe_ras_get_health_response response = {0};
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 99b2466e2062..d87db9f5174a 100644
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
@@ -286,4 +393,5 @@ struct xe_ras_set_health_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[2];
 } __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index d0341538ad05..17f53cb78dc4 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -28,6 +28,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -36,6 +37,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
 };
 
 /**
-- 
2.54.0


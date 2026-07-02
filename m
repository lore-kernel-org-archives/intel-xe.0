Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D77C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C7210F2D0;
	Thu,  2 Jul 2026 11:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lt/PQ8fE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887F710F2D0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990175; x=1814526175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LBaVDyDtGAQKHRJ0fRdPz52oJm8R7C9VIq/F/rlxTnw=;
 b=lt/PQ8fE2ZQYw4SaKKN7v4qanKuwJUbW2Up4QiaPCae0oxY7BbGwD9FO
 7yA1DdEPi7uPfK1U3f0cAoxIwq5fohcJkHMt3ncKY6+fhHF5hHAZ6wNJE
 ++2nlpK+nxMDwXPwwwWWjQfwLGsiz+/9velYfGqM00Sq3uaER3fvBy3Uh
 hPLSVBKIMItiY4aT+RY4O1vFufzWp3Q6hxuV/Okohb+aC1IcCtedrvr6+
 EwdRGQgUddRrAc8LKWcTJ7Yk+pTC6GvIDa494OXIWdezmGnhNT6e+GkxG
 rjeYQUB9WabSSc8j1Ht0ugZRkf7mxxzQXu7D5bFwl2br7t46Lb82hLqs3 w==;
X-CSE-ConnectionGUID: BlkpuTsZQwqfhZhPVlT0rQ==
X-CSE-MsgGUID: aVborAM+SeeWLIrpoXCtcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852884"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:54 -0700
X-CSE-ConnectionGUID: rrr/BkPoTs2s9kmEP5LFzQ==
X-CSE-MsgGUID: L063lV63QDqsjY9UGPlysQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738721"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:52 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 2/7] drm/xe/xe_ras: Add support to retrieve info queue
 data for CRI
Date: Thu,  2 Jul 2026 16:44:04 +0530
Message-ID: <20260702111401.3680214-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
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

Add support to retrieve info queue data. It can be retrieved when
has_info_queue=1 and RAS_INFO_QUEUE_FLAG_MORE_DATA is set in
response of XE_SYSCTRL_CMD_GET_COUNTER.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 112 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 44f4e1a3455b..85b0202467f6 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -270,6 +270,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
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
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..fc496888b3f8 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -9,6 +9,12 @@
 #include <linux/types.h>
 
 #define XE_RAS_NUM_COUNTERS			16
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE        200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE        5120
+#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE        0x01
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA        0x02
+#define XE_RAS_INFO_QUEUE_FLAG_OVERFLOW         0x04
+#define XE_RAS_INFO_QUEUE_FLAG_COMPRESSED       0x08
 
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
@@ -71,7 +77,64 @@ struct xe_ras_threshold_crossed {
 } __packed;
 
 /**
- * struct xe_ras_get_counter_request - Request structure for get counter
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
+ * struct xe_ras_get_counter_request - Request for get error counter
  */
 struct xe_ras_get_counter_request {
 	/** @counter: Error counter to be queried */
@@ -121,4 +184,51 @@ struct xe_ras_clear_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[3];
 } __packed;
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
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..538d93352655 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -25,11 +25,13 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
 };
 
 /**
-- 
2.54.0


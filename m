Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33C5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPc6RpTe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85A410E130;
	Fri, 30 Oct 2026 12:16:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970D910E130
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793362608; x=1824898608;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=otwESLQQi4tHFMB52B+3cgGzwYUO+NId7UDRJ7Z4VKs=;
 b=jPc6RpTeG7bZOUutk7iI7F9xp/uqPhIQN/E/ePEEhWlDg2ocbEeg8rCW
 h4ZafMxHaREzjENcNvqTS410l4NPiw2PYLCg7iji9xdZP5wIynvY6UnBO
 PrHUm2O1TsXTVIzprwkwXttT4wCQqKIlvnbU6jctXJYX/iYkF/FXRIxZP
 kz4r1ib1EBDFhD2FqW6R8BKLld1huXmzGYmmeilLBm9Z8YJgr1cqGODse
 Dji83FzxAe3LTYgIX0OwMX4e26ORIGnBTB9n7TyHhkozGKFk5qg/leupi
 pU2+qYec++Ytzn5P0zxzKhLJDO3/aerXjlGRELqFKUB2rC/cfGK1XNlsK w==;
X-CSE-ConnectionGUID: AnxX1LYIQ7a5aogtr3xKYw==
X-CSE-MsgGUID: vIq4W0PSRBi53uSketdBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2140087"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2140087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:16:42 -0700
X-CSE-ConnectionGUID: l/rBydPzS4ajYtNgLDbdSA==
X-CSE-MsgGUID: SQp++3jFSeG83NcEj+9+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5314219"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:16:41 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/xe_ras: Add support to retrieve info queue data
Date: Fri, 30 Oct 2026 17:46:38 +0530
Message-ID: <20261030121636.2488868-5-badal.nilawar@intel.com>
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

Retrieve the RAS info queue data, in multiple chunks, and assemble it into
a flat buffer.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c                   | 130 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   4 +-
 drivers/gpu/drm/xe/xe_ras_types.h             |  91 +++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 224 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..b6c2bf705449 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1106,6 +1106,136 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
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
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_err(xe, "sysctrl: get info queue command failed with status %#x\n",
+		       response.status);
+		return ret;
+	}
+
+	hdr = &response.queue_response.header;
+	xe_dbg(xe, "[RAS] info queue: total_size=%u chunk_offset=%u chunk_size=%u flags=0x%x num_headers=%u\n",
+	       hdr->total_size, hdr->chunk_offset, hdr->chunk_size,
+	       hdr->flags, hdr->num_headers);
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
+ * Returns: Number of valid bytes written into @dest_buf.  Zero if @dest_buf is
+ *          NULL or @dest_size is 0.
+ */
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size)
+{
+	const struct xe_ras_info_queue_header *first_hdr;
+	u32 flags, offset = 0;
+	int ret;
+
+	xe_assert(xe, counter_resp->has_info_queue);
+
+	if (!dest_buf || !dest_size)
+		return 0;
+
+	first_hdr = &counter_resp->first.header;
+
+	if (!chunk_is_valid(first_hdr, offset, dest_size)) {
+		xe_warn(xe, "[RAS]: invalid first info queue chunk (offset=%u size=%u, expected offset=%u)\n",
+			first_hdr->chunk_offset, first_hdr->chunk_size, offset);
+		return 0;
+	}
+
+	/* Copy first chunk already embedded in the counter response */
+	memcpy(dest_buf, counter_resp->first.data, first_hdr->chunk_size);
+	offset = first_hdr->chunk_size;
+	flags = first_hdr->flags;
+
+	/* Fetch any remaining chunks */
+	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {
+		struct xe_ras_get_info_queue_request req = {};
+		struct xe_ras_get_info_queue_response resp = {};
+		struct xe_ras_info_queue_header *hdr;
+
+		req.queue_request.offset = offset;
+		req.queue_request.size = min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
+		req.queue_request.session_id = counter_resp->counter;
+
+		ret = get_info_queue_data(xe, &req, &resp);
+		if (ret) {
+			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n",
+			       offset, ret);
+			return offset;
+		}
+
+		hdr = &resp.queue_response.header;
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
index c44fa172011f..d4a3d9fef1b2 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -25,5 +25,7 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *response);
-
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a86f9d2b8c92..67d57182aac9 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -19,6 +19,10 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
+
 /**
  * enum xe_ras_page_action - Page offline actions for page offline request
  *
@@ -110,6 +114,83 @@ struct xe_ras_threshold_crossed {
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
+	/** @reserved3: Reserved for future use */
+	u32 reserved3;
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
+ * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_request {
+	/** @queue_request: Info queue request parameters */
+	struct xe_ras_info_queue_data_request queue_request;
+	/** @reserved: Reserved for future use */
+	u32 reserved[16];
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_response {
+	/** @status: Status of the retrieval operation */
+	u32 status;
+	/** @queue_response: Info queue data chunk */
+	struct xe_ras_info_queue_data_response queue_response;
+} __packed;
+
 /**
  * struct xe_ras_get_counter_request - Request structure for get counter
  */
@@ -132,8 +213,14 @@ struct xe_ras_get_counter_response {
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
index 1f3f782d770e..9188457ef7ae 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -37,6 +37,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -50,6 +51,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
 };
 
 /**
-- 
2.56.0


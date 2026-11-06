Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FCC606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NB/bMJaA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90504112FAC;
	Fri,  6 Nov 2026 18:59:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC86112FAC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793991554; x=1825527554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zJlpTCfSjXPIfWMfnEZMEyPPVz3GU48DqI4IPDXdn7s=;
 b=NB/bMJaAFWSAhmS4uicWjtmROnDnCtml9aRMIKuibW7U6lcnkfFNmgVm
 Av1eIXIix7WvhKQcOfwXirBtZK39EEGXlykXUnmatESVI6zJ6V9pwE/Wo
 goBDVLSRrGah27B/lf7fsh0MWvvAfke38Tsjw3SgnZs3Jcs9RDCszoq7O
 tcBePUXZONavh/xZdho1sxyZwFDPnUY5ThfuyZYt2iH9U9np5Y0MJ4Q9Q
 XjSXcxoPg2nuXkNWhF+CnZkdA1VqVk/fBuZg24/r8BwyJn972YQpKrAUd
 JEaNB5BeKcmUKL55G+34dYHtm/cTSml7CyvuCvra6hUoPPd0qQ5iFP1jO w==;
X-CSE-ConnectionGUID: SUHGstiKTY277fqdLkzkzw==
X-CSE-MsgGUID: yEfLimXmTIioiCkm5ktOag==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2839859"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2839859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:59:14 -0800
X-CSE-ConnectionGUID: sdN8K0syR1a3rSX1dzA9aQ==
X-CSE-MsgGUID: q7s8pzmIToW5U+TxLV9odQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7679103"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:59:10 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v6 1/2] drm/xe/xe_ras: Add support to retrieve info queue data
Date: Sat,  7 Nov 2026 00:29:05 +0530
Message-ID: <20261106185903.3570234-5-badal.nilawar@intel.com>
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

Retrieve the RAS info queue data, in multiple chunks, and assemble it into
a flat buffer.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v6:
  - Replace destination buffer checks with xe_assert() (Raag)
  - Extract get_first_chunk() and get_remaining_chunks() helpers (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 140 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   4 +-
 drivers/gpu/drm/xe/xe_ras_types.h             |  91 +++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 234 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..7f218ab2bd1b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1106,6 +1106,146 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 	return 0;
 }
 
+static int get_info_queue(struct xe_device *xe,
+			  struct xe_ras_get_info_queue_request *request,
+			  struct xe_ras_get_info_queue_response *response)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	const struct xe_ras_info_queue_header *hdr;
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
+				  request, sizeof(*request), response, sizeof(*response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to get info queue %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(*response)) {
+		xe_err(xe, "sysctrl: unexpected get info queue response length %zu (expected %zu)\n",
+		       rlen, sizeof(*response));
+		return -EIO;
+	}
+
+	ret = ras_status_to_errno(response->status);
+	if (ret) {
+		xe_err(xe, "sysctrl: get info queue command failed with status %#x\n",
+		       response->status);
+		return ret;
+	}
+
+	hdr = &response->queue_response.header;
+	xe_dbg(xe, "[RAS] info queue: total_size=%u chunk_offset=%u chunk_size=%u flags=0x%x num_headers=%u\n",
+	       hdr->total_size, hdr->chunk_offset, hdr->chunk_size,
+	       hdr->flags, hdr->num_headers);
+
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
+static u32 get_first_chunk(struct xe_device *xe,
+			   const struct xe_ras_get_counter_response *response,
+			   u8 *dest_buf, u32 dest_size, u32 *flags)
+{
+	const struct xe_ras_info_queue_header *hdr = &response->first.header;
+
+	if (!chunk_is_valid(hdr, 0, dest_size)) {
+		xe_warn(xe, "[RAS]: invalid first info queue chunk (offset=%u size=%u, expected offset=%u)\n",
+			hdr->chunk_offset, hdr->chunk_size, 0);
+		return 0;
+	}
+
+	memcpy(dest_buf, response->first.data, hdr->chunk_size);
+	*flags = hdr->flags;
+
+	return hdr->chunk_size;
+}
+
+static u32 get_remaining_chunks(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *response,
+				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
+{
+	int ret;
+
+	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {
+		struct xe_ras_get_info_queue_request request = {};
+		struct xe_ras_get_info_queue_response queue_response = {};
+		struct xe_ras_info_queue_header *hdr;
+
+		request.queue_request.offset = offset;
+		request.queue_request.size = min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE,
+						 dest_size - offset);
+		request.queue_request.session_id = response->counter;
+
+		ret = get_info_queue(xe, &request, &queue_response);
+		if (ret) {
+			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n",
+			       offset, ret);
+			return offset;
+		}
+
+		hdr = &queue_response.queue_response.header;
+
+		if (!chunk_is_valid(hdr, offset, dest_size)) {
+			xe_warn(xe, "[RAS]: invalid info queue chunk (offset=%u size=%u, expected offset=%u)\n",
+				hdr->chunk_offset, hdr->chunk_size, offset);
+			return offset;
+		}
+
+		memcpy(dest_buf + offset, queue_response.queue_response.data, hdr->chunk_size);
+		offset += hdr->chunk_size;
+		flags = hdr->flags;
+	}
+
+	return min(offset, response->first.header.total_size);
+}
+
+/**
+ * xe_ras_drain_info_queue() - Drain the full RAS info queue into a flat buffer
+ * @xe: xe device
+ * @response: counter response carrying the first embedded chunk
+ * @dest_buf: destination buffer supplied by the caller
+ * @dest_size: size of @dest_buf in bytes; also caps the total amount of data
+ *             assembled from the info queue
+ *
+ * Copies the first chunk already embedded in @response, then loops
+ * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
+ * signals no more data or a transport/bounds error is encountered.  On
+ * transport or bounds errors the function stops and returns whatever has
+ * been assembled so far.
+ *
+ * Returns: Number of valid bytes written into @dest_buf.
+ */
+u32 xe_ras_drain_info_queue(struct xe_device *xe,
+			    const struct xe_ras_get_counter_response *response,
+			    u8 *dest_buf, u32 dest_size)
+{
+	u32 flags, offset;
+
+	xe_assert(xe, response->has_info_queue);
+	xe_assert(xe, dest_buf);
+	xe_assert(xe, dest_size);
+
+	offset = get_first_chunk(xe, response, dest_buf, dest_size, &flags);
+	if (!offset)
+		return 0;
+
+	return get_remaining_chunks(xe, response, dest_buf, dest_size, offset, flags);
+}
+
 static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct xe_ras_get_health_response response = {0};
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index c44fa172011f..5bdac147098f 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -25,5 +25,7 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *response);
-
+u32 xe_ras_drain_info_queue(struct xe_device *xe,
+			    const struct xe_ras_get_counter_response *response,
+			    u8 *dest_buf, u32 dest_size);
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
index cdacceebca06..50b1d9abaf1f 100644
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


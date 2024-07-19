Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38108C3DA64
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 20:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0600410ECB6;
	Fri, 19 Jul 2024 20:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZDH42af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E49F10E16A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721420960; x=1752956960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WvMKjgUlIxf2DeuMKHMlCWbuC48A/IppA9yqDSvC/oc=;
 b=LZDH42afhEHP9thQmSyeBbxw3i0gR+gFRu1syCbooMZI8VBrevorcTzs
 v73QHR0s5yw6M1T4F/BYoef9to+ziYMRRhtkGaGdUOlWoq47rgb/uz/Bq
 QSrkcO0pbo8uWEoJF1IeZfVWG6h4cbaoQPtqf/SinFCABXqgIy6nrgNMu
 OUSZEr+3pnwyXN+pd1hulfBNY+Ggo7A6IA3Ng2Ey1GzFbGnGISjvEvbQR
 45KxwNJuMPnMEleMLxIo9qemF6RYk1h3jgX7vlt1nrZR8B8Yo7ur19xo8
 HJUT1bvX6Ezo8nEfvMQOmjvu9+BkwC4ikdBP9bl6KpJBS7JlS5AyNG28W A==;
X-CSE-ConnectionGUID: mGe85b8RRlarElXNHak++Q==
X-CSE-MsgGUID: 3h8evUIqTi+aGl8JUVhc5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18926126"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18926126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 13:29:19 -0700
X-CSE-ConnectionGUID: x65Ocbs2RIy0ZPgI7FGi9Q==
X-CSE-MsgGUID: mjDoBFV8QSqwLib5kdUE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55412824"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa003.fm.intel.com with ESMTP; 19 Jul 2024 13:29:19 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v13 4/5] drm/xe/guc: Extract GuC error capture lists
Date: Fri, 19 Jul 2024 13:29:16 -0700
Message-Id: <20240719202917.1590984-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719202917.1590984-1-zhanjun.dong@intel.com>
References: <20240719202917.1590984-1-zhanjun.dong@intel.com>
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

Upon the G2H Notify-Err-Capture event, parse through the
GuC Log Buffer (error-capture-subregion) and generate one or
more capture-nodes. A single node represents a single "engine-
instance-capture-dump" and contains at least 3 register lists:
global, engine-class and engine-instance. An internal link
list is maintained to store one or more nodes.

Because the link-list node generation happen before the call
to devcoredump, duplicate global and engine-class register
lists for each engine-instance register dump if we find
dependent-engine resets in a engine-capture-group.

To avoid dynamically allocate the output nodes during gt reset,
pre-allocate a fixed number of empty nodes up front (at the
time of ADS registration) that we can consume from or return to
an internal cached list of nodes.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   8 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h     |  52 ++
 drivers/gpu/drm/xe/xe_guc_capture.c      | 711 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |  67 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h       |   2 +
 7 files changed, 825 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 43ad4652c2b2..b54fe40fc5a9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -176,6 +176,14 @@ enum xe_guc_sleep_state_status {
 #define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
 #define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
 
+enum xe_guc_state_capture_event_status {
+	XE_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
+	XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
+};
+
+#define XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
+#define XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION_DATA_LEN 1
+
 #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
 #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
 /* Flush PPC or SMRO caches along with TLB invalidation request */
diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 10db4ffaa17f..4043564eb819 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -17,4 +17,56 @@ enum guc_log_buffer_type {
 
 #define GUC_LOG_BUFFER_TYPE_MAX		3
 
+/**
+ * struct guc_log_buffer_state - GuC log buffer state
+ *
+ * Below state structure is used for coordination of retrieval of GuC firmware
+ * logs. Separate state is maintained for each log buffer type.
+ * read_ptr points to the location where Xe read last in log buffer and
+ * is read only for GuC firmware. write_ptr is incremented by GuC with number
+ * of bytes written for each log entry and is read only for Xe.
+ * When any type of log buffer becomes half full, GuC sends a flush interrupt.
+ * GuC firmware expects that while it is writing to 2nd half of the buffer,
+ * first half would get consumed by Host and then get a flush completed
+ * acknowledgment from Host, so that it does not end up doing any overwrite
+ * causing loss of logs. So when buffer gets half filled & Xe has requested
+ * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
+ * to the value of write_ptr and raise the interrupt.
+ * On receiving the interrupt Xe should read the buffer, clear flush_to_file
+ * field and also update read_ptr with the value of sample_write_ptr, before
+ * sending an acknowledgment to GuC. marker & version fields are for internal
+ * usage of GuC and opaque to Xe. buffer_full_cnt field is incremented every
+ * time GuC detects the log buffer overflow.
+ */
+struct guc_log_buffer_state {
+	/** @marker: buffer state start marker */
+	u32 marker[2];
+	/** @read_ptr: the Last Byte Offset Location */
+	u32 read_ptr;
+	/** @write_ptr: the Byte Offset Location */
+	u32 write_ptr;
+	/** @size: Log buffer size */
+	u32 size;
+	/**
+	 * @sampled_write_ptr: Log buffer write pointer
+	 * This is written by GuC to the byte offset of the next free entry in
+	 * the buffer on log buffer half full or state capture notification
+	 */
+	u32 sampled_write_ptr;
+	/**
+	 * @wrap_offset: wraparound offset
+	 * This is the byte offset of location 1 byte after last valid guc log
+	 * event entry written by Guc firmware before there was a wraparound.
+	 * This field is updated by guc firmware and should be used by Host
+	 * when copying buffer contents to file.
+	 */
+	u32 wrap_offset;
+	/** @flags: Flush to file flag and buffer full count */
+	u32 flags;
+#define	GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE	GENMASK(0, 0)
+#define	GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT	GENMASK(4, 1)
+	/** @version: The Guc-Log-Entry format version */
+	u32 version;
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 72abba8f7bf8..d4a63fbe303d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -10,6 +10,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_capture_abi.h"
+#include "abi/guc_log_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -32,6 +33,51 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 
+/*
+ * struct __guc_capture_bufstate
+ *
+ * Book-keeping structure used to track read and write pointers
+ * as we extract error capture data from the GuC-log-buffer's
+ * error-capture region as a stream of dwords.
+ */
+struct __guc_capture_bufstate {
+	u32 size;
+	u32 data_offset;
+	u32 rd;
+	u32 wr;
+};
+
+/*
+ * struct __guc_capture_parsed_output - extracted error capture node
+ *
+ * A single unit of extracted error-capture output data grouped together
+ * at an engine-instance level. We keep these nodes in a linked list.
+ * See cachelist and outlist below.
+ */
+struct __guc_capture_parsed_output {
+	/*
+	 * A single set of 3 capture lists: a global-list
+	 * an engine-class-list and an engine-instance list.
+	 * outlist in __guc_capture_parsed_output will keep
+	 * a linked list of these nodes that will eventually
+	 * be detached from outlist and attached into to
+	 * xe_codedump in response to a context reset
+	 */
+	struct list_head link;
+	bool is_partial;
+	u32 eng_class;
+	u32 eng_inst;
+	u32 guc_id;
+	u32 lrca;
+	struct gcap_reg_list_info {
+		u32 vfid;
+		u32 num_regs;
+		struct guc_mmio_reg *regs;
+	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
+#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
+#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
+};
+
 /*
  * Define all device tables of GuC error capture register lists
  * NOTE: For engine-registers, GuC only needs the register offsets
@@ -158,8 +204,16 @@ struct xe_guc_state_capture {
 						[GUC_STATE_CAPTURE_TYPE_MAX]
 						[GUC_CAPTURE_LIST_CLASS_MAX];
 	void *ads_null_cache;
+	struct list_head cachelist;
+#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
+#define PREALLOC_NODES_DEFAULT_NUMREGS 64
+
+	int max_mmio_per_node;
+	struct list_head outlist;
 };
 
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
+
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
 			 u32 owner, u32 type, enum guc_capture_list_class_type capture_class)
@@ -477,6 +531,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type,
 		return cache->status;
 	}
 
+	/*
+	 * ADS population of input registers is a good
+	 * time to pre-allocate cachelist output nodes
+	 */
+	guc_capture_create_prealloc_nodes(guc);
+
 	ret = xe_guc_capture_getlistsize(guc, owner, type, capture_class, &size);
 	if (ret) {
 		cache->is_valid = true;
@@ -668,6 +728,653 @@ static void check_guc_capture_size(struct xe_guc *guc)
 			  buffer_size, spare_size, capture_size);
 }
 
+static void
+guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
+			     struct list_head *list)
+{
+	list_add_tail(&node->link, list);
+}
+
+static void
+guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
+				struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->outlist);
+}
+
+static void
+guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
+				  struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->cachelist);
+}
+
+static void
+guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
+	int i;
+
+	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
+		tmp[i] = node->reginfo[i].regs;
+		memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
+		       guc->capture->max_mmio_per_node);
+	}
+	memset(node, 0, sizeof(*node));
+	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i)
+		node->reginfo[i].regs = tmp[i];
+
+	INIT_LIST_HEAD(&node->link);
+}
+
+/**
+ * DOC: Init, G2H-event and reporting flows for GuC-error-capture
+ *
+ * KMD Init time flows:
+ * --------------------
+ *     --> alloc A: GuC input capture regs lists (registered to GuC via ADS).
+ *                  xe_guc_ads acquires the register lists by calling
+ *                  xe_guc_capture_list_size and xe_guc_capture_list_get 'n' times,
+ *                  where n = 1 for global-reg-list +
+ *                            num_engine_classes for class-reg-list +
+ *                            num_engine_classes for instance-reg-list
+ *                               (since all instances of the same engine-class type
+ *                                have an identical engine-instance register-list).
+ *                  ADS module also calls separately for PF vs VF.
+ *
+ *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
+ *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
+ *                  Note2: 'x 3' to hold multiple capture groups
+ *
+ * GUC Runtime notify capture:
+ * --------------------------
+ *     --> G2H STATE_CAPTURE_NOTIFICATION
+ *                   L--> xe_guc_capture_process
+ *                           L--> Loop through B (head..tail) and for each engine instance's
+ *                                err-state-captured register-list we find, we alloc 'C':
+ *      --> alloc C: A capture-output-node structure that includes misc capture info along
+ *                   with 3 register list dumps (global, engine-class and engine-instance)
+ *                   This node is created from a pre-allocated list of blank nodes in
+ *                   guc->capture->cachelist and populated with the error-capture
+ *                   data from GuC and then it's added into guc->capture->outlist linked
+ *                   list. This list is used for matchup and printout by xe_devcoredump_read
+ *                   and xe_hw_engine_snapshot_print, (when user invokes the devcoredump sysfs).
+ *
+ * GUC --> notify context reset:
+ * -----------------------------
+ *     --> guc_exec_queue_timedout_job
+ *                   L--> xe_devcoredump
+ *                          L--> devcoredump_snapshot(..IS_GUC_CAPTURE)
+ *                               --> xe_hw_engine_snapshot_capture(..IS_GUC_CAPTURE)
+ *                               L--> xe_hw_engine_snapshot_from_capture is where
+ *                                    detach C from internal linked list and add it into
+ *                                    xe_hw_engine_snapshot struct (if the context and
+ *                                    engine of the event notification matches a node
+ *                                    in the link list).
+ *
+ * User Sysfs / Debugfs
+ * --------------------
+ *      --> xe_devcoredump_read->
+ *             L--> xxx_snapshot_print
+ *                    L--> xe_hw_engine_snapshot_print
+ *                         register lists values of the xe_hw_engine_snapshot
+ *                         saved from xe_hw_engine_snapshot_capture.
+ *
+ */
+
+static int guc_capture_buf_cnt(struct __guc_capture_bufstate *buf)
+{
+	if (buf->wr >= buf->rd)
+		return (buf->wr - buf->rd);
+	return (buf->size - buf->rd) + buf->wr;
+}
+
+static int guc_capture_buf_cnt_to_end(struct __guc_capture_bufstate *buf)
+{
+	if (buf->rd > buf->wr)
+		return (buf->size - buf->rd);
+	return (buf->wr - buf->rd);
+}
+
+/*
+ * GuC's error-capture output is a ring buffer populated in a byte-stream fashion:
+ *
+ * The GuC Log buffer region for error-capture is managed like a ring buffer.
+ * The GuC firmware dumps error capture logs into this ring in a byte-stream flow.
+ * Additionally, as per the current and foreseeable future, all packed error-
+ * capture output structures are dword aligned.
+ *
+ * That said, if the GuC firmware is in the midst of writing a structure that is larger
+ * than one dword but the tail end of the err-capture buffer-region has lesser space left,
+ * we would need to extract that structure one dword at a time straddled across the end,
+ * onto the start of the ring.
+ *
+ * Below function, guc_capture_log_remove_bytes is a helper for that. All callers of this
+ * function would typically do a straight-up memcpy from the ring contents and will only
+ * call this helper if their structure-extraction is straddling across the end of the
+ * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
+ * scalability for future expansion of output data types without requiring a redesign
+ * of the flow controls.
+ */
+static int
+guc_capture_log_remove_bytes(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     void *out, int bytes_needed)
+{
+	#define GUC_CAPTURE_LOG_BUF_COPY_RETRY_MAX	3
+	int fill_size = 0, tries = GUC_CAPTURE_LOG_BUF_COPY_RETRY_MAX;
+	int copy_size, avail;
+
+	xe_assert(guc_to_xe(guc), bytes_needed % sizeof(u32) == 0);
+
+	if (bytes_needed > guc_capture_buf_cnt(buf))
+		return -1;
+
+	while (bytes_needed > 0 && tries--) {
+		int misaligned;
+
+		avail = guc_capture_buf_cnt_to_end(buf);
+		misaligned = avail % sizeof(u32);
+		/* wrap if at end */
+		if (!avail) {
+			/* output stream clipped */
+			if (!buf->rd)
+				return fill_size;
+			buf->rd = 0;
+			continue;
+		}
+
+		/* Only copy to u32 aligned data */
+		copy_size = avail < bytes_needed ? avail - misaligned : bytes_needed;
+		xe_map_memcpy_from(guc_to_xe(guc), out, &guc->log.bo->vmap,
+				   buf->data_offset + buf->rd, copy_size);
+		buf->rd += copy_size;
+		fill_size += copy_size;
+		bytes_needed -= copy_size;
+
+		if (misaligned)
+			xe_gt_dbg(guc_to_gt(guc),
+				  "Bytes extraction not dword aligned, skipping.\n");
+	}
+
+	return fill_size;
+}
+
+static int
+guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			      struct guc_state_capture_group_header_t *ghdr)
+{
+	int fullsize = sizeof(struct guc_state_capture_group_header_t);
+
+	if (guc_capture_log_remove_bytes(guc, buf, ghdr, fullsize) != fullsize)
+		return -1;
+	return 0;
+}
+
+static int
+guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_state_capture_header_t *hdr)
+{
+	int fullsize = sizeof(struct guc_state_capture_header_t);
+
+	if (guc_capture_log_remove_bytes(guc, buf, hdr, fullsize) != fullsize)
+		return -1;
+	return 0;
+}
+
+static int
+guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_mmio_reg *reg)
+{
+	int fullsize = sizeof(struct guc_mmio_reg);
+
+	if (guc_capture_log_remove_bytes(guc, buf, reg, fullsize) != fullsize)
+		return -1;
+	return 0;
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_get_prealloc_node(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *found = NULL;
+
+	if (!list_empty(&guc->capture->cachelist)) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* get first avail node from the cache list */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
+			found = n;
+			break;
+		}
+	} else {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* traverse down and steal back the oldest node already allocated */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+			found = n;
+		}
+	}
+	if (found) {
+		list_del(&found->link);
+		guc_capture_init_node(guc, found);
+	}
+
+	return found;
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
+		       u32 keep_reglist_mask)
+{
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = guc_capture_get_prealloc_node(guc);
+	if (!new)
+		return NULL;
+	if (!original)
+		return new;
+
+	new->is_partial = original->is_partial;
+
+	/* copy reg-lists that we want to clone */
+	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
+		if (keep_reglist_mask & BIT(i)) {
+			XE_WARN_ON(original->reginfo[i].num_regs  >
+				   guc->capture->max_mmio_per_node);
+
+			memcpy(new->reginfo[i].regs, original->reginfo[i].regs,
+			       original->reginfo[i].num_regs * sizeof(struct guc_mmio_reg));
+
+			new->reginfo[i].num_regs = original->reginfo[i].num_regs;
+			new->reginfo[i].vfid  = original->reginfo[i].vfid;
+
+			if (i == GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS) {
+				new->eng_class = original->eng_class;
+			} else if (i == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
+				new->eng_inst = original->eng_inst;
+				new->guc_id = original->guc_id;
+				new->lrca = original->lrca;
+			}
+		}
+	}
+
+	return new;
+}
+
+static int
+guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_state_capture_group_header_t ghdr = {0};
+	struct guc_state_capture_header_t hdr = {0};
+	struct __guc_capture_parsed_output *node = NULL;
+	struct guc_mmio_reg *regs = NULL;
+	int i, numlists, numregs, ret = 0;
+	enum guc_state_capture_type datatype;
+	struct guc_mmio_reg tmp;
+	bool is_partial = false;
+
+	i = guc_capture_buf_cnt(buf);
+	if (!i)
+		return -ENODATA;
+
+	if (i % sizeof(u32)) {
+		xe_gt_warn(gt, "Got mis-aligned register capture entries\n");
+		ret = -EIO;
+		goto bailout;
+	}
+
+	/* first get the capture group header */
+	if (guc_capture_log_get_group_hdr(guc, buf, &ghdr)) {
+		ret = -EIO;
+		goto bailout;
+	}
+	/*
+	 * we would typically expect a layout as below where n would be expected to be
+	 * anywhere between 3 to n where n > 3 if we are seeing multiple dependent engine
+	 * instances being reset together.
+	 * ____________________________________________
+	 * | Capture Group                            |
+	 * | ________________________________________ |
+	 * | | Capture Group Header:                | |
+	 * | |  - num_captures = 5                  | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture1:                            | |
+	 * | |  Hdr: GLOBAL, numregs=a              | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... rega           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture2:                            | |
+	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=b| |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regb           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture3:                            | |
+	 * | |  Hdr: INSTANCE=RCS, numregs=c        | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regc           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture4:                            | |
+	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=d| |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regd           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture5:                            | |
+	 * | |  Hdr: INSTANCE=CCS0, numregs=e       | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... rege           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * |__________________________________________|
+	 */
+	is_partial = FIELD_GET(GUC_STATE_CAPTURE_HEADER_CAPTURE_TYPE, ghdr.info);
+	numlists = FIELD_GET(GUC_STATE_CAPTURE_GROUP_HEADER_NUM_CAPTURES, ghdr.info);
+
+	while (numlists--) {
+		if (guc_capture_log_get_data_hdr(guc, buf, &hdr)) {
+			ret = -EIO;
+			break;
+		}
+
+		datatype = FIELD_GET(GUC_STATE_CAPTURE_HEADER_CAPTURE_TYPE, hdr.info);
+		if (datatype > GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
+			/* unknown capture type - skip over to next capture set */
+			numregs = FIELD_GET(GUC_STATE_CAPTURE_HEADER_NUM_MMIO_ENTRIES,
+					    hdr.num_mmio_entries);
+			while (numregs--) {
+				if (guc_capture_log_get_register(guc, buf, &tmp)) {
+					ret = -EIO;
+					break;
+				}
+			}
+			continue;
+		} else if (node) {
+			/*
+			 * Based on the current capture type and what we have so far,
+			 * decide if we should add the current node into the internal
+			 * linked list for match-up when xe_devcoredump calls later
+			 * (and alloc a blank node for the next set of reglists)
+			 * or continue with the same node or clone the current node
+			 * but only retain the global or class registers (such as the
+			 * case of dependent engine resets).
+			 */
+			if (datatype == GUC_STATE_CAPTURE_TYPE_GLOBAL) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+			} else if (datatype == GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS &&
+				   node->reginfo[GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS].num_regs) {
+				/* Add to list, clone node and duplicate global list */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      GCAP_PARSED_REGLIST_INDEX_GLOBAL);
+			} else if (datatype == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE &&
+				   node->reginfo[GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE].num_regs) {
+				/* Add to list, clone node and duplicate global + class lists */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      (GCAP_PARSED_REGLIST_INDEX_GLOBAL |
+							      GCAP_PARSED_REGLIST_INDEX_ENGCLASS));
+			}
+		}
+
+		if (!node) {
+			node = guc_capture_get_prealloc_node(guc);
+			if (!node) {
+				ret = -ENOMEM;
+				break;
+			}
+			if (datatype != GUC_STATE_CAPTURE_TYPE_GLOBAL)
+				xe_gt_dbg(gt, "Register capture missing global dump: %08x!\n",
+					  datatype);
+		}
+		node->is_partial = is_partial;
+		node->reginfo[datatype].vfid = FIELD_GET(GUC_STATE_CAPTURE_HEADER_VFID, hdr.owner);
+
+		switch (datatype) {
+		case GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE:
+			node->eng_class = FIELD_GET(GUC_STATE_CAPTURE_HEADER_ENGINE_CLASS,
+						    hdr.info);
+			node->eng_inst = FIELD_GET(GUC_STATE_CAPTURE_HEADER_ENGINE_INSTANCE,
+						   hdr.info);
+			node->lrca = hdr.lrca;
+			node->guc_id = hdr.guc_id;
+			break;
+		case GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS:
+			node->eng_class = FIELD_GET(GUC_STATE_CAPTURE_HEADER_ENGINE_CLASS,
+						    hdr.info);
+			break;
+		default:
+			break;
+		}
+
+		numregs = FIELD_GET(GUC_STATE_CAPTURE_HEADER_NUM_MMIO_ENTRIES,
+				    hdr.num_mmio_entries);
+		if (numregs > guc->capture->max_mmio_per_node) {
+			xe_gt_dbg(gt, "Register capture list extraction clipped by prealloc!\n");
+			numregs = guc->capture->max_mmio_per_node;
+		}
+		node->reginfo[datatype].num_regs = numregs;
+		regs = node->reginfo[datatype].regs;
+		i = 0;
+		while (numregs--) {
+			if (guc_capture_log_get_register(guc, buf, &regs[i++])) {
+				ret = -EIO;
+				break;
+			}
+		}
+	}
+
+bailout:
+	if (node) {
+		/* If we have data, add to linked list for match-up when xe_devcoredump calls */
+		for (i = GUC_STATE_CAPTURE_TYPE_GLOBAL; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
+			if (node->reginfo[i].regs) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+				break;
+			}
+		}
+		if (node) /* else return it back to cache list */
+			guc_capture_add_node_to_cachelist(guc->capture, node);
+	}
+	return ret;
+}
+
+static int __guc_capture_flushlog_complete(struct xe_guc *guc)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
+		GUC_LOG_BUFFER_CAPTURE
+	};
+
+	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void __guc_capture_process_output(struct xe_guc *guc)
+{
+	unsigned int buffer_size, read_offset, write_offset, full_count;
+	struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
+	struct guc_log_buffer_state log_buf_state_local;
+	struct __guc_capture_bufstate buf;
+	bool new_overflow;
+	int ret, tmp;
+	u32 log_buf_state_offset;
+	u32 src_data_offset;
+
+	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_LOG_BUFFER_CAPTURE;
+	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_LOG_BUFFER_CAPTURE);
+
+	/*
+	 * Make a copy of the state structure, inside GuC log buffer
+	 * (which is uncached mapped), on the stack to avoid reading
+	 * from it multiple times.
+	 */
+	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
+			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
+
+	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
+	read_offset = log_buf_state_local.read_ptr;
+	write_offset = log_buf_state_local.sampled_write_ptr;
+	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
+
+	/* Bookkeeping stuff */
+	tmp = FIELD_GET(GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE, log_buf_state_local.flags);
+	guc->log.stats[GUC_LOG_BUFFER_CAPTURE].flush += tmp;
+	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_LOG_BUFFER_CAPTURE,
+						     full_count);
+
+	/* Now copy the actual logs. */
+	if (unlikely(new_overflow)) {
+		/* copy the whole buffer in case of overflow */
+		read_offset = 0;
+		write_offset = buffer_size;
+	} else if (unlikely((read_offset > buffer_size) ||
+			(write_offset > buffer_size))) {
+		xe_gt_err(guc_to_gt(guc),
+			  "Register capture buffer in invalid state: read = 0x%X, size = 0x%X!\n",
+			  read_offset, buffer_size);
+		/* copy whole buffer as offsets are unreliable */
+		read_offset = 0;
+		write_offset = buffer_size;
+	}
+
+	buf.size = buffer_size;
+	buf.rd = read_offset;
+	buf.wr = write_offset;
+	buf.data_offset = src_data_offset;
+
+	if (!xe_guc_read_stopped(guc)) {
+		do {
+			ret = guc_capture_extract_reglists(guc, &buf);
+			if (ret && ret != -ENODATA)
+				xe_gt_dbg(guc_to_gt(guc), "Capture extraction failed:%d\n", ret);
+		} while (ret >= 0);
+	}
+
+	/* Update the state of log buffer err-cap state */
+	xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
+		  log_buf_state_offset + offsetof(struct guc_log_buffer_state, read_ptr), u32,
+		  write_offset);
+
+	/*
+	 * Clear the flush_to_file from local first, the local was loaded by above
+	 * xe_map_memcpy_from, then write out the "updated local" through
+	 * xe_map_wr()
+	 */
+	log_buf_state_local.flags &= ~GUC_LOG_BUFFER_STATE_FLUSH_TO_FILE;
+	xe_map_wr(guc_to_xe(guc), &guc->log.bo->vmap,
+		  log_buf_state_offset + offsetof(struct guc_log_buffer_state, flags), u32,
+		  log_buf_state_local.flags);
+	__guc_capture_flushlog_complete(guc);
+}
+
+/*
+ * xe_guc_capture_process - Process GuC register captured data
+ * @guc: The GuC object
+ *
+ * When GuC captured data is ready, GuC will send message
+ * XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION to host, this function will be
+ * called to process the data comes with the message.
+ *
+ * Returns: None
+ */
+void xe_guc_capture_process(struct xe_guc *guc)
+{
+	if (guc->capture)
+		__guc_capture_process_output(guc);
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_alloc_one_node(struct xe_guc *guc)
+{
+	struct drm_device *drm = guc_to_drm(guc);
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
+		new->reginfo[i].regs = drmm_kzalloc(drm, guc->capture->max_mmio_per_node *
+					       sizeof(struct guc_mmio_reg), GFP_KERNEL);
+		if (!new->reginfo[i].regs) {
+			while (i)
+				drmm_kfree(drm, new->reginfo[--i].regs);
+			drmm_kfree(drm, new);
+			return NULL;
+		}
+	}
+	guc_capture_init_node(guc, new);
+
+	return new;
+}
+
+static void
+__guc_capture_create_prealloc_nodes(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *node = NULL;
+	int i;
+
+	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
+		node = guc_capture_alloc_one_node(guc);
+		if (!node) {
+			xe_gt_warn(guc_to_gt(guc), "Register capture pre-alloc-cache failure\n");
+			/* dont free the priors, use what we got and cleanup at shutdown */
+			return;
+		}
+		guc_capture_add_node_to_cachelist(guc->capture, node);
+	}
+}
+
+static int
+guc_get_max_reglist_count(struct xe_guc *guc)
+{
+	int i, j, k, tmp, maxregcount = 0;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
+		for (j = 0; j < GUC_STATE_CAPTURE_TYPE_MAX; ++j) {
+			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
+				if (j == GUC_STATE_CAPTURE_TYPE_GLOBAL && k > 0)
+					continue;
+
+				tmp = guc_cap_list_num_regs(guc->capture, i, j, k);
+				if (tmp > maxregcount)
+					maxregcount = tmp;
+			}
+		}
+	}
+	if (!maxregcount)
+		maxregcount = PREALLOC_NODES_DEFAULT_NUMREGS;
+
+	return maxregcount;
+}
+
+static void
+guc_capture_create_prealloc_nodes(struct xe_guc *guc)
+{
+	/* skip if we've already done the pre-alloc */
+	if (guc->capture->max_mmio_per_node)
+		return;
+
+	guc->capture->max_mmio_per_node = guc_get_max_reglist_count(guc);
+	__guc_capture_create_prealloc_nodes(guc);
+}
+
 /*
  * xe_guc_capture_init - Init for GuC register capture
  * @guc: The GuC object
@@ -684,7 +1391,9 @@ int xe_guc_capture_init(struct xe_guc *guc)
 		return -ENOMEM;
 
 	guc->capture->reglists = guc_capture_get_device_reglist(guc);
-
 	check_guc_capture_size(guc);
+	INIT_LIST_HEAD(&guc->capture->outlist);
+	INIT_LIST_HEAD(&guc->capture->cachelist);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 55c1cedcb923..6bfa6ed73587 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -37,6 +37,7 @@ xe_engine_class_to_guc_capture_class(enum xe_engine_class class)
 	return xe_guc_class_to_capture_class(xe_engine_class_to_guc_class(class));
 }
 
+void xe_guc_capture_process(struct xe_guc *guc);
 int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type,
 			   enum guc_capture_list_class_type capture_class, void **outptr);
 int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..7bf9e45abf49 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1106,6 +1106,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		/* Selftest only at the moment */
 		break;
 	case XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
+		ret = xe_guc_error_capture_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE:
 		/* FIXME: Handle this */
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 26f8c6a4f665..9996b2a635d1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -800,7 +800,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 	xe_sched_job_put(job);
 }
 
-static int guc_read_stopped(struct xe_guc *guc)
+int xe_guc_read_stopped(struct xe_guc *guc)
 {
 	return atomic_read(&guc->submission_state.stopped);
 }
@@ -822,7 +822,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	set_min_preemption_timeout(guc, q);
 	smp_rmb();
 	ret = wait_event_timeout(guc->ct.wq, !exec_queue_pending_enable(q) ||
-				 guc_read_stopped(guc), HZ * 5);
+				 xe_guc_read_stopped(guc), HZ * 5);
 	if (!ret) {
 		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
@@ -948,7 +948,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		 */
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
-					 guc_read_stopped(guc), HZ * 5);
+					 xe_guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
 			xe_sched_submission_start(sched);
@@ -1016,8 +1016,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
 
 	ret = wait_event_timeout(guc->ct.wq,
 				 !exec_queue_pending_enable(q) ||
-				 guc_read_stopped(guc), HZ * 5);
-	if (!ret || guc_read_stopped(guc)) {
+				 xe_guc_read_stopped(guc), HZ * 5);
+	if (!ret || xe_guc_read_stopped(guc)) {
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
@@ -1123,8 +1123,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			 */
 			ret = wait_event_timeout(guc->ct.wq,
 						 !exec_queue_pending_enable(q) ||
-						 guc_read_stopped(guc), HZ * 5);
-			if (!ret || guc_read_stopped(guc))
+						 xe_guc_read_stopped(guc), HZ * 5);
+			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
 			/*
@@ -1148,8 +1148,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
-					 guc_read_stopped(guc), HZ * 5);
-		if (!ret || guc_read_stopped(guc)) {
+					 xe_guc_read_stopped(guc), HZ * 5);
+		if (!ret || xe_guc_read_stopped(guc)) {
 trigger_reset:
 			if (!ret)
 				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
@@ -1340,7 +1340,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 	struct xe_device *xe = guc_to_xe(guc);
 
 	xe_assert(xe, exec_queue_suspended(q) || exec_queue_killed(q) ||
-		  guc_read_stopped(guc));
+		  xe_guc_read_stopped(guc));
 	xe_assert(xe, q->guc->suspend_pending);
 
 	__suspend_fence_signal(q);
@@ -1354,9 +1354,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q)) {
 		wait_event(guc->ct.wq, q->guc->resume_time != RESUME_PENDING ||
-			   guc_read_stopped(guc));
+			   xe_guc_read_stopped(guc));
 
-		if (!guc_read_stopped(guc)) {
+		if (!xe_guc_read_stopped(guc)) {
 			s64 since_resume_ms =
 				ktime_ms_delta(ktime_get(),
 					       q->guc->resume_time);
@@ -1470,7 +1470,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->entity = &ge->entity;
 
-	if (guc_read_stopped(guc))
+	if (xe_guc_read_stopped(guc))
 		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
@@ -1596,6 +1596,9 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
+		   xe_guc_read_stopped(guc));
 	int ret;
 
 	/*
@@ -1606,7 +1609,7 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	ret = wait_event_timeout(q->guc->suspend_wait,
 				 !READ_ONCE(q->guc->suspend_pending) ||
 				 exec_queue_killed(q) ||
-				 guc_read_stopped(guc),
+				 xe_guc_read_stopped(guc),
 				 HZ * 5);
 
 	if (!ret) {
@@ -1729,7 +1732,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
 	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
-		   !guc_read_stopped(guc));
+		   !xe_guc_read_stopped(guc));
 }
 
 void xe_guc_submit_stop(struct xe_guc *guc)
@@ -1738,7 +1741,7 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 	unsigned long index;
 	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, guc_read_stopped(guc) == 1);
+	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
 
@@ -1776,7 +1779,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	unsigned long index;
 	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, guc_read_stopped(guc) == 1);
+	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
@@ -1967,6 +1970,36 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
+/*
+ * xe_guc_error_capture_handler - Handler of GuC captured message
+ * @guc: The GuC object
+ * @msg: Point to the message
+ * @len: The message length
+ *
+ * When GuC captured data is ready, GuC will send message
+ * XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION to host, this function will be
+ * called 1st to check status before process the data comes with the message.
+ *
+ * Returns: None
+ */
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	u32 status;
+
+	if (unlikely(len != XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION_DATA_LEN)) {
+		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	status = msg[0] & XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
+	if (status == XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
+		xe_gt_warn(guc_to_gt(guc), "G2H-Error capture no space");
+
+	xe_guc_capture_process(guc);
+
+	return 0;
+}
+
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index bdf8c9f3d24a..9b71a986c6ca 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,12 +20,14 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
+int xe_guc_read_stopped(struct xe_guc *guc);
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len);
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
-- 
2.34.1


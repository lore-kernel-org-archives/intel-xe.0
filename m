Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521FAC25B76
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 01:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB75A10FD52;
	Tue,  7 May 2024 01:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDSiHagZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5BC10EE6B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 01:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715046476; x=1746582476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9FtHGiR9C1BtjvQ2uFuVBv89hJyJMJ5bg/ODHFT2vTU=;
 b=aDSiHagZLetGh60c6OoHO0C0ClTJ3R+QG/HhSHWncJSrgXIhHOfdDYvY
 1kaPf1HBL3P+lqTJ1XAB0pQCfM6ZOBXYjz+zPskRXgT9rSuiDT79rINb7
 czPEdfjejUhFjJ2/p8yyqiyqwo8xdcTRjm9l8RHGTCWCTy9n4teBP1ilm
 Y3kPzkZC9I8NQaE5Sv42lPpVdMT4EkXxdP8quuwH2/VuCea5flFRQgrc3
 V/1gmseq4X9udpY2U4Ojc6ZPEJ9tJB4qvNbct/hTP0BcK+GT5wX9PWVRl
 Altj0KRcHdvnbx1ryfpTzkVJe8hzumlWQIKb/4CcejTvSJMcYzbJ2IXMF Q==;
X-CSE-ConnectionGUID: UEZI032xTsejoMZDGe10BA==
X-CSE-MsgGUID: IeobB7ihR9apJ877ytLmbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22230835"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="22230835"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 18:47:39 -0700
X-CSE-ConnectionGUID: ellgOYT0Tpivl9PPxx4a1w==
X-CSE-MsgGUID: JmbqQWvPQMKi+Z5k3Giz9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28441663"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 06 May 2024 18:47:39 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 4/6] drm/xe/guc: Extract GuC error capture lists
Date: Mon,  6 May 2024 18:47:34 -0700
Message-Id: <20240507014736.1057093-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507014736.1057093-1-zhanjun.dong@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
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

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   7 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 558 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  45 ++
 drivers/gpu/drm/xe/xe_guc_ct.c           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |  45 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |   2 +
 7 files changed, 646 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 79ba98a169f9..ed1eeea34e8e 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -182,6 +182,13 @@ enum xe_guc_sleep_state_status {
 #define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
 #define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
 
+enum intel_guc_state_capture_event_status {
+	XE_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
+	XE_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
+};
+
+#define XE_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
+
 #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
 #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
 /* Flush PPC or SMRO caches along with TLB invalidation request */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index d2df027081b5..71d7c4a58925 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -520,6 +520,560 @@ static void check_guc_capture_size(struct xe_guc *guc)
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
+guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	INIT_LIST_HEAD(&node->link);
+}
+
+/*
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
+ *                         saved from the error-engine-dump.
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
+ * Below function, guc_capture_log_remove_dw is a helper for that. All callers of this
+ * function would typically do a straight-up memcpy from the ring contents and will only
+ * call this helper if their structure-extraction is straddling across the end of the
+ * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
+ * scalability for future expansion of output data types without requiring a redesign
+ * of the flow controls.
+ */
+static int
+guc_capture_log_remove_dw(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			  u32 *dw)
+{
+	int tries = 2;
+	int avail = 0;
+
+	if (!guc_capture_buf_cnt(buf))
+		return 0;
+
+	while (tries--) {
+		avail = guc_capture_buf_cnt_to_end(buf);
+		if (avail >= sizeof(u32)) {
+			*dw = xe_map_rd(guc_to_xe(guc), &guc->log.bo->vmap,
+					buf->data_offset + buf->rd, u32);
+			buf->rd += 4;
+			return 4;
+		}
+		if (avail)
+			xe_gt_dbg(guc_to_gt(guc), "Register capture log not dword aligned, skipping.\n");
+		buf->rd = 0;
+	}
+
+	return 0;
+}
+
+static bool
+guc_capture_data_extracted(struct xe_guc *guc, struct __guc_capture_bufstate *b,
+			   int size, void *dest)
+{
+	if (guc_capture_buf_cnt_to_end(b) >= size) {
+		xe_map_memcpy_from(guc_to_xe(guc), dest, &guc->log.bo->vmap,
+				   b->data_offset + b->rd, size);
+		b->rd += size;
+		return true;
+	}
+	return false;
+}
+
+static int
+guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			      struct guc_state_capture_group_header_t *ghdr)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_state_capture_group_header_t);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(guc, buf, fullsize, (void *)ghdr))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &ghdr->owner);
+	read += guc_capture_log_remove_dw(guc, buf, &ghdr->info);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static int
+guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_state_capture_header_t *hdr)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_state_capture_header_t);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(guc, buf, fullsize, (void *)hdr))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->owner);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->info);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->lrca);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->guc_id);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->num_mmios);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static int
+guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_mmio_reg *reg)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_mmio_reg);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(guc, buf, fullsize, (void *)reg))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &reg->offset);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->value);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->flags);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->mask);
+	if (read != fullsize)
+		return -1;
+
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
+			list_del(&n->link);
+			break;
+		}
+	} else {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* traverse down and steal back the oldest node already allocated */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+			found = n;
+		}
+		if (found)
+			list_del(&found->link);
+	}
+	if (found)
+		guc_capture_init_node(guc, found);
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
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
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
+			if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS) {
+				new->eng_class = original->eng_class;
+			} else if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
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
+	enum guc_capture_type datatype;
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
+	is_partial = FIELD_GET(CAP_GRP_HDR_CAPTURE_TYPE, ghdr.info);
+	numlists = FIELD_GET(CAP_GRP_HDR_NUM_CAPTURES, ghdr.info);
+
+	while (numlists--) {
+		if (guc_capture_log_get_data_hdr(guc, buf, &hdr)) {
+			ret = -EIO;
+			break;
+		}
+
+		datatype = FIELD_GET(CAP_HDR_CAPTURE_TYPE, hdr.info);
+		if (datatype > GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
+			/* unknown capture type - skip over to next capture set */
+			numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
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
+			if (datatype == GUC_CAPTURE_LIST_TYPE_GLOBAL) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS &&
+				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS].num_regs) {
+				/* Add to list, clone node and duplicate global list */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      GCAP_PARSED_REGLIST_INDEX_GLOBAL);
+			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE &&
+				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE].num_regs) {
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
+			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
+				xe_gt_dbg(gt, "Register capture missing global dump: %08x!\n",
+					  datatype);
+		}
+		node->is_partial = is_partial;
+		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
+
+		switch (datatype) {
+		case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
+			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
+			node->eng_inst = FIELD_GET(CAP_HDR_ENGINE_INSTANCE, hdr.info);
+			node->lrca = hdr.lrca;
+			node->guc_id = hdr.guc_id;
+			break;
+		case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
+			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
+			break;
+		default:
+			break;
+		}
+
+		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
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
+		for (i = GUC_CAPTURE_LIST_TYPE_GLOBAL; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+			if (node->reginfo[i].regs) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+				break;
+			}
+		}
+	}
+	return ret;
+}
+
+static int __guc_capture_flushlog_complete(struct xe_guc *guc)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
+		GUC_CAPTURE_LOG_BUFFER
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
+	struct guc_log_buffer_state *log_buf_state;
+	struct __guc_capture_bufstate buf;
+	bool new_overflow;
+	int ret;
+	u32 log_buf_state_offset;
+	u32 src_data_offset;
+
+	log_buf_state = (struct guc_log_buffer_state *)((ulong)guc->log.bo->vmap.vaddr +
+			(sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER));
+
+	log_buf_state_offset = sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER;
+	src_data_offset = xe_guc_get_log_buffer_offset(&guc->log, GUC_CAPTURE_LOG_BUFFER);
+
+	/*
+	 * Make a copy of the state structure, inside GuC log buffer
+	 * (which is uncached mapped), on the stack to avoid reading
+	 * from it multiple times.
+	 */
+	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
+			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
+
+	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_CAPTURE_LOG_BUFFER);
+	read_offset = log_buf_state_local.read_ptr;
+	write_offset = log_buf_state_local.sampled_write_ptr;
+	full_count = log_buf_state_local.buffer_full_cnt;
+
+	/* Bookkeeping stuff */
+	guc->log.stats[GUC_CAPTURE_LOG_BUFFER].flush += log_buf_state_local.flush_to_file;
+	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_CAPTURE_LOG_BUFFER,
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
+		} while (ret >= 0);
+	}
+
+	/* Update the state of log buffer err-cap state */
+	log_buf_state->read_ptr = write_offset;
+	log_buf_state->flush_to_file = 0;
+	__guc_capture_flushlog_complete(guc);
+}
+
+void xe_guc_capture_process(struct xe_guc *guc)
+{
+	if (guc->capture)
+		__guc_capture_process_output(guc);
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
@@ -527,7 +1081,9 @@ int xe_guc_capture_init(struct xe_guc *guc)
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
index 93e9c3784131..891f1e0fcb82 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -10,6 +10,7 @@
 
 struct xe_guc;
 
+void xe_guc_capture_process(struct xe_guc *guc);
 int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
 int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
index a3b3f52317a7..c406669355e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -10,6 +10,51 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_guc_fwif.h"
 
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
+	} reginfo[GUC_CAPTURE_LIST_TYPE_MAX];
+#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_CAPTURE_LIST_TYPE_GLOBAL)
+#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS)
+};
+
 /*
  * struct guc_debug_capture_list_header / struct guc_debug_capture_list
  *
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0151d29b3c58..aebdeb85dd99 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1044,6 +1044,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		/* Selftest only at the moment */
 		break;
 	case XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
+		ret = xe_guc_error_capture_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE:
 		/* FIXME: Handle this */
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d274a139010b..dcbeb3eff5ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -25,6 +25,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_id_mgr.h"
@@ -753,7 +754,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 	xe_sched_job_put(job);
 }
 
-static int guc_read_stopped(struct xe_guc *guc)
+int xe_guc_read_stopped(struct xe_guc *guc)
 {
 	return atomic_read(&guc->submission_state.stopped);
 }
@@ -775,7 +776,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	set_min_preemption_timeout(guc, q);
 	smp_rmb();
 	ret = wait_event_timeout(guc->ct.wq, !exec_queue_pending_enable(q) ||
-				 guc_read_stopped(guc), HZ * 5);
+				 xe_guc_read_stopped(guc), HZ * 5);
 	if (!ret) {
 		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
@@ -939,7 +940,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		 */
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
-					 guc_read_stopped(guc), HZ * 5);
+					 xe_guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
 			xe_sched_submission_start(sched);
@@ -1028,8 +1029,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
-					 guc_read_stopped(guc), HZ * 5);
-		if (!ret || guc_read_stopped(guc)) {
+					 xe_guc_read_stopped(guc), HZ * 5);
+		if (!ret || xe_guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
@@ -1142,7 +1143,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 	struct xe_device *xe = guc_to_xe(guc);
 
 	xe_assert(xe, exec_queue_suspended(q) || exec_queue_killed(q) ||
-		  guc_read_stopped(guc));
+		  xe_guc_read_stopped(guc));
 	xe_assert(xe, q->guc->suspend_pending);
 
 	q->guc->suspend_pending = false;
@@ -1158,9 +1159,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q)) {
 		wait_event(guc->ct.wq, q->guc->resume_time != RESUME_PENDING ||
-			   guc_read_stopped(guc));
+			   xe_guc_read_stopped(guc));
 
-		if (!guc_read_stopped(guc)) {
+		if (!xe_guc_read_stopped(guc)) {
 			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
 			s64 since_resume_ms =
 				ktime_ms_delta(ktime_get(),
@@ -1288,7 +1289,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->entity = &ge->entity;
 
-	if (guc_read_stopped(guc))
+	if (xe_guc_read_stopped(guc))
 		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
@@ -1414,7 +1415,7 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
 	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
-		   guc_read_stopped(guc));
+		   xe_guc_read_stopped(guc));
 }
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
@@ -1516,7 +1517,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
-	wait_event(guc->ct.wq, !guc_read_stopped(guc));
+	wait_event(guc->ct.wq, !xe_guc_read_stopped(guc));
 }
 
 void xe_guc_submit_stop(struct xe_guc *guc)
@@ -1525,7 +1526,7 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 	unsigned long index;
 	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, guc_read_stopped(guc) == 1);
+	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
 
@@ -1563,7 +1564,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	unsigned long index;
 	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, guc_read_stopped(guc) == 1);
+	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
@@ -1734,6 +1735,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	u32 status;
+
+	if (unlikely(len != 1)) {
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
index 4275b7da9df5..00f27a0c37b0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -19,12 +19,14 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 
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


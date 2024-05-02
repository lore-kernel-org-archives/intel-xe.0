Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC9CC04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1A21126B0;
	Thu,  2 May 2024 20:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA41Hn8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96810F7EE
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714683462; x=1746219462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ugmEMDEx8ZWgOfF1czINBnMIbTaRXu7Co6nVcvmMfGY=;
 b=DA41Hn8NCAyW6Y18l4HoNQ5RQxulfqi4Cfqg7pdE5AFq3ZE+RfB11FzV
 QPslZsGfEDWbu3BiuI14aWCiBRND02X5T0EMwvq5s61f+0mTCd5Kcx9k0
 ZqAo82z5oCCMH588IhlQay5J+0SdPQnGxMppM61aUAintnExCU52kz0lq
 LaDny/iw0srnOdADhrfxYzAsJvU1vhD/PqI5fPEn6W29XrqMwsqRFdgcl
 0x4zvljDdy7N3t6rvEk4Uy380mw53UAFJyh21kyUYEJNL91eLAtS65SGA
 orV+zMtrq4xt9HH9plJAOLpynNvq4drvR0XGuPtZ5uBJ/H5+XyU8ir1es Q==;
X-CSE-ConnectionGUID: szsmljWUQ4C1kLPQkexrRw==
X-CSE-MsgGUID: qR31m94aQr+8LKqDDrdf0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10696528"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10696528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:57:41 -0700
X-CSE-ConnectionGUID: 2E/NWBoXTNq+v/lSkHHcwQ==
X-CSE-MsgGUID: DsqjZA6aTCqqS0ryczK+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27218899"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 02 May 2024 13:57:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 3/5] drm/xe/guc: Pre-allocate output nodes for extraction
Date: Thu,  2 May 2024 13:57:36 -0700
Message-Id: <20240502205738.863369-4-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502205738.863369-1-zhanjun.dong@intel.com>
References: <20240502205738.863369-1-zhanjun.dong@intel.com>
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

re-allocate a fixed number of empty nodes up front (at the
time of ADS registration) that we can consume from or return to
an internal cached list of nodes.
Add guc capture data structure definition.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c      | 116 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  45 +++++++++
 2 files changed, 161 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 91dafaac97ba..806953d433b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -148,6 +148,7 @@ static const char * const capture_engine_class_names[] = {
  */
 #define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
 									 (index)])
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
 
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
@@ -430,6 +431,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, voi
 		return cache->status;
 	}
 
+	/*
+	 * ADS population of input registers is a good
+	 * time to pre-allocate cachelist output nodes
+	 */
+	guc_capture_create_prealloc_nodes(guc);
+
 	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
 	if (ret) {
 		cache->is_valid = true;
@@ -520,6 +527,115 @@ static void check_guc_capture_size(struct xe_guc *guc)
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
+guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
+				  struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->cachelist);
+}
+
+static void
+guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	struct guc_mmio_reg *tmp[GUC_CAPTURE_LIST_TYPE_MAX];
+	int i;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		tmp[i] = node->reginfo[i].regs;
+		memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
+		       guc->capture->max_mmio_per_node);
+	}
+	memset(node, 0, sizeof(*node));
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
+		node->reginfo[i].regs = tmp[i];
+
+	INIT_LIST_HEAD(&node->link);
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
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
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
+		for (j = 0; j < GUC_CAPTURE_LIST_TYPE_MAX; ++j) {
+			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
+				if (j == GUC_CAPTURE_LIST_TYPE_GLOBAL && k > 0)
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
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
index a3b3f52317a7..f0532a87e31d 100644
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
+	void *data;
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
+	 * i915_gpu_codedump in response to a context reset
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
-- 
2.34.1


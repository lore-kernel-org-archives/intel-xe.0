Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A48C25B5F
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 01:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8FA10EDBB;
	Tue,  7 May 2024 01:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OG6GHSx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CD410E219
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 01:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715046475; x=1746582475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Ol2Q5abYyFS7u59oehEcCOXQv52YErmukU7Hza1//g=;
 b=OG6GHSx74w9JiiF3pxqWZaQH7w/sXo+EMlEuq5IccwyjLwrZeBfwWZqa
 dHK5mJCA10Zee7CrLmz431jYo1ZAnOQj4PfYwF9ujlhxigo5L3EVI/IpI
 6AHRQZ2GQxwGKc9xFH9qOFjA4ktoasj9USof6lGk2B8DE3Okk//cjr6su
 0CAKcx0ByCg0OK/2JpUksqWwUx2P0Q6kpOFFrjtZxrcK0Ab1RdUaB3uIY
 Lq7gawjOrC7T+AdtYt52UZmtsmCfeZAt7BcMq4JbnOm5MEHnB5JVc5QmL
 NDOjW3i//g3Xk4fuyl6oMzMhF9nqMUMwHuJS8+F3B9cQNnnjfuD2ygd68 g==;
X-CSE-ConnectionGUID: tP6s6ocwS7mAmXV2IsSx2Q==
X-CSE-MsgGUID: cmjjo8EdTTCmgZ5miiHlMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22230837"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="22230837"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 18:47:39 -0700
X-CSE-ConnectionGUID: 06+AFV9SS5OQLvKnO/Y4Yg==
X-CSE-MsgGUID: kdIOSuptQRyQwCFq6MVhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28441666"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 06 May 2024 18:47:39 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 5/6] drm/xe/guc: Pre-allocate output nodes for extraction
Date: Mon,  6 May 2024 18:47:35 -0700
Message-Id: <20240507014736.1057093-6-zhanjun.dong@intel.com>
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

re-allocate a fixed number of empty nodes up front (at the
time of ADS registration) that we can consume from or return to
an internal cached list of nodes.
Add guc capture data structure definition.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 71d7c4a58925..42aae4d99514 100644
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
@@ -534,9 +541,28 @@ guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
 	guc_capture_add_node_to_list(node, &gc->outlist);
 }
 
+static void
+guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
+				  struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->cachelist);
+}
+
 static void
 guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
 {
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
 	INIT_LIST_HEAD(&node->link);
 }
 
@@ -986,6 +1012,8 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
 				break;
 			}
 		}
+		if (node) /* else return it back to cache list */
+			guc_capture_add_node_to_cachelist(guc->capture, node);
 	}
 	return ret;
 }
@@ -1074,6 +1102,83 @@ void xe_guc_capture_process(struct xe_guc *guc)
 		__guc_capture_process_output(guc);
 }
 
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
-- 
2.34.1


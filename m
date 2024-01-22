Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC707C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B3610EFBC;
	Mon, 22 Jan 2024 21:26:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D623F10EFC4
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958763; x=1737494763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fC9iNv3R7fUup/AzfLSec/FSDMCxJRD6+pOOfFlQYlE=;
 b=gwuTGZbcJNG4M7MRjT6bEU9MVre9/721UivbiIjWCwXPGcY8UQzNv+Bm
 6u1p1bAD8x6vhtbAwZE1fThW6chx8p9zHLNshEZ0fb5kOK4tOW70/eawp
 +qW/XdL29wc8OnBxqz4RoI7FD3afDT9WTjByIXze/RPegklx7zzQdaV1B
 ULLhPtyNlVoKJEpPlGNJE1vvEK9yOmI/NeRV6uPvx5YHl6yLUwOZyLGjI
 L6ybOtJ8RzrldmHWBbxlMmfKR1CSQIR56cA7AIdYim0cp7vWNkmwgDyx5
 8Z/xX434TiFzYc/PgfcGAhhBqngaTi+5dpheyBkDg4qusMl+V4kFQuUMu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432488202"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432488202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1432772"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2024 13:26:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 8/9] drm/xe/guc: Pre-allocate output nodes for extraction
Date: Mon, 22 Jan 2024 13:25:56 -0800
Message-Id: <20240122212557.55929-9-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122212557.55929-1-zhanjun.dong@intel.com>
References: <20240122212557.55929-1-zhanjun.dong@intel.com>
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

Pre-allocate a fixed number of empty nodes up front (at the
time of ADS registration) that we can consume from or return to
an internal cached list of nodes.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c         |   1 +
 drivers/gpu/drm/xe/xe_guc_capture.c | 161 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h |   1 +
 3 files changed, 163 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 63587db6a548..71c3488f2739 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -253,6 +253,7 @@ static void guc_fini(struct drm_device *drm, void *arg)
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 	xe_guc_pc_fini(&guc->pc);
+	xe_guc_capture_destroy(guc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 94ac351c6c16..2989c0869a73 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -256,6 +256,17 @@ guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+static void guc_capture_free_extlists(struct __guc_mmio_reg_descr_group *reglists)
+{
+	int i = 0;
+
+	if (!reglists)
+		return;
+
+	while (reglists[i].extlist)
+		kfree(reglists[i++].extlist);
+}
+
 struct __ext_steer_reg {
 	const char *name;
 	struct xe_reg_mcr reg;
@@ -481,6 +492,8 @@ xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
 	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
 }
 
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
+
 int
 xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
 {
@@ -499,6 +512,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, voi
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
@@ -899,6 +918,31 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
 	return found;
 }
 
+static struct __guc_capture_parsed_output *
+guc_capture_alloc_one_node(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		new->reginfo[i].regs = kcalloc(guc->capture->max_mmio_per_node,
+					       sizeof(struct guc_mmio_reg), GFP_KERNEL);
+		if (!new->reginfo[i].regs) {
+			while (i)
+				kfree(new->reginfo[--i].regs);
+			kfree(new);
+			return NULL;
+		}
+	}
+	guc_capture_init_node(guc, new);
+
+	return new;
+}
+
 static struct __guc_capture_parsed_output *
 guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
 		       u32 keep_reglist_mask)
@@ -939,6 +983,85 @@ guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *o
 	return new;
 }
 
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
+static void
+guc_capture_delete_one_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	int i;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
+		kfree(node->reginfo[i].regs);
+	list_del(&node->link);
+	kfree(node);
+}
+
+static void
+guc_capture_delete_prealloc_nodes(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	/*
+	 * NOTE: At the end of driver operation, we must assume that we
+	 * have prealloc nodes in both the cachelist as well as outlist
+	 * if unclaimed error capture events occurred prior to shutdown.
+	 */
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link)
+		guc_capture_delete_one_node(guc, n);
+
+	list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link)
+		guc_capture_delete_one_node(guc, n);
+}
+
 static int
 guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
 {
@@ -1208,6 +1331,40 @@ void xe_guc_capture_process(struct xe_guc *guc)
 		__guc_capture_process_output(guc);
 }
 
+static void
+guc_capture_free_ads_cache(struct xe_guc_state_capture *gc)
+{
+	int i, j, k;
+	struct __guc_capture_ads_cache *cache;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
+		for (j = 0; j < GUC_CAPTURE_LIST_TYPE_MAX; ++j) {
+			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
+				cache = &gc->ads_cache[i][j][k];
+				if (cache->is_valid)
+					kfree(cache->ptr);
+			}
+		}
+	}
+	kfree(gc->ads_null_cache);
+}
+
+void xe_guc_capture_destroy(struct xe_guc *guc)
+{
+	if (!guc->capture)
+		return;
+
+	guc_capture_free_ads_cache(guc->capture);
+
+	guc_capture_delete_prealloc_nodes(guc);
+
+	guc_capture_free_extlists(guc->capture->extlists);
+	kfree(guc->capture->extlists);
+
+	kfree(guc->capture);
+	guc->capture = NULL;
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
@@ -1225,6 +1382,10 @@ int xe_guc_capture_init(struct xe_guc *guc)
 
 #else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
 
+void xe_guc_capture_destroy(struct xe_guc *guc)
+{
+}
+
 void xe_guc_capture_process(struct xe_guc *guc)
 {
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index a16dcbe87af0..734315456b4d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -15,6 +15,7 @@ void xe_guc_capture_process(struct xe_guc *guc);
 int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
 int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
+void xe_guc_capture_destroy(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif /* _XE_GUC_CAPTURE_H */
-- 
2.34.1


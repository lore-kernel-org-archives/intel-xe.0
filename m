Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21308C54E8A
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 14:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7310FB1B;
	Tue, 19 Mar 2024 14:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bz4yxcX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D261110FB33
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710859007; x=1742395007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUsms7BZXnP3niFKvCu0HDv6SQEPq6nj9xV8VaG4F7w=;
 b=bz4yxcX+u5bwMIYP2DzhGPZU4bRS9rMfdWxwXO/IgPPghUtofKrEIgQo
 vNqOAYIJ3ZRy8BwM49ZC9HJqtRTUVniQIVEaM3Ftge5zCxNWNuA3pzMUl
 BSB1soHjV72IAK05Uc+9QeontvnGWlrnfdf4lac/TTH5irzspDZ0Aqg+2
 Sl2hgpYHHUUaHcc7R+G2XyyThSgxLVtXHxtDf1MZfLu0UtZ0ZPzPO+nvJ
 5OOFytpaQ7G2NfCdLQrjNJi/O14QusSn4/E66m6r0CBNqRL2vQzl0BJ5h
 H/K429Nwzo14v+nnRND/lfnJupbzpXgTo1dag8mlO8R3ZptWrE4HY7ALA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="31161891"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="31161891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 07:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="18562762"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 19 Mar 2024 07:36:46 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v6 7/8] drm/xe/guc: Pre-allocate output nodes for extraction
Date: Tue, 19 Mar 2024 07:36:20 -0700
Message-Id: <20240319143621.371087-8-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319143621.371087-1-zhanjun.dong@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c | 160 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h |   1 +
 3 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index feceba7659f3..5434280ad733 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -253,6 +253,7 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	xe_guc_capture_destroy(guc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f6c64948be31..e1857820b715 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -149,6 +149,7 @@ static const char * const capture_engine_class_names[] = {
  */
 #define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
 									 (index)])
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
 
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
@@ -186,6 +187,17 @@ guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
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
@@ -430,6 +442,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, voi
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
@@ -830,6 +848,31 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
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
@@ -870,6 +913,85 @@ guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *o
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
@@ -1139,6 +1261,40 @@ void xe_guc_capture_process(struct xe_guc *guc)
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
@@ -1156,6 +1312,10 @@ int xe_guc_capture_init(struct xe_guc *guc)
 
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


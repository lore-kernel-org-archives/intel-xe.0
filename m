Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE610C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 23:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72910E601;
	Tue, 16 Jan 2024 23:16:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB9B10E0D6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 23:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705446964; x=1736982964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6YeUwyy4ItprxgVZ9Z/0/l8Z+sg2KssHumqUiIjNa9o=;
 b=GXgl4ifu1Cqji27moTjLzIA4XZT3CR5rPO5NifSa3/nhqK9uVDf90lMv
 STtNvvLM0Msudw2KbP3XI1MwwkDiFUQpFV7FcWkjSrrCCZ2tTvkxbHWcf
 pQ670jhXfw1xUPIIn4XMhBMVNKFBGUhASKRUTiZpaAPhjZU7x15LulX+r
 FmVcO4IX3U1Scm438HLP2pOXG4oiF+PXkKIaEKHSD0W5G+ZvLzGe8YCrH
 AJ6ykvTIOTIVeepFMdemU3KqdQwYhayJQEd0Y3QzWbUt3MRZLwEHemQdb
 pDecoC8hcpApCM5ZeH/icSu1gL+aXlHipf1k9CxHtmD593qeoTGA/ZZF3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397171520"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397171520"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 15:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1031147517"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="1031147517"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2024 15:16:03 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/guc: Pre-allocate output nodes for extraction
Date: Tue, 16 Jan 2024 15:15:59 -0800
Message-Id: <20240116231600.154097-9-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116231600.154097-1-zhanjun.dong@intel.com>
References: <20240116231600.154097-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c | 84 +++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 97c194d59041..c1ce55ae4634 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -479,6 +479,8 @@ xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
 	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
 }
 
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
+
 int
 xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
 {
@@ -497,6 +499,12 @@ xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, voi
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
@@ -897,6 +905,31 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
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
@@ -937,6 +970,57 @@ guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *o
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
 static int
 guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
 {
-- 
2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E33C36004
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2731410E6D3;
	Thu, 20 Mar 2025 21:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlkwPTU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B22B10E6D2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742504875; x=1774040875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWFpyeAR0s5/COraxJsPN7EaoCPLtVFaB89Y+PQOUS0=;
 b=YlkwPTU+tkvUjzLzhBHFQhIieEjbSkpxcUTNEOjHkolgwCZLujK1Ja7F
 iWx/TaUrk/dvBBm/WKO9E8zc5VUVIk162j1wYNh0xFndUWAULtAC6uKAT
 VXBWQAURiUDjtnf6PGER1DaddwRo8NMH6KG/z3/v0x4H8dYRFPF9PZgcB
 d8fcwvGlk4HvAetHNATTW5lbIWO2kR6hALYUEUXXcEypXdjHCeoo+zoUO
 V77TkargX/Cpx85u/2V9RSTTnNfLfejALViUrUJ5sTEVFTXz789ha2ixk
 cHBXq2QE8TYqwQGnZ1qtFaiOKG8hGUMQKdUVrya3FyyVRUGCwq1A0CWKy Q==;
X-CSE-ConnectionGUID: LMxZq/ekRqu/RDU4pfLTOQ==
X-CSE-MsgGUID: SuhR3VxNSh6NhGuO0Geylg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43875355"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43875355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:54 -0700
X-CSE-ConnectionGUID: iPaqu6vwQdOLikjChpNlhg==
X-CSE-MsgGUID: lM/gMzRFQcW/Cc0YBSuRuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128326122"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.113.30])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Refactor GuC debugfs initialization
Date: Thu, 20 Mar 2025 22:07:36 +0100
Message-Id: <20250320210738.1733-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250320210738.1733-1-michal.wajdeczko@intel.com>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We don't have to drmm_kmalloc() local copy of debugfs_list to
write there our pointer to the struct xe_guc as we can extract
pointer to the struct xe_gt from the grandparent debugfs entry,
in similar way to what we did for GT debugfs files.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 94 ++++++++++-------------------
 1 file changed, 31 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index c569ff456e74..d59408ef0b9d 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -17,101 +17,69 @@
 #include "xe_macros.h"
 #include "xe_pm.h"
 
-static struct xe_guc *node_to_guc(struct drm_info_node *node)
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── uc
+ *      │   │   ├── guc_info
+ *      │   │   ├── guc_...
+ */
+
+static int guc_debugfs_show(struct seq_file *m, void *data)
 {
-	return node->info_ent->data;
-}
-
-static int guc_info(struct seq_file *m, void *data)
-{
-	struct xe_guc *guc = node_to_guc(m->private);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_info_node *node = m->private;
+	struct dentry *parent = node->dent->d_parent;
+	struct dentry *grandparent = parent->d_parent;
+	struct xe_gt *gt = grandparent->d_inode->i_private;
+	struct xe_device *xe = gt_to_xe(gt);
+	int (*print)(struct xe_guc *, struct drm_printer *) = node->info_ent->data;
+	int ret;
 
 	xe_pm_runtime_get(xe);
-	xe_guc_print_info(guc, &p);
+	ret = print(&gt->uc.guc, &p);
 	xe_pm_runtime_put(xe);
 
-	return 0;
+	return ret;
 }
 
-static int guc_log(struct seq_file *m, void *data)
+static int guc_log(struct xe_guc *guc, struct drm_printer *p)
 {
-	struct xe_guc *guc = node_to_guc(m->private);
-	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_pm_runtime_get(xe);
-	xe_guc_log_print(&guc->log, &p);
-	xe_pm_runtime_put(xe);
-
+	xe_guc_log_print(&guc->log, p);
 	return 0;
 }
 
-static int guc_log_dmesg(struct seq_file *m, void *data)
+static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
 {
-	struct xe_guc *guc = node_to_guc(m->private);
-	struct xe_device *xe = guc_to_xe(guc);
-
-	xe_pm_runtime_get(xe);
 	xe_guc_log_print_dmesg(&guc->log);
-	xe_pm_runtime_put(xe);
-
 	return 0;
 }
 
-static int guc_ctb(struct seq_file *m, void *data)
+static int guc_ctb(struct xe_guc *guc, struct drm_printer *p)
 {
-	struct xe_guc *guc = node_to_guc(m->private);
-	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_pm_runtime_get(xe);
-	xe_guc_ct_print(&guc->ct, &p, true);
-	xe_pm_runtime_put(xe);
-
+	xe_guc_ct_print(&guc->ct, p, true);
 	return 0;
 }
 
-static int guc_pc(struct seq_file *m, void *data)
+static int guc_pc(struct xe_guc *guc, struct drm_printer *p)
 {
-	struct xe_guc *guc = node_to_guc(m->private);
-	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_pm_runtime_get(xe);
-	xe_guc_pc_print(&guc->pc, &p);
-	xe_pm_runtime_put(xe);
-
+	xe_guc_pc_print(&guc->pc, p);
 	return 0;
 }
 
 static const struct drm_info_list debugfs_list[] = {
-	{"guc_info", guc_info, 0},
-	{"guc_log", guc_log, 0},
-	{"guc_log_dmesg", guc_log_dmesg, 0},
-	{"guc_ctb", guc_ctb, 0},
-	{"guc_pc", guc_pc, 0},
+	{ "guc_info", .show = guc_debugfs_show, .data = xe_guc_print_info },
+	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
+	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
+	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
+	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 {
 	struct drm_minor *minor = guc_to_xe(guc)->drm.primary;
-	struct drm_info_list *local;
-	int i;
 
-#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
-	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
-	if (!local)
-		return;
-
-	memcpy(local, debugfs_list, DEBUGFS_SIZE);
-#undef DEBUGFS_SIZE
-
-	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
-		local[i].data = guc;
-
-	drm_debugfs_create_files(local,
+	drm_debugfs_create_files(debugfs_list,
 				 ARRAY_SIZE(debugfs_list),
 				 parent, minor);
 }
-- 
2.47.1


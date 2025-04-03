Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D034FC3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 14:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C52A10EA00;
	Thu,  3 Apr 2025 14:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoP0mGov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0910EA34
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743690408; x=1775226408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OR2ZS5dbVbPrPj4s+opDc89YbJOA7MlOi+pCFMpGrKI=;
 b=HoP0mGovf4+aT6R6jRglpkO40vBww39jCrvOLN1gGLRj0WtO20DQCCKS
 jSNYr4I6a6ec3+lIGY0I6ZWxkbWpKw7TPAtWB2ORii/gJZmp7ntXkCp6/
 NfNG15P986DjPkf1QCFVQYoAEi6pUBxL0AZcmv+H6qcx+j1gZW6hTIs1N
 BBzXV0mNgrEsqt1ae6eTzc9tW6aBo534GbGrfe3fqUbDJl4WtNqAxcVoC
 NdyYax6k+q5LXwaxVFcMVLH/rmhzx8/X6qUbxyRRsPVpPFy7BEK/Oajbj
 X1wPXj0haHPi7ab+/YssUqhNQjI/94PcrJF7asRo/YEQl7IIVd2tWJ5l+ g==;
X-CSE-ConnectionGUID: lKafZDooTFy8FcSRWfaE2w==
X-CSE-MsgGUID: 2HyDRFVMQkW1v4u3eo/06g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45116894"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45116894"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:48 -0700
X-CSE-ConnectionGUID: WiZgGVg+QumT+dWSovYLEQ==
X-CSE-MsgGUID: ww+PWaHgQb65FrIJP2voAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="164260909"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.114.177])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 07:26:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/3] drm/xe/guc: Refactor GuC debugfs initialization
Date: Thu,  3 Apr 2025 16:26:33 +0200
Message-Id: <20250403142635.1821-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250403142635.1821-1-michal.wajdeczko@intel.com>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
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

Note that there is no change in file/directory structure, just
refactored how files are created and how functions are called.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v1
---
v2: document guc_debugfs_show helper (Lucas)
    clarify no changes in file structure (Lucas)
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 130 ++++++++++++++--------------
 1 file changed, 67 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index c569ff456e74..9a1c78b89f45 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -17,101 +17,105 @@
 #include "xe_macros.h"
 #include "xe_pm.h"
 
-static struct xe_guc *node_to_guc(struct drm_info_node *node)
+/*
+ * guc_debugfs_show - A show callback for struct drm_info_list
+ * @m: the &seq_file
+ * @data: data used by the drm debugfs helpers
+ *
+ * This callback can be used in struct drm_info_list to describe debugfs
+ * files that are &xe_guc specific in similar way how we handle &xe_gt
+ * specific files using &xe_gt_debugfs_simple_show.
+ *
+ * It is assumed that those debugfs files will be created on directory entry
+ * which grandparent struct dentry d_inode->i_private points to &xe_gt.
+ *
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0			# dent->d_parent->d_parent (d_inode->i_private == gt)
+ *      │   ├── uc		# dent->d_parent
+ *      │   │   ├── guc_info	# dent
+ *      │   │   ├── guc_...
+ *
+ * This function assumes that &m->private will be set to the &struct
+ * drm_info_node corresponding to the instance of the info on a given &struct
+ * drm_minor (see struct drm_info_list.show for details).
+ *
+ * This function also assumes that struct drm_info_list.data will point to the
+ * function code that will actually print a file content::
+ *
+ *    int (*print)(struct xe_guc *, struct drm_printer *)
+ *
+ * Example::
+ *
+ *    int foo(struct xe_guc *guc, struct drm_printer *p)
+ *    {
+ *        drm_printf(p, "enabled %d\n", guc->submission_state.enabled);
+ *        return 0;
+ *    }
+ *
+ *    static const struct drm_info_list bar[] = {
+ *        { name = "foo", .show = guc_debugfs_show, .data = foo },
+ *    };
+ *
+ *    parent = debugfs_create_dir("uc", gtdir);
+ *    drm_debugfs_create_files(bar, ARRAY_SIZE(bar), parent, minor);
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
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


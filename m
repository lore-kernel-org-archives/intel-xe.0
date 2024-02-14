Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68388C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 11:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A728310E7FC;
	Wed, 14 Feb 2024 11:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBiB5BSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CF310E797
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707911891; x=1739447891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=652gxSspewm4dTp/J3/SmlhLqLf8g8uv5WPiTN+InJ0=;
 b=EBiB5BShusSc45QGIPb5r96BQAQ4TdQSX9dYtzRhI1ByduoBLVC6RPWp
 Sv87ChT6NKtNvs1yYSY1LNwRR0w7TVXGAj5s02TCXCWxXEv2rkv/5qBoU
 3221vs5/IHWCy8m1lS2TOVKvnTOWVCDxkdoPmt1qx07h78Y/Ck7FAC/lm
 CSUeO2ZHzixizMBAPWdXmEmoqfCeMhTREesdj2SY7RBT3lgwM5DheePPM
 hCkYVsT5/XvDSE1BU13/xbj7JtaICY7tM6yU5vbMEaZY4CqwpVgUyyeg3
 jR+nDuaSt6jac+Xu6WIxK3ybZHtG5e2ZIjSMfjKJ8tcEcvbJqErg74/Vc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2090353"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2090353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3529176"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.138.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe: Define helper for GT specific debugfs files
Date: Wed, 14 Feb 2024 12:57:55 +0100
Message-Id: <20240214115756.1525-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240214115756.1525-1-michal.wajdeczko@intel.com>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
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

Many of our debugfs files are GT specific and require a pointer to
struct xe_gt to correctly show its content.  Our initial approach
to use drm_info_list.data field to pass pointer not only requires
extra steps (like copying template per each GT) but also abuses
the rule that this data field should not be device specific.

Introduce helper function that will use xe_gt pointer stored at
parent directory level and use .data only to pass actual print
function that would expects xe_gt pointer as a parameter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 52 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debugfs.h |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 207b992f1240..69a7e77d8305 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -23,6 +23,58 @@
 #include "xe_uc_debugfs.h"
 #include "xe_wa.h"
 
+/**
+ * xe_gt_debugfs_simple_show - A show callback for struct drm_info_list
+ * @m: the &seq_file
+ * @data: data used by the drm debugfs helpers
+ *
+ * This callback can be used in struct drm_info_list to describe debugfs
+ * files that are &xe_gt specific.
+ *
+ * It is assumed that those debugfs files will be created on directory entry
+ * which struct dentry d_inode->i_private points to &xe_gt.
+ *
+ * This function assumes that &m->private will be set to the &struct
+ * drm_info_node corresponding to the instance of the info on a given &struct
+ * drm_minor (see struct drm_info_list.show for details).
+ *
+ * This function also assumes that struct drm_info_list.data will point to the
+ * function code that will actually print a file content::
+ *
+ *   int (*print)(struct xe_gt *, struct drm_printer *)
+ *
+ * Example::
+ *
+ *    int foo(struct xe_gt *gt, struct drm_printer *p)
+ *    {
+ *        drm_printf(p, "GT%u\n", gt->info.id);
+ *        return 0;
+ *    }
+ *
+ *    static const struct drm_info_list bar[] = {
+ *        { name = "foo", .show = xe_gt_debugfs_simple_show, .data = foo },
+ *    };
+ *
+ *    dir = debugfs_create_dir("gt", parent);
+ *    dir->d_inode->i_private = gt;
+ *    drm_debugfs_create_files(bar, ARRAY_SIZE(bar), dir, minor);
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_info_node *node = m->private;
+	struct dentry *parent = node->dent->d_parent;
+	struct xe_gt *gt = parent->d_inode->i_private;
+	int (*print)(struct xe_gt *, struct drm_printer *) = node->info_ent->data;
+
+	if (WARN_ON(!print))
+		return -EINVAL;
+
+	return print(gt, &p);
+}
+
 static struct xe_gt *node_to_gt(struct drm_info_node *node)
 {
 	return node->info_ent->data;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.h b/drivers/gpu/drm/xe/xe_gt_debugfs.h
index 5a329f118a57..05a6cc93c78c 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
@@ -6,8 +6,10 @@
 #ifndef _XE_GT_DEBUGFS_H_
 #define _XE_GT_DEBUGFS_H_
 
+struct seq_file;
 struct xe_gt;
 
 void xe_gt_debugfs_register(struct xe_gt *gt);
+int xe_gt_debugfs_simple_show(struct seq_file *m, void *data);
 
 #endif
-- 
2.43.0


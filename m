Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B153ACD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE8A1124DA;
	Thu, 28 Mar 2024 16:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAnrJDQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BEF1124D2
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711643304; x=1743179304;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PAFoX1oKgECYDCLGCa6jECm2tHpnjWAAxU4sZr9qOxY=;
 b=VAnrJDQcHsY89BHEmWod2Xz51UUOg8+r2lIr6WBTETgHWUT/Ml+4Th94
 wsRPZrh8Z6V6MArphd/TXprLBBmOQkizViR9Ada+MYotJ0Ovda9oJPott
 C8cxZEK9rtXTEPj8M9au2t6RUdu+Tap59uHRBfhxvyFc6b8n/xUaDIqu0
 e6Z+w99AYo+EviyOJN+wtDbpzTCylYRBHl1WrEmSIC/8+TFFgZnvoylPz
 aIV44Vumt9G4ElDCKyxs1l14WdoV2h5zW6NeQm+uvYHBKhuHdkZjgVl9+
 N2Lfl8jimxlqB+0qMHUJeugKqXl0x0d4qZIr5os6Jq145lvWjColkvpFH g==;
X-CSE-ConnectionGUID: SQTUzuIESLKkjHnldhQJTA==
X-CSE-MsgGUID: 6JC3UB3TTu29zZc4FnXj9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6742959"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6742959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16579261"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/3] drm/xe: Define helper for GT specific debugfs files
Date: Thu, 28 Mar 2024 17:28:07 +0100
Message-Id: <20240328162808.451-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240328162808.451-1-michal.wajdeczko@intel.com>
References: <20240328162808.451-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://lore.kernel.org/r/20240214115756.1525-3-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 52 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debugfs.h |  2 ++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index abec616927f0..97c3c2437b9a 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -24,6 +24,58 @@
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


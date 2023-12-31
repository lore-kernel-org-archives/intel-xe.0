Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB2AC3DA6E
	for <intel-xe@archiver.kernel.org>; Sun, 31 Dec 2023 14:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68D510E058;
	Sun, 31 Dec 2023 14:39:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0516510E058
 for <intel-xe@lists.freedesktop.org>; Sun, 31 Dec 2023 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704033588; x=1735569588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i1Dlu+d3FPgW/xnnPYQLl3+eQlvUWLaUdoaPxiTC1ks=;
 b=l+D6+taXDS13qJGJVCb3DYWUHfAEVaTH4LxTvIpHVfOoIAj67VblWs/U
 Wh6EfTnNboUVSkOfYW8wCEGHo9+1+u1xg5r+HKaG1wSRXHx2ExjYkdpiC
 Yi+GJV2y5d+w24P9Vu3x7PJgqm9bgDCUmfh6W0HSHvzU0UwY/ENmoKweV
 OlOvwmIp4vuRGKJA6C+2WBEAYEn/o4jmXJ2HjE6hJIoZn/qWObLjcMqOz
 WHBkgvViWAfIuXb1Efm8fdlJB9dAS0UsZattij+hfl6I2tmB4d5OSl0vI
 qNmu5VKuhFPi7qPaImprzGLxRlM5zub9Xh1h6Vp6HxBQrwka0/Ha018oA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="463159689"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; d="scan'208";a="463159689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2023 06:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="808089349"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; d="scan'208";a="808089349"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2023 06:39:45 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/debugfs: Add support for gt synchronous force reset
Date: Sun, 31 Dec 2023 20:17:33 +0530
Message-Id: <20231231144733.568481-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karthik Poosa <karthik.poosa@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This support added as igt test freq_reset_multiple fails sporadically
in case xe_guc_pc is not started.
A completion is added in force_reset for this.
Writing non-zero to force_reset debugfs entry does synchronous reset.

v2:
- Changed wait for completion to interruptible (Anshuman).
- Moved timeout to xe_gt.h (Anshuman).
- Created a debugfs for updating timeout (Rodrigo).

v3:
- Update force_reset debugfs with write support.
  value 0 -> async reset, non-zero -> sync reset (Matthew Brost).

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         |  2 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 72 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_debugfs.h |  3 ++
 drivers/gpu/drm/xe/xe_gt_types.h   |  8 ++++
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..c8d2c18b0c62 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
+	init_completion(&gt->reset.done);
 
 	return gt;
 }
@@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(err);
 
+	complete(&gt->reset.done);
 	xe_gt_info(gt, "reset done\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..3518ab89ccfc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -55,15 +55,71 @@ static int hw_engines(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int force_reset(struct seq_file *m, void *data)
+static int force_reset(struct xe_gt *gt, bool is_sync)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_device *xe = gt_to_xe(gt);
+	long ret;
 
 	xe_gt_reset_async(gt);
 
+	if (is_sync) {
+		drm_info(&xe->drm, "waiting for gt reset completion");
+		ret = wait_for_completion_interruptible_timeout(&gt->reset.done,
+							msecs_to_jiffies(gt->reset.timeout_ms));
+		if (ret <= 0) {
+			drm_err(&xe->drm, "gt reset timed out/interrputed, ret %ld\n", ret);
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
+ssize_t force_reset_write(struct file *f, const char __user *buf, size_t len, loff_t *offset)
+{
+	struct xe_gt *gt = file_inode(f)->i_private;
+	struct xe_device *xe = gt_to_xe(gt);
+	char arg_str[5];
+	size_t size;
+	unsigned long arg;
+	int ret;
+
+	size = min(sizeof(arg_str)-1, len);
+	arg = copy_from_user((void *)arg_str, buf, size);
+	if (arg < 0) {
+		drm_err(&xe->drm, "reading force_reset arg failed, ret %ld", arg);
+		return arg;
+	}
+	arg_str[size] = '\0';
+
+	ret = kstrtoul(arg_str, 0, &arg);
+	if (ret) {
+		drm_err(&xe->drm, "force_reset arg parse failed, ret %d", ret);
+		return ret;
+	}
+
+	ret = force_reset(gt, (arg && 1));
+	if (ret != 0)  {
+		drm_err(&xe->drm, "force_reset failed, ret %d\n", ret);
+		return ret;
+	}
+	return len;
+}
+
+ssize_t force_reset_read(struct file *f, char __user *buf, size_t len, loff_t *offset)
+{
+	struct xe_gt *gt = file_inode(f)->i_private;
+
+	force_reset(gt, 0);
 	return 0;
 }
 
+static const struct file_operations force_reset_fops = {
+	.owner = THIS_MODULE,
+	.write = force_reset_write,
+	.read = force_reset_read,
+};
+
 static int sa_info(struct seq_file *m, void *data)
 {
 	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
@@ -192,7 +248,6 @@ static int vecs_default_lrc(struct seq_file *m, void *data)
 
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
-	{"force_reset", force_reset, 0},
 	{"sa_info", sa_info, 0},
 	{"topology", topology, 0},
 	{"steering", steering, 0},
@@ -245,5 +300,16 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
+	gt->reset.fr_dentry = debugfs_create_file("force_reset", 0600, root, xe,
+			    &force_reset_fops);
+	if (!gt->reset.fr_dentry)
+		drm_warn(&xe->drm, "force_reset debugfs file creation failed");
+	d_inode(gt->reset.fr_dentry)->i_private = gt;
+
+	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
+					&gt->reset.timeout_ms);
+	/* set a default timeout value */
+	gt->reset.timeout_ms = 1000;
+
 	xe_uc_debugfs_register(&gt->uc, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.h b/drivers/gpu/drm/xe/xe_gt_debugfs.h
index 5a329f118a57..40adcf1822c6 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
@@ -6,8 +6,11 @@
 #ifndef _XE_GT_DEBUGFS_H_
 #define _XE_GT_DEBUGFS_H_
 
+#include <linux/fs.h>
 struct xe_gt;
 
 void xe_gt_debugfs_register(struct xe_gt *gt);
+ssize_t force_reset_write(struct file *f, const char __user *buf, size_t len, loff_t *offset);
+ssize_t force_reset_read(struct file *f, char __user *buf, size_t len, loff_t *offset);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..d6134215094b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -148,6 +148,14 @@ struct xe_gt {
 		 * code to safely flush all code paths
 		 */
 		struct work_struct worker;
+		/** @done : completion for GT reset */
+		struct completion done;
+		/** @timeout_ms : gt synchronous reset timeout in ms */
+		u32 timeout_ms;
+		/** @dentry: dentry for force_reset */
+		struct dentry *fr_dentry;
+		/** @is_sync_reset : gt reset is synchronous */
+		//bool is_sync_reset;
 	} reset;
 
 	/** @tlb_invalidation: TLB invalidation state */
-- 
2.25.1


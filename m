Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1223C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1A10E032;
	Tue,  3 Jun 2025 18:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE8THbrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8867510E16F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976231; x=1780512231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0GFgVO/ksmceFHkRNnV8fX50FzFq8a81mtCXEMc3uQ0=;
 b=aE8THbrO+tZilJ81hGhKeG1RJM0EC57hVf+njaAGaoDOPvtcU2UyHU8f
 9bmOhxYcTtKOs3fOT705RGVCSXjQq1yPLbW4QJnRXxhoGm06IB0foKVF1
 o/xAo814t5MHpHS6hiUlzsO8GhMpqZV+foh42deONvOTYK9OrxNQVM+43
 FakI9T/5he5loIUpshB/GdtBhQwcp2DvB6qN8H5lryL48dKHjhEDDhI1P
 KmH2YgbNzIoU2b58eyc693g4Lb/0JXEjjqvaNqmNjfx7+uLug6GlXNbk9
 ALj/TaLvXQ/jQR/KGcr5/Gkh5SRD6FNvBTnCMLGBzwbyQf69iUO67l/aU g==;
X-CSE-ConnectionGUID: HtEPjksJSl26wuHYCPQskg==
X-CSE-MsgGUID: XSfGrI7CTniZv8eI3FACLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50902976"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50902976"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:51 -0700
X-CSE-ConnectionGUID: kOa+gp7ASdCob+eJfNGQYA==
X-CSE-MsgGUID: CJdDG6s/Tam56wlKNpiCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145899638"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/2] drm/xe: Add clear_stats GT debugfs
Date: Tue,  3 Jun 2025 11:45:21 -0700
Message-Id: <20250603184522.2218192-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603184522.2218192-1-matthew.brost@intel.com>
References: <20250603184522.2218192-1-matthew.brost@intel.com>
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

It helpful to clear GT stats, run a test cases which is being profiled,
and look at the results of the stats from the individual test case. Add
clear_stats GT debugfs entry whih allows the clearing of GT stats.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 848618acdca8..a6888f03a4dd 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -328,6 +328,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
 	return count;
 }
 
+static void clear_stats(struct xe_gt *gt)
+{
+	xe_gt_stats_clear(gt);
+}
+
+static ssize_t clear_stats_write(struct file *file,
+				 const char __user *userbuf,
+				 size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_gt *gt = s->private;
+
+	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
+}
+
+static int clear_stats_show(struct seq_file *s, void *unused)
+{
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
+
 static void force_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -408,6 +429,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	root->d_inode->i_private = gt;
 
 	/* VF safe */
+	debugfs_create_file("clear_stats", 0600, root, gt, &clear_stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 30f942671c2b..7e12fc3759e2 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
 
 	return 0;
 }
+
+/**
+ * xe_gt_stats_clear - Clear the GT stats
+ * @gt: GT structure
+ *
+ * This clear (zeros) all the available GT stats.
+ */
+void xe_gt_stats_clear(struct xe_gt *gt)
+{
+	enum xe_gt_stats_id id;
+
+	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
+		atomic64_set(&gt->stats.counters[id], 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index 38325ef53617..e8aea32bc971 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -13,6 +13,7 @@ struct drm_printer;
 
 #ifdef CONFIG_DEBUG_FS
 int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
+void xe_gt_stats_clear(struct xe_gt *gt);
 void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
 #else
 static inline void
-- 
2.34.1


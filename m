Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15266CA0FFD
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D5210EC0D;
	Fri, 29 Aug 2025 17:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6CUHY1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522E10E1F1
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756488156; x=1788024156;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/TKUgIY/vClMMusvc0IZ+lDEyJRnDKQKHmufqTDZjqs=;
 b=W6CUHY1PScktv8MN6JE0TReJNhw53fZp2r/oZ3WSPYaX8EsACgUJ86jN
 wpE6PjNdzayo1CDN+9xlrf3xct84CD5reLqHLQ54+9ZczzXNxdq1L8SEq
 wPntJd6esIKfq+tABSeRLi1AC/pOhCDJJ1G0a40jbNQzYE3VTLbAYSaAn
 f2CVcF728kB03xjkpzR4azKSv22qTveK3IVdKt27fHzWnfMdXxdL6K9if
 ZC/d2MhwXBD8kbwRa4d/d1jDr9jGS3VwylVQXVkx3P3uV3N6HO8LK1b97
 Mjk8oCR7k2y/Ahsl5LSRVFYHHWXcmLT7CN9s7ZVU2r8QZRdwF4OhFAQlR g==;
X-CSE-ConnectionGUID: vAnKclsvSNOycKbRuqwlvg==
X-CSE-MsgGUID: RCOH/KJvSIW2ITWz/9RhHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57805136"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="57805136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:22:36 -0700
X-CSE-ConnectionGUID: ZxUdUh4CTOyxLlod+FR5tw==
X-CSE-MsgGUID: 78PlDrapSXuMoRToI+amsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170597597"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:22:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 1/2] drm/xe: Add clearing stats to GT debugfs
Date: Fri, 29 Aug 2025 10:22:31 -0700
Message-Id: <20250829172232.1308004-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829172232.1308004-1-matthew.brost@intel.com>
References: <20250829172232.1308004-1-matthew.brost@intel.com>
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
and look at the results of the stats from the individual test case. Make
stats entry writable and upon write clear the stats.

v5:
 - Drop clear_stats debugfs entry (Lucas)
v6:
 - Use xe_gt_stats_clear rather than helper (Michal)
 - Rework loop in xe_gt_stats_clear (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index bf3a67b5951c..7411c5f5c739 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -327,7 +327,6 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
-	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
@@ -363,6 +362,24 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
 	return count;
 }
 
+static ssize_t stats_write(struct file *file, const char __user *userbuf,
+			   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_gt *gt = s->private;
+
+	return write_to_gt_call(userbuf, count, ppos, xe_gt_stats_clear, gt);
+}
+
+static int stats_show(struct seq_file *s, void *unused)
+{
+	struct drm_printer p = drm_seq_file_printer(s);
+	struct xe_gt *gt = s->private;
+
+	return xe_gt_stats_print_info(gt, &p);
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(stats);
+
 static void force_reset(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -448,6 +465,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	root->d_inode->i_private = gt;
 
 	/* VF safe */
+	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 30f942671c2b..17056d832138 100644
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
+	int id;
+
+	for (id = 0; id < ARRAY_SIZE(gt->stats.counters); ++id)
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


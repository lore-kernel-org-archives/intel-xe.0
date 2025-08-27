Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374DBCA0FF6
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A639A10E894;
	Wed, 27 Aug 2025 19:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNQjZGtu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8BF10E175
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756322811; x=1787858811;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/TKUgIY/vClMMusvc0IZ+lDEyJRnDKQKHmufqTDZjqs=;
 b=iNQjZGtuJ6Zm88y4Bg4DOzG2ch11iZagLtCYvysgf92ZVJM861r5+ARI
 uL9EvPQoVmy7uGj96Q2Umny9mKuFupA9KZM7tao1Gq0nfsENxzr0qecgb
 5dJ80vawIs3FRbSXH1N7uGxjAyeUoZW2P4/yi9U0iAo12AtOVITGYJvOH
 0iz+zGpv7ZIIct+nYojO7OQOsXPaSF/M7BDt3T42H+GJHQYThSDj+sTId
 SqEFYZS2XlaIk3JQk3samQmhfgsSVl/YPT+jgvyVanbw7ODChPGoRo+Ng
 Cq480+XIN7mHa5la/eO5zVXH7dZ9QS9D4QQVGP7OS1zZFBqRb3CbY4Uap w==;
X-CSE-ConnectionGUID: +DxDoz5aSE2ixf/tLYDuCg==
X-CSE-MsgGUID: ctqjQCwVR8WJ1x8QqIoytg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68855674"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="68855674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:26:49 -0700
X-CSE-ConnectionGUID: eQdPfTw6SyK7ogFzJKqrHw==
X-CSE-MsgGUID: xDrNePYnS/myGBPVQjU1Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169519494"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:26:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 1/2] drm/xe: Add clearing stats to GT debugfs
Date: Wed, 27 Aug 2025 12:26:43 -0700
Message-Id: <20250827192644.254002-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827192644.254002-1-matthew.brost@intel.com>
References: <20250827192644.254002-1-matthew.brost@intel.com>
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


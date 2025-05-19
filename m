Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE0EC3ABDD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 20:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68510E26D;
	Mon, 19 May 2025 20:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9KwOLcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4108A10E26D
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747685401; x=1779221401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kyNVIo555OuK1lKdkAIZMEM/bduKysRuYU75VOfXoTk=;
 b=h9KwOLcHLYQFbTa9KMjg+UMbxRYjhkDmEQXzDxnAkKKYFBBeizh1/WBW
 f90QHtfC+hpkJUYc/HapGwUMwAOpHlS3fZCJg1mwuFroF3+hovc0Ees3w
 zv+VNQckenYwtZ/thqDbU+UEpVmMoRgq02BgXds0MJE7cvjpJdULtGOHZ
 hIUzDPzldCGbixV5BE7m9AlmLszkWZ9xreS00z+LwcdnS9V5pib8CzuOT
 SCw9Xhk2swJfig5zyQlj22ltFoDNSdlBGediAkM6xAjw0eU6aBFTN2QZg
 M5FWQtID0ME+DLlmNf02FXvJUc6kn535C0STNLFCw8YoJHFPTqeAy5Rw5 w==;
X-CSE-ConnectionGUID: ktbzjFZAT8O9ZnbKZbcgDg==
X-CSE-MsgGUID: qIUwM1opTpauzpmXWdrT9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49702588"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49702588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 13:09:54 -0700
X-CSE-ConnectionGUID: 7oreEM8eREKNsDp7JkTfdA==
X-CSE-MsgGUID: 3Va0a3pWRuu9kBb6Sjzo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="170500765"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 13:09:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Allow to trigger GT resets using debugfs writes
Date: Mon, 19 May 2025 22:09:14 +0200
Message-Id: <20250519200914.216-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Today we allow to trigger GT resest by reading dedicated debugfs
files "force_reset" and "force_reset_sync" that we are exposing
using drm_info_list[] and drm_debugfs_create_files().

To avoid triggering potentially disruptive actions during otherwise
"safe" read operations, expose those two attributes using debugfs
function where we can specify file permissions and provide custom
"write" handler to trigger the GT resets also from there.

This step would allow us to drop triggering GT resets during read
operations, which we leave just to give users more time to switch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 96 +++++++++++++++++++++++-------
 1 file changed, 76 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 119a55bb7580..848618acdca8 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -122,24 +122,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
 	return ret;
 }
 
-static int force_reset(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_reset_async(gt);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return 0;
-}
-
-static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
-{
-	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_reset(gt);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return 0;
-}
-
 static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -306,8 +288,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
  * - without access to the PF specific data
  */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
-	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
-	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
 	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
@@ -332,6 +312,78 @@ static const struct drm_info_list pf_only_debugfs_list[] = {
 	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
 };
 
+static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t *ppos,
+				void (*call)(struct xe_gt *), struct xe_gt *gt)
+{
+	bool yes;
+	int ret;
+
+	if (*ppos)
+		return -EINVAL;
+	ret = kstrtobool_from_user(userbuf, count, &yes);
+	if (ret < 0)
+		return ret;
+	if (yes)
+		call(gt);
+	return count;
+}
+
+static void force_reset(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_pm_runtime_get(xe);
+	xe_gt_reset_async(gt);
+	xe_pm_runtime_put(xe);
+}
+
+static ssize_t force_reset_write(struct file *file,
+				 const char __user *userbuf,
+				 size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_gt *gt = s->private;
+
+	return write_to_gt_call(userbuf, count, ppos, force_reset, gt);
+}
+
+static int force_reset_show(struct seq_file *s, void *unused)
+{
+	struct xe_gt *gt = s->private;
+
+	force_reset(gt); /* to be deprecated! */
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
+
+static void force_reset_sync(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe_pm_runtime_get(xe);
+	xe_gt_reset(gt);
+	xe_pm_runtime_put(xe);
+}
+
+static ssize_t force_reset_sync_write(struct file *file,
+				      const char __user *userbuf,
+				      size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_gt *gt = s->private;
+
+	return write_to_gt_call(userbuf, count, ppos, force_reset_sync, gt);
+}
+
+static int force_reset_sync_show(struct seq_file *s, void *unused)
+{
+	struct xe_gt *gt = s->private;
+
+	force_reset_sync(gt); /* to be deprecated! */
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -355,6 +407,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	 */
 	root->d_inode->i_private = gt;
 
+	/* VF safe */
+	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
+	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
+
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 root, minor);
-- 
2.47.1


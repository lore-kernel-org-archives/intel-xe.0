Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B603C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 12:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF6F10E288;
	Mon, 29 May 2023 12:29:17 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9102A10E288
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685363354; x=1716899354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M0b4Op1Gcp3cyfcM4blOhoy24RV1Jhvio8CSPZqaF+0=;
 b=atCDhdAM6bvXjEZ/5saaqvDaEySjJxi+0fJGtciWQLNI4T177vybxT/n
 6s/oiNbcDM375qWDGlyuIHWzRlUCW9Mwd3CneJEXwHb8wPPCCyAJnvW/0
 4mVdaXMy1uI3HpcOdGrH8CGkUb/6szG9YGJNhEiaE5NCEPz0t058uA4Um
 8BzFjHox61NWTy9tlI2yZ7BudBxyMxLqpG3k6spdFtRcVl3nims3dB5j+
 USbYfFvZHEJ5nbQnYEF2KOiCww5EbMWx/oIgK89+ajGh6n50EoMnSJJXV
 nMPdjqSN3CLjE8r15HJK/m4jSvm7Fdxl8oE3s6llP1cYC7TKg7E/JgI8K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335047068"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="335047068"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 05:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830374135"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="830374135"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 29 May 2023 05:29:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 18:03:10 +0530
Message-Id: <20230529123310.2677564-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt reset
 failure.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In case of gt reset failure, KMD notifies userspace about failure
via uevent. To validate this notification we need to ensure gt
reset fails and there is no mechanism to cause failure from hardware.
Hence added a debugfs which will cause fake reset failure.

v1(Rodrigo)
- Change the variable to fake_reset_failure_in_progress.
- Drop usage of READ_ONCE and WRITE_ONCE.
- Follow consistency for variable assignment. Either use
  functions for all the assignments or don't use for any.

v2
- Add description for variable.
- Define xe_fake_reset(gt) function in xe_gt.c to set the
  fake_reset_failure_in_progress.
- No need to explicitly initialize the fake_reset_failure_in_progress
  as false. (Rodrigo)
- Return proper error code in case of fake reset. (Bala)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 18eda5b1377f..626d5e9f0520 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -596,6 +596,11 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+void xe_gt_fake_reset(struct xe_gt *gt)
+{
+	gt->reset.fake_reset_failure_in_progress = true;
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -609,6 +614,14 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_sanitize(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
+
+	if (gt->reset.fake_reset_failure_in_progress) {
+		err = -ECANCELED;
+		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
+		gt->reset.fake_reset_failure_in_progress = false;
+		goto err_msg;
+	}
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 086369f7ee6d..2031008aa57f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -25,6 +25,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
+void xe_gt_fake_reset(struct xe_gt *gt);
 void xe_gt_migrate_wait(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 339ecd5fad9b..cf2896858d36 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -138,6 +138,16 @@ static int workarounds(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int fake_reset_failure(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+
+	xe_gt_fake_reset(gt);
+	xe_gt_reset_async(gt);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -147,6 +157,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"ggtt", ggtt, 0},
 	{"register-save-restore", register_save_restore, 0},
 	{"workarounds", workarounds, 0},
+	{"fake_reset_failure", fake_reset_failure, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index b83c834e7ced..3e0e9ad4f0c3 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -168,6 +168,11 @@ struct xe_gt {
 
 	/** @reset: state for GT resets */
 	struct {
+		/**
+		 * @fake_reset_failure_in_progress: A bool to indicate a fake reset
+		 * failure has been triggered
+		 */
+		bool fake_reset_failure_in_progress;
 		/**
 		 * @worker: work so GT resets can done async allowing to reset
 		 * code to safely flush all code paths
-- 
2.25.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C391C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 07:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EE510E57E;
	Wed, 24 May 2023 07:02:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9920C10E57E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684911771; x=1716447771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vCz7BCONXDoizGO8+gM7yUfYDsoXJsSt4XhfgP/Im74=;
 b=eBFR/RGTanvpZwW9BLFLxvinR0l2weiIpiWtQCC7DV90OjzkyCIBqOxU
 O1m0Ng4LPD31AR78dvTWw48oUavGxOf6wTbiMX7dOBpyv5DSqFsuWftUZ
 q1GuaYm+FHCwesV2dx6GDlw8dAymXDIWv4G/zn/qclIjPr238aC3RzuGD
 bElLoKvFS0biFeZIauFWrbT7zZJQjKdRnXKuu3vRN5eqiIQh0amss86Wz
 FdbcgL9+AzSTemyJ8T0C1jAkSypJvb/be7IIdxpm2iKjTXUnLaDe9nnsy
 pB9/ba2/ipoUMESAh1C5vRR1j2KqhnhHSfNa5cWAM7gJLK+3AAprc7l2x A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416941316"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="416941316"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="704223142"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="704223142"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2023 00:02:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 12:36:41 +0530
Message-Id: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 80d42c7c7cfa..b3ac8b3ab455 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -506,6 +506,9 @@ int xe_gt_init(struct xe_gt *gt)
 	int err;
 	int i;
 
+	/*Fake reset failure should be disabled by default*/
+	gt->reset.fake_reset_failure_in_progress = false;
+
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
@@ -601,8 +604,18 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_info(gt, "reset started\n");
 
 	xe_gt_sanitize(gt);
-
 	xe_device_mem_access_get(gt_to_xe(gt));
+
+	err = gt->reset.fake_reset_failure_in_progress;
+	if (err) {
+		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
+
+		/* Disable fake reset failure for next call */
+		gt->reset.fake_reset_failure_in_progress = false;
+
+		goto err_msg;
+	}
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 8bf441e850a0..13d2a974bc00 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int fake_reset_failure(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+
+	gt->reset.fake_reset_failure_in_progress = true;
+	xe_gt_reset_async(gt);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -135,6 +145,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"steering", steering, 0},
 	{"ggtt", ggtt, 0},
 	{"register-save-restore", register_save_restore, 0},
+	{"fake_reset_failure", fake_reset_failure, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..746d65c4aacc 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -168,6 +168,7 @@ struct xe_gt {
 
 	/** @reset: state for GT resets */
 	struct {
+		bool fake_reset_failure_in_progress;
 		/**
 		 * @worker: work so GT resets can done async allowing to reset
 		 * code to safely flush all code paths
-- 
2.25.1


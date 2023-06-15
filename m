Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83A0EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 09:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6D810E4A4;
	Thu, 15 Jun 2023 09:02:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA7510E49A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686819732; x=1718355732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oknmoow7qdAJbuqWk7SJ/rvR6F4awIp6QYY/hRF3e1g=;
 b=BaJgg33rRqW4kjTzra18bFz1AkvQ8nrvYu72T1JJM03RfNi1xqkSNAdk
 iPr3JlEK8rd+8NQ0Pc2ZMfLYSIMdYEbMmeHIBBE7SinDpM9KiPJ/cwhgN
 vvC6pl/TC0kKYlgs0KtU19hybRdWg/Rx0pzcgV1/SlXdgyDbazAbDqTiz
 JNrM6U43e7eiUOgrkhXzgFE6KXUkuy8jfWtDbqJi8TsKDVHLAuGs5ypX5
 JpP5w7J1DjIq7lQ2OD5i2winxMr9qc6NziCqXqNtrqXrxaaWflS2KkEZS
 BbjaLNMAaMyrgXHiaalVBjOBkV3JgMxrX8ln8Vx2KKFMTcPeBr8k8Oe99 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338484320"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="338484320"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="959111676"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="959111676"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2023 02:02:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jun 2023 14:36:28 +0530
Message-Id: <20230615090628.3398741-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/1] drm/xe: Add a debugfs for faking gt reset
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

v3
- Move gt reset worker call to xe_fake_reset(gt) which ensures
fake reset goes through even in GT suspend state. (Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h         |  2 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2458397ce8af..b3025f60f666 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -497,10 +497,25 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+void xe_gt_fake_reset(struct xe_gt *gt)
+{
+	gt->reset.fake_reset_failure_in_progress = true;
+
+	xe_gt_info(gt, "Fake reset queued\n");
+	queue_work(gt->ordered_wq, &gt->reset.worker);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (gt->reset.fake_reset_failure_in_progress) {
+		err = -ECANCELED;
+		xe_gt_info(gt, "Fake GT reset failure is in progress\n");
+		gt->reset.fake_reset_failure_in_progress = false;
+		goto err_cancelled;
+	}
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -510,6 +525,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_sanitize(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -543,6 +559,7 @@ static int gt_reset(struct xe_gt *gt)
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
+err_cancelled:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 21d9044088de..22afae04fa3c 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -24,6 +24,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
+void xe_gt_fake_reset(struct xe_gt *gt);
+void xe_gt_migrate_wait(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b5a5538ae630..8d888153c477 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -138,6 +138,14 @@ static int workarounds(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int fake_reset_failure(struct seq_file *m, void *data)
+{
+	struct xe_gt *gt = node_to_gt(m->private);
+
+	xe_gt_fake_reset(gt);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -147,6 +155,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"ggtt", ggtt, 0},
 	{"register-save-restore", register_save_restore, 0},
 	{"workarounds", workarounds, 0},
+	{"fake_reset_failure", fake_reset_failure, 0},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 99ab7ec99ccd..0b6e1df3ca36 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -141,6 +141,11 @@ struct xe_gt {
 
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


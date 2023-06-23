Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D242AEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 04:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F21010E5D1;
	Fri, 23 Jun 2023 04:34:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447F710E5D1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 04:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687494885; x=1719030885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sp0pIX8fOmUlxtiDglo+AH6pFAYNg/l83zrdVdyGqKU=;
 b=R3etv8+hY8fli7nCNr+MXETWL+mfYe/URRgsQYeYR3s4GwKQ0INAm1Vi
 dfzYaxB0YtOr24DlykaI39uWFxRRBNpC1ja07mXsVIU1bMo7ZOixT1Jd2
 D9myDslSIV4QHOTPqBpzQb7RBeWsddxNf/ThzDpJ2hHkitO9FiEanwhWm
 qFmxPW2ucg7ep+VfDmfUSGtRpz9zJcbws4cklv+emiTMnnASs5VnJYAoX
 oK3Of4dIJeCEv4O+x7LeDNkgpNFNY8tAsqf7o3tHFyfD8wXceTYOM4sIj
 CJPKbZz8zO2ojNosdgoVUQAUjbUD9FT1kJOdDzZZfnzimAV25LVZAyAy4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447060046"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="447060046"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="805052280"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="805052280"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 21:34:41 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jun 2023 10:09:11 +0530
Message-Id: <20230623043911.3783416-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/1] drm/xe: Add a debugfs for faking gt reset
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

v4
-Clear whitespaces.

v5
- goto label changed from err_cancelled to err_fail.
- Remove unwanted declaration from xe_gt.h. (Francois)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  5 +++++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2458397ce8af..445a27ff0d04 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -497,10 +497,24 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+void xe_gt_fake_reset(struct xe_gt *gt)
+{
+	gt->reset.fake_reset_failure_in_progress = true;
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
+		goto err_fail;
+	}
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -543,6 +557,7 @@ static int gt_reset(struct xe_gt *gt)
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
+err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 21d9044088de..60382efcbb16 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -24,6 +24,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
+void xe_gt_fake_reset(struct xe_gt *gt);
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


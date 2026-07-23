Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A825C44524
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 08:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480CF10E544;
	Thu, 23 Jul 2026 08:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmulDk+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79F710E544
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784795148; x=1816331148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=canyMyejVT2AZBxQP1zJ7TWM/zFXiyKhWc5nB3PcZso=;
 b=KmulDk+VRYbZHZl11EWbn4dXsVvUqKbt4DDZYQA9DEaLzaGDyARmHUqB
 jD3a8u2tIiBe/p9SD7glzmtjIvcNqUMdSKgQjhAwFbVDcZe53JEHJTOJY
 HR177rJOVsT3qqPdg/aaybuI1jHyjnmSaEPOxIvpXYrowKjDCJ1A6M6gs
 CvQyi+nKcelADdBkaRRKKX3maPK7vtxqb0ylaaBDJlx2GnnIcTpkV0ksf
 Lr1BJLPDMNaQQTnaTDIxkifjeuQ/qJRg/f/3b4ZPaMnSgfN/nrviwUvrS
 +bRDZw/2JnPvGT2Czv17YX2lYXoHS/fTmJEha5ESlLmmDx3CWBiqYBEx7 Q==;
X-CSE-ConnectionGUID: biZErprmQCeM6+87wquzOA==
X-CSE-MsgGUID: u36F8yiNSO6uJuA0yamvXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85389093"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85389093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:47 -0700
X-CSE-ConnectionGUID: l5dqK9MdRSKUG+1lLfc5kw==
X-CSE-MsgGUID: W0XYTWQdTGmjEhMcqpH20A==
X-ExtLoop1: 1
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 01:25:45 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, anthony.giardina@intel.com
Subject: [PATCH v4 5/5] drm/xe/xe_late_bind_fw: Refactor pm flow
Date: Thu, 23 Jul 2026 14:07:05 +0530
Message-ID: <20260723083659.716683-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723083659.716683-7-badal.nilawar@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
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

Refactor late binding flow across suspend/resume by adding dedicated
pm functions.

Assisted-by: GitHub-Copilot:GPT-5.3
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 36 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_late_bind_fw.h |  4 ++--
 drivers/gpu/drm/xe/xe_pm.c           |  6 ++---
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 62b779942b88..f0970192a8e1 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -230,7 +230,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
 }
 
-void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+static void wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
@@ -306,18 +306,12 @@ static void xe_late_bind_work(struct work_struct *work)
 	xe_pm_runtime_put(xe);
 }
 
-int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+static int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
 	int fw_id;
 
-	if (!late_bind->component_added)
-		return -ENODEV;
-
-	if (late_bind->disable)
-		return 0;
-
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
 		if (lbfw->payload) {
@@ -446,7 +440,7 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
 	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_late_bind *late_bind = &xe->late_bind;
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	wait_for_worker_completion(late_bind);
 
 	late_bind->component.ops = NULL;
 }
@@ -461,7 +455,7 @@ static void xe_late_bind_remove(void *arg)
 	struct xe_late_bind *late_bind = arg;
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 
-	xe_late_bind_wait_for_worker_completion(late_bind);
+	wait_for_worker_completion(late_bind);
 
 	late_bind->component_added = false;
 
@@ -472,6 +466,28 @@ static void xe_late_bind_remove(void *arg)
 	}
 }
 
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind)
+{
+	if (!late_bind->component_added)
+		return;
+
+	if (late_bind->disable)
+		return;
+
+	wait_for_worker_completion(late_bind);
+}
+
+void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
+{
+	if (!late_bind->component_added)
+		return;
+
+	if (late_bind->disable)
+		return;
+
+	xe_late_bind_fw_load(late_bind);
+}
+
 /**
  * xe_late_bind_init() - add xe mei late binding component
  * @late_bind: pointer to late bind structure.
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 07e437390539..8896fea3068e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -11,7 +11,7 @@
 struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
-int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
-void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
+void xe_late_bind_pm_suspend(struct xe_late_bind *late_bind);
+void xe_late_bind_pm_resume(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a5289a9df8d2..d516f206b121 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -184,7 +184,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+	xe_late_bind_pm_suspend(&xe->late_bind);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
@@ -288,7 +288,7 @@ int xe_pm_resume(struct xe_device *xe)
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-	xe_late_bind_fw_load(&xe->late_bind);
+	xe_late_bind_pm_resume(&xe->late_bind);
 
 	drm_dbg(&xe->drm, "Device resumed\n");
 	xe_pm_block_end_signalling();
@@ -730,7 +730,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_sriov_vf_ccs_register_context(xe);
 
 	if (xe->d3cold.allowed)
-		xe_late_bind_fw_load(&xe->late_bind);
+		xe_late_bind_pm_resume(&xe->late_bind);
 
 out:
 	xe_rpm_lockmap_release(xe);
-- 
2.54.0


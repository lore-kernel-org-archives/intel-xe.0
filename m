Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED1AF3092A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8366D10E247;
	Thu,  5 Mar 2026 10:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMIsr6rH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E610E247
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706833; x=1804242833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NsdjgfeuEdryW6taB6sYEs1VKrO+dWucDNhqhqpfXTs=;
 b=ZMIsr6rHoJ1yFfAfHjqGFRkLUgUETzf2o0PIlkXG+gB3Y9fX2ueDN47Z
 FNfVxRdVBMiaqUTLR69pLVYnOf7P+h8MxP5Q9LrqykWnyeShbvJnlQFRk
 fSEz7/oNH2XE8BYdl0YGgWJ+PzA4IMZxy7+idGaSdwp9XuAXAA0kRHG7q
 HUs+KsBQsoboog9gwq63Py2a0M347b/l1HT02eXw35Z8YAHAi421CL1SY
 oK8mvcCwC2ha9AB5V/YxayP/IvlhwZzVC/hyEJjAqtNmKg3k8EYqLLIDX
 exo/7o7BHaCUFESMOdXeH3CFy9x6fpJBsdxh1oXxcO+p6zDkl2oI8Mked g==;
X-CSE-ConnectionGUID: KWT6aJxUTuWSmUahzmOGbw==
X-CSE-MsgGUID: CbCBFAv0SnSKnIkRF8VIxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859091"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73859091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:53 -0800
X-CSE-ConnectionGUID: DlRmgVnSSgOZbEV5YPdZcQ==
X-CSE-MsgGUID: qFcQ7ldwSTOEev/Mv6lXLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223326123"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:51 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [RFC PATCH 1/4] drm/xe/xe_late_bind_fw: Refactor pm flow
Date: Thu,  5 Mar 2026 16:14:42 +0530
Message-ID: <20260305104441.2857181-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305104441.2857181-6-badal.nilawar@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
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

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 32 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_late_bind_fw.h |  4 ++--
 drivers/gpu/drm/xe/xe_pm.c           |  6 +++---
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6d..5ca25186dc0cc 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -193,7 +193,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
 }
 
-void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
@@ -269,18 +269,12 @@ static void xe_late_bind_work(struct work_struct *work)
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
@@ -424,6 +418,28 @@ static void xe_late_bind_remove(void *arg)
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
+	xe_late_bind_wait_for_worker_completion(late_bind);
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
index 07e4373905395..8896fea3068e5 100644
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
index 01185f10a8835..f85b12c1a85d2 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -182,7 +182,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+	xe_late_bind_pm_suspend(&xe->late_bind);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
@@ -284,7 +284,7 @@ int xe_pm_resume(struct xe_device *xe)
 	if (IS_VF_CCS_READY(xe))
 		xe_sriov_vf_ccs_register_context(xe);
 
-	xe_late_bind_fw_load(&xe->late_bind);
+	xe_late_bind_pm_resume(&xe->late_bind);
 
 	drm_dbg(&xe->drm, "Device resumed\n");
 	xe_pm_block_end_signalling();
@@ -698,7 +698,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		xe_sriov_vf_ccs_register_context(xe);
 
 	if (xe->d3cold.allowed)
-		xe_late_bind_fw_load(&xe->late_bind);
+		xe_late_bind_pm_resume(&xe->late_bind);
 
 out:
 	xe_rpm_lockmap_release(xe);
-- 
2.52.0


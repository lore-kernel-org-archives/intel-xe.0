Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF39EEE25E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011A610EC4B;
	Thu, 12 Sep 2024 20:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBuqDCVU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FFA10EC4B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173518; x=1757709518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9CZDb6Vsv9nBwzpt8fbn9z5Tvd7ATfWTK8QGTzHiJI=;
 b=TBuqDCVU5xV+YLTBuUjXxA7olznRe3fJJYtscjKZYeF/3ehszEhwALYd
 Kj8LQ3+I+zvs81NtnzTJpnF8jlukgSn4Gh+Qg9hLGrD2yK1qo0DpdxgpS
 kiVV0Dpy9HUyZicelWN7A5sJ2Rghmqo34o6SDrtA9E7mAka6yXCb1dOjQ
 FzUXfDE84Q3rpwvP+RFW1ZN1mpr0OqcGU/XfQtbIEpCtC7rB1GWHzKkKR
 nkyhdxeRbjH2zSrKk9lVYoRM+S7DQCgfQ3pUPpXv+sm5oUVm2qGhzWKvK
 ld684X2/6kpwDdQZGchmzHPG1CeQ8tpmlAnwe6GfkYTKedCh8tfYx7Ui2 g==;
X-CSE-ConnectionGUID: Di3EoPFoQwK2ISXUXkGqzQ==
X-CSE-MsgGUID: k4kLe1p+QWiBXBPj99IGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725121"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725121"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:38 -0700
X-CSE-ConnectionGUID: XdroP62gSj2QlUImhz19wQ==
X-CSE-MsgGUID: 4oI2L5ESQoKOWUbq1YH0uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126810"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 4/6] drm/xe/pf: Save VF GuC state when pausing VF
Date: Thu, 12 Sep 2024 22:38:15 +0200
Message-Id: <20240912203817.1880-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since usually pausing the VF is done as a first step to migrate
that VF, immediately save VF GuC state as a final step of the VF
pausing to have that data ready to export when needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 41 ++++++++++++++++++-
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index b4fd5a81aff1..1f50aec3a059 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -13,6 +13,7 @@
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_gt_sriov_printk.h"
@@ -177,6 +178,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
+	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(RESUME_WIP);
@@ -416,6 +418,10 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:        |                                      :             /
  *	:        v                                      :            /
  *	:       PAUSE_GUC_DONE                          o-----restart
+ *	:        |                                      :
+ *	:        |   o---<--busy                        :
+ *	:        v  /         /                         :
+ *	:       PAUSE_SAVE_GUC                          :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -435,6 +441,7 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
+		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -465,12 +472,41 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
+static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
+{
+	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
+		pf_enter_vf_state_machine_bug(gt, vfid);
+}
+
+static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
+{
+	int err;
+
+	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
+		return false;
+
+	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
+	if (err) {
+		/* retry if busy */
+		if (err == -EBUSY) {
+			pf_enter_vf_pause_save_guc(gt, vfid);
+			return true;
+		}
+		/* give up on error */
+		if (err == -EIO)
+			pf_enter_vf_mismatch(gt, vfid);
+	}
+
+	pf_enter_vf_pause_completed(gt, vfid);
+	return true;
+}
+
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_completed(gt, vfid);
+	pf_enter_vf_pause_save_guc(gt, vfid);
 	return true;
 }
 
@@ -1339,6 +1375,9 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
+	if (pf_exit_vf_pause_save_guc(gt, vfid))
+		return true;
+
 	if (pf_exit_vf_resume_send_resume(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 11830aafea45..f02f941b4ad2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -27,6 +27,7 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
+ * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
@@ -56,6 +57,7 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
+	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.43.0


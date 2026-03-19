Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5156A109025E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 17:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1980D10E94C;
	Thu, 19 Mar 2026 17:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y54o+vqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B906610E94C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773941464; x=1805477464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ISAojIhlHkdg4kp0Pxuj5z83j1xfigO12JM66wAZ4zo=;
 b=Y54o+vqXe2uilDOLR1DudSiEY6V+uN07DmLX0qfcP/62oyEwDI0/Y2fc
 8kjqQhhfj+ao0DvauZrOJ5gZAjwlM9cfcLT0wEn/VGcYDhlHkZb+mjZMH
 WiyDtbM+CFZ20C1OhiE/LD1N78SnGv9i0kXk1jYskTmyyjcDBfsrf9Qti
 OznAaNl20SdfbkgqwYyPhj1DWD2kMdx21hIRvg5duIdfB/wSXS+QZlnKz
 IK1oH6CJFSEOJ66mAL8c87Z+EpshFp0u4r/OHB7FfUs1DsaUv+sw81DZS
 tdzvttzi0fGGb3yRZepT2VBQQ7+JUXfnHj6bTfcQT9/h6dXiH/BJjwCTL g==;
X-CSE-ConnectionGUID: CouLvkjyTdOq/6RjGnbFbg==
X-CSE-MsgGUID: iP+U8S76QamALCy/ZTCJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86385171"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86385171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:31:04 -0700
X-CSE-ConnectionGUID: ok7ReZtVRaikoNeAsEbXfA==
X-CSE-MsgGUID: 1tBSrPP7Tweg73Mytyb6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="260925285"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 10:31:00 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v11 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
Date: Thu, 19 Mar 2026 10:30:36 -0700
Message-ID: <20260319173031.1320708-15-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
References: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add suspend and resume handlers for System Controller to handle system
(S3/S4) and runtime power management transitions.

The handlers disable SoC remapper region before entering low power
states and restore remapper configuration and mailbox interface on
resume, re-establishing communication with firmware.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v10: (Riana, Umesh)
- Added sysctrl suspend/resume handling

v11: (Badal)
- Remove explicit SoC remapper disable on suspend
---
 drivers/gpu/drm/xe/xe_pm.c      | 11 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c | 44 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h |  2 ++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 01185f10a883..abdddd44a575 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -26,6 +26,7 @@
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_sysctrl.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
@@ -206,6 +207,8 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	xe_sysctrl_pm_suspend(xe);
+
 	drm_dbg(&xe->drm, "Device suspended\n");
 	xe_pm_block_end_signalling();
 
@@ -259,6 +262,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, true);
 
+	xe_sysctrl_pm_resume(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
@@ -618,6 +623,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	if (xe->d3cold.allowed)
+		xe_sysctrl_pm_suspend(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
@@ -670,6 +678,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
 
+	if (xe->d3cold.allowed)
+		xe_sysctrl_pm_resume(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 84e3b70043a1..d8f1f8cc2244 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -82,3 +82,47 @@ int xe_sysctrl_init(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_sysctrl_pm_suspend() - System Controller suspend handler
+ * @xe: xe device instance
+ *
+ * Invoked during system suspend (S3/S4) and runtime suspend to D3.
+ *
+ * The SoC remapper region is cleared automatically by hardware on D3
+ * cold entry. No action is required. This function is kept to preserve
+ * suspend/resume symmetry and provide a hook for future System Controller
+ * suspend handling.
+ */
+void xe_sysctrl_pm_suspend(struct xe_device *xe)
+{
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* SoC remapper region is disabled automatically on D3 cold entry; no action required. */
+}
+
+/**
+ * xe_sysctrl_pm_resume() - System Controller resume handler
+ * @xe: xe device instance
+ *
+ * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
+ * Restores SoC remapper configuration and reinitializes mailbox interface.
+ */
+void xe_sysctrl_pm_resume(struct xe_device *xe)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
+
+	xe_sysctrl_mailbox_init(sc);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index d5d8735038ae..a816feed8da6 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -17,5 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 }
 
 int xe_sysctrl_init(struct xe_device *xe);
+void xe_sysctrl_pm_suspend(struct xe_device *xe);
+void xe_sysctrl_pm_resume(struct xe_device *xe);
 
 #endif
-- 
2.43.0


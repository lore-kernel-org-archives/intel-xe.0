Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20747105F7AE
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6310EC5F;
	Fri, 13 Mar 2026 14:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7qEPgY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0212E10EC43
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773412413; x=1804948413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Spo8MJicYjxBeh5Iz2xheu6tqfalmT5tRJnyz8hcjHo=;
 b=J7qEPgY+YS+2hiFhLDlh94Cjm7suG9YYH97CyeM++kagqV+5dQi8kCQS
 Ifg5giDwVae4k69Fe91tCjBuYUrmPjlSoVo+CnbL6zNiqxdiwGAHqxZoC
 k7q8Op+BlZkeAINqqNJVOF2cpCR3LKnVqfkxc+qGZR8elISclIVwwSPJK
 CcqDeh3LpcZIEiy7BF6hm1cWmymEGl9dFKnGUEXAMj7N8N7VUYPq5jUof
 ACH28UqEaFQDtbwuPzRFFhh7as2oEinPY4TrKiA0pVGUwBEAXpWVWH+yz
 mYujDLstVQQwI8bSb8Ixswu2n+PyWlxQCDn+HIs2zYxmSimQvXYzPHRFY A==;
X-CSE-ConnectionGUID: VhHTjHgiSF+6ozrfkBiEuA==
X-CSE-MsgGUID: bS0GzN1EQ/6znn7Kh6w/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="73536546"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="73536546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:33 -0700
X-CSE-ConnectionGUID: 30As39UAQain/afBYFSaKw==
X-CSE-MsgGUID: RIc+LY1uTteg+cz22OZ5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="216084401"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 07:33:29 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v10 6/7] drm/xe/xe_sysctrl: Add System Controller power
 management support
Date: Fri, 13 Mar 2026 07:33:09 -0700
Message-ID: <20260313143303.2441609-15-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
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
---
v10: (Riana, Umesh)
- Added sysctrl suspend/resume handling
---
 drivers/gpu/drm/xe/xe_pm.c      | 11 +++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c | 40 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h |  2 ++
 3 files changed, 53 insertions(+)

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
index 84e3b70043a1..a3ac49e1985f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -82,3 +82,43 @@ int xe_sysctrl_init(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_sysctrl_pm_suspend() - System Controller suspend handler
+ * @xe: xe device instance
+ *
+ * Invoked during system suspend (S3/S4) and runtime suspend.
+ * Disables SoC remapper region to allow safe power state transitions.
+ */
+void xe_sysctrl_pm_suspend(struct xe_device *xe)
+{
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	xe->soc_remapper.set_sysctrl_region(xe, 0);
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


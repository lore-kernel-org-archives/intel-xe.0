Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3F1C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 19:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85810E2D9;
	Thu, 23 Jul 2026 19:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1d9Jm9R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BDB10E2D9
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 19:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784836292; x=1816372292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5dWvmfhg2abAj8AdZ9wpnDDImmDBbC3XM/3CiZFsBrI=;
 b=I1d9Jm9RbAO8EDdU/nPyY++Q2xnOxETwyL9Osp0a1fMVrud1AIUID/xs
 vFuI5x2qXcA2l/DLVnCQh0nNvxsEISvQzW8LlXlxZdn4GnwndTyxKfwmu
 QwDm9ugiR8Goj1BLoHpocWi6Yrgok+SbJXgdM80iCWDqdYTomUJ/zf5I3
 uGlqemSbQz29mLrewhtpBevrsE1hh1Yeg6fEKJuk4WBovMMnYIB0Kg6Sh
 tFVIzIiv1uFS+XpnjwYZiP9QRePY7ZLEZ3BhoTO6gqeXCsCPfQzUgUr2q
 kzrSnO0b5FenmKs5foO2nKhGzUeCVexTanuxy12guyZ9FyE68xHCdft4n A==;
X-CSE-ConnectionGUID: e8UgEHJrTD+nYBh4dmjawg==
X-CSE-MsgGUID: Pgy0DLLZTMCQzg77I/ioSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96163951"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="96163951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 12:51:32 -0700
X-CSE-ConnectionGUID: PVWazpyYQwamAdD1s7MOWw==
X-CSE-MsgGUID: Q7Dej+IyShKyMTRHI5iGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254163149"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 12:51:28 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/debugfs: Expose per-engine idle status
Date: Fri, 24 Jul 2026 01:13:04 +0530
Message-ID: <20260723194303.2507234-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extend the existing "hw_engines" debugfs to iterate over all hardware
engines and dump their idle state: whether the engine pipe is idle or
busy, whether C6 entry is allowed, and (where available) the forcewake
request status.

v2: Use existing debugfs (Matt Brost)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 ++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.c  |  4 ++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 54 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.c  |  2 --
 4 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..accf3012bad2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -196,6 +196,33 @@
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 #define   FAST_CLEAR_VALIGN_FIX			REG_BIT(13)
 
+#define MSG_IDLE_CS				XE_REG(0x8000)
+#define MSG_IDLE_VCS0				XE_REG(0x8004)
+#define MSG_IDLE_VCS1				XE_REG(0x8008)
+#define MSG_IDLE_VCS2				XE_REG(0x80C0)
+#define MSG_IDLE_VCS3				XE_REG(0x80C4)
+#define MSG_IDLE_VCS4				XE_REG(0x80C8)
+#define MSG_IDLE_VCS5				XE_REG(0x80CC)
+#define MSG_IDLE_VCS6				XE_REG(0x80D0)
+#define MSG_IDLE_VCS7				XE_REG(0x80D4)
+#define MSG_IDLE_VECS0				XE_REG(0x8010)
+#define MSG_IDLE_VECS1				XE_REG(0x80D8)
+#define MSG_IDLE_VECS2				XE_REG(0x80DC)
+#define MSG_IDLE_VECS3				XE_REG(0x80E0)
+#define MSG_IDLE_BCS0				XE_REG(0x800C)
+#define MSG_IDLE_BCS1				XE_REG(0x8680)
+#define MSG_IDLE_BCS2				XE_REG(0x8684)
+#define MSG_IDLE_BCS3				XE_REG(0x8688)
+#define MSG_IDLE_BCS4				XE_REG(0x868C)
+#define MSG_IDLE_BCS5				XE_REG(0x8690)
+#define MSG_IDLE_BCS6				XE_REG(0x8694)
+#define MSG_IDLE_BCS7				XE_REG(0x8698)
+#define MSG_IDLE_BCS8				XE_REG(0x869C)
+#define MSG_IDLE_GSCCS0				XE_REG(0xA62C)
+#define   MSG_IDLE_INDICATION			REG_BIT(0)
+#define   MSG_IDLE_C6_ALLOWED			REG_BIT(1)
+#define   MSG_IDLE_FW_STATUS			REG_GENMASK(13, 9)
+
 #define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
 
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5f2b90b18f97..b918f046ae15 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -127,8 +127,10 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 
 	drm_puts(&p, "\n**** HW Engines ****\n");
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
-		if (ss->hwe[i])
+		if (ss->hwe[i]) {
 			xe_engine_snapshot_print(ss->hwe[i], &p);
+			drm_puts(&p, "\n");
+		}
 
 	drm_puts(&p, "\n**** VM state ****\n");
 	xe_vm_snapshot_print(ss->vm, &p);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c38bcacb27e4..621d1e57e997 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -10,6 +10,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -22,6 +23,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
+#include "xe_mmio.h"
 #include "xe_mocs.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -111,6 +113,38 @@ int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
 
 static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 {
+	static const struct {
+		struct xe_reg reg;
+		bool has_fw;
+	} msg_idle_reg[XE_NUM_HW_ENGINES] = {
+		[XE_HW_ENGINE_RCS0] = { MSG_IDLE_CS, true },
+		[XE_HW_ENGINE_BCS0] = { MSG_IDLE_BCS0, true },
+		[XE_HW_ENGINE_BCS1] = { MSG_IDLE_BCS1, false },
+		[XE_HW_ENGINE_BCS2] = { MSG_IDLE_BCS2, false },
+		[XE_HW_ENGINE_BCS3] = { MSG_IDLE_BCS3, false },
+		[XE_HW_ENGINE_BCS4] = { MSG_IDLE_BCS4, false },
+		[XE_HW_ENGINE_BCS5] = { MSG_IDLE_BCS5, false },
+		[XE_HW_ENGINE_BCS6] = { MSG_IDLE_BCS6, false },
+		[XE_HW_ENGINE_BCS7] = { MSG_IDLE_BCS7, false },
+		[XE_HW_ENGINE_BCS8] = { MSG_IDLE_BCS8, false },
+		[XE_HW_ENGINE_VCS0] = { MSG_IDLE_VCS0, true },
+		[XE_HW_ENGINE_VCS1] = { MSG_IDLE_VCS1, true },
+		[XE_HW_ENGINE_VCS2] = { MSG_IDLE_VCS2, true },
+		[XE_HW_ENGINE_VCS3] = { MSG_IDLE_VCS3, true },
+		[XE_HW_ENGINE_VCS4] = { MSG_IDLE_VCS4, true },
+		[XE_HW_ENGINE_VCS5] = { MSG_IDLE_VCS5, true },
+		[XE_HW_ENGINE_VCS6] = { MSG_IDLE_VCS6, true },
+		[XE_HW_ENGINE_VCS7] = { MSG_IDLE_VCS7, true },
+		[XE_HW_ENGINE_VECS0] = { MSG_IDLE_VECS0, true },
+		[XE_HW_ENGINE_VECS1] = { MSG_IDLE_VECS1, true },
+		[XE_HW_ENGINE_VECS2] = { MSG_IDLE_VECS2, true },
+		[XE_HW_ENGINE_VECS3] = { MSG_IDLE_VECS3, true },
+		[XE_HW_ENGINE_CCS0] = { MSG_IDLE_CS, true },
+		[XE_HW_ENGINE_CCS1] = { MSG_IDLE_CS, true },
+		[XE_HW_ENGINE_CCS2] = { MSG_IDLE_CS, true },
+		[XE_HW_ENGINE_CCS3] = { MSG_IDLE_CS, true },
+		[XE_HW_ENGINE_GSCCS0] = { MSG_IDLE_GSCCS0, false },
+	};
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 
@@ -118,9 +152,27 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
 		return -ETIMEDOUT;
 
-	for_each_hw_engine(hwe, gt, id)
+	for_each_hw_engine(hwe, gt, id) {
+		struct xe_reg reg = msg_idle_reg[id].reg;
+		u32 val;
+
 		xe_hw_engine_print(hwe, p);
 
+		val = xe_mmio_read32(&gt->mmio, reg);
+
+		if (msg_idle_reg[id].has_fw)
+			drm_printf(p, "\tpipe %s, C6 %s, fw_req 0x%02x\n",
+				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
+				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed",
+				   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));
+		else
+			drm_printf(p, "\tpipe %s, C6 %s\n",
+				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
+				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed");
+
+		drm_puts(p, "\n");
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 82df19b304e1..5a4d085660a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1868,8 +1868,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
 					     list);
 	}
-
-	drm_puts(p, "\n");
 }
 
 /**
-- 
2.43.0


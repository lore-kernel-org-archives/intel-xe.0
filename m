Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DB2C44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 15:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8273210E37D;
	Thu, 16 Jul 2026 15:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0wuPwKl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEBA10E37D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784214900; x=1815750900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CUyLt40sB0fjtDktVj9Rjz2q14DBdW0D7jiY3ok527M=;
 b=C0wuPwKlfyoIV3A4kVG9bQgtKjEqORbK+QAKI8MIkeT1owVXQ9qbGwew
 GN97HE1gglP30WIg/iLz/mDGMXNUieuRcUQfs0bEcMZCYSWUv71/TActP
 buBVRuGDnZ4R9RkjBo/UGXvh9OY2tKk63j5mFNZyL/2eFEsNTrUeumlfW
 GI2IYuEDBzGXEpgEJ7L1PcfAAs1kNr1MrzPGz6DLrAtblIzpuk/XW0wQD
 +kSR5pr5kbptd9XtEZIn3ONR9NXZRC+LAGFiZ5+qoWv+2tJgS2IAghjcE
 2M6tVNFxLKVf9NhE5jUD5njfxOeiX5ex4qMhon4uKX4GV912lFWSONduK w==;
X-CSE-ConnectionGUID: mxXbQxVoT1aIAK4eS3ssmQ==
X-CSE-MsgGUID: BrlIbHLKRby+Kd5LjZfbPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84734279"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84734279"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:15:00 -0700
X-CSE-ConnectionGUID: B7hseonqR1mqmV006gSIUw==
X-CSE-MsgGUID: g+jhwhDLQFKKQEF9Y3v+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252541082"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:14:56 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/debugfs: Expose per-engine idle status
Date: Thu, 16 Jul 2026 20:36:43 +0530
Message-ID: <20260716150642.597692-2-sk.anirban@intel.com>
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

Introduce a "hw_engine_msg_idle" debugfs that iterates over all
hardware engines and dumps their idle state: whether the engine
pipe is idle or busy, whether C6 entry is allowed, and (where available)
the forcewake request status.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 27 +++++++++++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 69 ++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c38bcacb27e4..a2fc2aadb866 100644
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
@@ -124,6 +126,72 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int hw_engine_msg_idle(struct xe_gt *gt, struct drm_printer *p)
+{
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
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		drm_printf(p, "ERROR: Could not acquire forcewake\n");
+		return -ETIMEDOUT;
+	}
+
+	for_each_hw_engine(hwe, gt, id) {
+		struct xe_reg reg = msg_idle_reg[id].reg;
+		u32 val;
+
+		if (!reg.addr)
+			continue;
+
+		val = xe_mmio_read32(&gt->mmio, reg);
+
+		if (msg_idle_reg[id].has_fw)
+			drm_printf(p, "%s:\tpipe %s, C6 %s, fw_req 0x%02x\n", hwe->name,
+				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
+				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed",
+				   REG_FIELD_GET(MSG_IDLE_FW_STATUS, val));
+		else
+			drm_printf(p, "%s:\tpipe %s, C6 %s\n", hwe->name,
+				   val & MSG_IDLE_INDICATION ? "idle" : "busy",
+				   val & MSG_IDLE_C6_ALLOWED ? "allowed" : "not allowed");
+	}
+
+	return 0;
+}
+
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_gt_mcr_steering_dump(gt, p);
@@ -242,6 +310,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
+	{ "hw_engine_msg_idle", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engine_msg_idle },
 	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
 	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
 	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
-- 
2.43.0


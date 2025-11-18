Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED0ACEBF97
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 14:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CA810E4D7;
	Tue, 18 Nov 2025 14:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0GkFg3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD02E10E1A4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763477297; x=1795013297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCwIIu7sA6ys6q5QAkHnXDxRAJEJ75Q65NAogHTl46E=;
 b=P0GkFg3SzQyqVgPhRnqSnPwrthzJ+2WYg3/HGkDOReAUZ38eE2GPQhTO
 sZYL2qfX0eN7aAyki3Ewcjas85YVqiEFSEU/mNkn8ZO4aeUZpoHz8jkRC
 lMhT9d/63kJQHMCzprrr9+s9tD9t0Vul+kclROLkq9frjxiIal9r9TyNy
 +JlK15JFLuRDFvOfwCknyIfYYb5s+ByvGR/hfxqGVBZ+WLOuftOB0cVD9
 7V3IlZAmjUMR7omaakNETgrYglMCMYsjp1fiqS4ge+5+fw4grrMBG+8wt
 G+iVEqxVG3rw0awfbXEjtE4t35zAk7p12L1TLhVYFfm3klwT0dX1Qy8fj A==;
X-CSE-ConnectionGUID: LxzbDpXtRVmZ7INV6tgqmw==
X-CSE-MsgGUID: RXP3LmRgRKSxUoNWjXDwzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="68101581"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68101581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:48:16 -0800
X-CSE-ConnectionGUID: nSCl4aujSNGNSDGUjAWNPw==
X-CSE-MsgGUID: T8uynXXMShCDaAZY1pLbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195233749"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.246.131])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:48:14 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 16/20] drm/xe/eudebug: Mark guc contexts as debuggable
Date: Tue, 18 Nov 2025 16:48:04 +0200
Message-ID: <20251118144804.2540812-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
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

We need to inform to guc which contexts are debuggable
as their handling is different from ordinary contexts.

v2: void return, use xe_gt_dbg, no need for lrc (Matt)
v3: add the workaround enabling (Daniele)
v4: version needed to 70.49.4

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 +++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  1 +
 drivers/gpu/drm/xe/xe_eudebug_hw.h       |  7 ++++
 drivers/gpu/drm/xe/xe_guc_ads.c          | 18 ++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 45 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
 6 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 47756e4674a1..32a5f680a6d2 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -155,6 +155,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
 	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
 	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
+	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
 	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
 	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
 	XE_GUC_ACTION_LIMIT
@@ -278,4 +279,8 @@ enum xe_guc_g2g_type {
 /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
 #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
 
+enum  xe_guc_eu_kernel_debug_request_type {
+	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 265a135e7061..fba190d4f84b 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -423,6 +423,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
+	GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH				= 0x900d,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
index 8f59ec574e4e..7c5df12859ac 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
@@ -14,6 +14,13 @@ struct xe_eudebug;
 struct xe_hw_engine;
 struct xe_gt;
 
+#define XE_EUDEBUG_GUC_VER_MAJOR 70
+#define XE_EUDEBUG_GUC_VER_MINOR 49
+#define XE_EUDEBUG_GUC_VER_PATCH 4
+#define XE_EUDEBUG_GUC_VER_MIN MAKE_GUC_VER(XE_EUDEBUG_GUC_VER_MAJOR, \
+					    XE_EUDEBUG_GUC_VER_MINOR, \
+					    XE_EUDEBUG_GUC_VER_PATCH)
+
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
 void xe_eudebug_hw_init(struct xe_eudebug *d);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 58e0b0294a5b..8ff90437c976 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -16,6 +16,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
+#include "xe_eudebug_hw.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_printk.h"
@@ -363,6 +364,23 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	if (XE_GT_WA(gt, 14022766366)) {
+		const struct xe_uc_fw_version needed = {
+			.major = XE_EUDEBUG_GUC_VER_MAJOR,
+			.minor = XE_EUDEBUG_GUC_VER_MINOR,
+			.patch = XE_EUDEBUG_GUC_VER_PATCH,
+		};
+
+		if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER_STRUCT(needed))
+			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+					 GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH);
+		else
+			xe_gt_warn(gt, "eudebug needs GuC version %u.%u.%u or greater\n",
+				   needed.major, needed.minor, needed.patch);
+	}
+#endif
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 16f78376f196..26dc4a4a67f0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -21,6 +21,7 @@
 #include "xe_assert.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
+#include "xe_eudebug_hw.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
@@ -608,6 +609,47 @@ static void __register_exec_queue(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
+static bool xe_guc_has_debug_contexts(struct xe_guc *guc)
+{
+	return GUC_FIRMWARE_VER(guc) >=	XE_EUDEBUG_GUC_VER_MIN;
+}
+
+static int xe_guc_action_eu_kernel_debug_enable(struct xe_guc *guc,
+						struct xe_exec_queue *q)
+{
+	struct xe_gt *gt = q->hwe->gt;
+	const u32 action[] = {
+		XE_GUC_ACTION_EU_KERNEL_DEBUG,
+		q->guc->id,
+		XE_GUC_EU_KERNEL_DEBUG_ENABLE,
+		0, /* reserved */
+	};
+	int ret;
+
+	ret = xe_guc_ct_send(&guc->ct, action,
+			     ARRAY_SIZE(action), 0, 0);
+
+	if (ret)
+		xe_gt_dbg(gt, "GuC ctx=%d debug enabling failed with %d",
+			  action[1], ret);
+	else
+		xe_gt_dbg(gt, "GuC ctx=%d enabled for debug", action[1]);
+
+	return ret;
+}
+
+static void set_debug(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	int ret;
+
+	if (!xe_guc_has_debug_contexts(guc))
+		return;
+
+	ret = xe_guc_action_eu_kernel_debug_enable(guc, q);
+	if (ret)
+		xe_gt_warn(q->gt, "Failed to set eu kernel debug enable");
+}
+
 static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -662,6 +704,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	else
 		__register_exec_queue(guc, &info);
 	init_policies(guc, q);
+
+	if (xe_exec_queue_is_debuggable(q))
+		set_debug(guc, q);
 }
 
 static u32 wq_space_until_wrap(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e8f09ae7a67b..31272c83c6e0 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -85,3 +85,5 @@
 #eudebug
 18022722726	GRAPHICS_VERSION_RANGE(1250, 1274)
 14015474168	PLATFORM(PVC)
+14022766366	GRAPHICS_VERSION_RANGE(2000, 2004)
+		GRAPHICS_VERSION_RANGE(3000, 3005)
-- 
2.43.0


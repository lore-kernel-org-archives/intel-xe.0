Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71732D0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9110E475;
	Mon, 21 Oct 2024 09:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huMR/sF8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9908110E475
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504766; x=1761040766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+EYYRbVX0pmqL1rOi1mw2SBeK+LPyVT35f/nYnB4zQ=;
 b=huMR/sF8bV1WtbQYHhpeT/kF3GJWHT8eKr3Aogymjw9kkFO79en4/SAe
 Doh6FaSKRSzfupROvfdPtYjeqePvnXuyHqS0WPuAIRH4wIAz1GFArsnKo
 8YLn5cs6BYjegezdnYCfi2erEFRuzr+7+tp2v1VIvXDsM+XoxEfWNx5Mu
 Q8DqGEL2IBA76cz7Q1150QaZ5garrfePJchQOpgLyFyBISAKWGD4hOtmM
 /4sL++y5Umaxb12IhbjvDO9RSu9nFZgvXcU2/dTm/QQkJ5fjeaj6O6Jw/
 9mf8aFsxss+g7OAQgibmQ5V+r3ykWLmjqIzmy4s0m6SX8axLyFxPhacPM A==;
X-CSE-ConnectionGUID: z0E+ZuWNTJu6a7rVSGyrgw==
X-CSE-MsgGUID: ukN5ModVT+uVIm3n1Id0vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350788"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350788"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:26 -0700
X-CSE-ConnectionGUID: dsS1QPuYTz6LdC4F5ozLiQ==
X-CSE-MsgGUID: nw2nsrAjQImsna0VON6OVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84546026"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:22 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 05/19] drm/xe/eudebug: hw enablement for eudebug
Date: Mon, 21 Oct 2024 12:58:44 +0300
Message-ID: <20241021095904.439555-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
and some other registers needs to be programmed. Implement eudebug
mode enabling including eudebug related workarounds.

v2: Move workarounds to xe_wa_oob. Use reg_sr directly instead of
xe_rtp as it suits better for dynamic manipulation of those register we
do later in the series.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 10 ++++
 drivers/gpu/drm/xe/xe_eudebug.c          | 70 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h          |  3 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 +
 6 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7c78496e6213..e45c4d5378e5 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -115,6 +115,10 @@
 
 #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
 
+#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
+#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
+#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 42dc55cb23f4..45836d232fb2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -453,6 +453,14 @@
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
 #define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
+#define TD_CTL					XE_REG_MCR(0xe400)
+#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
+#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
+#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
+#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
+#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
+#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
+
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
@@ -479,11 +487,13 @@
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 #define   EARLY_EOT_DIS				REG_BIT(1)
+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 
 #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
+#define   XEHPC_DISABLE_BTB			REG_BIT(11)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index a6d69e20b083..fa0415b9aa11 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -10,13 +10,21 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
+
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_eudebug.h"
 #include "xe_eudebug_types.h"
 #include "xe_exec_queue.h"
 #include "xe_macros.h"
+#include "xe_reg_sr.h"
+#include "xe_rtp.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 /*
  * If there is no detected event read by userspace, during this period, assume
@@ -944,6 +952,68 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+#undef XE_REG_MCR
+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
+
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe->eudebug.available)
+		return;
+
+	if (!xe_rtp_match_first_render_or_compute(gt, hwe))
+		return;
+
+	if (XE_WA(gt, 18022722726)) {
+		struct xe_reg_sr_entry sr_entry = {
+			.reg = ROW_CHICKEN,
+			.clr_bits = STALL_DOP_GATING_DISABLE,
+			.set_bits = STALL_DOP_GATING_DISABLE,
+			.read_mask = STALL_DOP_GATING_DISABLE,
+		};
+
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+	}
+
+	if (XE_WA(gt, 14015474168)) {
+		struct xe_reg_sr_entry sr_entry = {
+			.reg = ROW_CHICKEN2,
+			.clr_bits = XEHPC_DISABLE_BTB,
+			.set_bits = XEHPC_DISABLE_BTB,
+			.read_mask = XEHPC_DISABLE_BTB,
+		};
+
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+	}
+
+	if (xe->info.graphics_verx100 >= 1200) {
+		u32 mask = TD_CTL_BREAKPOINT_ENABLE |
+			   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+			   TD_CTL_FEH_AND_FEE_ENABLE;
+		struct xe_reg_sr_entry sr_entry = {
+			.reg = TD_CTL,
+			.clr_bits = mask,
+			.set_bits = mask,
+			.read_mask = mask,
+		};
+
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+	}
+
+	if (xe->info.graphics_verx100 >= 1250) {
+		struct xe_reg_sr_entry sr_entry = {
+			.reg = TD_CTL,
+			.clr_bits = TD_CTL_GLOBAL_DEBUG_ENABLE,
+			.set_bits = TD_CTL_GLOBAL_DEBUG_ENABLE,
+			.read_mask = TD_CTL_GLOBAL_DEBUG_ENABLE,
+		};
+
+		xe_reg_sr_add(&hwe->reg_sr, &sr_entry, gt);
+	}
+}
+
 void xe_eudebug_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->eudebug.lock);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 326ddbd50651..3cd6bc7bb682 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -11,6 +11,7 @@ struct xe_device;
 struct xe_file;
 struct xe_vm;
 struct xe_exec_queue;
+struct xe_hw_engine;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -20,6 +21,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 void xe_eudebug_init(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
 void xe_eudebug_file_open(struct xe_file *xef);
 void xe_eudebug_file_close(struct xe_file *xef);
@@ -38,6 +40,7 @@ static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 static inline void xe_eudebug_init(struct xe_device *xe) { }
 static inline void xe_eudebug_fini(struct xe_device *xe) { }
+static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe) { }
 
 static inline void xe_eudebug_file_open(struct xe_file *xef) { }
 static inline void xe_eudebug_file_close(struct xe_file *xef) { }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..0b6e087712ea 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -16,6 +16,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
@@ -558,6 +559,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
+	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index bcd04464b85e..797f89424013 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -41,3 +41,5 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+18022722726	GRAPHICS_VERSION_RANGE(1250, 1274)
+14015474168	PLATFORM(PVC)
-- 
2.46.1


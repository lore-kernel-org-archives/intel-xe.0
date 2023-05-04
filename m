Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AABC7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 14:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B96C10E169;
	Thu,  4 May 2023 14:12:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445210E461
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683209556; x=1714745556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eQBIMli2SjqaI5FpzYFLk0nR8ucCVWYWjwHvjRRAWD0=;
 b=XvNQfFKqsoxYdXSstdugENN2Wpa74lpc3/O/sFq5Y3tSsHSEPSQoTaJe
 HX4qOPwGNQ83ada57NuWJ8F58PwErPUMoXw3ceFdgPJnj1O8xx/8WyIh3
 laEZGKyQ3zxCC7RrOv3IdQse8GgzuZ2dtcFfBTDgyTBuCS8EU6du2BEyW
 gRBC0ucBUllCrCM1JbeMGhTZvPkMpTw2ZIK3ynXA8BXf2eOJSECb9kJyr
 RRyVy4cvOlUoV7NQaNgplkydVsM5dnq5hy2r2inPI8trv13+9TWOSfryj
 rEf/Fv/Bnwc8BweoxcC+1mZD5vxEN892hl5rNJk0FkGMM85vOOcGyFbFZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="377009003"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="377009003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 07:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="786559626"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="786559626"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 07:12:34 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 07:12:26 -0700
Message-Id: <20230504141227.29785-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/2] drm/xe: Set default MOCS value for cs
 instructions
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

CS instructions that dont have a explicit MOCS field will use this
default MOCS value.

To do this, it was necessary to initialize part of the mocs earlier
and add new function that loads another array of rtp entries set
during run-time.

This is still missing to handle of mocs read for platforms with
HAS_L3_CCS_READ(aka PVC).

This was mainly copied from i915 source code.

v2:
- move to xe_hw_engine.c
- remove CMD_CCTL auxiliary macros

v3:
- rebased

Bspec: 45826
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 12 ++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mocs.c             | 11 ++++++--
 drivers/gpu/drm/xe/xe_mocs.h             |  1 +
 5 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index f6b3b99a562a6..717d560626cec 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -44,6 +44,18 @@
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
+
+#define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
+/*
+ * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
+ * The lsb of each can be considered a separate enabling bit for encryption.
+ * 6:0 == default MOCS value for reads  =>  6:1 == table index for reads.
+ * 13:7 == default MOCS value for writes => 13:8 == table index for writes.
+ * 15:14 == Reserved => 31:30 are set to 0.
+ */
+#define   CMD_CCTL_WRITE_OVERRIDE_MASK		REG_GENMASK(13, 8)
+#define   CMD_CCTL_READ_OVERRIDE_MASK		REG_GENMASK(6, 1)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0d4664e344dac..603bb3ae3e370 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -390,6 +390,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* Rerun MCR init as we now have hw engine list */
 	xe_gt_mcr_init(gt);
 
+	xe_mocs_init_early(gt);
+
 	err = xe_hw_engines_init_early(gt);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 566b62815dab5..d497f0289c372 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -21,6 +21,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
+#include "xe_rtp.h"
 #include "xe_sched_job.h"
 #include "xe_wa.h"
 
@@ -267,6 +268,39 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
 }
 
+static void
+hw_engine_setup_default_state(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	const u8 mocs_write_idx = gt->mocs.uc_index;
+	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
+	const u8 mocs_read_idx = gt->mocs.uc_index;
+	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
+			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
+	const struct xe_rtp_entry engine_was[] = {
+		/*
+		 * RING_CMD_CCTL specifies the default MOCS entry that will be
+		 * used by the command streamer when executing commands that
+		 * don't have a way to explicitly specify a MOCS setting.
+		 * The default should usually reference whichever MOCS entry
+		 * corresponds to uncached behavior, although use of a WB cached
+		 * entry is recommended by the spec in certain circumstances on
+		 * specific platforms.
+		 */
+		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
+					   CMD_CCTL_WRITE_OVERRIDE_MASK |
+					   CMD_CCTL_READ_OVERRIDE_MASK,
+					   ring_cmd_cctl_val,
+					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
+		{}
+	};
+
+	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
+}
+
 static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 				 enum xe_hw_engine_id id)
 {
@@ -293,6 +327,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
 	xe_wa_process_engine(hwe);
+	hw_engine_setup_default_state(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index f2ceecd536ed0..0d07811a573f6 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -518,6 +518,15 @@ static void init_l3cc_table(struct xe_gt *gt,
 	}
 }
 
+void xe_mocs_init_early(struct xe_gt *gt)
+{
+	struct xe_mocs_info table;
+
+	get_mocs_settings(gt->xe, &table);
+	gt->mocs.uc_index = table.uc_index;
+	gt->mocs.wb_index = table.wb_index;
+}
+
 void xe_mocs_init(struct xe_gt *gt)
 {
 	struct xe_mocs_info table;
@@ -528,8 +537,6 @@ void xe_mocs_init(struct xe_gt *gt)
 	 */
 	flags = get_mocs_settings(gt->xe, &table);
 	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
-	gt->mocs.uc_index = table.uc_index;
-	gt->mocs.wb_index = table.wb_index;
 
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).reg);
diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index 63500a1d6660a..25f7b35a76daf 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -11,6 +11,7 @@
 struct xe_engine;
 struct xe_gt;
 
+void xe_mocs_init_early(struct xe_gt *gt);
 void xe_mocs_init(struct xe_gt *gt);
 
 /**
-- 
2.40.1


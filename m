Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B35C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 18:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B71C10E429;
	Tue, 25 Apr 2023 18:46:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A79110E429
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682448382; x=1713984382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JLKMi1eWbtSxmA9IXnQP9rKZknPu3WZGIkTLfppelUI=;
 b=Bfy151QKazDIVRotuzbm8qkYGMakAWr4EL00z32UmQpiqTLMvg67BXY7
 WOt1ZtNDFEwTg0LhA9A6om6guOdQSB79lvtZUVoorzj7ApGW8xu0Mmmbk
 LZLvH7DKmt2nHxmPJy+4GoVK0etQpAvHK5sMvSWjqxwV9D+bNHNX4VyWV
 WfQvDf5R7uBrgW8JEEh6oRUMXZRshAYluMXIe8trIXcmpco39XrGYfuOc
 ZAo0VWNtkPkGNPf7mw1GmPZg4LkTIUSNnXEeEObwogpMVEdsUXrtYl+I7
 H2tVuhWE0PGhR2hGtd2RtiWf7iSRbUrRVZdxQNZioMlQOLtm6OOmX3BpR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="345622158"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="345622158"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="837554605"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="837554605"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 11:46:20 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 11:46:01 -0700
Message-Id: <20230425184602.144628-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Set default MOCS value for cs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

Bspec: 45826
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 13 +++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mocs.c             | 11 ++++++--
 drivers/gpu/drm/xe/xe_mocs.h             |  1 +
 5 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 2aa67d001c34b..7a12b99f8c1d2 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -44,6 +44,19 @@
 #define RING_EIR(base)				_MMIO((base) + 0xb0)
 #define RING_EMR(base)				_MMIO((base) + 0xb4)
 #define RING_ESR(base)				_MMIO((base) + 0xb8)
+
+#define RING_CMD_CCTL(base)			_MMIO((base) + 0xc4)
+#define RING_CMD_CCTL_RTP(base)			_XE_RTP_REG((base) + 0xc4)
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
 #define RING_BBADDR(base)			_MMIO((base) + 0x140)
 #define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168)
 #define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 4186f7f0d42f5..126434b4c3d7b 100644
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
index 4b56c35b988d4..b43641ea84518 100644
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
+		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL_RTP(0),
+					   CMD_CCTL_WRITE_OVERRIDE_MASK |
+					   CMD_CCTL_READ_OVERRIDE_MASK,
+					   ring_cmd_cctl_val,
+					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE)))
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
index e09c6242aafc0..b1a522bd1b418 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -517,6 +517,15 @@ static void init_l3cc_table(struct xe_gt *gt,
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
@@ -527,8 +536,6 @@ void xe_mocs_init(struct xe_gt *gt)
 	 */
 	flags = get_mocs_settings(gt->xe, &table);
 	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
-	gt->mocs.uc_index = table.uc_index;
-	gt->mocs.wb_index = table.wb_index;
 
 	if (flags & HAS_GLOBAL_MOCS)
 		__init_mocs_table(gt, &table, GEN12_GLOBAL_MOCS(0).reg);
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
2.40.0


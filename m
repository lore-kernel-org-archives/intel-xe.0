Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F06C77B73
	for <intel-xe@archiver.kernel.org>; Sat, 15 Apr 2023 04:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB2310E21D;
	Sat, 15 Apr 2023 04:09:29 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1694E10E06B
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Apr 2023 04:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681531767; x=1713067767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pg5ekjMd2fpITz6bbFPmZzH/LJqFSEqbEIFvQhZAXuY=;
 b=dY94IwUn7Xc/oZxzwSgHJNQBYTLeF+8zTjJBfW030GZA17RSjVM6R59h
 j4djhgtnVBLI6UZwF7aDeC1TO11w8AZhBL52LheYCfKOuzDPFMeaZBfH5
 rYKZZmoqrgnIlBHfif7OWI/4YjNlEiBLYMQQh3aAUCtIE22of2FB4rOpb
 U+WHYl3Tv2UDSjXdHz6DB0JtAdwkZptVHrUmpoiiJwGbbgZ3w29WI8dHX
 StMvsrZA3otI0LmQWv0dJCaB7nfBkHMZXA/A2Hy7EbOwcNfXxZ+KvWXe2
 jHRl2O4IaYVgZZW6313pce2sISEmyWB3WRB+x/yhBVVKazs8OS9bJxBKX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347342170"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="347342170"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 21:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833763975"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="833763975"
Received: from mkathuri-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.85.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 21:09:23 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 14 Apr 2023 21:09:05 -0700
Message-Id: <20230415040906.13230-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Set default MOCS value for cs
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

Bspec: 45826
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 16 +++++++++++
 drivers/gpu/drm/xe/xe_gt.c               |  2 ++
 drivers/gpu/drm/xe/xe_mocs.c             | 11 ++++++--
 drivers/gpu/drm/xe/xe_mocs.h             |  1 +
 drivers/gpu/drm/xe/xe_wa.c               | 36 ++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 2aa67d001c34b..cc874348f76bc 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -89,6 +89,22 @@
 #define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
 #define	  EL_CTRL_LOAD				REG_BIT(0)
 
+#define RING_CMD_CCTL(base)			_MMIO((base) + 0xc4)
+/*
+ * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
+ * The lsb of each can be considered a separate enabling bit for encryption.
+ * 6:0 == default MOCS value for reads  =>  6:1 == table index for reads.
+ * 13:7 == default MOCS value for writes => 13:8 == table index for writes.
+ * 15:14 == Reserved => 31:30 are set to 0.
+ */
+#define CMD_CCTL_WRITE_OVERRIDE_MASK REG_GENMASK(13, 7)
+#define CMD_CCTL_READ_OVERRIDE_MASK REG_GENMASK(6, 0)
+#define CMD_CCTL_MOCS_MASK (CMD_CCTL_WRITE_OVERRIDE_MASK | \
+			    CMD_CCTL_READ_OVERRIDE_MASK)
+#define CMD_CCTL_MOCS_OVERRIDE(write, read)				      \
+		(REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, (write) << 1) | \
+		 REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, (read) << 1))
+
 #define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
 
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
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a7d681b7538d4..5ef3561101466 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -631,6 +631,41 @@ void xe_wa_process_gt(struct xe_gt *gt)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 
+/**
+ * xe_wa_process_runtime_was_engine - process engine runtime workarounds
+ *
+ * For workarounds that program values that are only available in run-time.
+ */
+static void
+xe_wa_process_runtime_was_engine(struct xe_reg_sr *sr,
+				 struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	u8 mocs_w = gt->mocs.uc_index;
+	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
+	u8 mocs_r = gt->mocs.uc_index;
+	struct xe_rtp_entry engine_was[] = {
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
+					   CMD_CCTL_MOCS_MASK,
+					   CMD_CCTL_MOCS_OVERRIDE(mocs_w, mocs_r),
+					   XE_RTP_ACTION_FLAG(MASKED_REG, ENGINE_BASE))),
+		},
+		{}
+	};
+
+	xe_rtp_process(engine_was, &hwe->reg_sr, hwe->gt, hwe);
+}
+
 /**
  * xe_wa_process_engine - process engine workaround table
  * @hwe: engine instance to process workarounds for
@@ -642,6 +677,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe)
 {
 	xe_rtp_process(engine_was, &hwe->reg_sr, hwe->gt, hwe);
+	xe_wa_process_runtime_was_engine(&hwe->reg_sr, hwe->gt, hwe);
 }
 
 /**
-- 
2.40.0


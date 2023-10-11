Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4029FCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 23:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AD410E260;
	Wed, 11 Oct 2023 23:10:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27F410E298
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 23:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697065817; x=1728601817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7GWTbed/SLJ4GHihSl1hfwwRGP90tF6xBLqWGF7ORYE=;
 b=K//8ikvKEdNllES382QalEF4WCp8Ki7ghjRoDHWQbWqiYQ+34mxb29jH
 Y2qcYJQ1hc3mhOVDW6uXZrEi9kp3bpQNFgOkBAvN6VEe2YxZQxpo3TeeG
 gjXI/ozi6BDt0/tTT6PbQozM1kfUCuXuoxvnZbkoQWUjeuh39EqCQz814
 RWljv+g4GQ09Uv7EVWTXQImmnHYwALz1io4PpenKXiSaVZqpH65fHyoNX
 oWeQKH+yMcbH/1WB08Y4b80W6SSOt91CfU4bFiPUvClBINqLcarIKnxN/
 5VItWNUX/ZGLsc6PfKM71UyYBve/eDnPp4YIQTRf6hmUfHpwprD864fzd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451282092"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="451282092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="703919068"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="703919068"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:10:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:10:03 -0700
Message-ID: <20231011230957.463381-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011230957.463381-8-matthew.d.roper@intel.com>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe/debugfs: Add dump of default LRCs' MI
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For non-RCS engines, nearly all of the LRC state is composed of MI
instructions (specifically MI_LOAD_REGISTER_IMM).  Providing a dump
interface allows us to verify that the context image layout matches
what's documented in the bspec, and also allows us to check whether LRC
workarounds are being properly captured by the default state we record
at startup.

For now, the non-MI instructions found in the RCS and CCS engines will
dump as "unknown;" parsing of those will be added in a follow-up patch.

Bspec: 64993
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/xe/instructions/xe_inst_defs.h    |  1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  3 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 41 +++++++++
 drivers/gpu/drm/xe/xe_lrc.c                   | 84 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |  5 ++
 5 files changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
index c992ad767f08..d665a7e21f3b 100644
--- a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
+++ b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
@@ -15,6 +15,7 @@
  */
 #define XE_INST_CMD_TYPE		GENMASK(31, 29)
 #define   XE_INST_MI			REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x0)
+#define   XE_INST_GFXPIPE		REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x3)
 
 /*
  * Most (but not all) instructions have a "length" field in the instruction
diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 4a37b2b86b40..8cd1fc0e4f17 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -30,6 +30,9 @@
 #define   MI_ARB_DISABLE		0x0
 
 #define MI_BATCH_BUFFER_END		__MI_INST(0xA)
+#define MI_TOPOLOGY_FILTER		__MI_INST(0xD)
+#define MI_FORCE_WAKEUP			__MI_INST(0x1D)
+
 #define MI_STORE_DATA_IMM		__MI_INST(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index cd6d28c7b923..e2483cb7721a 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -15,6 +15,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
+#include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_pat.h"
 #include "xe_reg_sr.h"
@@ -149,6 +150,41 @@ static int pat(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int rcs_default_lrc(struct seq_file *m, void *data) {
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
+	return 0;
+}
+
+static int ccs_default_lrc(struct seq_file *m, void *data) {
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
+	return 0;
+}
+
+static int bcs_default_lrc(struct seq_file *m, void *data) {
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
+	return 0;
+}
+
+static int vcs_default_lrc(struct seq_file *m, void *data) {
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
+	return 0;
+}
+
+static int vecs_default_lrc(struct seq_file *m, void *data) {
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -159,6 +195,11 @@ static const struct drm_info_list debugfs_list[] = {
 	{"register-save-restore", register_save_restore, 0},
 	{"workarounds", workarounds, 0},
 	{"pat", pat, 0},
+	{"default_lrc_rcs", rcs_default_lrc},
+	{"default_lrc_ccs", ccs_default_lrc},
+	{"default_lrc_bcs", bcs_default_lrc},
+	{"default_lrc_vcs", vcs_default_lrc},
+	{"default_lrc_vecs", vecs_default_lrc},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a04867131839..825b229212ae 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -6,6 +6,7 @@
 #include "xe_lrc.h"
 
 #include "instructions/xe_mi_commands.h"
+#include "instructions/xe_gfxpipe_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
@@ -903,3 +904,86 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
 {
 	return __xe_lrc_parallel_map(lrc);
 }
+
+static int instr_dw(u32 cmd_header)
+{
+	/* Most instructions have the # of dwords (minus 2) in 7:0 */
+	return REG_FIELD_GET(XE_INST_LEN_MASK, cmd_header) + 2;
+}
+
+static int dump_mi_command(struct drm_printer *p,
+			   struct xe_gt *gt,
+			   u32 *dw,
+			   int remaining_dw)
+{
+	u32 numdw = instr_dw(*dw);
+	u32 opcode = REG_FIELD_GET(MI_OPCODE, *dw);
+
+	switch (*dw & MI_OPCODE) {
+	case MI_NOOP:
+		int num_noop = 1;
+		while (num_noop < remaining_dw &&
+		       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
+			num_noop++;
+		drm_printf(p, "MI_NOOP (%d dwords)\n", num_noop);
+		return num_noop;
+
+	case MI_LOAD_REGISTER_IMM:
+		drm_printf(p, "MI_LOAD_REGISTER_IMM: %d regs\n", (numdw - 1) / 2);
+		for (int i = 1; i < numdw; i += 2)
+			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
+		return numdw;
+
+	case MI_TOPOLOGY_FILTER:
+		drm_printf(p, "MI_TOPOLOGY_FILTER\n");
+		return 1;
+
+	case MI_FORCE_WAKEUP:
+		drm_printf(p, "MI_FORCE_WAKEUP\n");
+		return numdw;
+
+	case MI_BATCH_BUFFER_END:
+		drm_printf(p, "MI_BATCH_BUFFER_END\n");
+		return 0;
+
+	default:
+		drm_printf(p, "unknown MI opcode %#x, likely %d dwords\n",
+			   opcode, numdw);
+		return numdw;
+	}
+}
+
+void xe_lrc_dump_default(struct drm_printer *p,
+			 struct xe_gt *gt,
+			 enum xe_engine_class hwe_class)
+{
+	u32 *dw;
+	int remaining_dw, num_dw;
+
+	if (!gt->default_lrc[hwe_class]) {
+		drm_printf(p, "No default LRC for class %d\n", hwe_class);
+		return;
+	}
+
+	/* First page of LRC is a ppHWSP */
+	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
+	remaining_dw = (xe_lrc_size(gt_to_xe(gt), hwe_class) - LRC_PPHWSP_SIZE) / 4;
+
+	while (remaining_dw) {
+		if ((*dw & XE_INST_CMD_TYPE) == XE_INST_MI) {
+			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
+		} else {
+			num_dw = min(instr_dw(*dw), remaining_dw);
+			drm_printf(p, "Unknown instr <%#x> of type %#x, likely %d dwords\n",
+				   *dw, REG_FIELD_GET(XE_INST_CMD_TYPE, *dw),
+				   num_dw);
+		}
+
+		/* 0 is returned on MI_BATCH_BUFFER_END */
+		if (num_dw == 0)
+			break;
+
+		dw += num_dw;
+		remaining_dw -= num_dw;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 3a6e8fc5a837..a7056eda5e0c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -7,6 +7,7 @@
 
 #include "xe_lrc_types.h"
 
+struct drm_printer;
 struct xe_device;
 struct xe_exec_queue;
 enum xe_engine_class;
@@ -47,4 +48,8 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
 
 size_t xe_lrc_skip_size(struct xe_device *xe);
 
+void xe_lrc_dump_default(struct drm_printer *p,
+			 struct xe_gt *gt,
+			 enum xe_engine_class);
+
 #endif
-- 
2.41.0


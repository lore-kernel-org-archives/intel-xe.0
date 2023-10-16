Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22A9CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786A610E215;
	Mon, 16 Oct 2023 16:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC1510E215
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697474103; x=1729010103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhEd3zudOU82GfjRx+DQTvaP1243Q5l01RjzyehsJyc=;
 b=h9fPRa5DexjAUQGqBcFRDKs6GBkGDBCi3YgJNk3/gXSJV7/BAhk4aaDe
 63OjQCrhITYsdhr8ed94VbcCt2GSA0i7b/DTKizWpL/pgMva24MoBLYjw
 YbBt4sg9UGIiPxrEbFoVx+gXMwM2MjWdCoyAlZrWJiHOSL7mAaivjmWAD
 SHIMlp/cFz8XJoI+a/Mjp7TuKCGXblAOIwUl5Ivc99aUQjdXLeVhbNnDt
 yJbx28PNRnAcUaasADrQl79t2PiLqPZhiqaIDloJaEsv4SczmYb/nQTAK
 yupcL4igxzxFY0E6718tAztVjWoWhE+AOw1uG51M/e7/Xti8LmfZ0VGZP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452051248"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="452051248"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="790865612"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="790865612"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:35:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 09:34:55 -0700
Message-ID: <20231016163449.1300701-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016163449.1300701-8-matthew.d.roper@intel.com>
References: <20231016163449.1300701-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/6] drm/xe/debugfs: Add dump of default LRCs'
 MI instructions
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

v2:
 - Add raw instruction header as well as decoded meaning.  (Lucas)
 - Check that num_dw isn't greater than remaining_dw for instructions
   that have a "# dwords" field.  (Lucas)
 - Clarify comment about skipping over ppHWSP.  (Lucas)

Bspec: 64993
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |  1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  3 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 46 +++++++++
 drivers/gpu/drm/xe/xe_lrc.c                   | 97 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |  5 +
 5 files changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
index a7ec46395786..e403b4fcc20a 100644
--- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
+++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
@@ -15,6 +15,7 @@
  */
 #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
 #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
+#define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
 
 /*
  * Most (but not all) instructions have a "length" field in the instruction
diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 753ebf1efa78..1cfa96167fde 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -30,6 +30,9 @@
 #define   MI_ARB_DISABLE		0x0
 
 #define MI_BATCH_BUFFER_END		__MI_INSTR(0xA)
+#define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
+#define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index cd6d28c7b923..c4b67cf09f8f 100644
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
@@ -149,6 +150,46 @@ static int pat(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int rcs_default_lrc(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
+	return 0;
+}
+
+static int ccs_default_lrc(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
+	return 0;
+}
+
+static int bcs_default_lrc(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
+	return 0;
+}
+
+static int vcs_default_lrc(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
+	return 0;
+}
+
+static int vecs_default_lrc(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"hw_engines", hw_engines, 0},
 	{"force_reset", force_reset, 0},
@@ -159,6 +200,11 @@ static const struct drm_info_list debugfs_list[] = {
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
index a04867131839..38e98c54464b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -16,6 +16,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
 #include "xe_map.h"
 #include "xe_vm.h"
@@ -903,3 +904,99 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
 {
 	return __xe_lrc_parallel_map(lrc);
 }
+
+static int instr_dw(u32 cmd_header)
+{
+	/* Most instructions have the # of dwords (minus 2) in 7:0 */
+	return REG_FIELD_GET(XE_INSTR_LEN_MASK, cmd_header) + 2;
+}
+
+static int dump_mi_command(struct drm_printer *p,
+			   struct xe_gt *gt,
+			   u32 *dw,
+			   int remaining_dw)
+{
+	u32 inst_header = *dw;
+	u32 numdw = instr_dw(inst_header);
+	u32 opcode = REG_FIELD_GET(MI_OPCODE, inst_header);
+	int num_noop;
+
+	/* First check for commands that don't have/use a '# DW' field */
+	switch (inst_header & MI_OPCODE) {
+	case MI_NOOP:
+		num_noop = 1;
+		while (num_noop < remaining_dw &&
+		       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
+			num_noop++;
+		drm_printf(p, "[%#010x] MI_NOOP (%d dwords)\n", inst_header, num_noop);
+		return num_noop;
+
+	case MI_TOPOLOGY_FILTER:
+		drm_printf(p, "[%#010x] MI_TOPOLOGY_FILTER\n", inst_header);
+		return 1;
+
+	case MI_BATCH_BUFFER_END:
+		drm_printf(p, "[%#010x] MI_BATCH_BUFFER_END\n", inst_header);
+		/* Return 'remaining_dw' to consume the rest of the LRC */
+		return remaining_dw;
+	}
+
+	/*
+	 * Any remaining commands include a # of dwords.  We should make sure
+	 * it doesn't exceed the remaining size of the LRC.
+	 */
+	if (xe_gt_WARN_ON(gt, numdw > remaining_dw))
+		numdw = remaining_dw;
+
+	switch (inst_header & MI_OPCODE) {
+	case MI_LOAD_REGISTER_IMM:
+		drm_printf(p, "[%#010x] MI_LOAD_REGISTER_IMM: %d regs\n",
+			   inst_header, (numdw - 1) / 2);
+		for (int i = 1; i < numdw; i += 2)
+			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
+		return numdw;
+
+	case MI_FORCE_WAKEUP:
+		drm_printf(p, "[%#010x] MI_FORCE_WAKEUP\n", inst_header);
+		return numdw;
+
+	default:
+		drm_printf(p, "[%#010x] unknown MI opcode %#x, likely %d dwords\n",
+			   inst_header, opcode, numdw);
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
+	/*
+	 * Skip the beginning of the LRC since it contains the per-process
+	 * hardware status page.
+	 */
+	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
+	remaining_dw = (xe_lrc_size(gt_to_xe(gt), hwe_class) - LRC_PPHWSP_SIZE) / 4;
+
+	while (remaining_dw > 0) {
+		if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_MI) {
+			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
+		} else {
+			num_dw = min(instr_dw(*dw), remaining_dw);
+			drm_printf(p, "[%#10x] Unknown instruction of type %#x, likely %d dwords\n",
+				   *dw, REG_FIELD_GET(XE_INSTR_CMD_TYPE, *dw),
+				   num_dw);
+		}
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


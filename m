Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173FFC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 05:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84CB10E745;
	Mon,  6 Jul 2026 05:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRXDziSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26BA10E745
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 05:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783316144; x=1814852144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YnZKi1fCT+BeOwSQr4aRh2uCAXVwd6luae7WvZ1enY=;
 b=eRXDziSZpa20LUIxZ07iOcxofpHS3TK4eqyMzSK1GPb46sX1TC+sn34H
 Uu6QKp0gF1zQb7hqEPnenEOHo5To71CAfA7cWdy+LNc2d+uK6Lrg+ZcIv
 MUdv9Ccfmtv1xkBL8+qj7Wt24sXrhQJ373Qi/r6sjrPrrb8hJzNvNBtOG
 Jt/Tj7PsGetyPr5JlIG6srnPTs7qgqBshqgSfu7PJqrdPxuBLsTGXllOS
 szuuYZqdeHBwmNGuMowvuvtq2PnKueXHFFwxM1ohzNtw6b6E/Dc6P0HHB
 P4F/AkXjnF/uB2AXH3KT1kyP+QLUflYXs334mYaPn7KEc0Vg9IIIpdri7 Q==;
X-CSE-ConnectionGUID: +H224z5ARXuPQxtPIJYYBQ==
X-CSE-MsgGUID: ldJaWAw3SbGPQGIO5FDMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95096792"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95096792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 22:35:43 -0700
X-CSE-ConnectionGUID: 2V9ovslKSSO0ImSLGMAHRA==
X-CSE-MsgGUID: L8dh5k/pS8m88nmsnt7c2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="251877598"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 22:35:42 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v3] drm/xe: Add debugfs knob to control GPGPU preemption
 granularity
Date: Mon,  6 Jul 2026 11:05:32 +0530
Message-ID: <20260706053532.843645-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618042421.483657-1-varun.gupta@intel.com>
References: <20260618042421.483657-1-varun.gupta@intel.com>
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

Add a per-GT debugfs entry 'preemption_level' that controls the GPGPU/
Media preemption granularity for newly created RCS/CCS LRCs on Xe2+.

The knob accepts: "default", "mid-thread", "thread-group", "command",
corresponding to CS_CHICKEN1[2:1].

Per-context control requires FF_SLICE_CS_CHICKEN1[14] (Per Context
Preemption Granularity Control) to be active; without it CS_CHICKEN1[2:1]
is ignored by hardware. Two new RTP entries are added for Xe2+ RCS and
CCS engines to arm this gate bit.

CS_CHICKEN1 is part of the hardware context image and is saved/restored
automatically on every context switch (Bspec: Render Engine Context Image
Layout, DW offset 0x00E2). The preemption level is therefore written
directly into the cloned context image via xe_lrc_write_ctx_reg() in
xe_lrc_ctx_init() for each new LRC.

Because Xe2 CCS engines historically shared the xe2_xcs_offsets layout
with non-compute engines, a dedicated xe2_ccs_offsets layout is introduced
to safely map CS_CHICKEN1 exclusively for Compute contexts.

The debugfs entry is registered only on Xe2+ GTs with RCS/CCS engines
and only for the Physical Function (!IS_SRIOV_VF). If hardware fuses
indicate Mid-Thread Preemption is disabled in silicon, attempts to
select "mid-thread" are rejected with -EPERM under a forcewake lock.
Selecting any non-default value taints the kernel (TAINT_USER) as it
deviates from the platform default.

v3:
  - Wrapped XEHP_FUSE4 forcewake read with xe_pm_runtime_get/put to
    prevent PCIe aborts/timeouts when the GPU is in D3hot/D3cold. (sashiko)
  - Fixed NOP macro truncation by splitting padding offsets larger than
    0x7f into multiple NOPs, ensuring correct context layout. (sashiko)
  - Converted CTX_CS_CHICKEN1 initialization to a read-modify-write
    sequence to avoid overwriting golden context mask bits. (sashiko)
  - Removed the FF_SLICE_CS_CHICKEN1 workaround for CCS engines, as
    compute engines lack this 3D fixed-function register, which was
    causing GuC "illegal register" panics on initialization.

v2:
  - Dropped the WA BB/MI_LRI path; per Bspec, CS_CHICKEN1 is context
    save/restore state at DW 0x00E2, so we map CTX_CS_CHICKEN1 and program
    it directly in LRC init via xe_lrc_write_ctx_reg(). (Matt)
  - Split Xe2 CCS context offsets into a dedicated xe2_ccs_offsets array
    to map CS_CHICKEN1 without polluting other XCS engines.
  - Converted the debugfs interface from a binary boolean to a
    multi-option string knob ("default", "mid-thread", "thread-group",
    "command"). (Gustavo)
  - Restricted file creation to the Physical Function
    (!IS_SRIOV_VF). (Gustavo)
  - Added kernel tainting (TAINT_USER) when deviating from
    defaults. (Gustavo)
  - Added power-safe hardware fuse check (FUSE4 register 0x9114[20],
    CFEG_WMTP_DISABLE) before allowing MTP selection. (Matt)

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  2 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c      | 85 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h        | 31 +++++++++
 drivers/gpu/drm/xe/xe_lrc.c             | 52 +++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c              |  6 ++
 5 files changed, 176 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 4ab86fc369fd..2236debf5534 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -37,6 +37,8 @@
 #define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
 #define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
 
+#define CTX_CS_CHICKEN1         (0xe2 + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c38bcacb27e4..b41fafe22a76 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -6,10 +6,13 @@
 #include "xe_gt_debugfs.h"
 
 #include <linux/debugfs.h>
+#include <linux/panic.h>
+#include <linux/string.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -23,6 +26,7 @@
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_mocs.h"
+#include "xe_mmio.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_reg_sr.h"
@@ -336,6 +340,84 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 
+static const char * const preemption_level_names[] = {
+	[XE_GPGPU_PREEMPT_DEFAULT]      = "default",
+	[XE_GPGPU_PREEMPT_MID_THREAD]   = "mid-thread",
+	[XE_GPGPU_PREEMPT_THREAD_GROUP] = "thread-group",
+	[XE_GPGPU_PREEMPT_COMMAND]      = "command",
+};
+
+static int preemption_level_show(struct seq_file *m, void *unused)
+{
+	struct xe_gt *gt = m->private;
+
+	seq_printf(m, "%s\n", preemption_level_names[READ_ONCE(gt->gpgpu_preempt_level)]);
+
+	return 0;
+}
+
+static ssize_t preemption_level_write(struct file *file,
+				      const char __user *ubuf,
+				      size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct xe_gt *gt = m->private;
+	struct xe_device *xe = gt_to_xe(gt);
+	enum xe_gpgpu_preempt_level new_level;
+	char buf[16];
+	int idx;
+
+	if (*offp)
+		return -EINVAL;
+	if (len >= sizeof(buf))
+		return -EINVAL;
+	if (copy_from_user(buf, ubuf, len))
+		return -EFAULT;
+	buf[len] = '\0';
+
+	idx = sysfs_match_string(preemption_level_names, buf);
+	if (idx < 0)
+		return idx;
+
+	new_level = (enum xe_gpgpu_preempt_level)idx;
+
+	if (new_level == XE_GPGPU_PREEMPT_MID_THREAD) {
+		unsigned int fw_ref;
+		u32 fuse4;
+
+		xe_pm_runtime_get(xe);
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref) {
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
+			xe_pm_runtime_put(xe);
+			return -ETIMEDOUT;
+		}
+
+		fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		xe_pm_runtime_put(xe);
+
+		if (fuse4 & CFEG_WMTP_DISABLE) {
+			drm_warn(&xe->drm,
+				 "GT%u: MTP fused off in hardware, cannot select mid-thread\n",
+				 gt->info.id);
+			return -EPERM;
+		}
+	}
+
+	if (new_level != XE_GPGPU_PREEMPT_DEFAULT) {
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+		drm_notice(&xe->drm,
+			   "GT%u: GPGPU preemption overridden to '%s' (applies to new LRCs only)\n",
+			   gt->info.id, preemption_level_names[new_level]);
+	}
+
+	WRITE_ONCE(gt->gpgpu_preempt_level, new_level);
+
+	return len;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(preemption_level);
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -368,6 +450,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
+	if (GRAPHICS_VER(xe) >= 20 && !IS_SRIOV_VF(xe) &&
+	    (gt->info.engine_mask & (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)))
+		debugfs_create_file("preemption_level", 0600, root, gt, &preemption_level_fops);
 
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e5588c88800a..b4c677f1047b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -35,6 +35,33 @@ enum xe_gt_eu_type {
 	XE_GT_EU_TYPE_SIMD16,
 };
 
+/**
+ * enum xe_gpgpu_preempt_level - Per-context GPGPU preemption override mode
+ *
+ * Selects the preemption granularity programmed into CS_CHICKEN1[2:1] for
+ * newly created Xe2+ RCS/CCS LRCs.
+ *
+ * The per-context override is effective only when
+ * FF_SLICE_CS_CHICKEN1[FFSC_PERCTX_PREEMPT_CTRL] is enabled via RTP.
+ *
+ * This setting is GT-scoped and affects only LRCs created after the value is
+ * changed; existing contexts keep their previously programmed value.
+ *
+ * @XE_GPGPU_PREEMPT_DEFAULT: Keep platform default preemption granularity.
+ * @XE_GPGPU_PREEMPT_MID_THREAD: Force mid-thread preemption level.
+ * @XE_GPGPU_PREEMPT_THREAD_GROUP: Force thread-group preemption level.
+ * @XE_GPGPU_PREEMPT_COMMAND: Force command-level preemption.
+ *
+ * Zero-initialized via kzalloc, so XE_GPGPU_PREEMPT_DEFAULT is the safe
+ * default (no override from platform policy).
+ */
+enum xe_gpgpu_preempt_level {
+	XE_GPGPU_PREEMPT_DEFAULT = 0,
+	XE_GPGPU_PREEMPT_MID_THREAD,
+	XE_GPGPU_PREEMPT_THREAD_GROUP,
+	XE_GPGPU_PREEMPT_COMMAND,
+};
+
 #define XE_MAX_DSS_FUSE_REGS		4
 #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS		1
@@ -219,6 +246,10 @@ struct xe_gt {
 	 */
 	u32 ccs_mode;
 
+	/**
+	 * @gpgpu_preempt_level: per-GT GPGPU preemption granularity override.
+	 */
+	enum xe_gpgpu_preempt_level gpgpu_preempt_level;
 	/** @usm: unified shared memory state */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..513f43dbc505 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -567,6 +567,20 @@ static const u8 xe2_rcs_offsets[] = {
 	LRI(1, 0),              /* [0x47] */
 	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
 
+	NOP(0x7f), NOP(0x18),              /* Pad from DW 0x4a to 0xe0 */
+	LRI(1, POSTED),         /* [0xe1] */
+	REG16(0x580),           /* [0xe2] CS_CHICKEN1 (value at [0xe3]) */
+
+	0
+};
+
+static const u8 xe2_ccs_offsets[] = {
+	XE2_CTX_COMMON,
+
+	NOP(0x7f), NOP(0x2e),              /* Pad from DW 0x34 to 0xe0 */
+	LRI(1, POSTED),         /* [0xe1] */
+	REG16(0x580),           /* [0xe2] CS_CHICKEN1 (value at [0xe3]) */
+
 	0
 };
 
@@ -636,6 +650,13 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
 			return xe2_bcs_offsets;
 		else
 			return gen12_xcs_offsets;
+	} else if (class == XE_ENGINE_CLASS_COMPUTE) {
+		if (GRAPHICS_VER(xe) >= 20)
+			return xe2_ccs_offsets;
+		else if (GRAPHICS_VERx100(xe) >= 1255)
+			return dg2_xcs_offsets;
+		else
+			return gen12_xcs_offsets;
 	} else {
 		if (GRAPHICS_VER(xe) >= 20)
 			return xe2_xcs_offsets;
@@ -1589,6 +1610,37 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
+	if (GRAPHICS_VER(xe) >= 20 &&
+	    (hwe->class == XE_ENGINE_CLASS_RENDER ||
+	     hwe->class == XE_ENGINE_CLASS_COMPUTE)) {
+		enum xe_gpgpu_preempt_level level = READ_ONCE(gt->gpgpu_preempt_level);
+
+		if (level != XE_GPGPU_PREEMPT_DEFAULT) {
+			u32 level_bits;
+			u32 val;
+
+			switch (level) {
+			case XE_GPGPU_PREEMPT_MID_THREAD:
+				level_bits = PREEMPT_GPGPU_MID_THREAD_LEVEL;
+				break;
+			case XE_GPGPU_PREEMPT_THREAD_GROUP:
+				level_bits = PREEMPT_GPGPU_THREAD_GROUP_LEVEL;
+				break;
+			case XE_GPGPU_PREEMPT_COMMAND:
+				level_bits = PREEMPT_GPGPU_COMMAND_LEVEL;
+				break;
+			default:
+				level_bits = 0;
+				break;
+			}
+
+			val = xe_lrc_read_ctx_reg(lrc, CTX_CS_CHICKEN1);
+			val &= ~PREEMPT_GPGPU_LEVEL_MASK;
+			val |= REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, level_bits);
+			xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
+		}
+	}
+
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
 	/* TODO: Priority */
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 139434946f8f..70072963aba0 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -347,6 +347,12 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
 			     FFSC_PERCTX_PREEMPT_CTRL))
 	},
+	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl-Xe2"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
+			     FFSC_PERCTX_PREEMPT_CTRL))
+	},
 	{ XE_RTP_NAME("18032247524"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.43.0


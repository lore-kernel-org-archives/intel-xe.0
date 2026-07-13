Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD18C44507
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 14:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07DD10E9C3;
	Mon, 13 Jul 2026 14:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awscKdiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D810E9C3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783951991; x=1815487991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rSzEe1Ho1CgU+EwpD58+KxaC/Fl96rE18YoLyzF2LG0=;
 b=awscKdiAR0BQZrilzD59lEl7+uSdRAJIXzcsLQNvz5qIx7AFaSfbxS1p
 sBdGKy2ix3msd+eXXUbmf8iaDneOgBKuJuyADPzn36qn9TKYh0+0jV0yi
 zfAfX9kq9T4/8ha9sVJQSQhPJxbS5XmKmZ7mPfK6ka5dtIEAsRQTl75cF
 5QX6ZTRHCja8hbrLYaYh7n9e+TkA9jAGZEyYLyBjisEk52zywPqfnnuaa
 zFXCheV7jYQ4Qg82XCNKQvNrqfTMWmdJM7Po072zOqNBmYcQEvuZciDO+
 QhirmGLNjmX2oCK5JYCqgdopMkfbvLS01SDlCr1C3LUU7JWityruQysl+ w==;
X-CSE-ConnectionGUID: 2jirwJGkR02Mj4xArDGXfg==
X-CSE-MsgGUID: yBlv6/VUTJGBNY3W70zqPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107357783"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107357783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 07:13:10 -0700
X-CSE-ConnectionGUID: D7+rVAkVTNmdL8WMVTR8tg==
X-CSE-MsgGUID: 5MNYNmAgQweMAJBvZBhFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260453636"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 07:13:09 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v6] drm/xe: Add debugfs knob to control GPGPU preemption
 granularity
Date: Mon, 13 Jul 2026 19:43:00 +0530
Message-ID: <20260713141300.2378490-1-varun.gupta@intel.com>
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

Introduce a per-GT debugfs knob, 'gpgpu_preemption_level', to allow
overriding the GPGPU preemption level on a per-context basis for newly
created LRCs.
Add an RTP rule to enable per-context control via FF_SLICE_CS_CHICKEN1,
allowing the preemption level to be programmed directly into the LRC
image at CTX_CS_CHICKEN1 during context initialization.

v6:
  - Add missing xe_gt_printk.h include to fix compilation failure.

v5:
  - Use correct offset for CTX_CS_CHICKEN1. (Matt)
  - Restrict to the RCS engine. (Matt)
  - Drop LRC layout table modifications; dummy layouts do not need late
    context registers. (Matt)
  - Stash WMTP fuse state at boot to remove pm/forcewake from debugfs.
    (Matt)
  - Rename debugfs knob to 'gpgpu_preemption_level'. (Matt)
  - Use simple_write_to_buffer() and remove unnecessary READ_ONCE/
    WRITE_ONCE macros. (Matt)
  - Do not restrict debugfs visibility for SR-IOV VFs. (Matt)

v4
  - Fix incorrect NOP padding in the RCS context layout. (Sashiko)

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
 drivers/gpu/drm/xe/xe_gt.c              |  2 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c      | 65 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h        | 34 +++++++++++++
 drivers/gpu/drm/xe/xe_lrc.c             | 29 +++++++++++
 drivers/gpu/drm/xe/xe_wa.c              |  6 +++
 6 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 4ab86fc369fd..6f7abc0181b5 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -37,6 +37,8 @@
 #define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
 #define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
 
+#define CTX_CS_CHICKEN1			(0x12e + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 783eb6d631b5..7b502fb7cfce 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -607,6 +607,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	 * on pre-MTL platforms, reading it there will (correctly) return 0.
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
+	gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt->mmio, XEHP_FUSE4) &
+		CFEG_WMTP_DISABLE);
 
 	/*
 	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c38bcacb27e4..288590003461 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -6,6 +6,8 @@
 #include "xe_gt_debugfs.h"
 
 #include <linux/debugfs.h>
+#include <linux/panic.h>
+#include <linux/string.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
@@ -15,6 +17,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_idle.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_vf_debugfs.h"
 #include "xe_gt_stats.h"
@@ -336,6 +339,65 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 
+static const char * const gpgpu_preemption_level_names[] = {
+	[XE_GPGPU_PREEMPT_DEFAULT]      = "default",
+	[XE_GPGPU_PREEMPT_MID_THREAD]   = "mid-thread",
+	[XE_GPGPU_PREEMPT_THREAD_GROUP] = "thread-group",
+	[XE_GPGPU_PREEMPT_COMMAND]      = "command",
+};
+
+static int gpgpu_preemption_level_show(struct seq_file *m, void *unused)
+{
+	struct xe_gt *gt = m->private;
+
+	seq_printf(m, "%s\n", gpgpu_preemption_level_names[gt->gpgpu_preemption_level]);
+
+	return 0;
+}
+
+static ssize_t gpgpu_preemption_level_write(struct file *file,
+					    const char __user *ubuf,
+					    size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct xe_gt *gt = m->private;
+	enum xe_gpgpu_preempt_level new_level;
+	char buf[16];
+	ssize_t copied;
+	int idx;
+
+	if (*offp)
+		return -EINVAL;
+
+	copied = simple_write_to_buffer(buf, sizeof(buf) - 1, offp, ubuf, len);
+	if (copied < 0)
+		return copied;
+
+	buf[copied] = '\0';
+	idx = sysfs_match_string(gpgpu_preemption_level_names, strim(buf));
+	if (idx < 0)
+		return idx;
+
+	new_level = (enum xe_gpgpu_preempt_level)idx;
+
+	if (new_level == XE_GPGPU_PREEMPT_MID_THREAD && gt->info.has_wmtp_disabled) {
+		xe_gt_warn(gt, "MTP fused off in hardware, cannot select mid-thread\n");
+		return -EPERM;
+	}
+
+	if (new_level != XE_GPGPU_PREEMPT_DEFAULT) {
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+		xe_gt_notice(gt,
+			     "GPGPU preemption overridden to '%s' (applies to new LRCs only)\n",
+			     gpgpu_preemption_level_names[new_level]);
+	}
+
+	gt->gpgpu_preemption_level = new_level;
+
+	return copied;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(gpgpu_preemption_level);
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -368,6 +430,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
+	if (GRAPHICS_VER(xe) >= 20 && (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK))
+		debugfs_create_file("gpgpu_preemption_level", 0600, root,
+				    gt, &gpgpu_preemption_level_fops);
 
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e5588c88800a..97bd943309b3 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -35,6 +35,33 @@ enum xe_gt_eu_type {
 	XE_GT_EU_TYPE_SIMD16,
 };
 
+/**
+ * enum xe_gpgpu_preempt_level - Per-context GPGPU preemption override mode
+ *
+ * Selects the preemption granularity programmed into CS_CHICKEN1[2:1] for
+ * newly created Xe2+ RCS LRCs.
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
@@ -151,6 +178,8 @@ struct xe_gt {
 		 * feature.
 		 */
 		u8 has_xe2_blt_instructions:1;
+		/** @info.has_wmtp_disabled: hardware fuse indicates WMTP is disabled */
+		u8 has_wmtp_disabled:1;
 		/**
 		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
 		 * registers the geometry XeCore mask spans.
@@ -219,6 +248,11 @@ struct xe_gt {
 	 */
 	u32 ccs_mode;
 
+	/**
+	 * @gpgpu_preemption_level: per-GT GPGPU preemption granularity override.
+	 */
+	enum xe_gpgpu_preempt_level gpgpu_preemption_level;
+
 	/** @usm: unified shared memory state */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..1733bbe65288 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1589,6 +1589,35 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
 
+	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER) {
+		enum xe_gpgpu_preempt_level level = gt->gpgpu_preemption_level;
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


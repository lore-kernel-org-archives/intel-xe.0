Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E541CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F84C10F183;
	Mon, 12 Oct 2026 14:54:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF510F19B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791816891; x=1823352891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lYwPTlp7F9OF1DHD8uxmqLJyzk5dVu2Y+Y1X6QYJghk=;
 b=TPgjCWoxsD0zw8YWJAaJkMk2HXTEUrD5UJi4zhmN/cVz4kutbTfkmx4p
 T1fkbZwr2Va9iA9u3S2Yn1A0x5dT6vVsLxW4IZSTvNr/l1AKXGVoMx/JA
 93CAXJ3R1Za/Jdv6TJK3k9Xf6XxgtkVI6iB8O1flBaj3HfiR8fa/bUiSJ
 JhNNX8WrPsZoKs1FQGb22e5PQSKBqznQSEsp/rlBWx95MaeimZh/NmA5W
 cCUXSgcuHOXjPsJpgP0VAx1jNI3a51U/HpRFkGhP6HLgO8NmJ3hPWff3V
 QZrHsiDH/1Jh6sJE0xIxv9TmtqegNZa1ObqzVW+3VOWbf9GtKDfo8zvZu w==;
X-CSE-ConnectionGUID: ZYB/CvRNTWqgWZCJKOchgA==
X-CSE-MsgGUID: 7zD+hUxOTvySgQLk2oK9XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513555"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513555"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:54:50 -0700
X-CSE-ConnectionGUID: Qlnfp2DCTgm6wlEQmXSjWw==
X-CSE-MsgGUID: yGb9A3NLQMaFCx49PyUWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2675256"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 07:54:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Date: Mon, 12 Oct 2026 20:22:31 +0530
Message-ID: <20261012145237.3788198-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
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

Capture fuse-related GT register state in the Xe devcoredump to preserve
additional hardware configuration information for postmortem debugging.

Add generic register snapshot storage and helpers for capturing,
printing, and freeing MMIO register dumps. Use them to record both
primary GT and media GT fuse register state during devcoredump snapshot
collection and print the captured values in the coredump output.

Also add the required GT register definitions for RPM and mirror
copy-enable state used by the new dump paths.

v2:(Sashiko)
- Fix GT/media fuse snapshot capture to use the correct GT context.
- Add non-fault GT force wake for cross-GT register capture.
- Skip reading registers when SR-IOV VF.
- Skip media GT capture when media GT is absent.
- Add RPM snapshot print/free handling explicitly.
- Add POWERGATE_ENABLE register to get render awake status

v3:(Sashiko)
- Check RENDER_POWERGATE_ENABLE of POWERGATE_ENABLE register
- Replace "render is not awake" message with "render powergating
  appears not enabled"

v4:
- Reduce multiple apis and optimize the suggest way of struct arrays(Tejas)
- Add document for struct xe_gt_regset gt member(Hook failure)
- Change struct reg_desc to header file
- Remove Graphics version check for these registers set

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 215 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  52 ++++++
 3 files changed, 269 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f5cd3a94e47f..e93895e0c731 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -22,6 +22,8 @@
 #define   MTL_CC_MASK					REG_GENMASK(12, 9)
 #define   MTL_CRST					0xf
 
+#define RPM_GCD						XE_REG(0xc98)
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0					XE_REG(0xd00)
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index ab681b148869..1dbee725f55a 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -25,6 +25,8 @@
 #include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "xe_mmio.h"
+#include "regs/xe_gt_regs.h"
 
 /**
  * DOC: Xe device coredump
@@ -69,6 +71,171 @@
 /* 1 hour timeout */
 #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
 
+#define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
+
+static const struct xe_reg_desc xe3p_gt_fuse_reglist[] = {
+	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE"),
+	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE"),
+	XE_REG_DESC(XELP_EU_ENABLE, "EU_ENABLE"),
+	XE_REG_DESC(MIRROR_FUSE1, "MIRROR_FUSE1"),
+	XE_REG_DESC(GT_VEBOX_VDBOX_DISABLE, "GT_VEBOX_VDBOX_DISABLE"),
+	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
+	XE_REG_DESC(RESOURCE_COPY_ENABLE, "COPY_ENABLE_GTFS_GCD"),
+	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_1, "GT_GEOMETRY_DSS_1"),
+	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_2, "GT_GEOMETRY_DSS_2"),
+	XE_REG_DESC(XE2_GT_COMPUTE_DSS_2, "GT_COMPUTE_DSS_2"),
+	XE_REG_DESC(XEHPC_GT_COMPUTE_DSS_ENABLE_EXT, "GT_COMPUTE_DSS_ENABLE_EXT"),
+	XE_REG_DESC(XE3P_XPC_GT_GEOMETRY_DSS_3, "GT_GEOMETRY_DSS_3"),
+	XE_REG_DESC(XE3P_XPC_GT_COMPUTE_DSS_3, "GT_COMPUTE_DSS_3"),
+};
+
+static const struct xe_reg_desc xe3p_media_gt_fuse_reglist[] = {
+	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
+	XE_REG_DESC(RESOURCE_COPY_ENABLE, "COPY_ENABLE_GTFS_GCD"),
+};
+
+static const struct xe_reg_desc xe3p_gt_rpm_reglist[] = {
+	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
+	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"),
+};
+
+static const struct xe_reg_desc xe3p_media_gt_rpm_reglist[] = {
+	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
+};
+
+/**
+ * struct xe_gt_regset - Struct for register descriptor list for GT
+ *
+ * This struct is used to reference the corresponding reglist of
+ * Main GT and media GT
+ */
+struct xe_gt_regset {
+	/** @gt: GT array indexed by tile/GT id starting at 1; element 0 is unused */
+	struct xe_reg_desc_list gt[XE_MAX_GT_PER_TILE + 1];
+};
+
+/**
+ * enum xe_dbg_regset_type - debug register set types
+ * @XE_DBG_REGSET_FUSE: Fuse register set
+ * @XE_DBG_REGSET_RPM: RPM register set
+ * @XE_DBG_REGSET_MAX: Number of debug register set types
+ */
+enum xe_dbg_regset_type {
+	XE_DBG_REGSET_FUSE,
+	XE_DBG_REGSET_RPM,
+	XE_DBG_REGSET_MAX,
+};
+
+static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
+	[XE_DBG_REGSET_FUSE] = {
+		.gt[XE_GT_TYPE_MAIN]  = { xe3p_gt_fuse_reglist,
+					  ARRAY_SIZE(xe3p_gt_fuse_reglist) },
+		.gt[XE_GT_TYPE_MEDIA] = { xe3p_media_gt_fuse_reglist,
+					  ARRAY_SIZE(xe3p_media_gt_fuse_reglist) },
+	},
+	[XE_DBG_REGSET_RPM] = {
+		.gt[XE_GT_TYPE_MAIN]  = { xe3p_gt_rpm_reglist,
+					  ARRAY_SIZE(xe3p_gt_rpm_reglist) },
+		.gt[XE_GT_TYPE_MEDIA] = { xe3p_media_gt_rpm_reglist,
+					  ARRAY_SIZE(xe3p_media_gt_rpm_reglist) },
+	},
+};
+
+static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
+				      const struct xe_dbg_reg_snapshot *snap)
+{
+	u32 i;
+
+	if (!snap)
+		return;
+
+	for (i = 0; i < snap->num_regs; i++)
+		drm_printf(p, " %s [0x%x] = 0x%08x\n",
+			   snap->desc->regs[i].name,
+			   snap->desc->regs[i].reg.addr,
+			   snap->values[i]);
+}
+
+static void xe_dbg_reg_snapshot_free(struct xe_dbg_reg_snapshot *snap)
+{
+	kfree(snap);
+}
+
+static const u32 *xe_dbg_find_value(const struct xe_dbg_reg_snapshot *snap,
+				    struct xe_reg reg)
+{
+	int i;
+
+	if (!snap)
+		return NULL;
+
+	for (i = 0; i < snap->num_regs; i++)
+		if (snap->desc->regs[i].reg.addr == reg.addr)
+			return &snap->values[i];
+
+	return NULL;
+}
+
+static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
+				     const struct xe_dbg_reg_snapshot *snap)
+{
+	const u32 *val;
+
+	xe_dbg_reg_snapshot_print(p, snap);
+
+	if (!snap)
+		return;
+
+	val = xe_dbg_find_value(snap, POWERGATE_ENABLE);
+	if (val && !(*val & RENDER_POWERGATE_ENABLE))
+		drm_puts(p, "render powergating appears not enabled\n");
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
+				   const struct xe_reg_desc_list *reglist)
+{
+	struct xe_dbg_reg_snapshot *snap;
+	int i;
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return NULL;
+
+	snap = kmalloc(struct_size(snap, values, reglist->num_regs), GFP_ATOMIC);
+	if (!snap)
+		return NULL;
+
+	snap->desc	= reglist;
+	snap->num_regs = reglist->num_regs;
+	for (i = 0; i < reglist->num_regs; i++)
+		snap->values[i] = xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
+
+	return snap;
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_dbg_gt_snapshot_capture(struct xe_gt *fault_gt, struct xe_gt *other_gt,
+			   enum xe_dbg_regset_type type,
+			   enum xe_gt_type gt_type)
+{
+	struct xe_gt *target_gt;
+
+	if (!fault_gt || !fault_gt->tile)
+		return NULL;
+
+	target_gt = gt_type == XE_GT_TYPE_MEDIA ? fault_gt->tile->media_gt
+						 : fault_gt->tile->primary_gt;
+	if (!target_gt)
+		return NULL;
+
+	/* non-fault GT needs the caller's confirmed forcewake */
+	if (target_gt != fault_gt && target_gt != other_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(target_gt,
+						  &xe_dbg_regsets[type].gt[gt_type]);
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -109,6 +276,15 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
 	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
 
+	drm_printf(&p, "\n**** GT Fuse Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->gt_fuse);
+	drm_printf(&p, "\n**** Media GT Fuse Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->media_fuse);
+	drm_printf(&p, "\n**** GT RPM Register Dump ****\n");
+	xe_gt_rpm_snapshot_print(&p, ss->gt_rpm);
+	drm_printf(&p, "\n**** Media GT RPM Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->media_gt_rpm);
+
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
@@ -146,6 +322,18 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_guc_ct_snapshot_free(ss->guc.ct);
 	ss->guc.ct = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gt_fuse);
+	ss->gt_fuse = NULL;
+
+	xe_dbg_reg_snapshot_free(ss->media_fuse);
+	ss->media_fuse = NULL;
+
+	xe_dbg_reg_snapshot_free(ss->gt_rpm);
+	ss->gt_rpm = NULL;
+
+	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
+	ss->media_gt_rpm = NULL;
+
 	if (!IS_ERR_OR_NULL(ss->gt))
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
@@ -328,6 +516,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	struct xe_guc *guc = &gt->uc.guc;
 	const char *process_name = "no process";
 	bool cookie;
+	struct xe_gt *other_gt;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
@@ -345,8 +534,34 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	/* keep going if fw fails as we still want to save the memory and SW data */
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
+	other_gt = q->gt->tile->media_gt == q->gt ? q->gt->tile->primary_gt
+					    : q->gt->tile->media_gt;
+	if (other_gt) {
+		CLASS(xe_force_wake, fw_ref_other)(gt_to_fw(other_gt),
+						   XE_FORCEWAKE_ALL);
+		if (!xe_force_wake_ref_has_domain(fw_ref_other.domains, XE_FORCEWAKE_ALL))
+			other_gt = NULL;
+	}
+
 	cookie = dma_fence_begin_signalling();
 
+	ss->gt_fuse      = xe_dbg_gt_snapshot_capture(q->gt,
+						      other_gt,
+						      XE_DBG_REGSET_FUSE,
+						      XE_GT_TYPE_MAIN);
+	ss->media_fuse   = xe_dbg_gt_snapshot_capture(q->gt,
+						      other_gt,
+						      XE_DBG_REGSET_FUSE,
+						      XE_GT_TYPE_MEDIA);
+	ss->gt_rpm       = xe_dbg_gt_snapshot_capture(q->gt,
+						      other_gt,
+						      XE_DBG_REGSET_RPM,
+						      XE_GT_TYPE_MAIN);
+	ss->media_gt_rpm = xe_dbg_gt_snapshot_capture(q->gt,
+						      other_gt,
+						      XE_DBG_REGSET_RPM,
+						      XE_GT_TYPE_MEDIA);
+
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index a174385a6d83..90cca9ad2877 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -14,6 +14,48 @@
 struct xe_device;
 struct xe_gt;
 
+/**
+ * struct xe_reg_desc - Register descriptor struct to make reg list
+ *
+ * This struct is used as descriptor containting reg address and name
+ * of the register to dump its value during coredump for debug purpose.
+ */
+struct xe_reg_desc {
+	/** @reg: The register */
+	struct xe_reg reg;
+	/** @name: Name of the register */
+	const char *name;
+};
+
+/**
+ * struct xe_reg_desc_list - Struct for register descriptor list
+ *
+ * This struct is used to reference the corresponding reglist of
+ * various component
+ */
+struct xe_reg_desc_list {
+	/** @regs: Pointer to an array of register descriptors. */
+	const struct xe_reg_desc *regs;
+	/** @num_regs: refernce for num regs in reg descriptor*/
+	u32 num_regs;
+};
+
+/**
+ * struct xe_dbg_reg_snapshot - Register snapshot
+ *
+ * This struct contains the register values captured at the time of the crash.
+ * It is used to store the register values in a human-readable format for
+ * debugging purposes.
+ */
+struct xe_dbg_reg_snapshot {
+	/** @desc: register descriptor list. */
+	const struct xe_reg_desc_list *desc;
+	/** @num_regs: Number of registers needed for capture. */
+	u32 num_regs;
+	/** @values: register values*/
+	u32 values[];
+};
+
 /**
  * struct xe_devcoredump_snapshot - Crash snapshot
  *
@@ -35,6 +77,16 @@ struct xe_devcoredump_snapshot {
 
 	/** @gt: Affected GT, used by forcewake for delayed capture */
 	struct xe_gt *gt;
+
+	/** @gt_fuse: Fuse snapshot */
+	struct xe_dbg_reg_snapshot *gt_fuse;
+	/** @media_fuse: Media Fuse snapshot */
+	struct xe_dbg_reg_snapshot *media_fuse;
+	/** @gt_rpm: GT RPM snapshot */
+	struct xe_dbg_reg_snapshot *gt_rpm;
+	/** @media_gt_rpm: Media GT RPM snapshot */
+	struct xe_dbg_reg_snapshot *media_gt_rpm;
+
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
-- 
2.43.0


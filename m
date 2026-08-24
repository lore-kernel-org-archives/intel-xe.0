Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C548FC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8974510E829;
	Mon, 24 Aug 2026 18:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsxgAbDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3820510E818
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787597092; x=1819133092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q2TMUKl8cnRhS4Ij9CSR36DgWoisAUNdbnUAu8MejUY=;
 b=WsxgAbDzE50s7GIxS/O5M5+eMcvoxs39OTpma3z0m+4uZTuwnsOZdbzk
 zbmJNo7HBXG0CKnhLJk+Y5uhwU8Yl0n0TmzMA8iAzSwKzp4PeYfmPXJzw
 58Cg94MMc9XgZe7d6g6jvQXwGZEzduVuINGvrC316zKb3NyjXWSMtGqwh
 +tqLeYjd+CLKARi9juPrqXCXT2vA5oZVXTmNTLac8sjBQT+yEZct+k+Db
 hLLcbtwe7c76VP3unUnS3YSXVGja3oyiIZVbMCtP2OiPfI3aUEjwEKeYR
 QXaPpIeflni7Ai0obZQ4txtGNxdSnEaoMCFWsV7XwZVdLLbkB013l+kMh g==;
X-CSE-ConnectionGUID: 9XS6TK7IQEaUo1lsQDFH+Q==
X-CSE-MsgGUID: KB0gmAUxTKy5EPv3Z/vXhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75592757"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="75592757"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:44:52 -0700
X-CSE-ConnectionGUID: yg13X8s4T1udRmQWso2yGg==
X-CSE-MsgGUID: ItllSqI0SAWKSQUjyerASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="263351737"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa010.fm.intel.com with ESMTP; 24 Aug 2026 11:44:51 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v2 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Date: Tue, 25 Aug 2026 00:13:50 +0530
Message-ID: <20260824184356.1960708-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
References: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   4 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 254 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  39 ++++
 drivers/gpu/drm/xe/xe_device.h            |   5 +
 4 files changed, 302 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 48c515d91882..19f0a65cc3d2 100644
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
@@ -274,6 +276,8 @@
 #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
 #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
 
+#define COPY_ENABLE_GTFS_GCD			XE_REG(0x9174)
+
 #define GDRST					XE_REG(0x941c)
 #define   GRDOM_GUC				REG_BIT(3)
 #define   GRDOM_FULL				REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5f2b90b18f97..e5c33bc94103 100644
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
@@ -69,6 +71,232 @@
 /* 1 hour timeout */
 #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
 
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
+#define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
+
+static const struct xe_reg_desc xe3p_gt_fuse_reglist[] = {
+	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE"),
+	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE"),
+	XE_REG_DESC(XELP_EU_ENABLE, "EU_ENABLE"),
+	XE_REG_DESC(MIRROR_FUSE1, "MIRROR_FUSE1"),
+	XE_REG_DESC(GT_VEBOX_VDBOX_DISABLE, "GT_VEBOX_VDBOX_DISABLE"),
+	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
+	XE_REG_DESC(COPY_ENABLE_GTFS_GCD, "COPY_ENABLE_GTFS_GCD"),
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
+	XE_REG_DESC(COPY_ENABLE_GTFS_GCD, "COPY_ENABLE_GTFS_GCD"),
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
+ * struct xe_gt_regset - Struct for register descriptor list for GT
+ *
+ * This struct is used to reference the corresponding reglist of
+ * GT and media GT
+ */
+struct xe_gt_regset {
+	struct xe_reg_desc_list gt[XE_MAX_GT_PER_TILE + 1];
+};
+
+static const struct xe_gt_regset xe_fuse_regset = {
+	.gt[XE_GT_TYPE_MAIN] = {
+		.regs = xe3p_gt_fuse_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_gt_fuse_reglist),
+	},
+	.gt[XE_GT_TYPE_MEDIA] = {
+		.regs = xe3p_media_gt_fuse_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_media_gt_fuse_reglist),
+	},
+};
+
+static const struct xe_gt_regset xe_rpm_regset = {
+	.gt[XE_GT_TYPE_MAIN] = {
+		.regs = xe3p_gt_rpm_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_gt_rpm_reglist),
+	},
+	.gt[XE_GT_TYPE_MEDIA] = {
+		.regs = xe3p_media_gt_rpm_reglist,
+		.num_regs = ARRAY_SIZE(xe3p_media_gt_rpm_reglist),
+	},
+};
+
+#define XE_GT_REG_LIST(_type, _gt_type) \
+	(&xe_##_type##_regset.gt[XE_GT_TYPE_##_gt_type])
+
+static void
+xe_capture_reg_desc_list(struct xe_gt *gt,
+			 struct xe_reg_dump_snapshot *dst,
+			 const struct xe_reg_desc *src,
+			 u32 count)
+{
+	u32 i;
+
+	for (i = 0; i < count; i++) {
+		dst[i].reg = src[i].reg;
+		dst[i].value = xe_mmio_read32(&gt->mmio, src[i].reg);
+		dst[i].name = src[i].name;
+	}
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_dbg_reg_snapshot_capture(struct xe_gt *gt,
+			    const struct xe_reg_desc_list *reglist)
+{
+	struct xe_dbg_reg_snapshot *snap;
+
+	if (!gt || !xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return NULL;
+
+	if (!reglist->regs || !reglist->num_regs)
+		return NULL;
+
+	snap = kzalloc(struct_size(snap, regs, reglist->num_regs), GFP_ATOMIC);
+	if (!snap)
+		return NULL;
+
+	snap->num_regs = reglist->num_regs;
+
+	xe_capture_reg_desc_list(gt, snap->regs, reglist->regs, reglist->num_regs);
+
+	return snap;
+}
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
+			   snap->regs[i].name,
+			   snap->regs[i].reg.addr,
+			   snap->regs[i].value);
+}
+
+static void xe_dbg_reg_snapshot_free(struct xe_dbg_reg_snapshot *snap)
+{
+	kfree(snap);
+}
+
+static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
+				     const struct xe_dbg_reg_snapshot *snap)
+{
+	xe_dbg_reg_snapshot_print(p, snap);
+
+	if (snap && snap->num_regs >= 2 && !(snap->regs[1].value & 0x2))
+		drm_puts(p, "render is not awake\n");
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_dbg_reg_snapshot_capture_target(struct xe_gt *fault_gt,
+				   struct xe_gt *target_gt,
+				   const struct xe_reg_desc_list *reglist)
+{
+	if (!fault_gt || !target_gt)
+		return NULL;
+
+	if (target_gt != fault_gt) {
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(target_gt),
+					     XE_FORCEWAKE_ALL);
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+			return NULL;
+
+		return xe_dbg_reg_snapshot_capture(target_gt, reglist);
+	}
+
+	return xe_dbg_reg_snapshot_capture(target_gt, reglist);
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_gt_fuse_snapshot_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->primary_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->primary_gt,
+						  XE_GT_REG_LIST(fuse, MAIN));
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_media_gt_fuse_snapshot_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->media_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->media_gt,
+						  XE_GT_REG_LIST(fuse, MEDIA));
+}
+
+static struct xe_dbg_reg_snapshot *xe_gt_rpm_snapshot_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->primary_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->primary_gt,
+						  XE_GT_REG_LIST(rpm, MAIN));
+}
+
+static struct xe_dbg_reg_snapshot *
+xe_media_gt_rpm_snapshot_capture(struct xe_gt *gt)
+{
+	if (!gt || !gt->tile || !gt->tile->media_gt)
+		return NULL;
+
+	return xe_dbg_reg_snapshot_capture_target(gt,
+						  gt->tile->media_gt,
+						  XE_GT_REG_LIST(rpm, MEDIA));
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -114,6 +342,15 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
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
@@ -149,6 +386,18 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
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
@@ -349,6 +598,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	cookie = dma_fence_begin_signalling();
 
+	ss->gt_fuse = xe_gt_fuse_snapshot_capture(q->gt);
+	ss->media_fuse = xe_media_gt_fuse_snapshot_capture(q->gt);
+	ss->gt_rpm = xe_gt_rpm_snapshot_capture(q->gt);
+	ss->media_gt_rpm = xe_media_gt_rpm_snapshot_capture(q->gt);
+
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index a174385a6d83..75f317a5fe36 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -14,6 +14,35 @@
 struct xe_device;
 struct xe_gt;
 
+/**
+ * struct xe_reg_dump_snapshot - dump register snapshot
+ *
+ * This struct is used as generic reg dump snapshot in the format of
+ * register, its value and its name for human readable format.
+ */
+struct xe_reg_dump_snapshot {
+	/** @reg: xe register structure*/
+	struct xe_reg reg;
+	/** @value: Value of the register*/
+	u32 value;
+	/** @name: Name of the register */
+	const char *name;
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
+	/** @num_regs: Number of registers needed for capture. */
+	u32 num_regs;
+	/** @regs: Pointer to an array of register dump snapshot. */
+	struct xe_reg_dump_snapshot regs[];
+};
+
 /**
  * struct xe_devcoredump_snapshot - Crash snapshot
  *
@@ -35,6 +64,16 @@ struct xe_devcoredump_snapshot {
 
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
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6c4cfaebc44a..e05951b6988b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -260,6 +260,11 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
 }
 #endif
 
+static inline bool xe_dbg_reg_snapshot_is_supported(struct xe_device *xe)
+{
+	return (GRAPHICS_VER(xe) >= 35);
+}
+
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
-- 
2.43.0


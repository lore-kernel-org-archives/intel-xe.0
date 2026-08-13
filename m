Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3AAC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1F210F339;
	Thu, 13 Aug 2026 13:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHPP+rAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D65610F339
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786627869; x=1818163869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ol3UQYijA0rvhqTFE2Jr4x/HzZnEmVrvNVcNEK/JLU=;
 b=PHPP+rAofYbKtizFfqeP22jrrnKuUayd9CoLvgKVl+exKHMLenaZYWCX
 WzuOsUeseYjEl4x2Fu6uVmqxewWf+ujgAYQxID0GouqxrjGbf35Ty0bZd
 8ngLei+6Q2g+7PgXzOx4kRblGY9fblBVKWAbQvtQGxalrbqrAtfo2XeJe
 kYZVTWitErWtO33Xn3lAIpmhSMoem/qyDX00Qxu4zVYczseDc8lnoG1pR
 FEgDlxupB1DUgQNMwRAl6I5tmtkjhQ1Vx6FHRz7+U27a3FQWsHIWbIB1a
 AuKcn6F9rY8C3H/Za3NfyEYd/kW8Vs4ONN50qrWMErWBx9ihC5oUCe/PX A==;
X-CSE-ConnectionGUID: vsPdiHe5TuqsBPgNAthl7w==
X-CSE-MsgGUID: zB0ocwpdT1+VFjx7IzM9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97547697"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97547697"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:31:09 -0700
X-CSE-ConnectionGUID: kIW94obBRRuK+vZp/C8HAw==
X-CSE-MsgGUID: XQQWmTCWRr64UaB1Du7mzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="268207341"
Received: from unknown (HELO gfx-coremm-kmd15.iind.intel.com) ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 06:31:08 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/6] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
Date: Thu, 13 Aug 2026 19:00:32 +0530
Message-ID: <20260813133037.2912699-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   8 ++
 drivers/gpu/drm/xe/xe_devcoredump.c       | 146 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  35 ++++++
 drivers/gpu/drm/xe/xe_device.h            |   5 +
 4 files changed, 194 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 48c515d91882..959b1129fd50 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -22,6 +22,9 @@
 #define   MTL_CC_MASK					REG_GENMASK(12, 9)
 #define   MTL_CRST					0xf
 
+#define RPM_GCD						XE_REG(0xc98)
+#define RPM_GCD_MEDIA					XE_REG(0x380c98)
+
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0					XE_REG(0xd00)
 #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
@@ -274,6 +277,11 @@
 #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
 #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
 
+#define COPY_ENABLE_GTFS_GCD			XE_REG(0x9174)
+
+#define SERVICE_COPY_ENABLE_MEDIA		XE_REG(0x389170)
+#define COPY_ENABLE_GTFS_GCD_MEDIA		XE_REG(0x389174)
+
 #define GDRST					XE_REG(0x941c)
 #define   GRDOM_GUC				REG_BIT(3)
 #define   GRDOM_FULL				REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5f2b90b18f97..35d8101f2a19 100644
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
@@ -69,6 +71,136 @@
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
+static const struct xe_reg_desc xe3p_gt_fuse_reglist[] = {
+	{ XELP_GT_GEOMETRY_DSS_ENABLE, "GT_GEOMETRY_DSS_ENABLE" },
+	{ XEHP_GT_COMPUTE_DSS_ENABLE, "GT_COMPUTE_DSS_ENABLE" },
+	{ XELP_EU_ENABLE, "EU_ENABLE" },
+	{ MIRROR_FUSE1, "MIRROR_FUSE1" },
+	{ GT_VEBOX_VDBOX_DISABLE, "GT_VEBOX_VDBOX_DISABLE" },
+	{ SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE" },
+	{ COPY_ENABLE_GTFS_GCD, "COPY_ENABLE_GTFS_GCD" },
+	{ XE2_GT_GEOMETRY_DSS_1, "GT_GEOMETRY_DSS_1" },
+	{ XE2_GT_GEOMETRY_DSS_2, "GT_GEOMETRY_DSS_2" },
+	{ XE2_GT_COMPUTE_DSS_2, "GT_COMPUTE_DSS_2" },
+	{ XEHPC_GT_COMPUTE_DSS_ENABLE_EXT, "GT_COMPUTE_DSS_ENABLE_EXT" },
+	{ XE3P_XPC_GT_GEOMETRY_DSS_3, "GT_GEOMETRY_DSS_3" },
+	{ XE3P_XPC_GT_COMPUTE_DSS_3, "GT_COMPUTE_DSS_3" },
+	{ RPM_GCD, "RPM_GCD" },
+};
+
+static const struct xe_reg_desc xe3p_media_gt_fuse_reglist[] = {
+	{ SERVICE_COPY_ENABLE_MEDIA, "SERVICE_COPY_ENABLE_MEDIA" },
+	{ COPY_ENABLE_GTFS_GCD_MEDIA, "COPY_ENABLE_GTFS_GCD_MEDIA" },
+	{ RPM_GCD_MEDIA, "RPM_GCD_MEDIA" },
+};
+
+/**
+ * struct xe_reg_desc_list - Struct for register descriptor list
+ *
+ * This struct is used to reference the corresponding reglist of
+ * various component
+ */
+struct xe_reg_desc_list {
+	/** @regs: The register discriptor struct pointer*/
+	const struct xe_reg_desc *regs;
+	/** @num_regs: refernce for num regs in reg descriptor*/
+	u32 num_regs;
+};
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
+static struct xe_dbg_reg_snapshot *xe_gt_fuse_snapshot_capture(struct xe_gt *gt)
+{
+	struct xe_reg_desc_list reg_list;
+
+	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	reg_list.regs = xe3p_gt_fuse_reglist;
+	reg_list.num_regs = ARRAY_SIZE(xe3p_gt_fuse_reglist);
+
+	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
+}
+
+static struct xe_dbg_reg_snapshot *xe_media_gt_fuse_snapshot_capture(struct xe_gt *gt)
+{
+	struct xe_reg_desc_list reg_list;
+
+	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
+		return NULL;
+
+	reg_list.regs = xe3p_media_gt_fuse_reglist;
+	reg_list.num_regs = ARRAY_SIZE(xe3p_media_gt_fuse_reglist);
+
+	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
+}
+
 static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 {
 	return container_of(coredump, struct xe_device, devcoredump);
@@ -114,6 +246,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
 	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
 
+	drm_printf(&p, "\n**** GT Fuse Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->gt_fuse);
+	drm_printf(&p, "\n**** Media GT Fuse Register Dump ****\n");
+	xe_dbg_reg_snapshot_print(&p, ss->media_fuse);
+
 	drm_puts(&p, "\n**** GuC Log ****\n");
 	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
@@ -149,6 +286,12 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_guc_ct_snapshot_free(ss->guc.ct);
 	ss->guc.ct = NULL;
 
+	xe_dbg_reg_snapshot_free(ss->gt_fuse);
+	ss->gt_fuse = NULL;
+
+	xe_dbg_reg_snapshot_free(ss->media_fuse);
+	ss->media_fuse = NULL;
+
 	if (!IS_ERR_OR_NULL(ss->gt))
 		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
@@ -349,6 +492,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	cookie = dma_fence_begin_signalling();
 
+	ss->gt_fuse = xe_gt_fuse_snapshot_capture(q->gt);
+	ss->media_fuse = xe_media_gt_fuse_snapshot_capture(q->gt);
+
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index a174385a6d83..14490b61a56f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -14,6 +14,35 @@
 struct xe_device;
 struct xe_gt;
 
+/**
+ * struct xe_reg_dump_snapshot - dump register snapshot
+ *
+ * This struct used as generic reg dump snapshot in the format of
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
+	/** @num_regs: Number of registers need for capture. */
+	u32 num_regs;
+	/** @regs: Array of fuse register snapshots. */
+	struct xe_reg_dump_snapshot regs[];
+};
+
 /**
  * struct xe_devcoredump_snapshot - Crash snapshot
  *
@@ -35,6 +64,12 @@ struct xe_devcoredump_snapshot {
 
 	/** @gt: Affected GT, used by forcewake for delayed capture */
 	struct xe_gt *gt;
+
+	/** @gt_fuse: Fuse snapshot */
+	struct xe_dbg_reg_snapshot *gt_fuse;
+	/** @media_fuse: Media Fuse snapshot */
+	struct xe_dbg_reg_snapshot *media_fuse;
+
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6c4cfaebc44a..d199a674675b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -260,6 +260,11 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
 }
 #endif
 
+static inline bool xe_dbg_reg_snapshot_is_supported(struct xe_device *xe)
+{
+	return (GRAPHICS_VER(xe) >= 35) ? true : false;
+}
+
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
-- 
2.43.0


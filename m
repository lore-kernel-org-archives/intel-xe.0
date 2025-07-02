Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB76C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2055C10E785;
	Wed,  2 Jul 2025 19:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hG6OlDre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70C610E062
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484641; x=1783020641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IL6fYpfKylD7Jq0hABy7iQ6M5aPeuIpblhQizsEf8IA=;
 b=hG6OlDrenietz2CekY4t3SVG4OaMd90UXu0b4sAhrfa1TTZzJFsk8Rrc
 fMo2ktTV+ttauDvnq9Km69B/ZLKe0n0NCQlPUHJ2Cr+xhQYbJGN+6TokD
 2nQcs+BCpROJfsQDjCLo1kv3orn7q2WAonUJGj31OmVlSJdjOZJlmNmua
 mfD5WjGa44xOhJxt/aTLgtRCFIdjBBPL9hj+VQpWIMwuRQjqUo56SUL+o
 3RbxlyJRSbBMD0Lk3EHmXk6GJZavk/6riuT7XIood11zOEToVMF5DqLNB
 K4tJHbrwiUU7EnKTVvuG+kwrkB+L+aQpk+H1FclGiO92XUamY6EENnHEZ g==;
X-CSE-ConnectionGUID: UdZMDT2ISl2IcaRysRFJxA==
X-CSE-MsgGUID: djq8uNaJSy+fgOuvtM/88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039096"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039096"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:41 -0700
X-CSE-ConnectionGUID: +VNEotxiTkeekGMcNdCl3Q==
X-CSE-MsgGUID: 5sYWDwYVRoazkd428qWAog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615524"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:41 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 3/6] drm/xe: Add infrastructure for Device OOB workarounds
Date: Wed,  2 Jul 2025 12:30:33 -0700
Message-ID: <20250702193036.1417416-4-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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

Some workarounds need to be able to be applied ahead of any GT
initialization for example 15015404425. This patch creates XE_DEVICE_WA
macro, in the same vein as XE_WA. This macro can be used ahead of GT
initialization, and can be tracked in sysfs. This should alleviate some
of the complexities that exist in i915.

v2: name change SoC to Device, address style issues
v5: split into separate patch from RTP changes, put oob within a struct,
move the initiation of oob workarounds into xe_device_probe_early(),
clean up the comments around XE_WA.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 20 ++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++
 drivers/gpu/drm/xe/xe_wa.c           | 57 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h           | 17 ++++++++-
 5 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..0e26658bcf7e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -21,6 +21,7 @@
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_wa.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include "xe_bo_evict.h"
@@ -82,9 +83,28 @@ static int sriov_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int workarounds(struct xe_device *xe, struct drm_printer *p)
+{
+	xe_pm_runtime_get(xe);
+	xe_wa_device_dump(xe, p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static int workaround_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	workarounds(xe, &p);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"info", info, 0},
 	{ .name = "sriov_info", .show = sriov_info, },
+	{ .name = "workarounds", .show = workaround_info, },
 };
 
 static int forcewake_open(struct inode *inode, struct file *file)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..53df142c1031 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -699,6 +699,9 @@ int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
 
+	xe_wa_device_init(xe);
+	xe_wa_process_device_oob(xe);
+
 	err = xe_mmio_probe_early(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..4e0dab46a3e3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -360,6 +360,18 @@ struct xe_device {
 		u8 skip_pcode:1;
 	} info;
 
+	struct {
+		/** @oob: bitmap with active OOB workarounds */
+		unsigned long *oob;
+
+		/**
+		 * @oob_initialized: Mark oob as initialized to help detecting misuse
+		 * of XE_DEVICE_WA() - it can only be call on initialization after
+		 * Device OOB WAs have been processed.
+		 */
+		bool oob_initialized;
+	} wa_active;
+
 	/** @survivability: survivability information for device */
 	struct xe_survivability survivability;
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index f51218a7a580..8a31453bc012 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -11,6 +11,7 @@
 #include <linux/fault-inject.h>
 
 #include <generated/xe_wa_oob.h>
+#include <generated/xe_device_wa_oob.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -876,8 +877,32 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
 
 static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
 
+static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
+#include <generated/xe_device_wa_oob.c>
+	{}
+};
+
+static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
+
 __diag_pop();
 
+/** xe_wa_process_device_oob - process OOB workaround table
+ * @xe: device instance to process workarounds for
+ *
+ * process OOB workaround table for this device, marking in @xe the
+ * workarounds that are active.
+ */
+
+void xe_wa_process_device_oob(struct xe_device *xe)
+{
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
+
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was));
+
+	xe->wa_active.oob_initialized = true;
+	xe_rtp_process(&ctx, device_oob_was);
+}
+
 /**
  * xe_wa_process_oob - process OOB workaround table
  * @gt: GT instance to process workarounds for
@@ -946,6 +971,28 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
 }
 
+/**
+ * xe_wa_device_init - initialize device with workaround oob bookkeeping
+ * @xe: Xe device instance to initialize
+ *
+ * Returns 0 for success, negative with error code otherwise
+ */
+int xe_wa_device_init(struct xe_device *xe)
+{
+	unsigned long *p;
+
+	p = drmm_kzalloc(&xe->drm,
+			 sizeof(*p) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),
+			 GFP_KERNEL);
+
+	if (!p)
+		return -ENOMEM;
+
+	xe->wa_active.oob = p;
+
+	return 0;
+}
+
 /**
  * xe_wa_init - initialize gt with workaround bookkeeping
  * @gt: GT instance to initialize
@@ -980,6 +1027,16 @@ int xe_wa_init(struct xe_gt *gt)
 }
 ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
 
+void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
+{
+	size_t idx;
+
+	drm_printf(p, "Device OOB Workarounds\n");
+	for_each_set_bit(idx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was))
+		if (device_oob_was[idx].name)
+			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
+}
+
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	size_t idx;
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 52337405b5bc..3793fcae38a0 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -13,17 +13,19 @@ struct xe_gt;
 struct xe_hw_engine;
 struct xe_tile;
 
+int xe_wa_device_init(struct xe_device *xe);
 int xe_wa_init(struct xe_gt *gt);
+void xe_wa_process_device_oob(struct xe_device *xe);
 void xe_wa_process_oob(struct xe_gt *gt);
 void xe_wa_process_gt(struct xe_gt *gt);
 void xe_wa_process_engine(struct xe_hw_engine *hwe);
 void xe_wa_process_lrc(struct xe_hw_engine *hwe);
 void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
+void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
 void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 
 /**
- * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
- *         other more specific type
+ * XE_WA - Out-of-band workarounds, to be queried and called as needed.
  * @gt__: gt instance
  * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
  */
@@ -32,4 +34,15 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
 })
 
+/**
+ * XE_DEVICE_WA - Out-of-band Device workarounds, to be queried and called
+ * as needed.
+ * @xe__: xe_device
+ * @id__: XE_DEVICE_WA_OOB_<id__>, as generated by build system in generated/xe_device_wa_oob.h
+ */
+#define XE_DEVICE_WA(xe__, id__) ({					\
+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);			\
+	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
+})
+
 #endif
-- 
2.49.0


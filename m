Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05884C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 00:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7F810EB88;
	Tue, 14 Jul 2026 00:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxfoXv93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2043610EA9F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 00:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783990133; x=1815526133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQVeCZyg3Fj174yzKRQ3wmO7Ta21rxyBs2ovU+uE5ew=;
 b=nxfoXv93m5SYbPNQkZW/wdgvHXw/QhP7ITNJ8GuqVaGnD5d/mAN+9zFQ
 bw2QphVPd+DnbOt6f03iAm7jO9KcPSHzRJD7+M1mBNRjQasq+NZ1Ud5AP
 EcLA9iSleKVxc0WToPIZ00VJq1sgrbk46IAvcP0ralqEcPkGciFxWqPLB
 LVBjtohPXRcsE4iJVjSNJNleVSZKtzZxl7oHDH4IC6tdTMONQWHOFtFb3
 G/pxzg+vgphZdglE7Zn6iKeUmzypb+2XUSkH4GLvQO8YH7neBdJx6Twt+
 TurDdRULF63SheZWBkSJkpL5yLnPDbD69pJeuzAl9PqkWRavAmK+wkdYc w==;
X-CSE-ConnectionGUID: w8PkVgLYTZWvL2K2aspY0Q==
X-CSE-MsgGUID: +ll/3MWNRUOoiB5CWfRhlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72130913"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="72130913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 17:48:53 -0700
X-CSE-ConnectionGUID: Sbs9s4mzRleXtBjO5kFYPA==
X-CSE-MsgGUID: FgWEcvlnQjSwtwmM9PODxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260583038"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 17:48:53 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Add debugfs for IA/GT bias
Date: Mon, 13 Jul 2026 17:43:59 -0700
Message-Id: <20260714004359.3905038-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
References: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
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

GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
Lower 16 bits correspond to IA and upper to GT. Higher value
indicates more bias towards that plane. The values are in U1.15
format.

$ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
0x80004000 (GT: 1.000, IA: 0.500)

This interface will allow us to observe power budget changes while
running workloads and also, if needed, tune it.

v3: Add a helper function for U1.15 decode (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 70 +++++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..4f1404c6c209 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -634,6 +634,10 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
+#define   GT_BIAS				REG_GENMASK(31, 16)
+#define   IA_BIAS				REG_GENMASK(15, 0)
+
 #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
 /* Common performance limit reason bits - available on all platforms */
 #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c38bcacb27e4..f9230b3427d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -10,6 +10,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -22,6 +23,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
+#include "xe_mmio.h"
 #include "xe_mocs.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -336,6 +338,70 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 
+#define U1_15_MAX		0x8000
+#define U1_15_INT_BIT		REG_BIT(15)
+#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)
+
+static void decode_u1_15_value(u16 num, u16 *whole, u32 *frac)
+{
+	u16 frac_bits;
+
+	/* Uppermost bit is integer value */
+	*whole = num & U1_15_INT_BIT ? 1 : 0;
+
+	/* Rest are fraction bits */
+	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
+
+	/* Up to 3 decimal places */
+	*frac = ((u32)frac_bits * 1000) / U1_15_MAX;
+}
+
+static int ia_gt_bias_show(struct seq_file *s, void *unused)
+{
+	struct xe_gt *gt = s->private;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 val;
+	u32 ia_frac, gt_frac;
+	u16 ia_raw, gt_raw;
+	u16 ia_int, gt_int;
+
+	guard(xe_pm_runtime)(xe);
+	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
+
+	ia_raw = REG_FIELD_GET(IA_BIAS, val);
+	gt_raw = REG_FIELD_GET(GT_BIAS, val);
+
+	decode_u1_15_value(ia_raw, &ia_int, &ia_frac);
+	decode_u1_15_value(gt_raw, &gt_int, &gt_frac);
+
+	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
+		   val, gt_int, gt_frac, ia_int, ia_frac);
+
+	return 0;
+}
+
+static ssize_t ia_gt_bias_write(struct file *file,
+				const char __user *userbuf,
+				size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct xe_gt *gt = s->private;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 val;
+	int ret;
+
+	ret = kstrtou32_from_user(userbuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(xe);
+	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
+
+	return count;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -368,7 +434,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
-
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 root, minor);
@@ -378,6 +443,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
 
+	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
+		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
+
 	xe_uc_debugfs_register(&gt->uc, root);
 
 	if (IS_SRIOV_PF(xe))
-- 
2.38.1


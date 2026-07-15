Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCBEC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 00:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31B10E26B;
	Thu, 16 Jul 2026 00:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV2pmZhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2238C10E44F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 00:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784160203; x=1815696203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fvNsMmOgFekViibwIEmFxYRqAM6u9HlQWwisamFuUJg=;
 b=DV2pmZhEEn5VnczrRKTpXex3lft2frWqdsQOE2Hk64MwajZLveopA7vz
 Ia9Wc5X085Lk+TMsCI0JPtxV2zenYMI1FW8Ktu3/4GtDLpj893WO6rsvL
 Ef5NVBUXTxt3mukQU0ocMrQ8oZKGa72gkzOeRlp4waQsSz8HKB/B/zh+K
 jiSGJ2xZ7oBo29lGf0bvXxldb2DdsUY72mfylgeIeWS0SWSJoXLgPzhZ4
 wV+kAzACmmyk8QlNzXKQOfZehkuoQoVFHgM/TYYcKiDB0uqqpD1l6nRSE
 +6jASGk9yrWI9inVzIyFEOKgrO1yEXiWP6jGp0nBF+/ucGPXQtndrnHaM w==;
X-CSE-ConnectionGUID: MioLBh/xSR2gUDdyKh9dkg==
X-CSE-MsgGUID: JcFXlL1LTAa2h0bnX9+b+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95457258"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95457258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 17:03:23 -0700
X-CSE-ConnectionGUID: /kIbBk/lRRmbOXkdF1CgVw==
X-CSE-MsgGUID: NQIQVRkWSU2VCumodqH9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="254574187"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa006.jf.intel.com with ESMTP; 15 Jul 2026 17:03:23 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Add debugfs for IA/GT bias
Date: Wed, 15 Jul 2026 16:58:24 -0700
Message-Id: <20260715235824.116991-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
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
v4: Validate input values (Rodrigo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 83 +++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

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
index c38bcacb27e4..407393a90909 100644
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
@@ -336,6 +338,83 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 
+#define U1_15_MAX		0x8000
+#define U1_15_INT_BIT		REG_BIT(15)
+#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)
+
+static void decode_u1_15(u16 num, u16 *whole, u32 *frac)
+{
+	u16 frac_bits;
+
+	/*
+	 * In U1.15 format, uppermost bit is integer value and the
+	 * rest 15 are the fraction. We calculate up to 3 decimal places.
+	 */
+
+	*whole = num & U1_15_INT_BIT ? 1 : 0;
+	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
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
+	decode_u1_15(ia_raw, &ia_int, &ia_frac);
+	decode_u1_15(gt_raw, &gt_int, &gt_frac);
+
+	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
+		   val, gt_int, gt_frac, ia_int, ia_frac);
+
+	return 0;
+}
+
+static bool is_valid_u1_15(u32 val)
+{
+	/* Validate both IA and GT values */
+	if (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
+	    REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX)
+		return true;
+	else
+		return false;
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
+	if (!is_valid_u1_15(val))
+		return -EINVAL;
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
@@ -368,7 +447,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
 	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
 	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
-
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 root, minor);
@@ -378,6 +456,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
 
+	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
+		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
+
 	xe_uc_debugfs_register(&gt->uc, root);
 
 	if (IS_SRIOV_PF(xe))
-- 
2.38.1


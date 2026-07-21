Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE92DC4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 18:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A9710E3A8;
	Tue, 21 Jul 2026 18:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ds7cUci2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5776A10EAE7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784656843; x=1816192843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPWN2jnPlv1rlMOT/mqnVbrN5KbbOJ9U9zUlEtn515s=;
 b=ds7cUci2ZhpeXwJYODAyCsI/LLHrRPBOmbGp9RKcxVzQsGNijvAI+zM/
 wDjWytSNR482i7LbudRUSaR6JdEHL2D0hMHEBIZ1AievUyGZo+mcVkWl2
 IjxkoLdOaWmbuR+JHOZABKtyxRm8BTryRNNX8sR8krHm2Vs+Z7E92OXF4
 IU2xvBvCCV/zBCPZg67Kz7XfDaUgvQIZXyDm/nCmfsgv1MEnotSPgqDvR
 TmsWkn/F7wRoWjorRG/ClcgNMyBGEKg+2o1Kh0MmWd9b7HAhfJWHgqPyy
 wGn+YBUCYVRXYApSdRtpcnlHrwbfnhmVDZsdxUtjV4fJS8jCHI/ITn8Yp w==;
X-CSE-ConnectionGUID: jVPinuk9QpqkeDLAF08WsQ==
X-CSE-MsgGUID: 7jvCp458RUyUyA4PiGt0VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96401998"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="96401998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 11:00:42 -0700
X-CSE-ConnectionGUID: rfGcOtaaTrKAnsmzANbZNg==
X-CSE-MsgGUID: hG1zcg/FTXqIrMFDXn6v5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="282352766"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2026 11:00:42 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 2/2] drm/xe: Add debugfs for IA/GT bias
Date: Tue, 21 Jul 2026 10:55:34 -0700
Message-Id: <20260721175534.654743-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260721175534.654743-1-vinay.belgaumkar@intel.com>
References: <20260721175534.654743-1-vinay.belgaumkar@intel.com>
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

Bspec: 51878

v3: Add a helper function for U1.15 decode (Michal)
v4: Validate input values (Rodrigo)
v5: Comments (Michal, Rodrigo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Assisted-by: Copilot:auto
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 77 ++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

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
index c38bcacb27e4..8e3ff50d71e0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -9,7 +9,9 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
+#include <linux/math.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -22,6 +24,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
+#include "xe_mmio.h"
 #include "xe_mocs.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -336,6 +339,77 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 
+#define U1_15_ONE		0x8000
+#define U1_15_INT_BITS		GENMASK(15, 15)
+#define U1_15_FRACTION_BITS	GENMASK(14, 0)
+
+static void u1_15_decode(u16 num, u16 *i, u32 *frac)
+{
+	/*
+	 * In U1.15 format, uppermost bit is integer value and the
+	 * rest 15 are the fraction.
+	 */
+
+	*i = FIELD_GET(U1_15_INT_BITS, num);
+	*frac = FIELD_GET(U1_15_FRACTION_BITS, num);
+}
+
+static void u1_15_decode_decimal(u16 value, u16 *i, u32 *frac, int digits)
+{
+	u1_15_decode(value, i, frac);
+	*frac = (*frac * int_pow(10, digits)) / (FIELD_MAX(U1_15_FRACTION_BITS) + 1);
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
+	u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 3);
+	u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 3);
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
+	if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE ||
+	    REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
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
@@ -378,6 +452,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
 
+	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
+		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
+
 	xe_uc_debugfs_register(&gt->uc, root);
 
 	if (IS_SRIOV_PF(xe))
-- 
2.38.1


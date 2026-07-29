Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA7C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 22:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472F610E0AA;
	Wed, 29 Jul 2026 22:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Un5fRRky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672610E0AA
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785363692; x=1816899692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=preQR3qr5WZauul1tT/1/sDDdHX69OSAHPZ0e1SHEks=;
 b=Un5fRRkyy3rgKVtkka2JTebOhuuPixRHe0IN/4SLdV1KAd8bQtYVTljH
 IG336WDbiGVMavY7XA1Ytp06Ykaz+X/ofb939MHgdsCn5R9iMYAwGkpPk
 japvv+uXEOXM2nLkKD8kl4PYvZOoey1E4BaznB9nniEJ2DZdgf98zcj24
 tjGwpQ5RTrZqYCnzoHmbCjkWbUOtsROdpgaf5SpldncCRvS81pd7kZWYz
 nabh+q4UCOkbCVSl62O0IFcO9sbXBdNrXYRzydUBmVdQCU2xh1PLPxwlk
 H/AgoT7FK6XC5ISk+leirKrIJEXNNooUpRqfqW0R2LoK5TNxJHMN4S8bS Q==;
X-CSE-ConnectionGUID: 9mF4+WZiR72FvqQKXylsLw==
X-CSE-MsgGUID: cQYZ7VcOR4qlA0BBcT6aLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89869915"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="89869915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:21:32 -0700
X-CSE-ConnectionGUID: QMCUtfYeSMCPjG1+Ohs9Mg==
X-CSE-MsgGUID: eM5A4DZTT621tYPds/fzGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="256198551"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 15:21:32 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v7 2/2] drm/xe: Add debugfs for IA/GT bias
Date: Wed, 29 Jul 2026 15:16:29 -0700
Message-Id: <20260729221629.593195-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
References: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
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

$ cat /sys/kernel/debug/dri/0/gt0/gt_ia_bias
0x80004000 (GT: 1.0000, IA: 0.5000)

This interface will allow us to observe power budget changes while
running workloads and also, if needed, tune it. Minimum allowed value
for each of GT/IA bias is 0x10, and max is 0x8000 which corresponds
to a bias ratio of 1.

Bspec: 51878

v3: Add a helper function for U1.15 decode (Michal)
v4: Validate input values (Rodrigo)
v5: Comments (Michal, Rodrigo)
v6: Rename to gt_ia_bias (Anirban), check lower bound (Michal)
v7: Update filename in commit message

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Assisted-by: Copilot:auto
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 80 ++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..48c515d91882 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -634,6 +634,12 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
+#define   GT_BIAS				REG_GENMASK(31, 16)
+#define   IA_BIAS				REG_GENMASK(15, 0)
+#define   GT_BIAS_DEFAULT			0x10
+#define   IA_BIAS_DEFAULT			0x10
+
 #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
 /* Common performance limit reason bits - available on all platforms */
 #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c38bcacb27e4..ea78b57b1c31 100644
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
@@ -336,6 +339,80 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
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
+static int gt_ia_bias_show(struct seq_file *s, void *unused)
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
+	u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 4);
+	u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 4);
+
+	seq_printf(s, "0x%x (GT: %u.%04u, IA: %u.%04u)\n",
+		   val, gt_int, gt_frac, ia_int, ia_frac);
+
+	return 0;
+}
+
+static ssize_t gt_ia_bias_write(struct file *file,
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
+	if (REG_FIELD_GET(IA_BIAS, val) < IA_BIAS_DEFAULT ||
+	    REG_FIELD_GET(GT_BIAS, val) < GT_BIAS_DEFAULT)
+		return -EINVAL;
+
+	guard(xe_pm_runtime)(xe);
+	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
+
+	return count;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(gt_ia_bias);
+
 void xe_gt_debugfs_register(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -378,6 +455,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
 
+	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
+		debugfs_create_file("gt_ia_bias", 0600, root, gt, &gt_ia_bias_fops);
+
 	xe_uc_debugfs_register(&gt->uc, root);
 
 	if (IS_SRIOV_PF(xe))
-- 
2.38.1


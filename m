Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE83C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E5B10EAE5;
	Mon,  6 Jul 2026 21:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6flpUyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508F910EAE5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 21:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783374100; x=1814910100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8nyMa3zxpqQUmZXmqsuHYDO4tUW+kYzAy4NcNxhkQfA=;
 b=M6flpUypEdIm/JUYlmMZa9uO4DHA54ISKeyQ/NkghvdjcU0MU+2M+J6x
 FtiVyoxxpFzPBxg8Gt7fGQIrfmOxoD+VM6o811zQNtGzVqj88ZJ1EYCm2
 RDeuL5tp4npuLlRRl27Kyj642vLKs8YUIpDqm1egDjqKCRWmsyNeO0dGy
 jP5oeGLEc4kd6nsdaWgYxPjMw8YQJpftvoFXhFVLgffMLPizRNJtp3SDd
 UvrTCDidCZ0cHk4bFFL/DFbEa9mMTKf7SY+aUNVxlj/t57/De8Z8F727P
 6Yx0eo3XdV0kFUngxZpKI1CHC7xDPUhlVk7fMNOKyMfwnxIFo0DdzGbWQ w==;
X-CSE-ConnectionGUID: dTX0Xl9cR66ug83ijuPIgg==
X-CSE-MsgGUID: Zw4CGtO7Rrq4T8pUraN6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83996135"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="83996135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 14:41:40 -0700
X-CSE-ConnectionGUID: 29LrYI/sQ/qjy+v54rDzQA==
X-CSE-MsgGUID: xglki0m/Tm2qyzuGwR5CoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="258140392"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa005.jf.intel.com with ESMTP; 06 Jul 2026 14:41:40 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add sysfs for GT/IA bias
Date: Mon,  6 Jul 2026 14:36:36 -0700
Message-Id: <20260706213636.2743937-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260706213636.2743937-1-vinay.belgaumkar@intel.com>
References: <20260706213636.2743937-1-vinay.belgaumkar@intel.com>
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

$ cat /sys/class/drm/card1/device/tile0/gt0/freq0/gt_ia_bias
GT Bias: 1.000
IA Bias: 0.500

This interface will allow us to observe power budget changes while
running workloads and also, if needed, tune it.

v2: Decode the bias values (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +
 drivers/gpu/drm/xe/xe_gt_freq.c      | 71 ++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..41c5c5f20964 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -634,6 +634,8 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
+
 #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
 /* Common performance limit reason bits - available on all platforms */
 #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index a40dd074106f..08c0be8defd0 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -11,10 +11,13 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include <regs/xe_gt_regs.h>
+#include "xe_gt.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
 #include "xe_gt_types.h"
 #include "xe_guc_pc.h"
+#include "xe_mmio.h"
 #include "xe_pm.h"
 
 /**
@@ -242,6 +245,61 @@ static ssize_t power_profile_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
 
+static ssize_t gt_ia_bias_show(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	u32 val;
+	u32 ia_frac, gt_frac;
+	u16 ia_raw, gt_raw;
+	u16 ia_frac_bits, gt_frac_bits;
+	u16 ia_int, gt_int;
+
+	guard(xe_pm_runtime)(dev_to_xe(dev));
+	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
+
+	ia_raw = val & 0xFFFF;
+	gt_raw = (val >> 16) & 0xFFFF;
+
+	/* Uppermost bit is integer value */
+	ia_int = ia_raw >> 15;
+	gt_int = gt_raw >> 15;
+
+	/* Rest are fraction bits */
+	ia_frac_bits = ia_raw & 0x7FFF;
+	gt_frac_bits = gt_raw & 0x7FFF;
+
+	/* Up to 3 decimal places */
+	ia_frac = ((uint64_t)(ia_frac_bits * 1000)) / 0x8000;
+	gt_frac = ((uint64_t)(gt_frac_bits * 1000)) / 0x8000;
+
+	return sysfs_emit(buf, "GT Bias: %u.%03u\nIA Bias: %u.%03u\n",
+			  gt_int, gt_frac, ia_int, ia_frac);
+}
+
+static ssize_t gt_ia_bias_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buff, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buff, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(xe_pm_runtime)(dev_to_xe(dev));
+	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
+
+	return count;
+}
+
+static struct kobj_attribute attr_gt_ia_bias = __ATTR_RW(gt_ia_bias);
+
 static const struct attribute *freq_attrs[] = {
 	&attr_act_freq.attr,
 	&attr_cur_freq.attr,
@@ -258,8 +316,13 @@ static const struct attribute *freq_attrs[] = {
 static void freq_fini(void *arg)
 {
 	struct kobject *kobj = arg;
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj->parent);
 
 	sysfs_remove_files(kobj, freq_attrs);
+
+	if (xe_gt_is_main_type(gt) && !IS_DGFX(dev_to_xe(dev)))
+		sysfs_remove_file(kobj, &attr_gt_ia_bias.attr);
 	kobject_put(kobj);
 }
 
@@ -289,6 +352,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
 		return err;
 	}
 
+	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe)) {
+		err = sysfs_create_file(gt->freq, &attr_gt_ia_bias.attr);
+		if (err) {
+			kobject_put(gt->freq);
+			return err;
+		}
+	}
+
 	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
 		return err;
-- 
2.38.1


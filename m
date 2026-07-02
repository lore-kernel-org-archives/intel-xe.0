Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02B7C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 01:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6748610E403;
	Thu,  2 Jul 2026 01:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEq2sK1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDB910E403
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 01:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782954082; x=1814490082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bw2gWjs1nIDWdCtIgf0hDsKNCh0Oc29bOAeoUT0ldrw=;
 b=aEq2sK1/pwBu+zTxlhmryChg7wh2r6UL3O9E0QA6V48OmZBndTnq17zL
 GyflIHC8X0tV4MuWj9QFn98bvirfEGJloCWL1stgZonwaWHlu+III7pDo
 xbEMeX9cef6BETieeYvv/eHRrteJWuPouC6AAZqAkekHVs7qHqZY/DyF5
 kn2oB6sAIehOfmTmz+PNQpBYIFLEw4kiHF9HMJ4CCWTXGucL3yKNNAXEP
 +2UQWIWlxVzpFi2lSowOzX727P5LFfqLMMpYCzTPddoXjdhI8Q7W93/EL
 ax3VLBYvWa/idTuHYX6cR05A3ieYD6NzHlF+UBVmTINav6x2khXx6aV7Q g==;
X-CSE-ConnectionGUID: e9j8EZ9PRGSxTHT+edZMJQ==
X-CSE-MsgGUID: W0U4kB9HSemjjNIhzThMZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94350433"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="94350433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 18:01:22 -0700
X-CSE-ConnectionGUID: RE/cYoNVTbWkjZ2EPxbkeg==
X-CSE-MsgGUID: Kx3ODEl1SBGVHoVOKwetyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="252850697"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 18:01:22 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v1 2/2] drm/xe: Add sysfs for GT/IA bias
Date: Wed,  1 Jul 2026 17:56:14 -0700
Message-Id: <20260702005614.2621735-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
References: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
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
0x80002666

This interface will allow us to observe power budget changes while
running workloads and also, if needed, tune it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_freq.c      | 51 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

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
index a40dd074106f..0847832151f9 100644
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
@@ -242,6 +245,41 @@ static ssize_t power_profile_store(struct kobject *kobj,
 }
 static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
 
+static ssize_t gt_ia_bias_show(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       char *buf)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	u32 val;
+
+	guard(xe_pm_runtime)(dev_to_xe(dev));
+	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
+
+	return sysfs_emit(buf, "0x%x\n", val);
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
@@ -258,8 +296,13 @@ static const struct attribute *freq_attrs[] = {
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
 
@@ -289,6 +332,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
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


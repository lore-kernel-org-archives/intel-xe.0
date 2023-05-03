Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ABAC77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 06:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3310E1B2;
	Wed,  3 May 2023 06:40:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345E410E1B2
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683096056; x=1714632056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDgi4GOVjMroM3SghuhZYNhZrGTFv4DFKijEP4OvKbQ=;
 b=Lt8p5hDyZa65vLFYcjjPgTySgjvhtXf+27KmxcbD2Vm1Gvh24rMx6UG4
 a5nZ4WIZtXKZYW/bucfnDRdQ4x5cjPi0QKXaOfkdE2j41Gfw0fqFfMKEN
 iD7Yg4RYM14DIkWkoKjbYGCtAWJ54FpSIEIWt6uhMzAFN9nIGuDFww7j9
 aFzZPreroKt1mFeU/LlR01VjN2XWGsJVWfvg/ACFe3iFsh1S7uZ8d2SKY
 J4g9upv7s9Ui8yEt/sGvbsxOeCzUyGC6Q+OMQx2Buba9Du7FrtZJYszIR
 sgWMB99wDp3Kdd7ZQRXdum1UAIhLHgYGACmY8dcFhcrvV9mbsvFtDuBcz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348624099"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="348624099"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 23:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673962982"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="673962982"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 23:40:53 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 12:12:52 +0530
Message-Id: <20230503064252.830641-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230503064252.830641-1-riana.tauro@intel.com>
References: <20230503064252.830641-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 3/3] drm/xe/guc_pc : Remove render c state
 files
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Render c state sysfs entries are moved under device/gt#/gpu_idle.
Remove the files under device/gt#/

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 58 ----------------------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 0b6d0577a8a7..0e1e196174ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -71,17 +71,6 @@
  * - freq_max: GuC PC max request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
  *
- * Render-C States:
- * ================
- *
- * Render-C states is also a GuC PC feature that is now enabled in Xe for
- * all platforms.
- * Xe's GuC PC provides a sysfs API for Render-C States:
- *
- * device/gt#/rc* *read-only* files:
- * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
- * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
- *                  Prone to overflows.
  */
 
 static struct xe_guc *
@@ -580,51 +569,6 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(freq_max);
 
-static ssize_t rc_status_show(struct device *dev,
-			      struct device_attribute *attr, char *buff)
-{
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	struct xe_gt *gt = pc_to_gt(pc);
-	u32 reg;
-
-	xe_device_mem_access_get(gt_to_xe(gt));
-	reg = xe_mmio_read32(gt, GEN6_GT_CORE_STATUS.reg);
-	xe_device_mem_access_put(gt_to_xe(gt));
-
-	switch (REG_FIELD_GET(RCN_MASK, reg)) {
-	case GT_RC6:
-		return sysfs_emit(buff, "rc6\n");
-	case GT_RC0:
-		return sysfs_emit(buff, "rc0\n");
-	default:
-		return -ENOENT;
-	}
-}
-static DEVICE_ATTR_RO(rc_status);
-
-static ssize_t rc6_residency_show(struct device *dev,
-				  struct device_attribute *attr, char *buff)
-{
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	struct xe_gt *gt = pc_to_gt(pc);
-	u32 reg;
-	ssize_t ret;
-
-	xe_device_mem_access_get(pc_to_xe(pc));
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		goto out;
-
-	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
-	ret = sysfs_emit(buff, "%u\n", reg);
-
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out:
-	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret;
-}
-static DEVICE_ATTR_RO(rc6_residency);
-
 static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_act.attr,
 	&dev_attr_freq_cur.attr,
@@ -633,8 +577,6 @@ static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_rpn.attr,
 	&dev_attr_freq_min.attr,
 	&dev_attr_freq_max.attr,
-	&dev_attr_rc_status.attr,
-	&dev_attr_rc6_residency.attr,
 	NULL
 };
 
-- 
2.40.0


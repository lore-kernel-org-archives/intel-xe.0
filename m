Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10993C5ACB2
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3C910E249;
	Thu, 16 Nov 2023 03:34:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F5910E0B5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105683; x=1731641683;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ByybcJ6z1Y4qJ0vM5rk7R5yoUrjmQO/cJJQCkoZS8rw=;
 b=PDGBFyYY5XdJ140JI+5Bvhhnm7An1Zs+Maw5DVfCeo0TIpGpfDM+iKaQ
 ApKvovOrQS5o85m7mlPw8acGByFMDHrFED6Pmomgnp2dZ+OQe+r8lKJyp
 iK7CuDTwetgIkHKc4yy9VzJI6sipKYMDYJoAvJoCsZZ+kg1yoOK+PqCky
 eOe3KcFiDMGgeNNoINA6XpSedz8XSTsFgk813q4M+wMx2Qk73sEa0n9rk
 quyeXum072qzvYWAo1SKPj6GO/cCiUPpW51iJNqnqc5TbOXly1S7VnMxD
 GPbkhN8tqbcXlkAZSFu8yab5PEWpD0MDfNQyUF2V8Qy/frJT77fEmdS2+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9648709"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="9648709"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831129661"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="831129661"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:34:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 19:34:35 -0800
Message-Id: <20231116033436.1713-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
References: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/pvc: Allow userspace to configure CCS
 mode
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

Allow user to configure the CCS mode setting through a
'ccs_mode' sysfs interface. Also report the current
CCS mode configuration and number of compute slices
available through this interface.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c69d2e8a0fe1..36f7bd34bc78 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -10,7 +10,11 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
+#include "xe_gt_printk.h"
+#include "xe_mmio.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -29,6 +33,50 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(gt->sysfs);
 }
 
+static ssize_t
+ccs_mode_show(struct device *kdev,
+	      struct device_attribute *attr, char *buf)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+
+	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
+			  gt->ccs_mode.num_engines, hweight32(CCS_MASK(gt)));
+}
+
+static ssize_t
+ccs_mode_store(struct device *kdev, struct device_attribute *attr,
+	       const char *buff, size_t count)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+	u32 num_engines, num_slices;
+	int ret;
+
+	ret = kstrtou32(buff, 0, &num_engines);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ensure number of engines specified is valid and there is an
+	 * exact multiple of engines for slices.
+	 */
+	num_slices = hweight32(CCS_MASK(gt));
+	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
+		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
+			  num_engines, num_slices);
+		return -EINVAL;
+	}
+
+	if (gt->ccs_mode.num_engines != num_engines) {
+		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
+		gt->ccs_mode.num_engines = num_engines;
+		xe_gt_reset_async(gt);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ccs_mode);
+
 void xe_gt_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -52,6 +100,11 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
+	if (GRAPHICS_VERx100(xe) == 1260 &&
+	    sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr))
+		drm_warn(&xe->drm,
+			 "Sysfs creation for ccs_mode setting failed\n");
+
 	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.21.0.rc0.32.g243a4c7e27


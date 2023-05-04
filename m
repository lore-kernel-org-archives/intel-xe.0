Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52350C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 04:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215F710E296;
	Thu,  4 May 2023 04:54:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A462C10E22B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 04:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683176087; x=1714712087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o2Im6gezkiPCz9nJ3C/m/j6A/zqC6KrszBqSJRy3qN4=;
 b=ZG653VIzONwUiwKu/0w6P+6pVxhnftKMqqE1qyfidw61djxukZMv31g4
 EzG0DD1dBKhOulGBvPzGsWbuqGpo/zyGDaGGizGddzn8IOwXN7Bjz18zq
 WFq0pWpqyKYEkT67trBr5+75HvYNUS/WtPqGK9FLCe6pg11O+LoFqTImY
 09fMwjAUjSNPrrJAPoIhJG7zJOoTv0qXk0ioF+P/dn0sSbxvLKCOPIk5Q
 hDW2vImbYk+4clzYliJOb+4g+nBEwiJFLzv+BMaF9ugFHNNkH6/wo8A7L
 Kvqpa1jzcV3idgtCHBPf2MlpnyB+kLeYGzTCa9zletnJ+ikJZUFmrxvZE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="346304850"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="346304850"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943178217"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="943178217"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 10:26:59 +0530
Message-Id: <20230504045659.964449-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230504045659.964449-1-riana.tauro@intel.com>
References: <20230504045659.964449-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 3/3] drm/xe/guc_pc : Remove render c state
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Render c state sysfs entries are moved under device/gt#/gpu_idle.
Remove the files under device/gt#/

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 59 ----------------------------------
 1 file changed, 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 72d460d5323b..8039def83812 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -70,18 +70,6 @@
  * - freq_min: GuC PC min request.
  * - freq_max: GuC PC max request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
- *
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
@@ -580,51 +568,6 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
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
-	reg = xe_mmio_read32(gt, GT_CORE_STATUS.reg);
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
-	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
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
@@ -633,8 +576,6 @@ static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_rpn.attr,
 	&dev_attr_freq_min.attr,
 	&dev_attr_freq_max.attr,
-	&dev_attr_rc_status.attr,
-	&dev_attr_rc6_residency.attr,
 	NULL
 };
 
-- 
2.40.0


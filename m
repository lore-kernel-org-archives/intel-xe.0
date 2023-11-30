Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AC2C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 04:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092D10E208;
	Thu, 30 Nov 2023 04:32:12 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 04:32:09 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7510E208
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 04:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701318730; x=1732854730;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=II9bh0TiadEH02KsYwfXj5NxiqqlSOaB/dtDU71zB1k=;
 b=boNJQE1s4he3ktorntGYJce2/Vmwx3g4BzEzTd1ZV3xYSeUtwYqEY+Ep
 OZhBH52AB0U1AZRk6dPw9Q4+MnsWI5LdO0CxC7Bd+GKGontvHJg04ENMM
 vvnPY2rkc+7QsEIhpcULrLWTzjSRxjWSKcD5LBZLdzsdKDYavM5QxIIc3
 Tmg9DKR6kWnaEwT1YsasDD85ScIl32VqhqKmOju8+UAWN3HDVhS+KguIX
 0NJakQGIqhluY5JayltP0UNn+jY/E6Ifilu4maDwFMvCo0oPHlYVtm5DM
 fFHz4SSLmiN0ubxNVx1XMjfHWsd7SuZ2L0S172CnoyG2dUuAl7UUhc7c6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="257675"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="257675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 20:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="769159019"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="769159019"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga002.jf.intel.com with ESMTP; 29 Nov 2023 20:25:00 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 10:09:14 +0530
Message-Id: <20231130043914.343820-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Change the name of frequency sysfs
 attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Switching the names of frequency sysfs attrbutes to align with
required devfreq changes. The name changes are as below;

-freq_act -> act_freq
-freq_cur -> cur_freq
-freq_rpn -> rpn_freq
-freq_rpe -> rpe_freq
-freq_rp0 -> rp0_freq
-freq_min -> min_freq
-freq_max -> max_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 1943893a3fd7..8233277b76e4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -60,15 +60,15 @@
  * Xe's GuC PC provides a sysfs API for frequency management:
  *
  * device/gt#/freq_* *read-only* files:
- * - freq_act: The actual resolved frequency decided by PCODE.
- * - freq_cur: The current one requested by GuC PC to the Hardware.
- * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
- * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
- * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
+ * - act_freq: The actual resolved frequency decided by PCODE.
+ * - cur_freq: The current one requested by GuC PC to the Hardware.
+ * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
+ * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
+ * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
  *
  * device/gt#/freq_* *read-write* files:
- * - freq_min: GuC PC min request.
- * - freq_max: GuC PC max request.
+ * - min_freq: GuC PC min request.
+ * - max_freq: GuC PC max request.
  *             If max <= min, then freq_min becomes a fixed frequency request.
  *
  * Render-C States:
@@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t freq_act_show(struct device *dev,
+static ssize_t act_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(freq_act);
+static DEVICE_ATTR_RO(act_freq);
 
-static ssize_t freq_cur_show(struct device *dev,
+static ssize_t cur_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(freq_cur);
+static DEVICE_ATTR_RO(cur_freq);
 
-static ssize_t freq_rp0_show(struct device *dev,
+static ssize_t rp0_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
 }
-static DEVICE_ATTR_RO(freq_rp0);
+static DEVICE_ATTR_RO(rp0_freq);
 
-static ssize_t freq_rpe_show(struct device *dev,
+static ssize_t rpe_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
 	xe_device_mem_access_put(xe);
 	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
 }
-static DEVICE_ATTR_RO(freq_rpe);
+static DEVICE_ATTR_RO(rpe_freq);
 
-static ssize_t freq_rpn_show(struct device *dev,
+static ssize_t rpn_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
 
 	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
 }
-static DEVICE_ATTR_RO(freq_rpn);
+static DEVICE_ATTR_RO(rpn_freq);
 
-static ssize_t freq_min_show(struct device *dev,
+static ssize_t min_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_min);
+static DEVICE_ATTR_RW(min_freq);
 
-static ssize_t freq_max_show(struct device *dev,
+static ssize_t max_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_max);
+static DEVICE_ATTR_RW(max_freq);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 }
 
 static const struct attribute *pc_attrs[] = {
-	&dev_attr_freq_act.attr,
-	&dev_attr_freq_cur.attr,
-	&dev_attr_freq_rp0.attr,
-	&dev_attr_freq_rpe.attr,
-	&dev_attr_freq_rpn.attr,
-	&dev_attr_freq_min.attr,
-	&dev_attr_freq_max.attr,
+	&dev_attr_act_freq.attr,
+	&dev_attr_cur_freq.attr,
+	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpe_freq.attr,
+	&dev_attr_rpn_freq.attr,
+	&dev_attr_min_freq.attr,
+	&dev_attr_max_freq.attr,
 	NULL
 };
 
-- 
2.25.1


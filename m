Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A02C47071
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 02:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB13F10E38F;
	Wed, 15 Nov 2023 02:48:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B411310E38C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 02:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700016479; x=1731552479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZ96o8AFYs/XeCiSHEQKEAuTIyEv7fB1u4RBI6rmY/0=;
 b=jZC8FM9JKKWGuVM0jeuTHoFqGw7g6uAPJsYEugJEFEonvCMi1oqmofAc
 2v8NDQ0nl1h9N5DI+IsLpCXNLvR19z5hUfHZMAyTUEtvpNa7IyCG34uDf
 iwJTTGhsgP/YRFcLSZS8K4Ed8GpQ2mn4S+YBf1Z3eUkND9vRr/JFGSsrC
 oLBdswI9P/uD8sySAVZIDj0Utw+LJCB/iosA7TegjUjHKTSXRh0UJ8JW4
 aTAQOxx1Z0ihN0AIUUSVIU2JsmKo1Hg8H/LT/kUd9brX1P7Wkw3RM+O8C
 4+9sHh8d6JGeBVkl6ofdC+Hh0sevk7pPTapFEOqHz4hL3L+lcx/aNlHFi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9436050"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="9436050"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 18:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="835264754"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="835264754"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2023 18:47:44 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:31:11 +0530
Message-Id: <20231115030111.770130-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
References: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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

Creating a new freq directory to move frequency sysfs attributes.
Additonally, renaming the frequency sysfs to align with devfreq
requirements.

/device/tile<n>/gt<n>/freq
			|- act_freq
			|- cur_freq
			|- max_freq
			|- min_freq
			|- rp0_freq
			|- rpn_freq
			|- rpe_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 65 ++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f4ac76d6b2dd..5d64cd041db2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -57,15 +57,15 @@
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
@@ -385,7 +385,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t freq_act_show(struct device *dev,
+static ssize_t act_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct kobject *kobj = &dev->kobj;
@@ -410,9 +410,9 @@ static ssize_t freq_act_show(struct device *dev,
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
@@ -439,18 +439,18 @@ static ssize_t freq_cur_show(struct device *dev,
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
@@ -462,18 +462,18 @@ static ssize_t freq_rpe_show(struct device *dev,
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
@@ -510,7 +510,7 @@ static ssize_t freq_min_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -540,9 +540,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
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
@@ -568,7 +568,7 @@ static ssize_t freq_max_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 			      const char *buff, size_t count)
 {
 	struct xe_guc_pc *pc = dev_to_pc(dev);
@@ -598,7 +598,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret ?: count;
 }
-static DEVICE_ATTR_RW(freq_max);
+static DEVICE_ATTR_RW(max_freq);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -664,13 +664,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
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
 
@@ -950,6 +950,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
+	struct kobject *kobj;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
@@ -965,7 +966,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	err = sysfs_create_files(gt->sysfs, pc_attrs);
+	kobj = kobject_create_and_add("freq", gt->sysfs);
+
+	err = sysfs_create_files(kobj, pc_attrs);
 	if (err)
 		return err;
 
-- 
2.25.1


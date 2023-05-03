Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94198C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 06:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01410E1A3;
	Wed,  3 May 2023 06:40:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E0610E084
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 06:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683096053; x=1714632053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wplSGPuKEvh2u4yQ1gj4Rrm4fT3YJResSwzYdwEiX8=;
 b=gvW9Czxv9umiLzDBDATSJZn8H9crOQ3ioH+uEYeA9gLEAXdwla11Q7Zi
 QxGA5sutWAzyfTweLlLpsxor/fc4shu9BY0TmR0YOtSNIyYLIN74M6Uf/
 3Get8zUmEkuYVIs0gmZYhMCbZGF0P+px1oLDupGyBrMOgDYp9ywAJ96g0
 y+PB5b7bvrXmTUDLDmsKzpmoIuOJDXVq1PUwCQ2sud9+w0siDOuwHh0CT
 k3+oAm74Nc3w5A2rsRfZrZXcobFLKUvhuqDHeWJpfazKTFK6yj9Xkdssa
 iH8jJlndJcujdnkup3c5G4TxNt2xf9U29yMY077ApSwRP3s7Ld3j9ePNw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="348624095"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="348624095"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 23:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673962978"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; d="scan'208";a="673962978"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 23:40:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 12:12:51 +0530
Message-Id: <20230503064252.830641-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230503064252.830641-1-riana.tauro@intel.com>
References: <20230503064252.830641-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 2/3] drm/xe : add rc6_residency in ms
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

add rc6_residency in ms instead of rc6 residency counter.
Handle wrap around for the counter
The counter can still wrap as it relies on the frequency of
counter being read

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_idle.c | 46 +++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
index 231bdb45a6b7..a7e97ddd7253 100644
--- a/drivers/gpu/drm/xe/xe_idle.c
+++ b/drivers/gpu/drm/xe/xe_idle.c
@@ -11,6 +11,8 @@
 #include "xe_idle.h"
 #include "xe_mmio.h"
 
+#define XE_RC6_MULTIPLIER      1280
+
 /*
  * Render-C States:
  * ================
@@ -27,8 +29,7 @@
  *
  * device/gt#/gpu_idle/rc* *read-only* files:
  * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
- * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
- *		    Prone to overflows.
+ * - rc6_residency_ms: Provide the rc6_residency in ms
  */
 
 static struct xe_gt *idle_to_gt(struct xe_idle *idle)
@@ -51,6 +52,35 @@ static struct kobj_type xe_idle_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static u64 rc6_residency_us(struct xe_idle *idle)
+{
+	struct xe_gt *gt = idle_to_gt(idle);
+	u64 cur_residency, delta, overflow_residency, prev_residency;
+
+	overflow_residency = BIT_ULL(32);
+	cur_residency = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
+
+	/*
+	 * Counter wrap handling
+	 * Store previous hw counter values for counter wrap-around handling
+	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
+	 */
+	prev_residency = idle->prev_rc6_residency;
+	idle->prev_rc6_residency = cur_residency;
+
+	/* RC6 delta */
+	if (cur_residency >= prev_residency)
+		delta = cur_residency - prev_residency;
+	else
+		delta = cur_residency + (overflow_residency - prev_residency);
+
+	/* Add delta to RC6 extended raw driver copy. */
+	cur_residency = idle->cur_rc6_residency + delta;
+	idle->cur_rc6_residency = cur_residency;
+
+	return mul_u64_u32_div(cur_residency, XE_RC6_MULTIPLIER, 1000);
+}
+
 static ssize_t
 rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
@@ -76,11 +106,10 @@ static const struct kobj_attribute rc_status =
 __ATTR(rc_status, 0444, rc_status_show, NULL);
 
 static ssize_t
-rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+rc6_residency_ms_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct xe_idle *idle = kobj_to_idle(kobj);
 	struct xe_gt *gt = idle_to_gt(idle);
-	u32 reg;
 	ssize_t ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
@@ -88,8 +117,7 @@ rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 	if (ret)
 		goto out;
 
-	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
-	ret = sysfs_emit(buf, "%u\n", reg);
+	ret = sysfs_emit(buf, "%llu\n", DIV_ROUND_UP_ULL(rc6_residency_us(&gt->idle), 1000));
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
@@ -97,12 +125,12 @@ rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 	return ret;
 }
 
-static const struct kobj_attribute rc6_residency =
-__ATTR(rc6_residency, 0444, rc6_residency_show, NULL);
+static const struct kobj_attribute rc6_residency_ms =
+__ATTR(rc6_residency_ms, 0444, rc6_residency_ms_show, NULL);
 
 static const struct attribute *idle_attrs[] = {
 	&rc_status.attr,
-	&rc6_residency.attr,
+	&rc6_residency_ms.attr,
 	NULL,
 };
 
-- 
2.40.0


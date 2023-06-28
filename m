Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F785EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1FB10E371;
	Wed, 28 Jun 2023 11:41:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1810E371
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687952486; x=1719488486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zceaoDf/lGGMm9kLAaDugPtRMLQkeeMQFgO7u4rrF8=;
 b=dDS1xyLiJz71wn/q3McC1AwtllWP0gONPmUORBpPw0EXqcOq2aTMn45T
 7NVx5ZgOlKHWQAL09zUUDpU1EtEXVqKsax0Af3YllEJHIGTDpuIB0+hoX
 fPbe7IP2JSsRqLUU0kfkAQFY0ddZOpbGsGRjL4qF30fsn7o9VR7cOggRe
 wSZlGr3EWOx+y+PecJ5dsOByKzsNVwsnEJl6oXBc2EmGlRvvJ97yRqHLu
 XPZ05FHspa7GaG/Jpw3xCXJfsPuvviVOFkzjUVYJAmzOxwsCjajWcdWav
 N8ZbIcgNhb4v4Q0Kg4/JOw0W2Pkoj2Fvlj65/0TaH4HyiGhQzLie0BljH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425492884"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="425492884"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861507315"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="861507315"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 04:41:24 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 17:17:27 +0530
Message-Id: <20230628114732.3598169-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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

Add engines sysfs directory under its GT and
create sub directory for all engine class
(note its not per instance) present on GT.

For example,
DUT# cat /sys/class/drm/cardX/device/gtN/engines/
bcs/ ccs/

V2 :
   - Correct class mask logic - Himal
   - Remove extra parenthesis

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       |  6 +++
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 92 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.h |  3 ++
 3 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc76678a8276..5166265b5c1d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -322,6 +322,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	err = xe_gt_sysfs_engines(gt);
+	if (err)
+		drm_warn(&gt_to_xe(gt)->drm,
+			 "failed to register engines sysfs directory, err: %d\n",
+			 err);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c01cc689058c..76bb6441e9c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -22,6 +22,98 @@ static struct kobj_type xe_gt_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
+static void kobj_xe_engine_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static const struct kobj_type kobj_xe_engine_type = {
+	.release = kobj_xe_engine_release,
+	.sysfs_ops = &kobj_sysfs_ops
+};
+
+static struct kobject *
+kobj_xe_engine(struct kobject *parent, char *name)
+{
+	struct kobject *kobj;
+
+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
+	if (!kobj)
+		return NULL;
+
+	kobject_init(kobj, &kobj_xe_engine_type);
+	if (kobject_add(kobj, parent, "%s", name)) {
+		kobject_put(kobj);
+		return NULL;
+	}
+
+	return kobj;
+}
+
+int xe_gt_sysfs_engines(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct kobject *kobj;
+	u16 class_mask = 0;
+	int err = 0;
+
+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
+	if (!kobj)
+		return -ENOMEM;
+
+	kobject_init(kobj, &xe_gt_sysfs_kobj_type);
+
+	err = kobject_add(kobj, gt->sysfs, "engines");
+	if (err) {
+		kobject_put(kobj);
+		return err;
+	}
+
+	for_each_hw_engine(hwe, gt, id) {
+		char name[MAX_ENGINE_NAME_LEN];
+		struct kobject *khwe;
+
+		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
+		    hwe->class == XE_ENGINE_CLASS_MAX)
+			continue;
+
+		if ((class_mask >> hwe->class) & 1)
+			continue;
+
+		class_mask |= 1 << hwe->class;
+
+		switch (hwe->class) {
+		case XE_ENGINE_CLASS_RENDER:
+			strcpy(name, "rcs");
+			break;
+		case XE_ENGINE_CLASS_VIDEO_DECODE:
+			strcpy(name, "vcs");
+			break;
+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			strcpy(name, "vecs");
+			break;
+		case XE_ENGINE_CLASS_COPY:
+			strcpy(name, "bcs");
+			break;
+		case XE_ENGINE_CLASS_COMPUTE:
+			strcpy(name, "ccs");
+			break;
+		default:
+			kobject_put(kobj);
+			return -EINVAL;
+		}
+
+		khwe = kobj_xe_engine(kobj, name);
+		if (!khwe) {
+			kobject_put(kobj);
+			return -EINVAL;
+		}
+	}
+
+	return err;
+}
+
 static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_gt *gt = arg;
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
index ecbfcc5c7d42..a531aebd10d6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
@@ -8,7 +8,10 @@
 
 #include "xe_gt_sysfs_types.h"
 
+#define MAX_ENGINE_NAME_LEN	16
+
 int xe_gt_sysfs_init(struct xe_gt *gt);
+int xe_gt_sysfs_engines(struct xe_gt *gt);
 
 static inline struct xe_gt *
 kobj_to_gt(struct kobject *kobj)
-- 
2.25.1


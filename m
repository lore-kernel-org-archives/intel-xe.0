Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F11C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 12:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE8110E6F0;
	Fri,  4 Aug 2023 12:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536D310E0B9
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691153884; x=1722689884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FVc/s7WxVeA0lXjXP9IVERqcXV4KevFz7TI7bgrnKcg=;
 b=iJf1whlHf7+H/n7aGecWmmESyAQ73bdI4Wa+sBBdxpnaxMQN5H+iOha1
 DN/7e2OQ9h9bHWyC1LmuaW5o7kiBeklbPrCwavxMG80Yjga/LvcGJgr/C
 mIq+C8NQdpI7uhglJ+PPSVveKCulRyYWvJu85x4GnsE+zQW/Hn/WyELR2
 zDOSvc24CIz+HMv4+EiTox7zcAx9KQ8opkXV+a7BD/9xnZzkmrVs0f6Ns
 Ku5D0cBRrGy4jqsrK4D7lNCY/Vn+dJm7x9QiZu4lCx8o1NfM5m3cRBoii
 e8G4RF3sfYI0M4pzxL5wC+4K0ob3NSENpg07oyHKuFMXS3NEaiJxKD8MQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456524215"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="456524215"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 05:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765098947"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="765098947"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 05:58:02 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 18:34:49 +0530
Message-Id: <20230804130452.1402344-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804130452.1402344-1-tejas.upadhyay@intel.com>
References: <20230804130452.1402344-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V13 3/6] drm/xe: Add job timeout engine property
 to sysfs
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

The time after which a job is removed from the scheduler.
Add sysfs entry to provide user defined job timeout to
scheduler.

The job timeout can be adjusted per-engine class using,

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms

V8:
  - Rebase
V7:
  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
V6:
  - Remove timeout validation, not relevant - Niranjana
  - Rebase to use common error path
V5:
  - Rebase to use engine class interface instead of hw engine
V4:
  - Rebase to per class engine props interface
V3:
  - Rebase
  - Update commit message to reflect tile update
V2:
  - Use sysfs_create_files as part of this patch

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 86 +++++++++++++------
 1 file changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 99a8197765bd..03e0c29445b7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -24,38 +24,34 @@ static const struct kobj_type kobj_xe_hw_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
-static void kobj_xe_hw_engine_class_fini(struct drm_device *drm, void *arg)
+static ssize_t job_timeout_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
 {
-	struct kobject *kobj = arg;
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
 
-	kobject_put(kobj);
-}
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
 
-	static struct kobj_eclass *
-kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, char *name)
-{
-	struct kobj_eclass *keclass;
-	int err = 0;
+	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
 
-	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
-	if (!keclass)
-		return NULL;
+	return count;
+}
 
-	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
-	if (kobject_add(&keclass->base, parent, "%s", name)) {
-		kobject_put(&keclass->base);
-		return NULL;
-	}
+static ssize_t job_timeout_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
 
-	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
-				       &keclass->base);
-	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-	return keclass;
+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
 }
 
+static struct kobj_attribute job_timeout_attr =
+__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
+
 static ssize_t job_timeout_default(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buf)
 {
@@ -97,6 +93,44 @@ static const struct attribute *defaults[] = {
 	NULL
 };
 
+static const struct attribute *files[] = {
+	&job_timeout_attr.attr,
+	NULL
+};
+
+static void kobj_xe_hw_engine_class_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, files);
+	kobject_put(kobj);
+}
+
+	static struct kobj_eclass *
+kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, char *name)
+{
+	struct kobj_eclass *keclass;
+	int err = 0;
+
+	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
+	if (!keclass)
+		return NULL;
+
+	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
+	if (kobject_add(&keclass->base, parent, "%s", name)) {
+		kobject_put(&keclass->base);
+		return NULL;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
+				       &keclass->base);
+	if (err)
+		drm_warn(&xe->drm,
+			 "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+	return keclass;
+}
+
 static void hw_engine_class_defaults_fini(struct drm_device *drm, void *arg)
 {
 	struct kobject *kobj = arg;
@@ -229,6 +263,10 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 				 err);
 			goto err_object;
 		}
+
+		err = sysfs_create_files(&keclass->base, files);
+		if (err)
+			goto err_object;
 	}
 
 	err = drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini,
-- 
2.25.1


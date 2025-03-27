Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED4C36011
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 12:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88110E32B;
	Thu, 27 Mar 2025 12:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Phepl3gh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB0B10E32B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743077961; x=1774613961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhZeWa1dwmmwa2EBKV1UbVWe40zLplZMEzLaBIc0hi4=;
 b=Phepl3ghVh/scj9mEw78B1X8Z5/RtRvWVzxNoCxZyp/zP6jzGJ2FzuCH
 XUVYxmmVR0OP3jyririNlQugCyx1qpBvlR6aFFpGnccNXG7Y+P9DHiEtD
 yQCsEXFJbXXqKLF3Ns2IrIXqgmbGqyLBQXD1w6nAR7U+eMykhgi1OapAS
 OX4RZRxQg4nSvT5PreqMKArZMM+8GIN0gFn9h/AvVk3GPjeMITOxlDpIU
 29SdiD8EwgcQMukCEv846sfS36kU8KraPpUUR8Fq798TRPUu6n5sIE2Y7
 j92UnabPgd4dTfRLS+5ykV3En0TCwD4qfH+CO0l9Cl1aJbI1HCSIbMjLy g==;
X-CSE-ConnectionGUID: mI/SKsbHQGOoHC+Dj3IKDQ==
X-CSE-MsgGUID: LLGyg/zcTDiVANBw69NsMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66877292"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="66877292"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:19:21 -0700
X-CSE-ConnectionGUID: cHWVTiu0TpqKpm3ewQmejw==
X-CSE-MsgGUID: tm/jwfyAStqSng1iUAV9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="124923746"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:19:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/hw_engine: define sysfs_ops on all directories
Date: Thu, 27 Mar 2025 17:56:47 +0530
Message-Id: <20250327122647.886637-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Sysfs_ops needs to be defined on all directories which
can have attr files with set/get method. Add sysfs_ops
to even those directories which is currently empty but
would have attr files with set/get method in future.
Leave .default with default sysfs_ops as it will never
have setter method.

V2(Himal/Rodrigo):
 - use single sysfs_ops for all dir and attr with set/get
 - add default ops as ./default does not need runtime pm at all

Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 108 +++++++++---------
 1 file changed, 52 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index e238c0e9fdd0..640950172088 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -32,14 +32,61 @@ bool xe_hw_engine_timeout_in_range(u64 timeout, u64 min, u64 max)
 	return timeout >= min && timeout <= max;
 }
 
-static void kobj_xe_hw_engine_release(struct kobject *kobj)
+static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
 {
 	kfree(kobj);
 }
 
+static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
+						  struct attribute *attr,
+						  char *buf)
+{
+	struct xe_device *xe = kobj_to_xe(kobj);
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->show) {
+		xe_pm_runtime_get(xe);
+		ret = kattr->show(kobj, kattr, buf);
+		xe_pm_runtime_put(xe);
+	}
+
+	return ret;
+}
+
+static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
+						   struct attribute *attr,
+						   const char *buf,
+						   size_t count)
+{
+	struct xe_device *xe = kobj_to_xe(kobj);
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->store) {
+		xe_pm_runtime_get(xe);
+		ret = kattr->store(kobj, kattr, buf, count);
+		xe_pm_runtime_put(xe);
+	}
+
+	return ret;
+}
+
+static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
+	.show = xe_hw_engine_class_sysfs_attr_show,
+	.store = xe_hw_engine_class_sysfs_attr_store,
+};
+
 static const struct kobj_type kobj_xe_hw_engine_type = {
-	.release = kobj_xe_hw_engine_release,
-	.sysfs_ops = &kobj_sysfs_ops
+	.release = xe_hw_engine_sysfs_kobj_release,
+	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
+};
+
+static const struct kobj_type kobj_xe_hw_engine_type_def = {
+	.release = xe_hw_engine_sysfs_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
 };
 
 static ssize_t job_timeout_max_store(struct kobject *kobj,
@@ -543,7 +590,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 	if (!kobj)
 		return -ENOMEM;
 
-	kobject_init(kobj, &kobj_xe_hw_engine_type);
+	kobject_init(kobj, &kobj_xe_hw_engine_type_def);
 	err = kobject_add(kobj, parent, "%s", ".defaults");
 	if (err)
 		goto err_object;
@@ -560,57 +607,6 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 }
 ALLOW_ERROR_INJECTION(xe_add_hw_engine_class_defaults, ERRNO); /* See xe_pci_probe() */
 
-static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
-{
-	kfree(kobj);
-}
-
-static ssize_t xe_hw_engine_class_sysfs_attr_show(struct kobject *kobj,
-						  struct attribute *attr,
-						  char *buf)
-{
-	struct xe_device *xe = kobj_to_xe(kobj);
-	struct kobj_attribute *kattr;
-	ssize_t ret = -EIO;
-
-	kattr = container_of(attr, struct kobj_attribute, attr);
-	if (kattr->show) {
-		xe_pm_runtime_get(xe);
-		ret = kattr->show(kobj, kattr, buf);
-		xe_pm_runtime_put(xe);
-	}
-
-	return ret;
-}
-
-static ssize_t xe_hw_engine_class_sysfs_attr_store(struct kobject *kobj,
-						   struct attribute *attr,
-						   const char *buf,
-						   size_t count)
-{
-	struct xe_device *xe = kobj_to_xe(kobj);
-	struct kobj_attribute *kattr;
-	ssize_t ret = -EIO;
-
-	kattr = container_of(attr, struct kobj_attribute, attr);
-	if (kattr->store) {
-		xe_pm_runtime_get(xe);
-		ret = kattr->store(kobj, kattr, buf, count);
-		xe_pm_runtime_put(xe);
-	}
-
-	return ret;
-}
-
-static const struct sysfs_ops xe_hw_engine_class_sysfs_ops = {
-	.show = xe_hw_engine_class_sysfs_attr_show,
-	.store = xe_hw_engine_class_sysfs_attr_store,
-};
-
-static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
-	.release = xe_hw_engine_sysfs_kobj_release,
-	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
-};
 
 static void hw_engine_class_sysfs_fini(void *arg)
 {
@@ -641,7 +637,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 	if (!kobj)
 		return -ENOMEM;
 
-	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
+	kobject_init(kobj, &kobj_xe_hw_engine_type);
 
 	err = kobject_add(kobj, gt->sysfs, "engines");
 	if (err)
-- 
2.34.1


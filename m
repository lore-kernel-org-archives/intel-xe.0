Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9251FC35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 12:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5543A10E30B;
	Wed, 19 Mar 2025 12:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1n0tmI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEDE10E30B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Mar 2025 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742385994; x=1773921994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/QP5wKi7EXwmBCyXUbFGdiiUT955jyHEQfGQ7U1Pp/E=;
 b=B1n0tmI5uSBQFatTfOPzDFMn/bxhMDbzpD9tUp28XbLaxtZSqICeOuod
 qQz+mh57qTZF5e4FlJskOcjsM57SI2NIem106CdbrcGLAPgR/+FfkJoUO
 qg1s8n8PoD78pVI8cPCV0aI4oFswJUmd4cREykYp3HjQU3MhwFbC42x3C
 fqj7tWr7H8QL5LE33QwjpAQchptXZy4L3PeC6aWwPHPUfMaRJRzxM4Roo
 56T3dTUH+heMmVsLGEq50g4lL2pA5DEn19zG1dccC81Su//vdYmKXKsWJ
 rQek3UBPT2t3c6liRvrxnxLbXXPLqtR4fyygzNgcyghy4WoJdnwrBIxMb g==;
X-CSE-ConnectionGUID: YkARwvAnQGaLsDCn3v47CQ==
X-CSE-MsgGUID: w8MufV2jQTOATvhzxz5rcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54564774"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="54564774"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:06:32 -0700
X-CSE-ConnectionGUID: /Vv3pRssQ3+qC6pDVeWJPg==
X-CSE-MsgGUID: kiThxSLMRM682DLBAeGrwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122617650"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 05:06:30 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: sysfs_ops needs to be defined on parent directory
Date: Wed, 19 Mar 2025 17:43:49 +0530
Message-Id: <20250319121349.288844-1-tejas.upadhyay@intel.com>
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

Currently, xe_hw_engine_sysfs_kobj_type is defining sysfs_ops
on wrong directory. Sysfs_ops needs to be defined on immediate
parent directory to be able to called on each attribute set/get.

Fixes: 3f0e14651ab0 ("drm/xe: Runtime PM wake on every sysfs call")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 67 +++++++++----------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index b53e8d2accdb..25592f178482 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -492,39 +492,6 @@ static const struct attribute * const files[] = {
 	NULL
 };
 
-static void kobj_xe_hw_engine_class_fini(void *arg)
-{
-	struct kobject *kobj = arg;
-
-	sysfs_remove_files(kobj, files);
-	kobject_put(kobj);
-}
-
-static struct kobj_eclass *
-kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
-{
-	struct kobj_eclass *keclass;
-	int err = 0;
-
-	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
-	if (!keclass)
-		return NULL;
-
-	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
-	if (kobject_add(&keclass->base, parent, "%s", name)) {
-		kobject_put(&keclass->base);
-		return NULL;
-	}
-	keclass->xe = xe;
-
-	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
-				       &keclass->base);
-	if (err)
-		return NULL;
-
-	return keclass;
-}
-
 static void hw_engine_class_defaults_fini(void *arg)
 {
 	struct kobject *kobj = arg;
@@ -611,6 +578,38 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
 	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
 };
 
+static void kobj_xe_hw_engine_class_fini(void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, files);
+	kobject_put(kobj);
+}
+
+static struct kobj_eclass *
+kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
+{
+	struct kobj_eclass *keclass;
+	int err = 0;
+
+	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
+	if (!keclass)
+		return NULL;
+
+	kobject_init(&keclass->base, &xe_hw_engine_sysfs_kobj_type);
+	if (kobject_add(&keclass->base, parent, "%s", name)) {
+		kobject_put(&keclass->base);
+		return NULL;
+	}
+	keclass->xe = xe;
+
+	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
+				       &keclass->base);
+	if (err)
+		return NULL;
+
+	return keclass;
+}
 static void hw_engine_class_sysfs_fini(void *arg)
 {
 	struct kobject *kobj = arg;
@@ -640,7 +639,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 	if (!kobj)
 		return -ENOMEM;
 
-	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
+	kobject_init(kobj, &kobj_xe_hw_engine_type);
 
 	err = kobject_add(kobj, gt->sysfs, "engines");
 	if (err)
-- 
2.34.1


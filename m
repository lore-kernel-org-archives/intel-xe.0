Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D07C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 21:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FFA10E09B;
	Mon, 10 Apr 2023 21:34:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D827010E09B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681162470; x=1712698470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FbzV9rs1fS2sqpoD9XG/kQfJr+e0qAt+A+uKHz49Bko=;
 b=QuEaM4rixBV3fDuLl83Cn4jUbb4mq7akQAN/9otlvZnSYqkt70qQO7Sw
 w7Rd0gbFPf4SDpjPHi9rKJNJMPs9HLCxEVzKbgblpBM3sCW4f01xvGNw5
 FnXvQerdxiYAuL+picoPUot+083wS5Knv6SmJq+vht0QT3qGo5LTXIAOn
 qsg/SkVxHo7wnwQHlMch08a0Sa/KoBqZweatT+9JXafRn92SKPD7obneP
 pNbqm4ME0xMZto0WjYT5j8EWmjsfLGh6Ew+e66tCL+biM3qAEKyHqXlKC
 j5itRBh4nABW3ku5rgpVMHZsHKrCH2GZ8ih00LOSu1u72sprmuX2ppHT7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323823122"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323823122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 14:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777674289"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="777674289"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 14:34:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 10 Apr 2023 14:34:33 -0700
Message-Id: <20230410213433.625866-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Don't grab runtime PM ref in engine
 create IOCTL
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

A VM had a runtime PM ref, a engine can't be created without a VM, and
the engine holds a ref to the VM thus this is unnecessary. Beyond that
taking a ref in the engine create IOCTL and dropping it in the destroy
IOCTL is wrong as a user doesn't have to call the destroy IOCTL (e.g.
they can just kill the process or close the driver FD). If a user does
this PM refs are leaked.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 43 ++++++++++------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 37209b13bcd6..094ec17d3004 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -539,8 +539,6 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, eci[0].gt_id >= xe->info.tile_count))
 	       return -EINVAL;
 
-	xe_pm_runtime_get(xe);
-
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
 			struct xe_engine *new;
@@ -552,16 +550,12 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			logical_mask = bind_engine_logical_mask(xe, gt, eci,
 								args->width,
 								args->num_placements);
-			if (XE_IOCTL_ERR(xe, !logical_mask)) {
-				err = -EINVAL;
-				goto put_rpm;
-			}
+			if (XE_IOCTL_ERR(xe, !logical_mask))
+				return -EINVAL;
 
 			hwe = find_hw_engine(xe, eci[0]);
-			if (XE_IOCTL_ERR(xe, !hwe)) {
-				err = -EINVAL;
-				goto put_rpm;
-			}
+			if (XE_IOCTL_ERR(xe, !hwe))
+				return -EINVAL;
 
 			migrate_vm = xe_migrate_get_vm(gt->migrate);
 			new = xe_engine_create(xe, migrate_vm, logical_mask,
@@ -576,7 +570,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 				err = PTR_ERR(new);
 				if (e)
 					goto put_engine;
-				goto put_rpm;
+				return err;
 			}
 			if (id == 0)
 				e = new;
@@ -589,30 +583,22 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		logical_mask = calc_validate_logical_mask(xe, gt, eci,
 							  args->width,
 							  args->num_placements);
-		if (XE_IOCTL_ERR(xe, !logical_mask)) {
-			err = -EINVAL;
-			goto put_rpm;
-		}
+		if (XE_IOCTL_ERR(xe, !logical_mask))
+			return -EINVAL;
 
 		hwe = find_hw_engine(xe, eci[0]);
-		if (XE_IOCTL_ERR(xe, !hwe)) {
-			err = -EINVAL;
-			goto put_rpm;
-		}
+		if (XE_IOCTL_ERR(xe, !hwe))
+			return -EINVAL;
 
 		vm = xe_vm_lookup(xef, args->vm_id);
-		if (XE_IOCTL_ERR(xe, !vm)) {
-			err = -ENOENT;
-			goto put_rpm;
-		}
+		if (XE_IOCTL_ERR(xe, !vm))
+			return -ENOENT;
 
 		e = xe_engine_create(xe, vm, logical_mask,
 				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
 		xe_vm_put(vm);
-		if (IS_ERR(e)) {
-			err = PTR_ERR(e);
-			goto put_rpm;
-		}
+		if (IS_ERR(e))
+			return PTR_ERR(e);
 	}
 
 	if (args->extensions) {
@@ -642,8 +628,6 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 put_engine:
 	xe_engine_kill(e);
 	xe_engine_put(e);
-put_rpm:
-	xe_pm_runtime_put(xe);
 	return err;
 }
 
@@ -750,7 +734,6 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
 
 	trace_xe_engine_close(e);
 	xe_engine_put(e);
-	xe_pm_runtime_put(xe);
 
 	return 0;
 }
-- 
2.34.1


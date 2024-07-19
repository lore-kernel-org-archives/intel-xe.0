Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A285C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E7310E8E3;
	Fri, 19 Jul 2024 17:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5sfmJ2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9BE10E8E3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721409770; x=1752945770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kox6gziR0dAL7d1KnNIvj5ZBQqfTLoFv+ETfBWtC3K8=;
 b=K5sfmJ2IEkvRDsj5SIeQiCWnQueULswjjBTMODLaAyOu9yR4I2d6USPS
 HDV7N124rcByFTfmHL/SeO91fRX0RBKY9ATV4Czfb5i2RcyHIjH3SyDqk
 Dto8wYTic5UvUOGAE/i7A8MGAE1jHa2FpRF4n9jrataGSjlSnGvIuPOtC
 1TajHxbLS2khSIg4u72t5jMSCB5KrnjukSfuq6/yTVFj2ra0H90Gr3Ckj
 ypSS2wT+TytFbvdbcay97aIUxy9E5T9G5B/wUfj1qMe0baC6P1ju3/uTn
 dwEvPcM1tDJipQaGbFktUrY4HPwqJPivCzFARO5k/QEBc5eaTZAlF8q2c g==;
X-CSE-ConnectionGUID: JDda6F49RBOq74e+lNCXqg==
X-CSE-MsgGUID: 1DfzrLIdTz2c61kqx7WAFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22843858"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="22843858"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:22:49 -0700
X-CSE-ConnectionGUID: xRMWfQtNQqK2daeGbKi9ww==
X-CSE-MsgGUID: dWLptL8fRuS1HNP+lJ6j0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55728889"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:22:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied to
 an array of binds
Date: Fri, 19 Jul 2024 10:23:34 -0700
Message-Id: <20240719172334.1527484-1-matthew.brost@intel.com>
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

The size of an array of binds is directly tied to several kmalloc in the
KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
the case of these failures.

The expected UMD behavior upon returning -ENOBUFS is to split an array
of binds into a series of single binds.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3fde2c8292ad..b715883f40d8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -718,7 +718,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
+static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
 
@@ -731,7 +731,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
 				      sizeof(*vops->pt_update_ops[i].ops),
 				      GFP_KERNEL);
 		if (!vops->pt_update_ops[i].ops)
-			return -ENOMEM;
+			return array_of_binds ? -ENOBUFS : -ENOMEM;
 	}
 
 	return 0;
@@ -824,7 +824,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			goto free_ops;
 	}
 
-	err = xe_vma_ops_alloc(&vops);
+	err = xe_vma_ops_alloc(&vops, false);
 	if (err)
 		goto free_ops;
 
@@ -871,7 +871,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	if (err)
 		return ERR_PTR(err);
 
-	err = xe_vma_ops_alloc(&vops);
+	err = xe_vma_ops_alloc(&vops, false);
 	if (err) {
 		fence = ERR_PTR(err);
 		goto free_ops;
@@ -2765,7 +2765,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 					   sizeof(struct drm_xe_vm_bind_op),
 					   GFP_KERNEL | __GFP_ACCOUNT);
 		if (!*bind_ops)
-			return -ENOMEM;
+			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
 
 		err = __copy_from_user(*bind_ops, bind_user,
 				       sizeof(struct drm_xe_vm_bind_op) *
@@ -3104,7 +3104,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
-	err = xe_vma_ops_alloc(&vops);
+	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
 	if (err)
 		goto unwind_ops;
 
-- 
2.34.1


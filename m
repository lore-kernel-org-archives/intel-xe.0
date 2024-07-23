Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCEEC3DA5D
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 01:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036F10E112;
	Tue, 23 Jul 2024 01:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfSItbt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CAE10E112
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 01:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721697378; x=1753233378;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lfHshuDr3qYMcwh/iDSkpf+4+t9+ibCPJy5m/us6a2U=;
 b=GfSItbt865nkXB9lOY5s8W18p/q9bZW3ueIEW5QJpvjbVXhjq+JkmIaN
 FTMadtJ9C6KXNIxXITA6wJtbbDh3DwH77fAcOezmJiO9EOB4XZ/kAVU15
 oWesLTyUX6AwONtnuCG/BUJ8PClrDzP6DPO2t2jf+hPMw7JE+KJWZvbd5
 0JpoLZoiTJxknV/SntJiVCzJFmtMPkXK7gC4A7Hua2Fi5QvLXHKes2EjQ
 QmFuUoh4fB3QSri/GiYH5qlGzuTBzApNUr211VYaEXqvodt5x2+KB0x3o
 uEFchpiCKrSq6GsNyOiNLMXBiCC80pP6vh5+WDxxbONX+HE81AiNJRStd w==;
X-CSE-ConnectionGUID: V7kgNnWAQmGevLYtW6udcQ==
X-CSE-MsgGUID: gasjeJXCQ7OQ+j8MuQYvPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19423886"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19423886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 18:16:17 -0700
X-CSE-ConnectionGUID: oCWy/1X5STC0yJBIT89VHg==
X-CSE-MsgGUID: djSCyaXkQKi1pddMM3caLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="52122422"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 18:16:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
Date: Mon, 22 Jul 2024 18:17:02 -0700
Message-Id: <20240723011702.1684013-1-matthew.brost@intel.com>
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

v2:
 - Resend for CI
v3:
 - Resend for CI

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fa2821d0c64..12d43c35978c 100644
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
@@ -2766,7 +2766,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 					   sizeof(struct drm_xe_vm_bind_op),
 					   GFP_KERNEL | __GFP_ACCOUNT);
 		if (!*bind_ops)
-			return -ENOMEM;
+			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
 
 		err = __copy_from_user(*bind_ops, bind_user,
 				       sizeof(struct drm_xe_vm_bind_op) *
@@ -3105,7 +3105,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
-	err = xe_vma_ops_alloc(&vops);
+	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
 	if (err)
 		goto unwind_ops;
 
-- 
2.34.1


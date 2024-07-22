Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76472C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 20:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DCC10E2DA;
	Mon, 22 Jul 2024 20:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZ14rInp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B5B10E05A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 20:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721679973; x=1753215973;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y3npR52/y/Zzd4VT7r8BEJhAZnuJ945a/05iRM6m6Fs=;
 b=JZ14rInp2Xw5Mnnyz0tSJYWTMlCQ0YNuCchf7rqPvkMDb0A5ktmHdbny
 /kxSlIH0918t2tQmP4mgah2S9gd7wQsIDV9BTgsiEb1NBU1tgz0r/73vR
 a63R2MPPcVjP+t0M3ncAYMyxf+cPOltn9CvTh6e+mJiEygBDcnvXIzRoS
 7zpkCmEQ4IL8HjPNZ5bHi1qOR4qsd+jqb1cTOog4v18se9t5somwz42Np
 v9quYyAcEPriKbX3LTaP5w59WIapGrcyyQ0eXuSGpCZXp7i6Jjor5I3Ew
 p0XgBDkiJy0ibNhZBhSigct64r7De0vqmrSUm8RcDN6GBbIb0zK67u3Ji Q==;
X-CSE-ConnectionGUID: 0p1teKaIQGuMKHjAZQAGng==
X-CSE-MsgGUID: x/E086lDTG2mKS/A8vUMFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19146884"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19146884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:26:12 -0700
X-CSE-ConnectionGUID: W41n33kST76FcghTzJzK7g==
X-CSE-MsgGUID: k3KrF+krTT6a8cEZqTWOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="56838764"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:26:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
Date: Mon, 22 Jul 2024 13:26:57 -0700
Message-Id: <20240722202657.1601192-1-matthew.brost@intel.com>
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

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e703e3bf8748..3b321da14096 100644
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


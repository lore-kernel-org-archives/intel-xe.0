Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C324C369A0
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 07:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5A10E7A9;
	Wed, 25 Sep 2024 07:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijrXJEzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFADA10E7A9
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727248483; x=1758784483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RQewIJ5jgRSChN9kL832GTgVw+SPwAtAdiiaLGzOHtM=;
 b=ijrXJEzokBEvOx9YuOKtspxl4sq3DBYZ7VjEB1+aTCAppdtknZCNs9Nb
 D7mqJkaYas9mWo4LR4bfbYHaRw4pqpGPlF5gt2Z+Hh2S8ug+iqCf94KWW
 PfkeLFTO186b7eNhMJ2lVHuXjiRerakFE4TGsti2qkpVm0OC7rd5Sflut
 vOHuRjBULyPpaCyVi981zBlENuekbBTpRoCyjDvtYQImiebIs+baFLtrj
 NtYKFRlPczdtZvXs4F6goI7j0rjmuKaavXzOawTZqX11K51MMOklBrozB
 TfnVEytuxfFsILYw0ZgCflcW3CsIp+TSLC5BnkxtXLtcRJPDDKV0OWX4P Q==;
X-CSE-ConnectionGUID: LmbG5xYiSYeL7mRwQaiRRA==
X-CSE-MsgGUID: ehF3AOsoRQuJ+8IanO0DNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="43799267"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="43799267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 00:14:42 -0700
X-CSE-ConnectionGUID: Lnf2aRSkSzyoV37u0Q2UCA==
X-CSE-MsgGUID: SRW01/YcTWeTyHHXvP+Zjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="76185436"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.236])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 00:14:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm/xe/vm: move xa_alloc to prevent UAF
Date: Wed, 25 Sep 2024 08:14:27 +0100
Message-ID: <20240925071426.144015-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
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

Evil user can guess the next id of the vm before the ioctl completes and
then call vm destroy ioctl to trigger UAF since create ioctl is still
referencing the same vm. Move the xa_alloc all the way to the end to
prevent this.

v2:
 - Rebase

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_vm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 31fe31db3fdc..ce9dca4d4e87 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1765,10 +1765,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
-	if (err)
-		goto err_close_and_put;
-
 	if (xe->info.has_asid) {
 		down_write(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
@@ -1776,12 +1772,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 				      &xe->usm.next_asid, GFP_KERNEL);
 		up_write(&xe->usm.lock);
 		if (err < 0)
-			goto err_free_id;
+			goto err_close_and_put;
 
 		vm->usm.asid = asid;
 	}
 
-	args->vm_id = id;
 	vm->xef = xe_file_get(xef);
 
 	/* Record BO memory for VM pagetable created against client */
@@ -1794,10 +1789,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
 #endif
 
+	/* user id alloc must always be last in ioctl to prevent UAF */
+	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
+	if (err)
+		goto err_close_and_put;
+
+	args->vm_id = id;
+
 	return 0;
 
-err_free_id:
-	xa_erase(&xef->vm.xa, id);
 err_close_and_put:
 	xe_vm_close_and_put(vm);
 
-- 
2.46.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B5DC25B5E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0E611A0EC;
	Thu, 25 Apr 2024 04:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7mBop/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C411A0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020884; x=1745556884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q+CHYThN+MUUUZSjtMQj5+jVmfuMVMaR6c+EYNuiG0A=;
 b=F7mBop/iDQFtEPaCMz/7W8Do7g1uKxt+p5lXHdyuh+nDFJdi2XEks+93
 cl/2GYmex7WgVosGonhOcuZIeix1wlwNRIb7s+6RhUXMMM+9VhVeOPdoE
 iDr+FTB+jhvKFEeqz4OOWlRsKOeN6TyXaSjoypHEJHo9ccXB8djDGRZ9o
 fonghGZcO978mmJ57z71Nzbm2VSy5RgUTVH7h2cD8vJjWUZtEtuA2ishN
 Samf4u+Zr+qENLAYQpkWHadiPcM5WAwiPhyXXeqsgJ9f2d9hzV7elUs1Q
 Izd2bgsM7zn9nhfcbRPyfka8V60TD8zurA7G3dw3/WQ/b6SVBQv2Irar1 g==;
X-CSE-ConnectionGUID: WUjW18wvRh+8l+rY4b2B1w==
X-CSE-MsgGUID: ATjgo3g4QJy7n1jO8JxV7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374880"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374880"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:44 -0700
X-CSE-ConnectionGUID: Pwsk2DrOSEelNkFmDSKBqQ==
X-CSE-MsgGUID: HL5Q+Ab0TcmLkTOGsVL4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996504"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 10/13] drm/xe: Move ufence check to op_lock_and_prep
Date: Wed, 24 Apr 2024 21:55:10 -0700
Message-Id: <20240425045513.1913039-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425045513.1913039-1-matthew.brost@intel.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
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

Rather than checking for an unsignaled ufence ay unbind time, check for
this during the op_lock_and_prep function. This helps with the
transition to job 1 per VM bind IOCTL.

v2:
 - Rebase
v3:
 - Fix typo in commit message (Oak)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fe824ff5346f..3d642bc3cb28 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1637,16 +1637,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	trace_xe_vma_unbind(vma);
 
-	if (vma->ufence) {
-		struct xe_user_fence * const f = vma->ufence;
-
-		if (!xe_sync_ufence_get_status(f))
-			return ERR_PTR(-EBUSY);
-
-		vma->ufence = NULL;
-		xe_sync_ufence_put(f);
-	}
-
 	if (number_tiles > 1) {
 		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
@@ -2701,6 +2691,21 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 	return err;
 }
 
+static int check_ufence(struct xe_vma *vma)
+{
+	if (vma->ufence) {
+		struct xe_user_fence * const f = vma->ufence;
+
+		if (!xe_sync_ufence_get_status(f))
+			return -EBUSY;
+
+		vma->ufence = NULL;
+		xe_sync_ufence_put(f);
+	}
+
+	return 0;
+}
+
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			    struct xe_vma_op *op)
 {
@@ -2713,6 +2718,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    op->map.immediate);
 		break;
 	case DRM_GPUVA_OP_REMAP:
+		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
+		if (err)
+			break;
+
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
 					    false);
@@ -2722,6 +2731,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			err = vma_lock_and_validate(exec, op->remap.next, true);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
+		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
+		if (err)
+			break;
+
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.unmap.va),
 					    false);
-- 
2.34.1


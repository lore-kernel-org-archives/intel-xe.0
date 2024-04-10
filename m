Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F45CD1299
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABC5113174;
	Wed, 10 Apr 2024 05:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dwa75BVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9152F113173
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727634; x=1744263634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Dsb/WPiV6eVRPnTme1Q8oTDNcnFJnpjfECGoUPuRV4=;
 b=Dwa75BVOSAbDZ7aXVbjOEf4vxHEqcAqw1fqqViyAUU5UOqMpAeQpfkL+
 c570lMvsGx+9FLroj9pkjb0uWTUjoJ3ZIdjZ6Vk269QhSwvLE36XGqYwP
 Zo6EfMwgPJQVJPcY78/Ib6LlyQkBAPp5rpYIXRKEWTlyPlrex9xl8hf7U
 qB3MaV0OOu4v27GLyt493H/wvLjAJFIg/T6Vtt+4Zom85QaymZ3jeR/eP
 TiD5DPw0WSw43G1syBk/7mzvBw4xGef6m8ozOb7l0KepEIX/l8EGlGCC8
 +LiriJAnBZxclyGoWbo24uWWZ9AuesSLATOiTyW1wRCB3jy1qXY7QHZuy Q==;
X-CSE-ConnectionGUID: iJIkzM4lTNWFdY7YRBKzEw==
X-CSE-MsgGUID: UvUTenkxRwCwfiw3l0BZnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680009"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:34 -0700
X-CSE-ConnectionGUID: A0NrGMuVTxOM+jZZKwdjRA==
X-CSE-MsgGUID: n8rzoHJ4QkiEENqPNO5REA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536849"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 10/13] drm/xe: Move ufence check to op_lock
Date: Tue,  9 Apr 2024 22:40:53 -0700
Message-Id: <20240410054056.478023-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410054056.478023-1-matthew.brost@intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
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
this during the op_lock function. This will help with the transition to
job 1 per VM bind IOCTL.

v2:
 - Rebase

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 97384c77f662..0319e70577fe 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1755,16 +1755,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
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
@@ -2819,6 +2809,21 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
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
@@ -2830,6 +2835,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    !xe_vm_in_fault_mode(vm));
 		break;
 	case DRM_GPUVA_OP_REMAP:
+		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
+		if (err)
+			break;
+
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.remap.unmap->va),
 					    false);
@@ -2839,6 +2848,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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


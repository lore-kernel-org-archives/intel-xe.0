Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D20C19F53
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF0A10FEF2;
	Wed, 24 Apr 2024 17:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMEJAcnd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6092610FF33
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713979465; x=1745515465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x50UMQ8GlrvjcWlkwj3iRbFA+ObdbvETfDFZsKvodto=;
 b=lMEJAcndLxfJ6Eez+7bBhOhAj8RHK+5I9pLNApe7uxljeievorVUFgnh
 ++rf6sWi3IDEO7puqOUSSkzubVGbhhUUK+9OWR3evRRjfh+q6QXJ7AHCR
 ypKORoOfuQ25DrwZQpi/B62y61Vp0XBlwrt4lpncQfEUyFrpjDDpQsFlW
 3ow7lBeuHYA80Y2YC8Z1Oj/Xi+MCbl7d5w16Q2/REXOoch5R6mkS6EjpP
 WwUY9xQeR6vPF82LjzJvNbKb1EAsfS9hBwjQ/MtbWSB+Zhb+tPNKsp5km
 XfiWC/8E2Xt/eCZqd1jfsxPSKeNzD1/9rcsj1tpahB+uVBtOd1WBb0WRT w==;
X-CSE-ConnectionGUID: rGr+0XwFRxGjzL/OLeSP8w==
X-CSE-MsgGUID: Xnm24eyMRYGrjWkaixmVjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12561484"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12561484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:23 -0700
X-CSE-ConnectionGUID: J9A3mG0BRH2+zwBjiH4NsA==
X-CSE-MsgGUID: LuM1UMTLSd2tQKuZ7FdmBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24825510"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 10/13] drm/xe: Move ufence check to op_lock_and_prep
Date: Wed, 24 Apr 2024 10:23:49 -0700
Message-Id: <20240424172352.1704851-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
References: <20240424172352.1704851-1-matthew.brost@intel.com>
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
index 93a2c113ad1a..9f561763e287 100644
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


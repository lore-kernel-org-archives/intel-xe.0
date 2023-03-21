Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47541C76195
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 23:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E8210E195;
	Tue, 21 Mar 2023 23:42:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86910E195
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 23:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679442134; x=1710978134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8gR1F6eKam/fmPvXvfq8NA8ZXgFQypbXUDWQS7Xx4tI=;
 b=OFLtSemMxGA1RDOiKmtW22S/UiFd+ZVjbCCgS/j60i4Ja7SzPoz54mDX
 Rnkq85n0cKNcEfwy2gI3jzrGNZLcPJEloHM7hJH8R7rdtvwtMJPtBrrnC
 XnztJ7EpCKaGdgdfEEZ2V2z/mDXSAXLFJWwtqHywN5JyBl4EbG2Yp85yV
 V3Wwsow7bxl/c40rnlPI+GplqNQLvpSgrvC5VFWndZmuaaFZ07I+/myTV
 6om3ivVrXpeWGet+SxWqlKkHcdFftNhUIIXL1KHYEAVKARrT8Sa8JqmOz
 xfM9K7LeWb9Fk3jTCtBzSn534e/vlJvMnq2J/wGOsu10BArqyjavVm+Ty A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322926681"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="322926681"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631780120"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="631780120"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 16:42:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 16:42:17 -0700
Message-Id: <20230321234217.692726-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321234217.692726-1-matthew.brost@intel.com>
References: <20230321234217.692726-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Move in fault mode / non-fault mode
 check to xe_vm_create
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

The check for fault mode / non-fault mode was in the VM create IOCTL
before VM creation and not under a lock. The increment was after VM
creation under the lock. This is racey. Move both the check and
increment to xe_vm_create before actual creation and have the lock for
both of these steps.

Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 45 ++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e7674612a57e..965cad81b02a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1060,9 +1060,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	struct xe_gt *gt;
 	u8 id;
 
+	err = mutex_lock_interruptible(&xe->usm.lock);
+	if (err)
+		return ERR_PTR(err);
+	if (XE_IOCTL_ERR(xe, flags & XE_VM_FLAG_FAULT_MODE &&
+			 xe_device_in_non_fault_mode(xe)) ||
+	    XE_IOCTL_ERR(xe, !(flags & XE_VM_FLAG_MIGRATION) &&
+			 xe_device_in_fault_mode(xe))) {
+		mutex_unlock(&xe->usm.lock);
+		return ERR_PTR(-EINVAL);
+	}
+	if (flags & XE_VM_FLAG_FAULT_MODE)
+		xe->usm.num_vm_in_fault_mode++;
+	else if (!(flags & XE_VM_FLAG_MIGRATION))
+		xe->usm.num_vm_in_non_fault_mode++;
+	mutex_unlock(&xe->usm.lock);
+
 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
-	if (!vm)
-		return ERR_PTR(-ENOMEM);
+	if (!vm) {
+		err = -ENOMEM;
+		goto err_usm;
+	}
 
 	vm->xe = xe;
 	kref_init(&vm->refcount);
@@ -1182,13 +1200,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (number_gts > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
-	mutex_lock(&xe->usm.lock);
-	if (flags & XE_VM_FLAG_FAULT_MODE)
-		xe->usm.num_vm_in_fault_mode++;
-	else if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe->usm.num_vm_in_non_fault_mode++;
-	mutex_unlock(&xe->usm.lock);
-
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -1220,6 +1231,14 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_device_mem_access_put(xe);
 		xe_pm_runtime_put(xe);
 	}
+err_usm:
+	mutex_lock(&xe->usm.lock);
+	if (flags & XE_VM_FLAG_FAULT_MODE)
+		xe->usm.num_vm_in_fault_mode--;
+	else if (!(flags & XE_VM_FLAG_MIGRATION))
+		xe->usm.num_vm_in_non_fault_mode--;
+	mutex_unlock(&xe->usm.lock);
+
 	return ERR_PTR(err);
 }
 
@@ -1843,14 +1862,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
-			 xe_device_in_non_fault_mode(xe)))
-		return -EINVAL;
-
-	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
-			 xe_device_in_fault_mode(xe)))
-		return -EINVAL;
-
 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
 			 !xe->info.supports_usm))
 		return -EINVAL;
-- 
2.34.1


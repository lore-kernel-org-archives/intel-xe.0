Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547C6C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5F610E803;
	Fri, 24 Nov 2023 15:23:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F290110E802
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700839427; x=1732375427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6ENcmS508D5MxjMDqob5A8HURD3QW5XgEk5uBxzxRE=;
 b=MuFZUYJQw7tQnoipaXc8koMQyUytT/Ksfjt77x2ExHlckA3NvRy/AW5j
 HSmv+X2IfS8WYmGTOVjpSmw8fC0HQId9cJF6YCBbkUl/79mK26k0I66pZ
 RcxUNSlqbfADViDCmw4jlhLKQmrAtt0SyHikvo7blCDjOZfZ/lA/Kc9re
 0itlXTgglBdcOABnNAFx78fjfDy4z2Nb/kPR+kfCNazLm+lB/ksZsWymU
 Ej/NA+fBWzqWWXwskY0qQd9NKL8MnSusn8pZ5XO0VMz5NguwZ3C5Tulbe
 uc+YU3zBV19pMi4F49CW+ZZN4T2C8QZs/D6kMSps22TmgymEz6NLDh2bG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478647710"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478647710"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858407723"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="858407723"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:23:20 +0100
Message-ID: <20231124152320.97115-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124152320.97115-1-thomas.hellstrom@linux.intel.com>
References: <20231124152320.97115-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Use LR abbrev for long-running
 vms
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently we're using "compute mode" for long running VMs using
using preempt-fences for memory management, and "fault mode" for long
running VMs using page faults.

Change this to use the terminology "long-running" abbreviated as LR for
long-running VMs. These VMs can then either be in preempt-fence mode or
fault mode. The user can force fault mode at creation time, but otherwise
the driver can choose to use fault- or preempt-fence mode for long-running
vms depending on the device capabilities. Initially unless fault-mode is
specified, the driver uses preempt-fence mode.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c |  8 ++++----
 include/uapi/drm/xe_drm.h  | 20 +++++++++++++++++++-
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5a4483bb00b1..e2e1fbe7f7d1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1919,7 +1919,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 }
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
-				    DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE | \
+				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
 				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
 				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 
@@ -1955,7 +1955,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE &&
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
 			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
 		return -EINVAL;
 
@@ -1972,12 +1972,12 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
-	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
+	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
 		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
 		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
-		flags |= XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE;
+		flags |= XE_VM_FLAG_FAULT_MODE;
 
 	vm = xe_vm_create(xe, flags);
 	if (IS_ERR(vm))
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 88f3aca02b08..4e9688c85db6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -589,8 +589,26 @@ struct drm_xe_vm_create {
 	__u64 extensions;
 
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
-#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
+	/*
+	 * An LR, or Long Running VM accepts exec submissions
+	 * to its exec_queues that don't have an upper time limit on
+	 * the job execution time. But exec submissions to these
+	 * don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
+	 * DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
+	 * used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
+	 * LR VMs can be forced to recoverable page-fault mode using
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, but the xe kernel driver is also
+	 * allowed to silently enable DRM_XE_VM_CREATE_FLAG_FAULT_MODE.
+	 */
+#define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
+	/*
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
+	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
+	 * on demand when accessed, and also allows per-VM overcommit of memory.
+	 * The xe driver does internally use recoverable pagefaults
+	 * to implement this.
+	 */
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
-- 
2.41.0


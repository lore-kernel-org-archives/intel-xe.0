Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BF1C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 15:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E199A10E2D1;
	Mon, 27 Nov 2023 15:03:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30C110E2BF
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701097429; x=1732633429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0m/4ETNuO5OXlw21TpyBWpGkmtLUek2E2j8fyMrlIBA=;
 b=aOv06O1RPRlitDPuT7HwANI9GM636qUN1uonj5ukkYN9P8e0lPuoor22
 nlOqj+A7IolFIlwaG2yBnV2jZOrMXO2xhoF+tBECU7ipy1EXfjh5Jnhce
 qtTt87UapVKyIQiA+5ghy84TKhKRVZWntLXWdAeMlxVFug3CT0wmXYIgZ
 L6SAGuLSdJ3C+VLEl+/ga14jN0/1z1PTS8BUKXFnZFC6uGqXbzuvRry1L
 Dfr0stnIu/70IsPxwx3RS5FLixpUDHnjk3MS2FN+mym45PJY9YI2Ul9lH
 des2dSlvwSpGNXtezZpwsC4mSQQZGKiEsjqgDyYHktiCTkZ8ixAGk4qE4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377752769"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="377752769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="761616452"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761616452"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.187])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:03:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 16:03:30 +0100
Message-ID: <20231127150330.38041-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231127150330.38041-1-thomas.hellstrom@linux.intel.com>
References: <20231127150330.38041-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/xe/uapi: Use LR abbrev for
 long-running vms
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
preempt-fences for memory management, and "fault mode" for long
running VMs using page faults.

Change this to use the terminology "long-running" abbreviated as LR for
long-running VMs. These VMs can then either be in preempt-fence mode or
fault mode. The user can force fault mode at creation time, but otherwise
the driver can choose to use fault- or preempt-fence mode for long-running
vms depending on the device capabilities. Initially unless fault-mode is
specified, the driver uses preempt-fence mode.

v2:
- Fix commit message wording and the documentation around
  CREATE_FLAG_LR_MODE and CREATE_FLAG_FAULT_MODE

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c |  8 ++++----
 include/uapi/drm/xe_drm.h  | 23 ++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index aa965e90ce12..6d35067ed8bc 100644
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
index 88f3aca02b08..2810997a6db4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -589,8 +589,29 @@ struct drm_xe_vm_create {
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
+	 * LR VMs can be created in recoverable page-fault mode using
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
+	 * If that flag is omitted, the UMD can not rely on the slightly
+	 * different per-VM overcommit semantics that are enabled by
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE (see below), but KMD may
+	 * still enable recoverable pagefaults if supported by the device.
+	 */
+#define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
+	/*
+	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
+	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
+	 * on demand when accessed, and also allows per-VM overcommit of memory.
+	 * The xe driver internally uses recoverable pagefaults to implement
+	 * this.
+	 */
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
-- 
2.41.0


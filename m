Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BDDC4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2759C10E75D;
	Thu, 30 Nov 2023 18:40:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0416210E764
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369630; x=1732905630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sY2jKxUeUQ/iW5CA8JppFFi247M88CW0eO7a/bN/XMI=;
 b=M7zKmDU/ScEqLDiuKFF1ghqTJ0AyGPijGs84D2eFYEXy1P/oWLzyue0V
 pbyBXt3rD3OuhcgPgCo/+mLswLCb/J3zS0YDyyVVKi6jMpoRL42/aFgmF
 P+6p4+tyDxj0h4HyK6ln7VIwH3dfsmliEdWEntAPjylNA1/6OyCzqTJaa
 Vmduv1iL2C8jHYRMwnwh8q4ytOHeOjW/R+yWEuco4U8JOWe9YKXxhF3Os
 P4yZRsCMdI3YcbvWuwsOeaTC3ETDk88tTWOCDAB2HjQr7PDnorYbn+UhQ
 KWN9kCG8I/6nPddNoTFBqsD7LoQQ7mHrsY+tf4B2dOL5Cuyo6edB2scOk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111752"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111752"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294968"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294968"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:29 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:53 +0000
Message-Id: <20231130183955.7-15-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 14/16] drm/xe/uapi: Use LR abbrev for
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

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
index 2c4cf1309753..e09050f16f07 100644
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
index 66c75a0e4fb6..84a477009e85 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -647,8 +647,29 @@ struct drm_xe_vm_create {
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
2.34.1


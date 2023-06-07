Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90030C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F8289DA9;
	Wed,  7 Jun 2023 11:05:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4883289DA9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686135934; x=1717671934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jMxdC22kJVkmG0asynPHcfWxfaBvMTbJk0JAYmLlXgM=;
 b=D57SdFxAiDxZcav6O2KM+dCBZAW31aiNVmv6R5/euYA2gLdh8PAGQXdA
 kuV5q7gadHhKR/mrbGg6SPRS+OXLRxvB3hZb9udLN2yOGiFEj2/mn0j6B
 bTcHiB9prZzDE5QIxqUlpnbYYI6Hr0zxUeMU7q5zpJja1U/A3kH/LsRKh
 YLy+Smn/f6IH5FshNXKziUdDjMokpmtkNVyEgrhYfI017vheSxGFgKDSU
 vdWrhfRWaaEv1igUd5he7ejs5E3SlahxjMJ6Sy+6rTH1qCgX0HqVwZxPv
 6pkOuod0870tITvJMM91nEUktlHAp/ttXkx27AlYdysxAcDoPUkLfUAfX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="337315001"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="337315001"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883719312"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="883719312"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 04:05:30 -0700
From: janga.rahul.kumar@intel.com
To: intel-xe@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Wed,  7 Jun 2023 16:36:00 +0530
Message-Id: <20230607110600.956524-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/Xe: Use EOPNOTSUPP instead of ENOTSUPP
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

ENOTSUPP is not a standard Unix error.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c          | 2 +-
 drivers/gpu/drm/xe/xe_mmio.c            | 4 ++--
 drivers/gpu/drm/xe/xe_sync.c            | 6 +++---
 drivers/gpu/drm/xe/xe_vm.c              | 8 ++++----
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 094ec17d3004..39d824ad7c82 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -609,7 +609,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 
 	if (XE_IOCTL_ERR(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
 			 !!(e->flags & ENGINE_FLAG_COMPUTE_MODE))) {
-		err = -ENOTSUPP;
+		err = -EOPNOTSUPP;
 		goto put_engine;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c7fbb1cc1f64..9fda28353ebc 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -461,7 +461,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			fallthrough;
 		case DRM_XE_MMIO_8BIT: /* TODO */
 		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -ENOTSUPP;
+			ret = -EOPNOTSUPP;
 			goto exit;
 		}
 	}
@@ -479,7 +479,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			fallthrough;
 		case DRM_XE_MMIO_8BIT: /* TODO */
 		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -ENOTSUPP;
+			ret = -EOPNOTSUPP;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 99f1ed87196d..b9e3214e4448 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -116,7 +116,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
 		if (XE_IOCTL_ERR(xe, no_dma_fences))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
@@ -134,7 +134,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
 		if (XE_IOCTL_ERR(xe, no_dma_fences))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
@@ -169,7 +169,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	case DRM_XE_SYNC_USER_FENCE:
 		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
 			return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0a4becdf4675..3208319475c4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1764,10 +1764,10 @@ static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (XE_IOCTL_ERR(xe, vm->async_ops.error_capture.addr))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	vm->async_ops.error_capture.mm = current->mm;
 	vm->async_ops.error_capture.addr = value;
@@ -3033,7 +3033,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-			err = -ENOTSUPP;
+			err = -EOPNOTSUPP;
 		if (XE_IOCTL_ERR(xe, !err && args->num_syncs))
 			err = EINVAL;
 		if (XE_IOCTL_ERR(xe, !err && !vm->async_ops.error))
@@ -3058,7 +3058,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
 			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
-		err = -ENOTSUPP;
+		err = -EOPNOTSUPP;
 		goto put_engine;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..5880e6cf8af9 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -142,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		if (XE_IOCTL_ERR(xe, !vm->async_ops.error_capture.addr)) {
 			xe_vm_put(vm);
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 		}
 
 		addr = vm->async_ops.error_capture.addr;
-- 
2.25.1


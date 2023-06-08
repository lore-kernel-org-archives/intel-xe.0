Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C666CC7EE29
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 08:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939BF10E583;
	Thu,  8 Jun 2023 08:54:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA9110E583
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686214477; x=1717750477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xDEif9h84spL3IIji1HeacdH8OWEsWVbbrRbFWFgakA=;
 b=foLGO9UegeIAJKtbxLYvXdP3oBa7YDtzZxU7zh1D/QRNCAr3IiEF7EAs
 GNG7YCzUKLy7TciI+fMStRlYOAA/KZhLmmzZ05bubS3JTfwx+b/ACFeA3
 41tUe+1/GD6IZZzqrnKsCas65uffcs0iT6TCjdG9/Rx+3o4CilF3jTLKm
 /RqNJrVhmvpXHAVSNBl9cThUWPimuUfYmv3isLCqp//5f8e4WLSeajwLG
 pOnZmctUoWtrc70rAlibZ097xEOmy1vRPaqDVi8Bog4nZcTI9Q+qTb5QI
 n3glgSHOm/5qvO0J/QAJJEVBDQVT8xT1LyXMtdGgqvhjlCxa/SHBZ/pMW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="356108225"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="356108225"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="704002744"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="704002744"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by orsmga007.jf.intel.com with ESMTP; 08 Jun 2023 01:54:33 -0700
From: janga.rahul.kumar@intel.com
To: intel-xe@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Thu,  8 Jun 2023 14:25:04 +0530
Message-Id: <20230608085504.1002259-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/Xe: Use ENOTSUP instead of ENOTSUPP
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

ENOTSUPP is not a standard Unix error use ENOTSUP instead.

v2: Update commit description (Aravind)
    Use ENOTSUP instead of EOPNOTSUPP as EOPNOTSUPP
    is recommended for socket. (Himal)

Sample checkpatch warning:
WARNING: ENOTSUPP is not a SUSV4 error code
+                return -ENOTSUPP;

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
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
index 094ec17d3004..6c3e2840d1c1 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -609,7 +609,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 
 	if (XE_IOCTL_ERR(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
 			 !!(e->flags & ENGINE_FLAG_COMPUTE_MODE))) {
-		err = -ENOTSUPP;
+		err = -ENOTSUP;
 		goto put_engine;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c7fbb1cc1f64..54400147e7df 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -461,7 +461,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			fallthrough;
 		case DRM_XE_MMIO_8BIT: /* TODO */
 		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -ENOTSUPP;
+			ret = -ENOTSUP;
 			goto exit;
 		}
 	}
@@ -479,7 +479,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			fallthrough;
 		case DRM_XE_MMIO_8BIT: /* TODO */
 		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -ENOTSUPP;
+			ret = -ENOTSUP;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 99f1ed87196d..7969e6057d23 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -116,7 +116,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
 		if (XE_IOCTL_ERR(xe, no_dma_fences))
-			return -ENOTSUPP;
+			return -ENOTSUP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
@@ -134,7 +134,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
 		if (XE_IOCTL_ERR(xe, no_dma_fences))
-			return -ENOTSUPP;
+			return -ENOTSUP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
@@ -169,7 +169,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	case DRM_XE_SYNC_USER_FENCE:
 		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
-			return -ENOTSUPP;
+			return -ENOTSUP;
 
 		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
 			return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0a4becdf4675..b1e3d8d26e46 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1764,10 +1764,10 @@ static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -ENOTSUPP;
+		return -ENOTSUP;
 
 	if (XE_IOCTL_ERR(xe, vm->async_ops.error_capture.addr))
-		return -ENOTSUPP;
+		return -ENOTSUP;
 
 	vm->async_ops.error_capture.mm = current->mm;
 	vm->async_ops.error_capture.addr = value;
@@ -3033,7 +3033,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-			err = -ENOTSUPP;
+			err = -ENOTSUP;
 		if (XE_IOCTL_ERR(xe, !err && args->num_syncs))
 			err = EINVAL;
 		if (XE_IOCTL_ERR(xe, !err && !vm->async_ops.error))
@@ -3058,7 +3058,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
 			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
-		err = -ENOTSUPP;
+		err = -ENOTSUP;
 		goto put_engine;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..752b094848d5 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -142,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		if (XE_IOCTL_ERR(xe, !vm->async_ops.error_capture.addr)) {
 			xe_vm_put(vm);
-			return -ENOTSUPP;
+			return -ENOTSUP;
 		}
 
 		addr = vm->async_ops.error_capture.addr;
-- 
2.25.1


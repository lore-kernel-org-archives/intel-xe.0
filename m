Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99788C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 09:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446E810E359;
	Tue, 13 Jun 2023 09:37:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB0510E359
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686649025; x=1718185025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lVWZ+7FMFIGbsHEdM8LuJPB0wkNHEHvXCRNPRFAr0lk=;
 b=IfmfXZBnbWPY95WxXvQs2z7jmdmmXmN3I4Uqf3blvCGRSFb6MyqWoMxo
 2yj8MhozYPrLI0SQG/Ol/FGZCynaBKLkPOBsbKxYfUUdA9I9x+XfwXDCN
 iAhn6XrkWXEXSoI+T+GB4seL6GlKMRhQ7CWVB4WkC35omisutQdTzH8w3
 tG2Mra30qNrAis2to1h1tgsaK1yLfBQjgxH0BIsBiCZONfDvRn8XKsNx3
 7CepoS/5P5C4s+ZXuCP6N3Ah7A4rwXbUeUk8mDhI48QdIGL/OilN+qwDw
 kgJclLK80eHhZr6Jozob9VZl6Knty5gDsOMuEk9OkpVQmdNfU8+GsSbfu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358278507"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="358278507"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 02:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958343243"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="958343243"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 02:37:02 -0700
From: janga.rahul.kumar@intel.com
To: intel-xe@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 13 Jun 2023 15:07:40 +0530
Message-Id: <20230613093740.1242129-1-janga.rahul.kumar@intel.com>
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

ENOTSUPP is not a standard Unix error should use
EOPNOTSUPP instead.

v2: Update commit description (Aravind)

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c          | 2 +-
 drivers/gpu/drm/xe/xe_mmio.c            | 4 ++--
 drivers/gpu/drm/xe/xe_sync.c            | 6 +++---
 drivers/gpu/drm/xe/xe_vm.c              | 8 ++++----
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..74d56c19f8d4 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -612,7 +612,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 
 	if (XE_IOCTL_ERR(xe, e->vm && xe_vm_in_compute_mode(e->vm) !=
 			 !!(e->flags & ENGINE_FLAG_COMPUTE_MODE))) {
-		err = -ENOTSUPP;
+		err = -EOPNOTSUPP;
 		goto put_engine;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f7a7f996b37f..f1336803b915 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -495,7 +495,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			fallthrough;
 		case DRM_XE_MMIO_8BIT: /* TODO */
 		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -ENOTSUPP;
+			ret = -EOPNOTSUPP;
 			goto exit;
 		}
 	}
@@ -513,7 +513,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			fallthrough;
 		case DRM_XE_MMIO_8BIT: /* TODO */
 		case DRM_XE_MMIO_16BIT: /* TODO */
-			ret = -ENOTSUPP;
+			ret = -EOPNOTSUPP;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 5acb37a8b2ab..7786b908a3fd 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -120,7 +120,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
 		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
@@ -138,7 +138,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
 		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
 			return -EINVAL;
@@ -173,7 +173,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	case DRM_XE_SYNC_USER_FENCE:
 		if (XE_IOCTL_ERR(xe, !signal))
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
 			return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1c380ad7f6b..be25f05f53c8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1817,10 +1817,10 @@ static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (XE_IOCTL_ERR(xe, vm->async_ops.error_capture.addr))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	vm->async_ops.error_capture.mm = current->mm;
 	vm->async_ops.error_capture.addr = value;
@@ -3068,7 +3068,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_ERR(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-			err = -ENOTSUPP;
+			err = -EOPNOTSUPP;
 		if (XE_IOCTL_ERR(xe, !err && args->num_syncs))
 			err = EINVAL;
 		if (XE_IOCTL_ERR(xe, !err && !vm->async_ops.error))
@@ -3093,7 +3093,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (XE_IOCTL_ERR(xe, !vm->async_ops.error &&
 			 async != !!(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS))) {
-		err = -ENOTSUPP;
+		err = -EOPNOTSUPP;
 		goto put_engine;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 6c8a60c60087..3122374341d6 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -143,7 +143,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		if (XE_IOCTL_ERR(xe, !vm->async_ops.error_capture.addr)) {
 			xe_vm_put(vm);
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 		}
 
 		addr = vm->async_ops.error_capture.addr;
-- 
2.25.1


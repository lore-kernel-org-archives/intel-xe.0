Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609FEC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 10:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D1B10E042;
	Fri, 16 Aug 2024 10:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1Rm9bgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFBC10E042
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723805467; x=1755341467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=okt5spZZvNT8ya+xgNPhQijKI7H8UrLQtr8IEyO3UqQ=;
 b=H1Rm9bgKB8zq4oBGBDIfPsws0O2OU+lKgI2o1/dAGHQYfe5ltDUui4KW
 A/fK+0bIhS4XP3jeUKtRJvKxXwfDJam5P24f/VKvboSTsj7tgOdtbQfrK
 CVlK3i7xwRNBJV3bvqp9l3Gc6k2mwAi1ehDWWxBUi2ySLckIxrhJ3bQU3
 P1pDJy46Q6qiTVET76m6WcU6l5bud1ij2aQzjycq+uvDgXnH2qZ2xuq+X
 0Wta+V3QoF/tyQKO7etsuSMUnzVeTAXn2/aIvMibD7/VzPtwZ6JGgkdEX
 2tmrKOqv5OuUKW0sdHqKGhIKzOWwuuI4DHZfh9COdgJF8Fp36dDyLX4ge A==;
X-CSE-ConnectionGUID: zB3bPkc/QjeSwKGF/LCfuw==
X-CSE-MsgGUID: dfYnPkQHSSydaqPevzBeGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24999658"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="24999658"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 03:51:07 -0700
X-CSE-ConnectionGUID: aBx5ZbkoT7u1WE18mVvu5A==
X-CSE-MsgGUID: nYDnogPXSgqsNDBF9bWtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="64045646"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 03:51:06 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Remove redundant param from xe_bo_create_user
Date: Fri, 16 Aug 2024 12:22:48 +0200
Message-ID: <20240816102248.25628-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

BO from xe_bo_create_user() will always be of type,
ttm_bo_type_device. So remove that redundant parameter.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  5 ++---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 12 +++++++-----
 drivers/gpu/drm/xe/xe_bo.c            |  6 ++----
 drivers/gpu/drm/xe/xe_bo.h            |  1 -
 5 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index df9fd907edd4..8dac069483e8 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -125,7 +125,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 		kunit_info(test, "Testing system memory\n");
 
 	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
-			       ttm_bo_type_device, bo_flags);
+			       bo_flags);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
@@ -206,7 +206,6 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		xe_vm_lock(vm, false);
 		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
 				       DRM_XE_GEM_CPU_CACHING_WC,
-				       ttm_bo_type_device,
 				       bo_flags);
 		xe_vm_unlock(vm);
 		if (IS_ERR(bo)) {
@@ -216,7 +215,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
 					     DRM_XE_GEM_CPU_CACHING_WC,
-					     ttm_bo_type_device, bo_flags);
+					     bo_flags);
 		if (IS_ERR(external)) {
 			KUNIT_FAIL(test, "external bo create err=%pe\n", external);
 			goto cleanup_bo;
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index c24c8509227e..13db6c0530b3 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -126,7 +126,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 	kunit_info(test, "running %s\n", __func__);
 	bo = xe_bo_create_user(xe, NULL, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
-			       ttm_bo_type_device, params->mem_mask);
+			       params->mem_mask);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(bo));
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 47ae9d0b8864..1a192a2a941b 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -641,7 +641,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	long ret;
 
 	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
-				   DRM_XE_GEM_CPU_CACHING_WC, ttm_bo_type_device,
+				   DRM_XE_GEM_CPU_CACHING_WC,
 				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
 
 	if (IS_ERR(sys_bo)) {
@@ -664,8 +664,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 	xe_bo_unlock(sys_bo);
 
-	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
-				   ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
+				   DRM_XE_GEM_CPU_CACHING_WC,
+				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
 
 	if (IS_ERR(ccs_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -687,8 +688,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 	xe_bo_unlock(ccs_bo);
 
-	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
-				    ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
+				    DRM_XE_GEM_CPU_CACHING_WC,
+				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(vram_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(vram_bo));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 800119c8fc8d..ce8282e67e84 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1499,11 +1499,10 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				struct xe_vm *vm, size_t size,
 				u16 cpu_caching,
-				enum ttm_bo_type type,
 				u32 flags)
 {
 	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
-						 cpu_caching, type,
+						 cpu_caching, ttm_bo_type_device,
 						 flags | XE_BO_FLAG_USER);
 	if (!IS_ERR(bo))
 		xe_bo_unlock_vm_held(bo);
@@ -2027,7 +2026,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
-			       ttm_bo_type_device, bo_flags);
+			       bo_flags);
 
 	if (vm)
 		xe_vm_unlock(vm);
@@ -2333,7 +2332,6 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 
 	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
 			       DRM_XE_GEM_CPU_CACHING_WC,
-			       ttm_bo_type_device,
 			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
 			       XE_BO_FLAG_SCANOUT |
 			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 1c9dc8adaaa3..935a94279026 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -87,7 +87,6 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
 struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				struct xe_vm *vm, size_t size,
 				u16 cpu_caching,
-				enum ttm_bo_type type,
 				u32 flags);
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
-- 
2.42.0


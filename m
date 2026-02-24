Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A179EFB7F9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 09:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16CE10E52E;
	Tue, 24 Feb 2026 09:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iar8UfcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033E10E52E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771925290; x=1803461290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5MsO/EHTwJegIMgQRT+PS6qtftdFkiXCv1d6gx2KfEQ=;
 b=iar8UfcSzyuTm3qAMPOkU7Sk3XGYBnMuQXnpUtAeje0kYPsGiNk5oNP+
 vQ6EgTyTXvjuGdmYiZ6FLDI1KQfDX+X1JArP1eV9koYihGKMty9dxdwf8
 3pW3aQcHLyTcs9XgTZ8ONR9ivUVXT4L4mAwOxfzphWdOjecEg4lkz5pe4
 Aiw0OZjW51zzR36y32xTJMUUARosTAdbZ5ZEy66Qe8lePadWrbdyerpem
 d9JY2JREaVmX7t74avw7Jz12QYAJ0JQAQ7X8BfDPsrE/XMLUFXkgiMHzN
 VuYx3jzlcoM1Ziy6pEVgw2GMI9ORYwUjKgLdNz/mvBK6L/57L7TPcdo3O g==;
X-CSE-ConnectionGUID: bMCVRY1ZSwqkxEdoQ6MAhQ==
X-CSE-MsgGUID: d5dg0SBTTXyfkHUh/fxwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90344903"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="90344903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:28:09 -0800
X-CSE-ConnectionGUID: teosfm99TN+0jablO+TQHA==
X-CSE-MsgGUID: Epb6mLbXRGO4+bbxMhz1Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253578954"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:28:08 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 oak.zeng@intel.com
Subject: [PATCH] drm/xe: Skip BO migration when platform supports CPU atomics
 on VRAM
Date: Tue, 24 Feb 2026 14:57:58 +0530
Message-ID: <20260224092758.1880683-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

should_migrate_to_smem() forced any BO marked ATOMIC_GLOBAL
or ATOMIC_CPU out of VRAM on a CPU fault, regardless of whether the
platform actually requires it.

Introduce has_system_atomics_on_vram to the device capability flags.
should_migrate_to_smem() now gates migration on this flag, eliminating
redundant evictions on capable hardware.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 16 +++++++++-------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  5 ++++-
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6c2cb959cdd..848467ca6700 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1771,14 +1771,15 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 
 static bool should_migrate_to_smem(struct xe_bo *bo)
 {
+	struct xe_device *xe = xe_bo_device(bo);
+
 	/*
-	 * NOTE: The following atomic checks are platform-specific. For example,
-	 * if a device supports CXL atomics, these may not be necessary or
-	 * may behave differently.
+	 * Migrate to system memory only if the platform does not support
+	 * CPU atomics on VRAM.
 	 */
-
-	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
-	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
+	return (bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
+		bo->attr.atomic_access == DRM_XE_ATOMIC_CPU) &&
+	       !xe->info.has_system_atomics_on_vram;
 }
 
 static int xe_bo_wait_usage_kernel(struct xe_bo *bo, struct ttm_operation_ctx *ctx)
@@ -1804,6 +1805,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
 			       struct drm_exec *exec)
 {
 	struct ttm_buffer_object *tbo = &bo->ttm;
+	struct xe_device *xe = xe_bo_device(bo);
 	int err = 0;
 
 	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
@@ -1811,7 +1813,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
 		if (!err)
 			err = ttm_bo_populate(&bo->ttm, ctx);
 	} else if (should_migrate_to_smem(bo)) {
-		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
+		xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
 		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f3ef836541e..2fe643c179fe 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -205,6 +205,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
 		u8 has_64bit_timestamp:1;
+		/** @info.has_system_atomics_on_vram: Supports CPU atomics on VRAM */
+		u8 has_system_atomics_on_vram:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 56a768f2cfca..f2d86e08e190 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -925,8 +925,11 @@ static int xe_info_init(struct xe_device *xe,
 
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
-	if (xe->info.platform != XE_PVC)
+	if (xe->info.platform != XE_PVC) {
 		xe->info.has_device_atomics_on_smem = 1;
+		/* PVC doesn't support CPU atomics on VRAM, Xe2+ platforms do */
+		xe->info.has_system_atomics_on_vram = 1;
+	}
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
 	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
-- 
2.43.0


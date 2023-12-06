Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E910C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0B10E672;
	Wed,  6 Dec 2023 04:23:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16DA10E670
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 04:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701836625; x=1733372625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TVDIFbxrCNU1j9ZAdSM1C0Ogt4V4EOz3hrMiJ1qtpNk=;
 b=n+JEpuUxv0AzQZA4ns9C0tjAQfuyh6oKhsu2ONjP1U2VzAd9+hn7dZin
 lP0kiRCK5MYAsb5CE/j6qPut0WB+DdIujqThg2HeJjo0z9Modn2g3iK7+
 PzDmPudQgZpum1JYJBClGqGHtQuo6gRl4Squ8ZRsxF/1+MG+2oiEcUzQN
 MPZZmIIL3AjXTdyK+lbbc1AjAhdVjjMw9xAqc6aHntKgDwlucO3jc9UjF
 3U8uVUvbiPBMZ6FBNi0H6UWHOJXjhuCF7C6d9a5djD2/G9rIfQ7swujAf
 +RucMjJ1K+Hx0bSb+MSZq1Ah6PgWGDKjeXfeYPbpd11EyljJgNSSVStdI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458326761"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="458326761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 20:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="12556316"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 20:23:44 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 10:01:19 +0530
Message-Id: <20231206043126.984049-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/9] drm/xe/xe2: Allocate extra pages for ccs
 during bo create
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

Each byte of CCS data now represents 512 bytes of main memory data.
Allocate extra pages to handle ccs region for igfx too.

Bspec:58796

v2:
 - For dgfx ensure system bit is not set.
 - Modify comments.(Thomas)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                | 14 +++++++++-----
 drivers/gpu/drm/xe/xe_device.c            |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index f1c5bf203b3d..1f9c32e694c6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -16,7 +16,7 @@
 #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
-#define   NUM_BYTES_PER_CCS_BYTE	256
+#define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)
 #define   NUM_CCS_BLKS_PER_XFER		1024
 
 #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 72dc4a4eed4e..81630838d769 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2173,8 +2173,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't use
- * flat CCS compression, because the GPU then has no way to access the
+ * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
+ * use flat CCS compression, because the GPU then has no way to access the
  * CCS metadata using relevant commands. For the opposite case, we need to
  * allocate storage for the CCS metadata when the BO is not resident in
  * VRAM memory.
@@ -2183,9 +2183,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  */
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
-	return bo->ttm.type == ttm_bo_type_device &&
-		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
-		(bo->flags & XE_BO_CREATE_VRAM_MASK);
+	struct xe_device *xe = xe_bo_device(bo);
+
+	return (xe_device_has_flat_ccs(xe) &&
+		bo->ttm.type == ttm_bo_type_device &&
+		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK) &&
+		  !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
+		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 400fa1ac6168..50c87f03c51c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -605,7 +605,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
-		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
-- 
2.25.1


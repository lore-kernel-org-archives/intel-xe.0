Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DF4C10F13
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446A010E82B;
	Thu,  7 Dec 2023 09:12:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B715C10E818
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940314; x=1733476314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nm+i4dr04iOi60WcVAEvbGmoS99FyCiosmdPPBGPg3c=;
 b=SJGtdfqdil6ryXle5zgZ+sx+1ghzaEoc6qYO0iF8QMcOaJ83BytjDPce
 LvlAB3xc9yUv7Kaf4rjaHcbrK239n+DKLIvSYX+WQpBk3y0LsCwVz2BD/
 ecMwKZ3PYWQjA/srnSn6+PSG1oJB0HkhNlxduRMBPCym4Php0qQuO3YDd
 c0MFRJu7Kojq6xftrLGQLQ8Dyt2ez61EH8YOLa1eUoGlW/hYJtm5qBPkP
 Asp5gwzUFEqEuo7Quy3tlprFqwjbqflCZmi+SggrvmQ+2wvnQxbtMSpH3
 jnEaW+duNJvd0lJOATutKd9cavpRpAf61glJ/oZDbG1fLBUebN4Tn4smD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391373975"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391373975"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067835"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067835"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:40 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:15 +0530
Message-Id: <20231207091922.1224800-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 2/9] drm/xe/xe2: Allocate extra pages for ccs
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
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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


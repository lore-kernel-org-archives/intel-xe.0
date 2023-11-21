Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22552C5ACB3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 10:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8DC10E46A;
	Tue, 21 Nov 2023 10:01:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15BF10E255
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700560904; x=1732096904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lxSNIx+9pw1TCV30D9r7Tt0FNylM/zpQFnQkNsTtfAk=;
 b=aGrc0dJnizJrHeCWHWvgeY/D4C8aztV/BGkgfPUE3fORxiIJRtKkMHXE
 wfO1sL790EMNnRc0qAbRE4NeOz41BFpFoiTDxEFebwRDDTAv79edP9oO2
 nT+FKKqaUBf9EHZ932KWbZkcjMQcuc5QqTNpigGua/sH+vWYpebLAuGim
 ZzpxAfnzGEUGs5YxylXXY6yavizRLw0S5CR1CcQZ7clWWZAua6TutafR6
 Pj8YAbQiM9zu5Us/Prt2tx25eXGHVb6IT94gB5YmM0cVRX4VzpHpyRXlR
 7/O9PtOiFE61GQFdG2wRr8VbZLHC4GP6rNiQCIuwkbkALwNttWU7nm/t0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394646802"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="394646802"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 02:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="857283637"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="857283637"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 02:01:42 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:39:03 +0530
Message-Id: <20231121100906.3587649-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 3/6] drm/xe/xe2: Allocate extra pages for ccs
 during bo create.
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                | 15 ++++++---------
 drivers/gpu/drm/xe/xe_device.c            |  2 +-
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 4402f72481dc..7f74592f99ce 100644
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
index 4305f5cbc2ab..4730ee3c1012 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't use
- * flat CCS compression, because the GPU then has no way to access the
- * CCS metadata using relevant commands. For the opposite case, we need to
- * allocate storage for the CCS metadata when the BO is not resident in
- * VRAM memory.
- *
  * Return: true if extra pages need to be allocated, false otherwise.
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
+		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK)) ||
+		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 07a3e4cf48d1..265f9ffc5323 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
-		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
-- 
2.25.1


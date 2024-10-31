Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8FDD767F6
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1636310E03D;
	Thu, 31 Oct 2024 18:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+O5YskT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E216410E903
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730398223; x=1761934223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u3qYgHW9Zp1GFMTFg7M547V1gen+8oUnSJOJZbbK/nY=;
 b=b+O5YskTZaUyyhu1y8zblv1UhBIlB2vxLG1J3uoREZOk6Mm+O3KWh+IJ
 BLVSzeNYriFFkCY6Ch+sIvG1Xq0TWRP/vQ3TFQKuOZrJyDFOLpQCVKkQ5
 mQePxi/gs4xdFrIbBuAJV8CCJ1S0bHJQ3bQuD71AdY50FFb12KRKPgmPQ
 WGjhZ05apCqu4ifUvcxj6T7bE/aJfl4v6G3TptMAgrKThnysxGUOnzfku
 8L7KMF+UtxPwl/Mc4uR0ugeZiusW+C2W41aarGF+ULyKUMg/wB1sKXhfF
 XXQswGl3ss4tO+OV+tdp900QXnSdhSSAKysI5/EQDmzNcSNcs0JsPXL/w A==;
X-CSE-ConnectionGUID: zF7Z5kx6R1Gq5FOmS4/I8g==
X-CSE-MsgGUID: 7CA+iSpKREqc3zH+pDKtXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41255869"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41255869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
X-CSE-ConnectionGUID: 0wWEhnAYS/qzTgC/RbhYqA==
X-CSE-MsgGUID: XpJEKfMJTk6/d03OZTwCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="86637568"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:10:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 3/8] drm/xe: Add xe_ttm_access_memory
Date: Thu, 31 Oct 2024 11:10:43 -0700
Message-Id: <20241031181048.2948948-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
References: <20241031181048.2948948-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
VRAM easily be accessed. Add xe_ttm_access_memory which hooks into
ttm_bo_access to access such memory.

v4:
 - Assert memory access rather than taking RPM ref (Thomas / Auld)
 - Fix warning on xe_res_cursor.h for non-zero offset (Mika)

Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 59 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0261a8b29351..0cb014aba699 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -442,6 +442,14 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 	kfree(tt);
 }
 
+static bool xe_ttm_resource_visible(struct ttm_resource *mem)
+{
+	struct xe_ttm_vram_mgr_resource *vres =
+		to_xe_ttm_vram_mgr_resource(mem);
+
+	return vres->used_visible_size == mem->size;
+}
+
 static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
@@ -453,11 +461,9 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_ttm_vram_mgr_resource *vres =
-			to_xe_ttm_vram_mgr_resource(mem);
 		struct xe_mem_region *vram = res_to_mem_region(mem);
 
-		if (vres->used_visible_size < mem->size)
+		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
 
 		mem->bus.offset = mem->start << PAGE_SHIFT;
@@ -1111,6 +1117,52 @@ static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
+				unsigned long offset, void *buf, int len,
+				int write)
+{
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct iosys_map vmap;
+	struct xe_res_cursor cursor;
+	struct xe_mem_region *vram;
+	int bytes_left = len;
+
+	xe_bo_assert_held(bo);
+	xe_device_assert_mem_access(xe);
+
+	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
+		return -EIO;
+
+	/* FIXME: Use GPU for non-visible VRAM */
+	if (!xe_ttm_resource_visible(ttm_bo->resource))
+		return -EIO;
+
+	vram = res_to_mem_region(ttm_bo->resource);
+	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
+		     bo->size - (offset & PAGE_MASK), &cursor);
+
+	do {
+		unsigned long page_offset = (offset & ~PAGE_MASK);
+		int byte_count = min((int)(PAGE_SIZE - page_offset), bytes_left);
+
+		iosys_map_set_vaddr_iomem(&vmap, (u8 __iomem *)vram->mapping +
+					  cursor.start);
+		if (write)
+			xe_map_memcpy_to(xe, &vmap, page_offset, buf, byte_count);
+		else
+			xe_map_memcpy_from(xe, buf, &vmap, page_offset, byte_count);
+
+		buf += byte_count;
+		offset += byte_count;
+		bytes_left -= byte_count;
+		if (bytes_left)
+			xe_res_next(&cursor, PAGE_SIZE);
+	} while (bytes_left);
+
+	return len;
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1120,6 +1172,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.move = xe_bo_move,
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
+	.access_memory = xe_ttm_access_memory,
 	.release_notify = xe_ttm_bo_release_notify,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
-- 
2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE4C54E66
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 10:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4371D10F347;
	Tue, 12 Mar 2024 10:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO4+PJzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0A010F30A;
 Tue, 12 Mar 2024 10:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710237887; x=1741773887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IpuPnfTEDNwxO17jDA10oYjukIw3E/5powuOknsvP+w=;
 b=SO4+PJzYtP9FJcJPireH+XPqSkB2TjTnxKzjt2SV7DAoQjMizQCRvZKr
 AQF2O7vfEnV42Iwa9TV1GYUSy3VE6Gdxsme/MOqm+7Q5PFhRgquC9DH5E
 g+37mXwmyDTWCNtorUPAuHPLw4nhfZyf++j/Ok+Gj6l4jg+lQy89gEClH
 GuNcdAm2Sv0MlNAgmuFYqqddVOMXyYi8bZ1ewtC+ikRasutktZ9VMY3jS
 uZmmtY8U2XE8YD9kgoaaTGxP8onLSfBDAVfJgpD3x59MN12WDvaV7vSz7
 MNjN8HmTJzYkGR0tsh29eV5O/YS6Vpu7yuxn/bxofublfmWk68xTxZr9b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7883317"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7883317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15979658"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2024 03:04:45 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/xe/display: fix potential overflow when multiplying 2 u32
Date: Tue, 12 Mar 2024 15:24:41 +0530
Message-Id: <20240312095441.3684038-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Multiplying XE_PAGE_SIZE with another u32 and the product stored in
u64 can potentially lead to overflow. Change one of the value to u64 so
as to perform 64 bit arithmetic operation as the product is u64.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..c9d26345ae6e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -29,7 +29,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * (u64)XE_PAGE_SIZE,
 							      xe->pat.idx[XE_CACHE_WB]);
 
 			iosys_map_wr(map, *dpt_ofs, u64, pte);
@@ -61,7 +61,7 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 
 		for (column = 0; column < width; column++) {
 			iosys_map_wr(map, *dpt_ofs, u64,
-				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+				     pte_encode_bo(bo, src_idx * (u64)XE_PAGE_SIZE,
 				     xe->pat.idx[XE_CACHE_WB]));
 
 			*dpt_ofs += 8;
@@ -118,7 +118,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		u32 x;
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * (u64)XE_PAGE_SIZE,
 							      xe->pat.idx[XE_CACHE_WB]);
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
@@ -164,7 +164,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * (u64)XE_PAGE_SIZE,
 							      xe->pat.idx[XE_CACHE_WB]);
 
 			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
@@ -381,4 +381,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
-- 
2.25.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5C7CEACC0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 13:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED76110E620;
	Tue,  1 Oct 2024 13:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4Iat05a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F5510E620
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727790211; x=1759326211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZHZDvSV2l9eT/Xn0cHB3uMLDnsGCD2XQDFYRLNSGw0=;
 b=j4Iat05aOY0i70g1skCLvPQJXDDV1lNqgdHJ9sRleygp6iH3zPRYd3m7
 +56QKMlpQExTcsSaAKPyO9QIWU/tWbI1CQ9rkWs3gNvFSaBqJmoqLapJx
 XIFx33NnVwnYaWaoav4jwfodHQoYf7uK+nPNKr4ZUnQvzesaAMciySb4B
 DmcamwQ2DQZNFRr3VH0vWeOPyyuiR1QPVjCuSoDOs/FnEvif06DWgUJsR
 cEGr6OoTV93lq/UzvWKv9bFhkdB+Pf+9e9i4lWdmHixUIbSkEMrWYrq3Q
 nWUOK5FSqWMJF4bgu09WyMDNsKEvbwUGGqv+zOCAwKaGhjDy7vbdx/8s9 w==;
X-CSE-ConnectionGUID: 7VxZQVzRTZ+PedhC+tqOtA==
X-CSE-MsgGUID: 0GGkfO6XTZGv8S+2IgSBEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49446847"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="49446847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:43:30 -0700
X-CSE-ConnectionGUID: AfoZ9FacRl2m5lK/9pJRxw==
X-CSE-MsgGUID: uD2oCivxRZC9dxFbLAN0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73791102"
Received: from suttanur-desk.iind.intel.com (HELO
 singhapo-Super-Server.iind.intel.com) ([10.145.169.90])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2024 06:43:29 -0700
From: apoorva.singh@intel.com
To: intel-xe@lists.freedesktop.org
Cc: oak.zeng@intel.com, Brian Welty <brian.welty@intel.com>,
 Apoorva Singh <apoorva.singh@intel.com>
Subject: [PATCH 1/2] drm/xe: Add support for PTE_NC bit
Date: Tue,  1 Oct 2024 19:24:31 +0530
Message-Id: <20241001135432.447074-2-apoorva.singh@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001135432.447074-1-apoorva.singh@intel.com>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
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

From: Brian Welty <brian.welty@intel.com>

The current implementation of access counters is incomplete in that it
doesn't manage the PTE_NC (No Count) bit. HW has finite number of access
counters which HW itself dynamically allocates/deallocates. As these are
a finite resource, don't enable access counting (don't waste counters)
for page table mappings which cannot take any action on trigger of access
counter threshold (cannot be migrated).
The logic for this decision is encapsulated in xe_bo_can_use_acc().

Signed-off-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h |  3 +++
 drivers/gpu/drm/xe/xe_pt.c |  4 ++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5f2f1ec46b57..449a301c5688 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2196,6 +2196,40 @@ bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type)
 	return false;
 }
 
+/**
+ * xe_bo_can_use_acc - Determine if BO is eligible for access counting
+ * @bo: The buffer object.
+ * @tile: Tile (set of GT engines) which page table the BO is being bound
+ *        is associated with.
+ *
+ * Number of HW access counters is finite and allocation/deallocation is
+ * managed internally by hardware. As they are precious, don't waste them
+ * on backing store for BO's that cannot be migrated.
+ * Currently this means, allow access counting if:
+ *   BO has more than one placement
+ *   BO is not already in VRAM local to @tile
+ * Note, access counters are not used unless enabled in LRC.
+ */
+bool xe_bo_can_use_acc(struct xe_bo *bo, struct xe_tile *tile)
+{
+	struct ttm_resource *res;
+
+	/* userptr or using null page */
+	if (!bo)
+		return false;
+
+	res = bo->ttm.resource;
+	/* if for some reason no backing store, nothing to migrate */
+	if (!res)
+		return false;
+
+	/* cannot migrate if single placment */
+	if (bo->placement.num_placement <= 1)
+		return false;
+
+	return true;
+}
+
 static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
 {
 	memset(place, 0, sizeof(*place));
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6e4be52306df..b60dce0d2f1c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -55,6 +55,8 @@
 #define XE_64K_PTE_MASK			(XE_64K_PAGE_SIZE - 1)
 #define XE_64K_PDE_MASK			(XE_PDE_MASK >> 4)
 
+#define XE_PPGTT_PTE_NC			BIT_ULL(5)
+
 #define XE_PL_SYSTEM		TTM_PL_SYSTEM
 #define XE_PL_TT		TTM_PL_TT
 #define XE_PL_VRAM0		TTM_PL_VRAM
@@ -209,6 +211,7 @@ bool xe_bo_has_single_placement(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
+bool xe_bo_can_use_acc(struct xe_bo *bo, struct xe_tile *tile);
 
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
 int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d6353e8969f0..18cf13d548c6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -660,6 +660,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
 	}
 
+	/* set NoCount bit when not in need of access counting */
+	if (!xe_bo_can_use_acc(bo, tile))
+		xe_walk.default_pte |= XE_PPGTT_PTE_NC;
+
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
-- 
2.34.1


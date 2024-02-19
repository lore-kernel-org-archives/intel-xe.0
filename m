Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72E1C48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 21:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8487B10E088;
	Mon, 19 Feb 2024 21:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImTYe9nZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F5F10E008
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 21:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708377533; x=1739913533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPv8HttmwuHWaYMo5wA8qKrDF/rNv+vrS8L3xRebtxc=;
 b=ImTYe9nZHoK+DZJh5HTVZftiR1s1MiMM0tNmJrfWdR3HLtyDZ38xoiP0
 Bn2lvFz7+eIfdo/hfcyYO9w52fSb4WW/UNkV+ZFxtUHsZUVuB5Muli1Sk
 ggAr/J5f3YSiBNzWFQq7vr/7agC7S0WienT/Kza9IQ+VlgEh/PPKzPd3x
 GBJTybJbc3ydRXy78vuCdkmeqwZGvg/N+4B8AvOGQBHq/+pDnQeKKklNF
 07QwopDmIaGBZGwrj426iCnSqWc5QAAIZnJJa7HtjPAZp+0sffgz+DPre
 wBfVPB09vXjSZlfgE31JBlm0AYFiL8OzNLv/UU196Bme3zKi0kHQl1vcH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2334997"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2334997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="9246358"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 13:18:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Return 2MB page size for compact 64k PTEs
Date: Mon, 19 Feb 2024 13:19:42 -0800
Message-Id: <20240219211942.3633795-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219211942.3633795-1-matthew.brost@intel.com>
References: <20240219211942.3633795-1-matthew.brost@intel.com>
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

Compact 64k PTEs are only intended to be used within a single VMA which
covers the entire 2MB range of the compact 64k PTEs. Add
XE_VMA_PTE_COMPACT VMA flag to indicate compact 64k PTEs are used and
update xe_vma_max_pte_size to return at least 2MB if set.

v2: Include missing changes

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/758
Fixes: 8f33b4f054fc ("drm/xe: Avoid doing rebinds")
Fixes: c47794bdd63d ("drm/xe: Set max pte size when skipping rebinds")
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 5 ++++-
 drivers/gpu/drm/xe/xe_vm.c       | 2 +-
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 46cea37bdac5..7f54bc3e389d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -547,13 +547,16 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		*child = &xe_child->base;
 
 		/*
-		 * Prefer the compact pagetable layout for L0 if possible.
+		 * Prefer the compact pagetable layout for L0 if possible. Only
+		 * possible if VMA covers entire 2MB region as compact 64k and
+		 * 4k pages cannot be mixed within a 2MB region.
 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
 		 * memory.
 		 */
 		if (GRAPHICS_VERx100(tile_to_xe(xe_walk->tile)) >= 1250 && level == 1 &&
 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
 			walk->shifts = xe_compact_pt_shifts;
+			xe_walk->vma->gpuva.flags |= XE_VMA_PTE_COMPACT;
 			flags |= XE_PDE_64K;
 			xe_child->is_compact = true;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7781290d2b99..23a44ef85aa4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2190,7 +2190,7 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 {
 	if (vma->gpuva.flags & XE_VMA_PTE_1G)
 		return SZ_1G;
-	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
+	else if (vma->gpuva.flags & (XE_VMA_PTE_2M | XE_VMA_PTE_COMPACT))
 		return SZ_2M;
 	else if (vma->gpuva.flags & XE_VMA_PTE_64K)
 		return SZ_64K;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 91800ce70845..a603cc2eb56b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -30,6 +30,7 @@ struct xe_vm;
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
+#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
-- 
2.34.1


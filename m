Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43C5CCD1BC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6623910E80E;
	Wed, 22 Oct 2025 16:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWRshwOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4852410E80E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151198; x=1792687198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h76Ca5gwR7IQ2b2fuiDsBR6j/AZe549I1r83LITxMFk=;
 b=LWRshwOE0GCOa3DIWslaR66+mhm1su+fERES5U5wj7syx0FjqBxq5la5
 suV7rvcirrpkrprRV/K46NJLRf/AUfj6TnniZNzHissjkdSZpF9vf5nhR
 +nXpPi2CSVcJScvCIzwQUD2kKT1dwzZXBnN9b4U64E8XPmc5lF0IMn+7O
 4q3e2UDC2/1dOOSU73Xyh4yiZne5AL/yTF6sc50okpsd0pzZ5ZUu4lIJJ
 8oxQt7uUKq4cO1CwOZ5usZe946Ape1bBaQitaFajIYZUwNMcnUmfFtGl9
 tbL5Hk0YzilDqjE+rCRlXe76d0eC5//dWDIcfARChm4s4y2DjVtZdPJq/ Q==;
X-CSE-ConnectionGUID: UnhlI6W9QlugvvRdpTo58w==
X-CSE-MsgGUID: bnqmelf2RNmCWIuqSxVONw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911759"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:58 -0700
X-CSE-ConnectionGUID: opTLmPN2SFGJLKAp4/EBcA==
X-CSE-MsgGUID: YHiyTR+JTCa5fZgNeVF2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043704"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 7/7] drm/xe/migrate: skip bounce buffer path on xe2
Date: Wed, 22 Oct 2025 17:38:36 +0100
Message-ID: <20251022163836.191405-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163836.191405-1-matthew.auld@intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
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

Now that we support MEM_COPY we should be able to use the PAGE_COPY
mode, otherwise falling back to BYTE_COPY mode when we have odd
sizing/alignment.

v2:
 - Use info.has_mem_copy_instr
 - Rebase on latest changes.
v3 (Matt Brost):
 - Allow various pitches including 1byte pitch for MEM_COPY

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 43 ++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1bbc7bca33ed..921c9c1ea41f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1920,6 +1920,25 @@ enum xe_migrate_copy_dir {
 #define XE_CACHELINE_BYTES	64ull
 #define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
 
+static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len)
+{
+	u32 pitch;
+
+	if (IS_ALIGNED(len, PAGE_SIZE))
+		pitch = PAGE_SIZE;
+	else if (IS_ALIGNED(len, SZ_4K))
+		pitch = SZ_4K;
+	else if (IS_ALIGNED(len, SZ_256))
+		pitch = SZ_256;
+	else if (IS_ALIGNED(len, 4))
+		pitch = 4;
+	else
+		pitch = 1;
+
+	xe_assert(xe, pitch > 1 || xe->info.has_mem_copy_instr);
+	return pitch;
+}
+
 static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 unsigned long len,
 					 unsigned long sram_offset,
@@ -1937,14 +1956,14 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	struct xe_bb *bb;
 	u32 update_idx, pt_slot = 0;
 	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
-	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
-		PAGE_SIZE : 4;
+	unsigned int pitch = xe_migrate_copy_pitch(xe, len);
 	int err;
 	unsigned long i, j;
 	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
-	if (drm_WARN_ON(&xe->drm, (!IS_ALIGNED(len, pitch)) ||
-			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
+	if (!xe->info.has_mem_copy_instr &&
+	    drm_WARN_ON(&xe->drm,
+			(!IS_ALIGNED(len, pitch)) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
 		return ERR_PTR(-EOPNOTSUPP);
 
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
@@ -2163,9 +2182,10 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	xe_bo_assert_held(bo);
 
 	/* Use bounce buffer for small access and unaligned access */
-	if (!IS_ALIGNED(len, 4) ||
-	    !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
-	    !IS_ALIGNED(offset, XE_CACHELINE_BYTES)) {
+	if (!xe->info.has_mem_copy_instr &&
+	    (!IS_ALIGNED(len, 4) ||
+	     !IS_ALIGNED(page_offset, XE_CACHELINE_BYTES) ||
+	     !IS_ALIGNED(offset, XE_CACHELINE_BYTES))) {
 		int buf_offset = 0;
 		void *bounce;
 		int err;
@@ -2227,6 +2247,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
 			cursor.start;
 		int current_bytes;
+		u32 pitch;
 
 		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
 			current_bytes = min_t(int, bytes_left,
@@ -2234,13 +2255,13 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		else
 			current_bytes = min_t(int, bytes_left, cursor.size);
 
-		if (current_bytes & ~PAGE_MASK) {
-			int pitch = 4;
-
+		pitch = xe_migrate_copy_pitch(xe, current_bytes);
+		if (xe->info.has_mem_copy_instr)
+			current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
+		else
 			current_bytes = min_t(int, current_bytes,
 					      round_down(S16_MAX * pitch,
 							 XE_CACHELINE_BYTES));
-		}
 
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
-- 
2.51.0


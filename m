Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D1CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 10:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8570610E4B8;
	Mon, 22 Jun 2026 10:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzniaB4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B5D10E5F0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782124521; x=1813660521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUVkrnIG5eVhv9eKdTUZkeMxKECSSvUHm2mFSmrX3sI=;
 b=KzniaB4Not0Ox2yQtWfO762L/8pri+vBD3d0mxrXMKQWyro/s/wrGeQ4
 DFHN5HUcGjqZCs6oKJYS+SClKHVH9NOpJVhh/hxrBDKf8DihvimXSmJHF
 8gvyuyyAVHoCoj7+3P68jcsKTeeXCbKK08oisMRTO60Ir5O2cnNHOYUX8
 BaDmts+1GLgpKlxzdYt3UqvF8My58o8LpsFJ2h0184k+wpzvt7mzW0fOS
 PRa3nWouQLXE3urcV9xnYqjjh0uPf8QVPsk12l5SEOfeJRfgYNx1Acxtn
 osgDqPPN4DlECCetUhhMmKORLyfN06KpxvF5OVx1IySPsfpdjas51OXQm w==;
X-CSE-ConnectionGUID: x6Ch6gouSXac8Qwutibu8A==
X-CSE-MsgGUID: 7zyabtZxTeqOcBnDU4eXKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70365455"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="70365455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:21 -0700
X-CSE-ConnectionGUID: aRgRV6m0SLO9PReIbWt3tQ==
X-CSE-MsgGUID: yvNhnyuXSoOyAVJnFRh8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248046789"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:35:19 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 3/4] drm/xe/xe_migrate: Optimize unaligned access_memory
 copies
Date: Mon, 22 Jun 2026 12:34:48 +0200
Message-ID: <20260622103449.3335928-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622103449.3335928-1-jan.maslak@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

When xe_migrate_access_memory() falls back to a smaller pitch for an
unaligned destination, the copy can end up running linearly for the
entire transfer.

Reduce the number of copy jobs by first using a short linear copy to
reach a better destination alignment, then using the largest matrix copy
pitch that alignment supports, and finally using a linear copy for any
remaining tail bytes.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 148 ++++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 135d59f6e100..f5aa4a0dd6c4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2206,6 +2206,86 @@ static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len, u64 dst_addr)
 	return pitch;
 }
 
+/**
+ * xe_migrate_dst_pitch() - Determine max pitch supported by dst alignment
+ * @dst_addr: Destination address (page offset)
+ *
+ * Returns the largest pitch (PAGE_SIZE, SZ_4K, SZ_256, or 4) that dst_addr
+ * supports based solely on its alignment. Returns 1 if not even 4-byte aligned.
+ */
+static u32 xe_migrate_dst_pitch(u64 dst_addr)
+{
+	if (IS_ALIGNED(dst_addr, PAGE_SIZE))
+		return PAGE_SIZE;
+	if (IS_ALIGNED(dst_addr, SZ_4K))
+		return SZ_4K;
+	if (IS_ALIGNED(dst_addr, SZ_256))
+		return SZ_256;
+	if (IS_ALIGNED(dst_addr, 4))
+		return 4;
+	return 1;
+}
+
+/**
+ * xe_migrate_best_alignment() - Find the best alignment reachable within max_bytes
+ * @dst_addr: Current destination address
+ * @max_bytes: Maximum bytes we can copy to reach alignment (typically U16_MAX)
+ *
+ * Returns the largest alignment (PAGE_SIZE, SZ_4K, SZ_256, or 4) that dst_addr
+ * can reach by copying at most max_bytes. Returns 0 if already at best alignment
+ * or if no useful alignment can be reached.
+ */
+static u32 xe_migrate_best_alignment(u64 dst_addr, u32 max_bytes)
+{
+	u32 bytes_to_page = round_up(dst_addr, PAGE_SIZE) - dst_addr;
+	u32 bytes_to_4k = round_up(dst_addr, SZ_4K) - dst_addr;
+	u32 bytes_to_256 = round_up(dst_addr, SZ_256) - dst_addr;
+	u32 bytes_to_4 = round_up(dst_addr, 4) - dst_addr;
+
+	if (bytes_to_page == 0)
+		return 0;
+
+	if (bytes_to_page <= max_bytes)
+		return PAGE_SIZE;
+
+	if (bytes_to_4k > 0 && bytes_to_4k <= max_bytes)
+		return SZ_4K;
+
+	if (bytes_to_256 > 0 && bytes_to_256 <= max_bytes)
+		return SZ_256;
+
+	if (bytes_to_4 > 0 && bytes_to_4 <= max_bytes)
+		return 4;
+
+	return 0;
+}
+
+/**
+ * xe_migrate_bytes_to_align() - Calculate bytes needed to reach target alignment
+ * @dst_addr: Current destination address
+ * @alignment: Target alignment (PAGE_SIZE, SZ_4K, SZ_256, or 4)
+ *
+ * Returns: Number of bytes to copy to reach the target alignment.
+ */
+static u32 xe_migrate_bytes_to_align(u64 dst_addr, u32 alignment)
+{
+	return round_up(dst_addr, alignment) - dst_addr;
+}
+
+/**
+ * xe_migrate_aligned_copy_len() - Calculate the aligned copy length for matrix copy
+ * @len: Remaining bytes
+ * @pitch: The pitch to use for matrix copy
+ *
+ * Returns: Length rounded down to pitch, or 0 if less than pitch.
+ */
+static u32 xe_migrate_aligned_copy_len(u32 len, u32 pitch)
+{
+	if (len < pitch)
+		return 0;
+	return round_down(len, pitch);
+}
+
 static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 unsigned long len,
 					 unsigned long sram_offset,
@@ -2539,15 +2619,65 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		else
 			current_bytes = min_t(int, bytes_left, cursor.size);
 
-		pitch = xe_migrate_copy_pitch(xe, current_bytes,
-					      write ? vram_addr :
-					      (unsigned long)buf & ~PAGE_MASK);
-		if (xe->info.has_mem_copy_instr)
-			current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
-		else
-			current_bytes = min_t(int, current_bytes,
-					      round_down(S16_MAX * pitch,
-							 XE_CACHELINE_BYTES));
+		{
+			/*
+			 * Optimized copy strategy to minimize number of jobs:
+			 * 1. Linear copy to align dst to best reachable alignment
+			 * 2. Matrix copy for bulk data copy
+			 * 3. Single linear copy for remaining bytes
+			 */
+			u64 dst_addr = write ? vram_addr :
+					       (unsigned long)buf & ~PAGE_MASK;
+			u32 max_linear = xe->info.has_mem_copy_instr ? U16_MAX :
+					 round_down(S16_MAX, XE_CACHELINE_BYTES);
+			u32 best_align = xe_migrate_best_alignment(dst_addr, max_linear);
+			u32 bytes_to_align = best_align ?
+					     xe_migrate_bytes_to_align(dst_addr, best_align) : 0;
+
+			if (bytes_to_align > 0 && bytes_to_align <= (u32)current_bytes) {
+				/*
+				 * Phase 1: Linear copy to reach best alignment.
+				 * Copy just enough bytes to align dst_addr.
+				 */
+				pitch = 1;
+				current_bytes = min_t(int, bytes_to_align, max_linear);
+			} else if (IS_ALIGNED(dst_addr, 4)) {
+				/*
+				 * Phase 2: Matrix copy for aligned bulk data.
+				 * Use the best pitch that dst alignment supports,
+				 * then round down len to that pitch.
+				 */
+				u32 dst_pitch = xe_migrate_dst_pitch(dst_addr);
+				u32 aligned_len = xe_migrate_aligned_copy_len(current_bytes,
+								      dst_pitch);
+
+				if (aligned_len >= dst_pitch) {
+					pitch = dst_pitch;
+					if (xe->info.has_mem_copy_instr) {
+						current_bytes = min_t(int, aligned_len,
+								      U16_MAX * pitch);
+					} else {
+						current_bytes = min_t(int, aligned_len,
+								      round_down(S16_MAX * pitch,
+										 XE_CACHELINE_BYTES));
+					}
+				} else {
+					/*
+					 * Phase 3: Linear copy for remainder.
+					 * Not enough for matrix copy - do single linear copy.
+					 */
+					pitch = 1;
+					current_bytes = min_t(int, current_bytes, max_linear);
+				}
+			} else {
+				/*
+				 * Phase 3: Linear copy for remainder.
+				 * dst not 4-aligned and can't reach alignment - linear copy.
+				 */
+				pitch = 1;
+				current_bytes = min_t(int, current_bytes, max_linear);
+			}
+		}
 
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBEDCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 13:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB7C10FE19;
	Wed, 14 Oct 2026 13:46:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3FA10FE19
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 13:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791985610; x=1823521610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Otej9CSXFKH93LTINYtAkHA4GSf81aeSOP4CV5UU5wk=;
 b=Wgw2oeMTcpOxsnrWTqC0iL1aLw3u9jbwwA1O3wcbpmyNIFO3t8kZQUPJ
 Xt+AdbdmDl7rGdGXkCawpz68sdEl3LrPyKPkUglxm9/YlkXFM5joY93fU
 Y9SripNFW17JJ7xk6VyXMYRJ6BWV2qG/WVnIpzxyNcPNHzHrVmQkCpoGY
 PkveCWGc15dbGiQfpbQPGP4ws6J96h5m24hGXdn4h8/zoJIxYHbxrVtwu
 74d5n8ZfmOG1oeIoA6JcLgjXMCU7BbHJLkQNVhl753ASneT0bFd+wJF9A
 2iJ7LjoSrOLWCc2JQNX7HqAsV9t053FHSiF14bT/wggO+taa+LVt+UTzI g==;
X-CSE-ConnectionGUID: sI+8yomqSu6E13f2Qx4rmw==
X-CSE-MsgGUID: jqDOBHiYSlWRtk+Wbk4CRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="617477"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="617477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:46:50 -0700
X-CSE-ConnectionGUID: p8UbzS39TAen9a7FIUN8OQ==
X-CSE-MsgGUID: AHIJxmcPQR6kllNcLVPRvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1540009"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 06:46:48 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH v4 3/4] drm/xe/xe_migrate: Optimize unaligned access_memory
 copies
Date: Wed, 14 Oct 2026 15:46:33 +0200
Message-ID: <20261014134634.582314-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014134634.582314-1-jan.maslak@intel.com>
References: <20261014134634.582314-1-jan.maslak@intel.com>
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

When xe_migrate_access_memory() falls back to a smaller pitch for an
unaligned destination, the copy can end up running linearly for the
entire transfer.

Reduce the number of copy jobs by first using a short linear copy to
reach a better destination alignment, then using the largest matrix copy
pitch that alignment supports, and finally using a linear copy for any
remaining tail bytes.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 149 ++++++++++++++++++++++++++++++--
 1 file changed, 140 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4b995c93fcea..5609f29b28fe 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2207,6 +2207,86 @@ static u32 xe_migrate_copy_pitch(struct xe_device *xe, u32 len, u64 dst_addr)
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
+	u32 bytes_to_page = xe_migrate_bytes_to_align(dst_addr, PAGE_SIZE);
+	u32 bytes_to_4k = xe_migrate_bytes_to_align(dst_addr, SZ_4K);
+	u32 bytes_to_256 = xe_migrate_bytes_to_align(dst_addr, SZ_256);
+	u32 bytes_to_4 = xe_migrate_bytes_to_align(dst_addr, 4);
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
@@ -2540,15 +2620,66 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
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
+			 *
+			 * The phase logic controls transfer chunking; emit_copy() selects
+			 * MEM_COPY_CMD or XY_FAST_COPY_BLT based on hardware support.
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
+					u32 max_bytes = xe->info.has_mem_copy_instr ?
+							U16_MAX * dst_pitch :
+							round_down(S16_MAX * dst_pitch,
+								   XE_CACHELINE_BYTES);
+
+					pitch = dst_pitch;
+					current_bytes = min_t(int, aligned_len, max_bytes);
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


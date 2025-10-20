Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2973CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B1310E432;
	Mon, 20 Oct 2025 12:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4+D1oHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8AE10E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964887; x=1792500887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rJGWfAufUl9kXsNEJKEDtBtHXCGV+jePSwx3NirW8FM=;
 b=C4+D1oHdB2DrAA//FM+LkCw828aBvXeFbgfdYg4ZSXpFpd9la5PSxaNC
 YeeH08qi1vEYgIHgbZJwSFUi9MYOPy092sRi9xuLvrnzhMovqY34lHPD7
 lWtAMXPqojE3tcJzfeqYva2tvb4JRAcD8uNF2sFOWSFMzRJPpeGnCoXU8
 Qs9KhtNx4qGeMw7SAIL6To388UI16U6A6AMM1uYyEKIF0hPQNSJzMYFkw
 jzy0hcpybF7r71FAkjWYNqW7Npt2TbOU/YhxIswmlOaHV2c+dY8s5Yw+5
 01wJUCHFnmJzMsGiDgI8MosxT6c2POKKjoLlIHPMXKsH4UJvTLHgFTOji w==;
X-CSE-ConnectionGUID: S3Iw2RtGSLSI4pZp3OMvYw==
X-CSE-MsgGUID: AoYYHWRdT9GMe5f1V6SLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422399"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:47 -0700
X-CSE-ConnectionGUID: /NqOFn/2T5KocP+uQkuqjw==
X-CSE-MsgGUID: xObMX9BHQyq1f2JKmBc3PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512902"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 6/7] drm/xe/migrate: skip bounce buffer path on xe2
Date: Mon, 20 Oct 2025 13:54:38 +0100
Message-ID: <20251020125431.41153-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020125431.41153-9-matthew.auld@intel.com>
References: <20251020125431.41153-9-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 14ade32b8b69..7819a168ed17 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1938,8 +1938,9 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	unsigned long i, j;
 	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
-	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
-			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
+	if (!xe->info.has_mem_copy_instr &&
+	    drm_WARN_ON(&xe->drm,
+			(len & XE_CACHELINE_MASK) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
 		return ERR_PTR(-EOPNOTSUPP);
 
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
@@ -2158,8 +2159,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	xe_bo_assert_held(bo);
 
 	/* Use bounce buffer for small access and unaligned access */
-	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
-	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
+	if (!xe->info.has_mem_copy_instr &&
+	    (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
+	     !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))) {
 		int buf_offset = 0;
 		void *bounce;
 		int err;
@@ -2231,9 +2233,12 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		if (current_bytes & ~PAGE_MASK) {
 			int pitch = 4;
 
-			current_bytes = min_t(int, current_bytes,
-					      round_down(S16_MAX * pitch,
-							 XE_CACHELINE_BYTES));
+			if (xe->info.has_mem_copy_instr)
+				current_bytes = min_t(int, current_bytes, U16_MAX * pitch);
+			else
+				current_bytes =
+					min_t(int, current_bytes,
+					      round_down(S16_MAX * pitch, XE_CACHELINE_BYTES));
 		}
 
 		__fence = xe_migrate_vram(m, current_bytes,
-- 
2.51.0


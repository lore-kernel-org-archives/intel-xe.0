Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C843CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508EA10E820;
	Wed, 15 Oct 2025 14:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bA8puMfd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C27A10E80E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538029; x=1792074029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SR9KD7gIfaVCUEGkvyXVyqCdss1VODX+CxEYEnZ9PUo=;
 b=bA8puMfd1rK1sfknNm/y8jOm0dg6JSuomKRI6cT6BbdGH4gXef+981Wb
 rDInpv9aYcBI0PGIUx1kzK2YQ7vKmhsKjze1vG+heZe+vaR73Jz+AYHVZ
 3GraF7lI3zvmZy5WY5AsYpNc3M6qrUyHAg8YprGOPYesKRzze34BG+Qks
 FuSu16TxhzyBQG4nIr3Loli1MzwQ7cOqJ4DlXM8KttkR6r40U8BMniK6S
 BzkM7SPIgqVgEYPsHf0TDaEcEte46FRD9yqDMkoT8wCBuGiQh5tU1VGnR
 lfB/ZDuYJyeuAHnn/cjIDAfGAPXY8y8o61x7gGXyc2OCebF1EFD9447hv g==;
X-CSE-ConnectionGUID: GXgmMe0WSq+dOYqSZp/nXw==
X-CSE-MsgGUID: tOvnUAZ0T+OXvyBNGgL52w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="72990305"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="72990305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:29 -0700
X-CSE-ConnectionGUID: rCzEMU3dQbax6HyMyiLB1Q==
X-CSE-MsgGUID: fSExZR0/QAe6m9pdhVV61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181740988"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 6/6] drm/xe/migrate: skip bounce buffer path on xe2
Date: Wed, 15 Oct 2025 15:19:36 +0100
Message-ID: <20251015141929.123637-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015141929.123637-8-matthew.auld@intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index da1fefb96070..8bd8e8179313 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1933,9 +1933,11 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	int err;
 	unsigned long i, j;
 	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
+	bool has_byte_copy = GRAPHICS_VER(xe) >= 20;
 
-	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
-			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
+	if (!has_byte_copy &&
+	    drm_WARN_ON(&xe->drm,
+			(len & XE_CACHELINE_MASK) || (sram_offset | vram_addr) & XE_CACHELINE_MASK))
 		return ERR_PTR(-EOPNOTSUPP);
 
 	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
@@ -2149,13 +2151,14 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	struct drm_pagemap_addr *pagemap_addr;
 	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
 	int bytes_left = len, current_page = 0;
+	bool has_byte_copy = GRAPHICS_VER(xe) >= 20;
 	void *orig_buf = buf;
 
 	xe_bo_assert_held(bo);
 
 	/* Use bounce buffer for small access and unaligned access */
-	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
-	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
+	if (!has_byte_copy && (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
+			       !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))) {
 		int buf_offset = 0;
 		void *bounce;
 		int err;
-- 
2.51.0


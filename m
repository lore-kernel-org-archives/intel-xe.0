Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7A7CCD187
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 01:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C44710E352;
	Mon, 13 Oct 2025 01:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiOoH6BA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6455310E354
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 01:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760320587; x=1791856587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wWvBpm0dKVenZ5eVndf8zwxjEz4QV23LaL1M+P8m1eI=;
 b=CiOoH6BAK2ikMEyGkKjB/499G1LuuusgIT7S55JNIyjJPsbXoZZu/nSR
 feavr7Fjq44ayEkXSejtS4a6wiD3IiXELDYfo11hta8bOc+A1DmJoqwye
 FU84x+cDrZSA/zihwT5v9Un0A6QDHU4DGzISz20RjdSdTn1RgYbCAkENn
 EEAeR8wNc9SzP0E6SF7JoqRAvAgnTKXh+sfFR0ItSPd68TajVYikq0VKS
 fS6np+VyMdm0BA9cYD/zdyBBkugNSId4yIij0lilz4M9jMxRnVcaNAhmR
 8FzQtkF5lqhyZfC3QSRpFB8rb68mqvkYSBC83MJXmRZcQM2vK1+niHGkM Q==;
X-CSE-ConnectionGUID: GuLVAn7oSm+PysGnqT9e7A==
X-CSE-MsgGUID: MoCot3rkSMansSV3Q1zz7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="65074674"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="65074674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 18:56:26 -0700
X-CSE-ConnectionGUID: 0NKIjFCdQ+aT+udKxUWmjQ==
X-CSE-MsgGUID: nYoKuCDTRGSKW228m8xyNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181892725"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 18:56:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com, simon.richter@hogyros.de
Subject: [PATCH v4 1/2] drm/xe: Fix build_pt_update_batch_sram for non-4K
 PAGE_SIZE
Date: Sun, 12 Oct 2025 18:56:19 -0700
Message-Id: <20251013015620.4115242-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013015620.4115242-1-matthew.brost@intel.com>
References: <20251013015620.4115242-1-matthew.brost@intel.com>
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

The build_pt_update_batch_sram function in the Xe migrate layer assumes
PAGE_SIZE == XE_PAGE_SIZE (4K), which is not a valid assumption on
non-x86 platforms. This patch updates build_pt_update_batch_sram to
correctly handle PAGE_SIZE > 4K by programming multiple 4K GPU pages per
CPU page.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169..b534d1cc404a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1781,13 +1781,15 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       u32 size)
 {
 	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u64 gpu_page_size = 0x1ull << xe_pt_shift(0);
 	u32 ptes;
 	int i = 0;
 
-	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+	ptes = DIV_ROUND_UP(size, gpu_page_size);
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
+		chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
 		bb->cs[bb->len++] = 0;
@@ -1796,18 +1798,29 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i].addr & PAGE_MASK;
+			u64 addr = sram_addr[i].addr & ~(gpu_page_size - 1);
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
 				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
+
+again:
 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
 								 addr, pat_index,
 								 0, false, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			i++;
+			if (gpu_page_size < PAGE_SIZE) {
+				addr += XE_PAGE_SIZE;
+				if (sram_addr[i].addr + PAGE_SIZE != addr) {
+					chunk--;
+					goto again;
+				}
+				i++;
+			} else {
+				i += gpu_page_size / PAGE_SIZE;
+			}
 		}
 	}
 }
-- 
2.34.1


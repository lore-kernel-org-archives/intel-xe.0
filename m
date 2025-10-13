Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE16CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 03:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA0B10E00A;
	Mon, 13 Oct 2025 03:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2Tgg6P7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE3C10E047
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760327177; x=1791863177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mXs3MgpUkKYbZelPkF0mx3+Gfh3gyA6m1s3HqzOaaw=;
 b=V2Tgg6P723UlTQtcNCOEcXdHytP0ij5nl7az2R5sHNRPBpidN4ez5dPq
 I7GjShbohpwhK5TOb604d1DnRZiQUFrT4mYrxU7TJ8J+pCDvKyFEaAKLC
 opYXJFBtrCzOnFz4xMBEGcvxkWNSWKKdGliZ/ccqumQoSU0G2hi+1S6iL
 jjNJqVmUMC5SH2KmIgwT1wONURlatzFiYHxtz8SWQT5He1Y59w/kILywI
 hbLV4KL/QkDG3DQmPoGnujqSXXjE1BDIg3malpdGLReEGOw6ntPBHOCmK
 PKKwfzv3rdGu+FH8b+vdhqDoIRg/oI+q/JcfF5gA3wZeSsD5Jgf5Z14Ca w==;
X-CSE-ConnectionGUID: 86rmfVrKTjCaPnJBilwNEA==
X-CSE-MsgGUID: 4t6rRXqpTcmkQojWJyeeHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62558986"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62558986"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 20:46:01 -0700
X-CSE-ConnectionGUID: 9JZQZxnnQUWDlJhAMqnEkA==
X-CSE-MsgGUID: 04Z9b6svRZy12XFL6lV5nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181060420"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 20:46:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com, simon.richter@hogyros.de
Subject: [PATCH v5 1/2] drm/xe: Fix build_pt_update_batch_sram for non-4K
 PAGE_SIZE
Date: Sun, 12 Oct 2025 20:45:54 -0700
Message-Id: <20251013034555.4121168-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013034555.4121168-1-matthew.brost@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
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

v5:
 - Mask off non-address bits during compare

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169..216fc0ec2bb7 100644
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
@@ -1796,18 +1798,30 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i].addr & PAGE_MASK;
+			u64 addr = sram_addr[i].addr & ~(gpu_page_size - 1);
+			u64 pte, orig_addr = addr;
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
 				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
-			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
-								 addr, pat_index,
-								 0, false, 0);
-			bb->cs[bb->len++] = lower_32_bits(addr);
-			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			i++;
+again:
+			pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+								addr, pat_index,
+								0, false, 0);
+			bb->cs[bb->len++] = lower_32_bits(pte);
+			bb->cs[bb->len++] = upper_32_bits(pte);
+
+			if (gpu_page_size < PAGE_SIZE) {
+				addr += XE_PAGE_SIZE;
+				if (orig_addr + PAGE_SIZE != addr) {
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


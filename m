Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC938CCD1A7
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CC10E434;
	Mon, 20 Oct 2025 12:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSLauK1+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809D410E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760964882; x=1792500882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LdXWSwMNHbL8in1m3F+Gi1A287C12lTaPo82rB+7Sas=;
 b=DSLauK1+Bdla9ECPgUYD/4SYxddDo4BkBcq4TpiVtFyLgHCcv3FX6zKp
 4IaKiFaNqcbdayJkxnq4szVjGOwMnpDjkfgrdbz+Aa2svk4O21ep8a3E1
 eXJPcxfYV2497nx89OzjbiA029IeWDN2nosXG93Wgp7uN4GWBtJDwXVgd
 QW2zsXaa+3BE2uo80chvH/S7DIqrQiyFYPaL5o91oH2kT0DUWpcPYnEtw
 X2JbZlE7LaLWs2leLD+h9aOM5tcIzdgaAs7/QfByp3XpizIyZ/vCdVqPN
 ZVSOJKQY6jphcwZcVbMNg+YJEUMNu/ZBF3ud6mO24s5X3bXI5qmCLtDYw g==;
X-CSE-ConnectionGUID: 74tiJZ74TiOA487S92zO5A==
X-CSE-MsgGUID: TC0fb9s0ReSiC6T03ii1VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74422389"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="74422389"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:41 -0700
X-CSE-ConnectionGUID: 9VyEtgycTUOwUG2Z33wqRA==
X-CSE-MsgGUID: GGy7IH6pQleMLa6x9otnRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182512876"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.44])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 05:54:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/7] drm/xe/migrate: rework size restrictions for sram pte
 emit
Date: Mon, 20 Oct 2025 13:54:33 +0100
Message-ID: <20251020125431.41153-10-matthew.auld@intel.com>
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

We allow the input size to not be aligned to PAGE_SIZE, which leads to
various bugs in build_pt_update_batch_sram() for PAGE_SIZE > 4K systems.
For example if ptes is exactly one gpu_page_size then the chunk size is
rounded down to zero.  The simplest fix looks to be forcing PAGE_SIZE
aligned inputs.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3112c966c67d..8ff2d3b98e7f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1798,6 +1798,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	u32 ptes;
 	int i = 0;
 
+	xe_tile_assert(m->tile, PAGE_ALIGNED(size));
+
 	ptes = DIV_ROUND_UP(size, gpu_page_size);
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
@@ -1811,12 +1813,13 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i].addr & ~(gpu_page_size - 1);
-			u64 pte, orig_addr = addr;
+			u64 addr = sram_addr[i].addr;
+			u64 pte;
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
 				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
+			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
 
 again:
 			pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
@@ -1827,7 +1830,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 
 			if (gpu_page_size < PAGE_SIZE) {
 				addr += XE_PAGE_SIZE;
-				if (orig_addr + PAGE_SIZE != addr) {
+				if (!PAGE_ALIGNED(addr)) {
 					chunk--;
 					goto again;
 				}
@@ -1918,10 +1921,10 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	if (use_pde)
 		build_pt_update_batch_sram(m, bb, m->large_page_copy_pdes,
-					   sram_addr, len + sram_offset, 1);
+					   sram_addr, npages << PAGE_SHIFT, 1);
 	else
 		build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
-					   sram_addr, len + sram_offset, 0);
+					   sram_addr, npages << PAGE_SHIFT, 0);
 
 	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
 		if (use_pde)
-- 
2.51.0


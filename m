Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68B8C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759F810E08B;
	Thu, 12 Jun 2025 22:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3mtfC+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529E210E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749768391; x=1781304391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQ3/+ZEkX0WMS6QKjzBZ1q3fNjDQte7eqBypBCT90h8=;
 b=N3mtfC+YU52PJ5q0OBCTRcEeZaA8ULvsOmrl9ISaC13RLFS/kjG9U9Cz
 d8dgi8zTXznndBcbM7X5MNnYN+Do2hvaX4xivD18tlRIJjZXHjtP2I63P
 khNmuCmVzNGDqAbitPy3R6L40HEnYqYsbhFWmoMhKpcbhf239ZSuBFXjb
 /i485LH2O2TySWrY+RXij1pxHU86nAIsdWryq7kkrbY/7Y8z5+gytHB5Q
 uf/Dnr49kCum4rOCPNE5w1+oiEyOhCK9XL2fOH8GFzAd8/Mr2bPsdWPGf
 dgGejSi0v1PX6XyjeYuzjQCjOT9fAuBP6QLp/rjAsXPWNbuzxHcdk+bxV A==;
X-CSE-ConnectionGUID: pCTfxoWgTeGqVkMj5/DLuQ==
X-CSE-MsgGUID: dA+92FUdSCeuQQpxKs68Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55772123"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="55772123"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:46:29 -0700
X-CSE-ConnectionGUID: UuQkVSg9QsyDvKYLclkM8A==
X-CSE-MsgGUID: nCCRZ2DpTy20cL7sJB68/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="147496980"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2025 15:46:28 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Brian3 Nguyen <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
Date: Thu, 12 Jun 2025 22:46:20 +0000
Message-Id: <20250612224620.161105-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523150418.168362-1-jia.yao@intel.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
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

According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
valid value for x is 0x1FE, not 0x1FF.

v2
 - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew & Patelczyk, Maciej)

v3
 - Change macro MAX_PTE_PER_SDI from 0x1fe to 0x1feU (De Marchi, Lucas)

Bspec: 60246

Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
Cc: Alex Zuo <alex.zuo@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..6cdd4538fd6b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -82,7 +82,7 @@ struct xe_migrate {
  * of the instruction.  Subtracting the instruction header (1 dword) and
  * address (2 dwords), that leaves 0x3FD dwords (0x1FE qwords) for PTE values.
  */
-#define MAX_PTE_PER_SDI 0x1FE
+#define MAX_PTE_PER_SDI 0x1FEU
 
 /**
  * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
@@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
 	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
 	/*
 	 * MI_STORE_DATA_IMM command is used to update page table. Each
-	 * instruction can update maximumly 0x1ff pte entries. To update
-	 * n (n <= 0x1ff) pte entries, we need:
+	 * instruction can update maximumly 0x1fe pte entries. To update
+	 * n (n <= 0x1fe) pte entries, we need:
 	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
 	 * 2 dword for the page table's physical location
 	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
 	 */
-	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
+	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, MAX_PTE_PER_SDI);
 	num_dword += entries * 2;
 
 	return num_dword;
@@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 	while (ptes) {
-		u32 chunk = min(0x1ffU, ptes);
+		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
-- 
2.34.1


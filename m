Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4510C54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6165210E169;
	Tue, 27 May 2025 16:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6Kj8gM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8610E169
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748363456; x=1779899456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M8Xpk8xiMbKhnxQ5KHBjb9VdLeqHB8tvxcnqwAfFOqM=;
 b=N6Kj8gM+aRhlODdqY9kalojW+725LnvyzAZuiqLat0KDDFo9el5zNZeq
 MIyDO599gwdTK3EujjfpWwKjtnfVJfHoMZq9JPcEmULAKThmFjD8QeFqi
 vdYIG48m1wooa42z9bVJbb8r5ranf55csnv3Xkahm89KUy4SVSpcoH6JY
 qOTKV7mFL6zM3u57fhc/sylZIByx6DknCXrKl6y9N6vLtXDIf/19CByna
 Gfl/A4/XFKAaNQXDNvRlCN/7aCNQ9Zp6V9JmZU1U1a0ay3wNE/CPbrzlh
 2/noUgvcC2MeV9N1zRp/G/t3bU0Ya+lGVPVW0CHuh6xBCcAb4XA1ESe2o Q==;
X-CSE-ConnectionGUID: 6JTWjFU1SEmxEnDtJK/0UQ==
X-CSE-MsgGUID: gsWbc6LCRt2VWugd6XAHTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50060304"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50060304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:30:56 -0700
X-CSE-ConnectionGUID: pNaVFJBpSr+jKWuSKTvmJg==
X-CSE-MsgGUID: ZVU8gPIQSYiuIBCs0BDUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143337052"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by fmviesa010.fm.intel.com with ESMTP; 27 May 2025 09:30:53 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Brian3 Nguyen <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
Date: Tue, 27 May 2025 16:30:50 +0000
Message-Id: <20250527163050.287042-1-jia.yao@intel.com>
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

Bspec: 60246

Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
Cc: Alex Zuo <alex.zuo@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..1ede50780a14 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
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


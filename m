Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFEFC54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 15:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6444910E814;
	Fri, 23 May 2025 15:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+PbHyRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAA210E814
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748012667; x=1779548667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=226B13ccPCCYJOflltJiHSjj2nZguFvAgeLmictOHrk=;
 b=b+PbHyRpW4r9//COZwwu/rxSGwG0JyAQEIE8mMA8OqrfgbM0sFdJ9Tky
 wj+PkODxLDJXdqOPmAmCFEN3aG42fDAAohkqUdNygA8tnENV5cNCo7kHk
 fL1RUuEwDDnyEsZU9kr7X3wGPBQYN9EvF2fsgFYaw12X0jn3aoE3e6s57
 ivxA9M6/PkeCZiBIHUT7wJSqW6T7hRf9mY/6NVtqPS7PnpxjD8CDmvca8
 O9tk8+EpBqE8K/PXHSwR0SyERwKo8kgxS0GJEbU1CDPdl8OzdAoPuURq7
 l/o5wUBViBaDDnSSFnXk81yLtSAgsEBmhEFzRjn0BNNFZJtY2/Dz92prg Q==;
X-CSE-ConnectionGUID: hxk7QJyBSzKjwdiUJxRxGA==
X-CSE-MsgGUID: UQQWJap4QmSiMi2Micg7KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49955094"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="49955094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 08:04:24 -0700
X-CSE-ConnectionGUID: PWKa5dl/TeKv+qlxsYWNCA==
X-CSE-MsgGUID: jKoVT7+TQZ+OTmn3FMeFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="142214692"
Received: from osgcshtiger.sh.intel.com ([10.239.70.161])
 by fmviesa009.fm.intel.com with ESMTP; 23 May 2025 08:04:23 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Brian3 Nguyen <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
Date: Fri, 23 May 2025 15:04:18 +0000
Message-Id: <20250523150418.168362-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.34.1
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

Bspec: 60246

Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
Cc: Alex Zuo <alex.zuo@intel.com>
Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..be8f05574850 100644
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
+	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1fe);
 	num_dword += entries * 2;
 
 	return num_dword;
@@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 	while (ptes) {
-		u32 chunk = min(0x1ffU, ptes);
+		u32 chunk = min(0x1feU, ptes);
 
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
-- 
2.34.1


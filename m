Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6C3C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 14:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E0310E47B;
	Tue,  5 Aug 2025 14:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2lItCrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEFD10E478
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754402478; x=1785938478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5DsLyII9HfLYYkNAssxD+iJxjnthufGx461dFRdvFk=;
 b=W2lItCrv7Po1xE6PpPb/PwflmH6WbFCFTInHA3tn5nufGlebx415dOeo
 BLxQnHLfDZjy+GjLqPtWFVTtuNt/tJ/+0VIid99rxtu5ZPJ758To16YNY
 rb48b30fZpDjslFhiAM9Ql12kln6Fx+89CuhngTBStH3JM9/SMHCgVhn4
 DG2D2sb1FkMY8fGl55ehYARuVzbam4p3Cl50tf8xLVt+PtLTBEEyiKaPl
 KpSONzLpVQb5Ip2+nId0ROOJCUiivd/Vx6GrArUh80wgKBpxSqk+WVfT4
 vzsDGQ+N65Kczu1t3z0csvlKIOvI/5vPxtcg7kC646nNqdCwVzfkNagni Q==;
X-CSE-ConnectionGUID: hBgPYrbuTqGTR+bSz2qxRg==
X-CSE-MsgGUID: RCeqFz8BT5WLjwx93A+gcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82145240"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="82145240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:18 -0700
X-CSE-ConnectionGUID: pw5GaI2ERcmTmlVSPDkDng==
X-CSE-MsgGUID: L7FlupcdSW6CzwuE0LDNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201686344"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 07:01:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 5/6] drm/xe/migrate: Populate struct drm_pagemap_addr array
Date: Tue,  5 Aug 2025 15:59:06 +0200
Message-ID: <20250805140028.599361-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805140028.599361-1-francois.dugast@intel.com>
References: <20250805140028.599361-1-francois.dugast@intel.com>
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

Workaround to ensure all addresses are populated in the array as
this is expected when creating the copy batch. This is required
because the migrate layer does not support 2MB GPU pages yet. A
proper fix will come in a follow-up.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6a0f04411ae0..0f9636a06083 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1802,6 +1802,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
 		PAGE_SIZE : 4;
 	int err;
+	unsigned long i, j;
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
@@ -1818,6 +1819,24 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		return ERR_PTR(err);
 	}
 
+	/*
+	 * If the order of a struct drm_pagemap_addr entry is greater than 0,
+	 * the entry is populated by GPU pagemap but subsequent entries within
+	 * the range of that order are not populated.
+	 * build_pt_update_batch_sram() expects a fully populated array of
+	 * struct drm_pagemap_addr. Ensure this is the case even with higher
+	 * orders.
+	 */
+	for (i = 0; i < npages;) {
+		unsigned int order = sram_addr[i].order;
+
+		for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
+			if (!sram_addr[i + j].addr)
+				sram_addr[i + j].addr = sram_addr[i].addr + j * PAGE_SIZE;
+
+		i += NR_PAGES(order);
+	}
+
 	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
 				   sram_addr, len + sram_offset);
 
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A23AC87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E0810E6B6;
	Wed, 30 Jul 2025 14:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyHj3UCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583D910E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753885455; x=1785421455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5DsLyII9HfLYYkNAssxD+iJxjnthufGx461dFRdvFk=;
 b=NyHj3UCfqVMGPMfpJBUvOVU4fwybFUdBmLWKf8ejc1zSrqtQVdKhTPqt
 bL0yXEoYFceqOCBZknrgZKtuE0Av+5UReHTIa18HCxosH7ZFNgOVoa7sv
 OvjM143bhTUKGA13iqYRp4f2MMK8vnwr7iyVTvLtShrKjfuqmlT2IRkNk
 M5e128uzTPafAF7qDv+3F1mlW0V6mygZv6M3Pa20Mx7ipTMfPn6g2LrL2
 R2uTnzS5V7CaAK0C07s43Elxkc0SGK4dWGFXLdLVaIrGm1nP2l+jL7EkG
 9lEp7rU+WQP0XAyo0S+5fvCtsDA4QkYBYMSWSRq2UNBGuo1EOjyYcaVL4 Q==;
X-CSE-ConnectionGUID: fHSJ/ztdSFq8VmUdKUwZ+w==
X-CSE-MsgGUID: GqUoOlijTDKh3l52kXlcRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55392782"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55392782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:15 -0700
X-CSE-ConnectionGUID: 3tySluWiS8KZXqN0idGTuA==
X-CSE-MsgGUID: 4eXKzUlES3e+5Uz7/xLdOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167254530"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.245.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:24:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 5/6] drm/xe/migrate: Populate struct drm_pagemap_addr array
Date: Wed, 30 Jul 2025 16:22:50 +0200
Message-ID: <20250730142357.3851167-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730142357.3851167-1-francois.dugast@intel.com>
References: <20250730142357.3851167-1-francois.dugast@intel.com>
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


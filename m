Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1E7C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF610E80F;
	Thu, 17 Jul 2025 13:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpmUA1PY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB02A10E80F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759611; x=1784295611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+bCrqXVHQR4L7Z1h6ZRrRmAFumD69aEu2pepJu0ZgRg=;
 b=UpmUA1PYzbqkmmOW8xmc1uAg2gyBciY/c6kt53mlewrRfEveBdHi2Uhn
 3KVXoeBE/ghdZNb7SZq9O3C+nDr2yLBrlFgfyxbohaA1Exb4f6MkjMA9j
 xLDbgRLkAWxA++o6oyK8a0GyJm4/rUe3FSa+noMdP/iHjLY1zBVUeUk2o
 C0vuc/1hjP8CF7CjJSPmzaOxzwiekznNNzFQH1J5AoEDS5fHwMW2utO7g
 vu3vTu4OYepSV+SWsrahKMDxx8CLBmHh8fl7+scbducLudGygBbGhy7q7
 +SawYUm/IOLWuhjSm7EhpCRLJQ8YAAIdVCNeLbAKQ+c94gafp2+ZUY//Z g==;
X-CSE-ConnectionGUID: Vwt+Q0EQTmO+SQlipAA/Bg==
X-CSE-MsgGUID: hqTQGU+TR+akytx2HokB5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54251733"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54251733"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:11 -0700
X-CSE-ConnectionGUID: 4tyS/JEKTJmzs9NzLCKEcQ==
X-CSE-MsgGUID: tFJ3MCEiRZerMmc/wuv7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162328406"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 4/5] drm/xe/migrate: Use order to calculate migration length
Date: Thu, 17 Jul 2025 15:38:26 +0200
Message-ID: <20250717133928.526111-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717133928.526111-1-francois.dugast@intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
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

Since GPU SVM can DMA map folios, it can no longer be assumed that the
order is always 0 and that the mapping size is always PAGE_SIZE. Instead,
to determinate the migration length, use the order associated with each
DMA mapping, provided by drm_pagemap_device_addr.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 33d67993f1f6..efbf8c0f41dc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1724,7 +1724,12 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     struct drm_pagemap_device_addr *src_addr,
 				     u64 dst_addr)
 {
-	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
+	unsigned long i, len = 0;
+
+	for (i = 0; i < npages; i++)
+		len += PAGE_SIZE << src_addr[i].order;
+
+	return xe_migrate_vram(m, len, 0, src_addr, dst_addr,
 			       XE_MIGRATE_COPY_TO_VRAM);
 }
 
@@ -1745,7 +1750,12 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       u64 src_addr,
 				       struct drm_pagemap_device_addr *dst_addr)
 {
-	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
+	unsigned long i, len = 0;
+
+	for (i = 0; i < npages; i++)
+		len += PAGE_SIZE << dst_addr[i].order;
+
+	return xe_migrate_vram(m, len, 0, dst_addr, src_addr,
 			       XE_MIGRATE_COPY_TO_SRAM);
 }
 
-- 
2.43.0


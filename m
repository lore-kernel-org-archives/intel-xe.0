Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABF2C87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 15:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E7910E9ED;
	Fri, 25 Jul 2025 15:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaAz+FzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9662410E9EA
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753458040; x=1784994040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0RYiShIQ/TBKp8N+93/vL5SGulRWk0IXHzs3nLTips4=;
 b=DaAz+FzVg7kH13NMxMdvvsqGck2vgj+CwIsBNg2OcweNPuvwfoqX7f5b
 8nkmKon7znWL6U4afqWcdu+tjA3p9j21fh6EXQ3UPDOvvsHDl2i5Mpr36
 U0PB+vf6VNwhavw8voTc302oWMWRgwdgCQ7doVWZj+FXyyODFxM+C47iM
 B25orVtsqBwkTQUqirjRBFYJEGIVOZQqxV3BkdCe9u1EaCGuTvL6TYSQ1
 8GaEtshqk99EqYo7uI8yt9dcMPamEn1o5NNjHbtdfS0furZZMnyf70y5g
 fzkOf0m2QZwsaEYJNaEzgaCBwWOMEVrdTqkjlIJD+2qRnlEdrslhoX45g Q==;
X-CSE-ConnectionGUID: WGHjBU/tQVy/qE5ExxOfFg==
X-CSE-MsgGUID: QUt1jw2ZQI+VDf8wON2d/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="54879420"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="54879420"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:40 -0700
X-CSE-ConnectionGUID: l8vhu4BlRzqzvDd2HNtDAw==
X-CSE-MsgGUID: ZrDMhOVtQ3u1SxIhaAgDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165503684"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.200])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 08:40:39 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 5/6] drm/xe/migrate: Populate struct drm_pagemap_addr array
Date: Fri, 25 Jul 2025 17:39:29 +0200
Message-ID: <20250725154011.2807655-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725154011.2807655-1-francois.dugast@intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
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

Ensure all addresses are populated in the array as this is expected
when creating the copy batch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c33bd1b139c9..998b37852ac7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1797,6 +1797,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
 		PAGE_SIZE : 4;
 	int err;
+	unsigned long i, j;
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
@@ -1813,6 +1814,24 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
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


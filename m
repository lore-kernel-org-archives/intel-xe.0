Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F2C369CB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 10:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C121E89C05;
	Tue, 22 Apr 2025 09:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzNemmwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4E89C05
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745315996; x=1776851996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZNGkLc6DSkJJCVBSHVPWhbf4z3KJhsayx0T6U3erBVU=;
 b=FzNemmwi4eISX+8QXtdpFN9MYqqCoCeCk/xCwgDdAHsI2JA09VRk6Xnp
 9ITAv+thmRLN2KLM4JfDaxZ0vh72IdiIDYMQ3h6cI2OxpswIzjt29fRa1
 2AV5Wfd5dbJVcaStr0P/12laQlvwcD+7dfhltZpj6o5e1GbvnUf71r0zV
 VADRL9KiJCp+z6DX99VM5lQewrnpVkvWRr5TleirSPvMz7bAT9ABP7PiW
 0E3ES/Tmk7lWTjjnhgvzCTSdFhcOp4hPdmNGHnH7wkM5H+viDK2IiFraN
 0dYVIlXUbaNdaYpjhVu0rlPmFJQZQGYoBBaSonRpwO9dHQOUN1CAlUaEQ A==;
X-CSE-ConnectionGUID: TdUM/3i1Rbm7x14EHZfnzA==
X-CSE-MsgGUID: VpanPeN2Tg6OO6EihlsZvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="72260052"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="72260052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:59:56 -0700
X-CSE-ConnectionGUID: N71ggxKMSa+IhTen1gsNYg==
X-CSE-MsgGUID: ql4IN9hTTomB2/Z1FyD5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131719489"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:59:55 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 53M9xjq41198407
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 12:59:45 +0300
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 53M9xjV91198406; Tue, 22 Apr 2025 12:59:45 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/gpusvm: remove unused pages pointer
Date: Tue, 22 Apr 2025 12:59:43 +0300
Message-Id: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
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

the pages pointer is not used, remove it

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 2451c816edd5..30408f2dd370 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1330,7 +1330,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	unsigned long num_dma_mapped;
 	unsigned int order = 0;
 	unsigned long *pfns;
-	struct page **pages;
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
@@ -1368,8 +1367,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	mmput(mm);
 	if (err)
 		goto err_free;
-
-	pages = (struct page **)pfns;
 map_pages:
 	/*
 	 * Perform all dma mappings under the notifier lock to not
@@ -1444,8 +1441,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				err = -EFAULT;
 				goto err_unmap;
 			}
-
-			pages[i] = page;
 		} else {
 			dma_addr_t addr;
 
-- 
2.34.1


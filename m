Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF16FEB2719
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 10:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6253810E38A;
	Wed, 11 Feb 2026 10:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkOSaKfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3780E10E38A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770806542; x=1802342542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5B2BfXmlz6PbnYacDy6pryozirfkMhjvlJ+oU/b77hw=;
 b=nkOSaKfLJAXMU1bEB5CAARDrjHQLN+AGUiojcwTSSs80xFIS4AudlSzA
 ZJ6Yhjh6RkdGgZcu2RZJKousAf5ZLy6OLzz4+IDGeu1A02CbvLCQJBxIq
 JB/A92o4H/+Ip3zYuNiLuueN+Bi+8+Wfh+MHrvO+cofiNZ579TCZYCijo
 x6wRhF1Asq5P/r4WJc+MbamMchIuZPJpB7W5fEr6zkNsd4hURtujdGCiH
 SiV5fQUjvVIoFiBTB8kKrBqNQamW3RTk7zgwJWDA/6TVuT4Mh+ytOxvov
 xdZwrI19Jh2udQ422RC9TAgsUgFQQrSWQ+wLs1lLGwzcZkTgCg1k1dbk9 g==;
X-CSE-ConnectionGUID: KIMpVc05RNKeBX5V+80QEg==
X-CSE-MsgGUID: LM2jhaRWRL6uKCeiEJr//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71156904"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71156904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 02:42:21 -0800
X-CSE-ConnectionGUID: 0L+MBHJ2TNKP0mVlog2btQ==
X-CSE-MsgGUID: 09KN/V0QRNK8znBWeBybGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211320787"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.235])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 02:42:21 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] Revert "drm/pagemap: Disable device-to-device migration"
Date: Wed, 11 Feb 2026 11:41:59 +0100
Message-ID: <20260211104159.114947-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With commit
a69d1ab971a6 ("mm: Fix a hmm_range_fault() livelock / starvation problem")
device-to-device migration is not functional again and the
disabling can be reverted.

Add the above commit as a Fixes: tag in order for the revert to not
take place unless that commit is present.

This reverts commit 10dd1eaa80a56d3cf6d7c36b5269c8fed617f001.

Cc: Matthew Brost <matthew.brost@intel.com>
Fixes: a69d1ab971a6 ("mm: Fix a hmm_range_fault() livelock / starvation problem")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 38eca94f01a1..73438ba275bc 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -480,18 +480,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		.start		= start,
 		.end		= end,
 		.pgmap_owner	= pagemap->owner,
-		/*
-		 * FIXME: MIGRATE_VMA_SELECT_DEVICE_PRIVATE intermittently
-		 * causes 'xe_exec_system_allocator --r *race*no*' to trigger aa
-		 * engine reset and a hard hang due to getting stuck on a folio
-		 * lock. This should work and needs to be root-caused. The only
-		 * downside of not selecting MIGRATE_VMA_SELECT_DEVICE_PRIVATE
-		 * is that device-to-device migrations won’t work; instead,
-		 * memory will bounce through system memory. This path should be
-		 * rare and only occur when the madvise attributes of memory are
-		 * changed or atomics are being used.
-		 */
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
+		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
 	unsigned long i, npages = npages_in_range(start, end);
 	unsigned long own_pages = 0, migrated_pages = 0;
-- 
2.52.0


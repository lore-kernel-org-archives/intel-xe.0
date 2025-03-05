Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3038C282D3
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 09:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB23210E71B;
	Wed,  5 Mar 2025 09:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcqqhUsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24ED10E70E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741166556; x=1772702556;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MNORjv8BzN674AuWAcPXV7QIzeKdpro3hJOjk0t3gy0=;
 b=UcqqhUsKQCmL2jh7kI7fd6c+JEQs/6D0fp9RT/wNOkiHAf6aeaST2/Ii
 kt3+xTgZsWrrBA+MgYN8AMGviQIPNKlQG5FnkYg21Hpa6/cOLRvl6v63Q
 KNsvPgQGNvCUVfyOkXRr65iWov44RmZhdbzd4t5Ld5Kj7iWNaOlQIBVqa
 u1LzbQPVVYHZ5awHLKny9Gbv+4S3f3Z//YgGv9f81rvKM75XvdevU1gkZ
 FzmPgIgNGYrmhE5qenMxPKDTTU+OhUcdtpLle90WTHX3DnVMT4BUz9Vs7
 G3VsfgtbhYUMH2WXxO5iJLJ0SQSIrLu0pDxOjoAGSaSZ8il5ZYsSQEDFy Q==;
X-CSE-ConnectionGUID: mOXaTJloS2GdyWZEbtgGrA==
X-CSE-MsgGUID: Arn1Sq9YTBe4G54ac4oPzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64557167"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="64557167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:22:35 -0800
X-CSE-ConnectionGUID: bUH8IBX5SmyXWjiIXiEHtg==
X-CSE-MsgGUID: 8/HmnhdbRW2/J8buOYDbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123569523"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:22:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v17 3/7] drm/ttm: Use fault-injection to test error paths
Date: Wed,  5 Mar 2025 10:22:16 +0100
Message-ID: <20250305092220.123405-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305092220.123405-1-thomas.hellstrom@linux.intel.com>
References: <20250305092220.123405-1-thomas.hellstrom@linux.intel.com>
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

Use fault-injection to test partial TTM swapout and interrupted swapin.
Return -EINTR for swapin to test the callers ability to handle and
restart the swapin, and on swapout perform a partial swapout to test that
the swapin and release_shrunken functionality.

v8:
- Use the core fault-injection system.
v9:
- Fix compliation failure for !CONFIG_FAULT_INJECTION

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index ffb7abf52bab..83b10706ba89 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -48,6 +48,13 @@
 
 #include "ttm_module.h"
 
+#ifdef CONFIG_FAULT_INJECTION
+#include <linux/fault-inject.h>
+static DECLARE_FAULT_ATTR(backup_fault_inject);
+#else
+#define should_fail(...) false
+#endif
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -514,6 +521,12 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
 		if (ttm_backup_page_ptr_is_handle(p)) {
 			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
 
+			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
+			    should_fail(&backup_fault_inject, 1)) {
+				ret = -EINTR;
+				break;
+			}
+
 			if (handle == 0) {
 				restore->restored_pages++;
 				continue;
@@ -1007,7 +1020,13 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
 
 	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
 
-	for (i = 0; i < tt->num_pages; ++i) {
+	num_pages = tt->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
 		s64 shandle;
 
 		page = tt->pages[i];
@@ -1293,6 +1312,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_globals_fops);
 	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
 			    &ttm_pool_debugfs_shrink_fops);
+#ifdef CONFIG_FAULT_INJECTION
+	fault_create_debugfs_attr("backup_fault_inject", ttm_debugfs_root,
+				  &backup_fault_inject);
+#endif
 #endif
 
 	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
-- 
2.48.1


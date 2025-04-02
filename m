Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FDBC36017
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 12:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19E10E76B;
	Wed,  2 Apr 2025 12:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfWDez3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900810E76B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743596985; x=1775132985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RX81cDvAfIm6F1GzK2JqhEuybuGiptguA2JRsC9uHbs=;
 b=kfWDez3vJ4dbsfz42fIKHj8kxnTgD2L/MmQf2Rnqjjo0iR2xnWfckmJ2
 mS3Dg9dpzIDDA1JWT2GKjtbb3IeAQNa9a60PeirUVDkMrPenUN5ihHBBV
 zdh6vHHY6Hpfzz+nyfgSLSyYSN62WF+SaPIMJg7hvUxaaliwIf/dpe0Bl
 y00gi44xvxm/ZIHTiDn8/gp3lWoDDt4eCir66et8YQ7wNcI6rl0lRmv33
 CI6yMLANjqnvD0o21/nqDtZd0rqXIpEbeQzcaWpjtSnn22I7RnAiQpSxt
 h2LLs2ntGVDU7k5pRO0UGBcC+tD1o5ifufZYHkwI3Du+4MGLXt9gLU6P9 g==;
X-CSE-ConnectionGUID: mQ4G3uphTuuR/2zPi631Tw==
X-CSE-MsgGUID: Fy6VpFZDSs+s5BCEJtkGyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44105105"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44105105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:29:42 -0700
X-CSE-ConnectionGUID: +r1ggz34R++Y/s7bU0Xpvw==
X-CSE-MsgGUID: wzH6bh3BTyWfEALTQY25uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="149873352"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:29:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Fix xe_pt_stage_bind_walk kerneldoc
Date: Wed,  2 Apr 2025 14:29:24 +0200
Message-ID: <20250402122924.25526-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

The structure was missing a proper kerneldoc header and once
that was added a number of typos and errors became obvious.
Fix those.

Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
Closes: https://lore.kernel.org/intel-xe/x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj/
Fixes: b2d4b03b03a7 ("drm/xe: Make the PT code handle placement per PTE rather than per vma / range")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 82ae159feed1..33839b25d708 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -269,8 +269,11 @@ struct xe_pt_update {
 	bool preexisting;
 };
 
+/**
+ * struct xe_pt_stage_bind_walk - Walk state for the stage_bind walk.
+ */
 struct xe_pt_stage_bind_walk {
-	/** base: The base class. */
+	/** @base: The base class. */
 	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
@@ -278,14 +281,14 @@ struct xe_pt_stage_bind_walk {
 	struct xe_vm *vm;
 	/** @tile: The tile we're building for. */
 	struct xe_tile *tile;
-	/** @default_pte: PTE flag only template for VRAM. No address is associated */
+	/** @default_vram_pte: PTE flag only template for VRAM. No address is associated */
 	u64 default_vram_pte;
-	/** @default_pte: PTE flag only template for VRAM. No address is associated */
+	/** @default_system_pte: PTE flag only template for System. No address is associated */
 	u64 default_system_pte;
 	/** @dma_offset: DMA offset to add to the PTE. */
 	u64 dma_offset;
 	/**
-	 * @needs_64k: This address range enforces 64K alignment and
+	 * @needs_64K: This address range enforces 64K alignment and
 	 * granularity on VRAM.
 	 */
 	bool needs_64K;
@@ -301,6 +304,7 @@ struct xe_pt_stage_bind_walk {
 	u64 va_curs_start;
 
 	/* Output */
+	/** @wupd: Walk output data for page-table updates. */
 	struct xe_walk_update {
 		/** @wupd.entries: Caller provided storage. */
 		struct xe_vm_pgtable_update *entries;
@@ -318,7 +322,7 @@ struct xe_pt_stage_bind_walk {
 	u64 l0_end_addr;
 	/** @addr_64K: The start address of the current 64K chunk. */
 	u64 addr_64K;
-	/** @found_64: Whether @add_64K actually points to a 64K chunk. */
+	/** @found_64K: Whether @add_64K actually points to a 64K chunk. */
 	bool found_64K;
 };
 
-- 
2.48.1


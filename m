Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AFBCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB0110E0A8;
	Mon,  6 Oct 2025 15:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+f7d7cA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680310E0A8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759763739; x=1791299739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mVLfQNTWw4qULi2rFZvJLLIuO0EkCgBFZQ2gs8+bDmE=;
 b=J+f7d7cA3/1w12KP7R/HztW9+UJ0+spKoKQBNMmPYZKH//nduQAt7IA1
 F9qmNr4XYsIenebgvwe6UaA7iUqkKLk1ro58unCHZE2YcXFhszkKcsLzi
 TnIvFDhiP7w4v5Prx3k3yrKQrftZOeOvwPbn/z/TTdBOrb1u3h5yaRmsf
 dIdd4eitQ0c+r5WG82CvhDDz60Uvi0P/xl2LlW1CnbQ/Qq8skolWllY86
 Q6hMu0i7SwgN6rJqtWJbAYbjySpvyEY+0ycC58ycLZFnjC++N6CH8skPj
 stH70c/PQo0rieOh6HMvUoI2eDHtuzbLZM9gWtDOOq2ttskq82LLMrCuB A==;
X-CSE-ConnectionGUID: p3UWy7V3QUqJKtv4Wu3Kow==
X-CSE-MsgGUID: WKMrnOuzTpqfJmO2Kx7//g==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61647796"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61647796"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:15:39 -0700
X-CSE-ConnectionGUID: hSFgLXSES5STEo2X/ocaEg==
X-CSE-MsgGUID: ZZW+3oBuTeigF+0rmcqVSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="203643011"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2025 08:15:37 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/xe: Fix comments in xe_gt struct
Date: Mon,  6 Oct 2025 15:13:18 +0000
Message-ID: <20251006151317.2553182-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251003234850.2481736-2-shuicheng.lin@intel.com>
References: <20251003234850.2481736-2-shuicheng.lin@intel.com>
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

Correct several spelling and grammar issues in xe_gt struct
documentation to improve readability:

- Fix "to not" -> "do not".
- Fix "mmigrations" -> "migrations".
- Fix "Multiple queues exists" -> "Multiple queues exist".
- Fix "are be processed" -> "to be processed".
- Fix "have being processed" -> "have been processed".

These changes are purely cosmetic and do not affect functionality.

v2: drop kernel-doc formatting change. (Jani)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 66158105aca5..8b5f604d7883 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -202,14 +202,14 @@ struct xe_gt {
 		/**
 		 * @usm.bb_pool: Pool from which batchbuffers, for USM operations
 		 * (e.g. migrations, fixing page tables), are allocated.
-		 * Dedicated pool needed so USM operations to not get blocked
+		 * Dedicated pool needed so USM operations do not get blocked
 		 * behind any user operations which may have resulted in a
 		 * fault.
 		 */
 		struct xe_sa_manager *bb_pool;
 		/**
 		 * @usm.reserved_bcs_instance: reserved BCS instance used for USM
-		 * operations (e.g. mmigrations, fixing page tables)
+		 * operations (e.g. migrations, fixing page tables)
 		 */
 		u16 reserved_bcs_instance;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
@@ -220,8 +220,8 @@ struct xe_gt {
 		 * @usm.pf_queue: Page fault queue used to sync faults so faults can
 		 * be processed not under the GuC CT lock. The queue is sized so
 		 * it can sync all possible faults (1 per physical engine).
-		 * Multiple queues exists for page faults from different VMs are
-		 * be processed in parallel.
+		 * Multiple queues exist for page faults from different VMs to be
+		 * processed in parallel.
 		 */
 		struct pf_queue {
 			/** @usm.pf_queue.gt: back pointer to GT */
@@ -387,7 +387,7 @@ struct xe_gt {
 		/**
 		 * @wa_active.oob_initialized: mark oob as initialized to help
 		 * detecting misuse of XE_GT_WA() - it can only be called on
-		 * initialization after OOB WAs have being processed
+		 * initialization after OOB WAs have been processed
 		 */
 		bool oob_initialized;
 	} wa_active;
-- 
2.49.0


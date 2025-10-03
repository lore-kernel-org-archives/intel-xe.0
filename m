Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E12CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 23:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7F110E17E;
	Fri,  3 Oct 2025 23:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8uCE5DT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9AF10E17E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 23:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759535457; x=1791071457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bZO4QU+HPdPbBnt+6Nj2GgN+tzhRaEntYRuvfegD56A=;
 b=N8uCE5DTg0els3gPa01OpyV93Pt4RP9hYXgLWdoMk3EjfaibOgsUdEIy
 uuxb++jLVvQB45wV5xWT3DWZOTc8L9fSVmDuLIm7DbOIs5laxjvZCfaV7
 kXPQYYFravkM3gMhyXRZkDotujNkiiA8f/4qvdWwxdzA+IlJWhcOaEhOg
 ItPIdtArXN6jf6LGUVM1Q4ymZHfoYAM2q5bKUL685Ml7NJv9xKVeBWELN
 MbVyq/jF2+01frSVHPmKS3ZIRdZuiWWI472MrGdUI5tIbLtGZgXEaZ4+z
 sFQSx0BWODnlc/cidog1iBNhyI//H5n6dj7JlUAr4YBac82FVr+Zi2sHq g==;
X-CSE-ConnectionGUID: dF9qkfq8SjabxXJTxcFGjg==
X-CSE-MsgGUID: xFTCUB4PQZSdrd+KOigmuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="65462151"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="65462151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 16:50:56 -0700
X-CSE-ConnectionGUID: 9YC29KUARY6OQPgciZL3+w==
X-CSE-MsgGUID: IMudyZuJTja8Sv07yJ9LFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="179047479"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa007.fm.intel.com with ESMTP; 03 Oct 2025 16:50:55 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Fix typos and improve kernel-doc comments in xe_gt
Date: Fri,  3 Oct 2025 23:48:51 +0000
Message-ID: <20251003234850.2481736-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

- Use proper kernel-doc comment opener (`/**`).
- Fix "to not" -> "do not".
- Fix "mmigrations" -> "migrations".
- Fix "Multiple queues exists" -> "Multiple queues exist".
- Fix "are be processed" -> "to be processed".
- Fix "have being processed" -> "have been processed".

These changes are purely cosmetic and do not affect functionality.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 66158105aca5..8fb4ea1d90f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -50,7 +50,7 @@ struct xe_mmio_range {
 	u32 end;
 };
 
-/*
+/**
  * The hardware has multiple kinds of multicast register ranges that need
  * special register steering (and future platforms are expected to add
  * additional types).
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


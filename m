Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ACAE77197
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 00:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6855610E7CB;
	Fri,  3 Jan 2025 00:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc7P7NnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACBA10E7C7
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735863093; x=1767399093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TO+RgavdHQiqdqkUO/9wsRslsporzO+vdl9zCHFWrU8=;
 b=Fc7P7NnYA/8lazXCXREgMmVodOIOHFLp1t6FUxeBa7P2C5IsA+72iFta
 XXaQCX55B8AB2r52BUKIktm/3D4U5G0sy8M5D00u8sacNLjkWzzWUuTG8
 AW3Ts/04owApvdbFVyQ3Y1EomRaEHrTgEPWYP9BpKcZV1Kjoy11HmOAan
 wR8IWpPKJWHhGlEbxf0vo3WAxYWEEIOizGbP5ymg3mQTuj0PgbOH6Ah/4
 tHnORzcfQEcOeHjelAD7HMP7i2iZ+Wy0YSmNfevpYY8iuEem7iBAJXO89
 qX2v4dicm+C1AWrZ0ND8cUXvEV6/0qhGUPbZs6gQ9807Urzd/sY5HXa/s w==;
X-CSE-ConnectionGUID: d9BkOBmdSua0VyUnXIYwzw==
X-CSE-MsgGUID: yUrhE/KhTgqnd3XBnlmG8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53519370"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="53519370"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 16:11:31 -0800
X-CSE-ConnectionGUID: I8632tyEQe6Sd/8/ckT7wQ==
X-CSE-MsgGUID: 7PZajYP0QH25H2aXimH2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101498541"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 16:11:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix tlb invalidation when wedging
Date: Thu,  2 Jan 2025 16:11:10 -0800
Message-ID: <20250103001111.331684-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250103001111.331684-1-lucas.demarchi@intel.com>
References: <20250103001111.331684-1-lucas.demarchi@intel.com>
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

If GuC fails to load, the driver wedges, but in the process it tries to
do stuff that may not be initialized yet. This moves the
xe_gt_tlb_invalidation_init() to be done earlier: as its own doc says,
it's a software-only initialization and should had been named with the
_early() suffix.

Move it to be called by xe_gt_init_early(), so the locks and seqno are
initialized, avoiding a NULL ptr deref when wedging:

	xe 0000:03:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01
	xe 0000:03:00.0: [drm] *ERROR* GT0: firmware signature verification failed
	xe 0000:03:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:03:00.0 as wedged.
	...
	BUG: kernel NULL pointer dereference, address: 0000000000000000
	#PF: supervisor read access in kernel mode
	#PF: error_code(0x0000) - not-present page
	PGD 0 P4D 0
	Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
	CPU: 9 UID: 0 PID: 3908 Comm: modprobe Tainted: G     U  W          6.13.0-rc4-xe+ #3
	Tainted: [U]=USER, [W]=WARN
	Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-S ADP-S DDR5 UDIMM CRB, BIOS ADLSFWI1.R00.3275.A00.2207010640 07/01/2022
	RIP: 0010:xe_gt_tlb_invalidation_reset+0x75/0x110 [xe]

This can be easily triggered by poking the GuC binary to force a
signature failure. There will still be an extra message,

	xe 0000:03:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100

but that's better than a NULL ptr deref.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3956
Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 41ab7fbebc193..26e64530ada27 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -387,6 +387,10 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
 
+	err = xe_gt_tlb_invalidation_init_early(gt);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -588,10 +592,6 @@ int xe_gt_init(struct xe_gt *gt)
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
 	}
 
-	err = xe_gt_tlb_invalidation_init(gt);
-	if (err)
-		return err;
-
 	err = xe_gt_pagefault_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 665927b80e9ea..257b500e17037 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -106,7 +106,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 }
 
 /**
- * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
+ * xe_gt_tlb_invalidation_init_early - Initialize GT TLB invalidation state
  * @gt: graphics tile
  *
  * Initialize GT TLB invalidation state, purely software initialization, should
@@ -114,7 +114,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
+int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
 {
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 00b1c6c01e8d9..672acfcdf0d70 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -14,7 +14,8 @@ struct xe_gt;
 struct xe_guc;
 struct xe_vma;
 
-int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
+int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
+
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-- 
2.47.0


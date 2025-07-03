Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBEBC83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F4110E918;
	Thu,  3 Jul 2025 22:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n55RVJ3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D018B10E912
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582487; x=1783118487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=52pfKbX9dXBRNF3hS4LlI7mFIOq4CvsvGHUfYe6/LrQ=;
 b=n55RVJ3ohYbViA9EwUWeJHRuZ2Pllgci3F3WhgOnQAW7cJDevveYPJsB
 E1dIzASnb7Y0o13lECLJUiyvFCwM/zJ5l6BtMWtKmRISiLxQJH4IQRlPu
 5PzmCnfXCOo5JjStcCrUDcc/E+lGFq/O5K6zN6V1nDveBDaT/8eSzfWz5
 i8q4SK64JHUfWwWC8liHZ0GSqtJ+1oeGr0gcvhboDZ4qMJ13IE5SqTGRc
 8BMTeycNM347or7vVX50tcWd9tfMoNcP02rO3VWJ7K3hAszcKV0CT1Cwl
 6yusJPw3Qv+6tegOVhsaP6gd/LrTjB0ZomzL3WZ3qsDjTnWYWhWxZAXHH w==;
X-CSE-ConnectionGUID: fUZaR6uzSoGflH5pk8a/mw==
X-CSE-MsgGUID: 9Q4cB1oOSWSjVvvczL6pjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468778"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468778"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: PhPHafVDTgS1VTNsTt9EsQ==
X-CSE-MsgGUID: 1vWmLYo+TJ+lgj+tQZ/AAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048794"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/7] drm/xe/lrc: Reduce scope of empty lrc data
Date: Thu,  3 Jul 2025 15:41:10 -0700
Message-ID: <20250703-lrc-refactors-v1-1-6aa22f174041@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

The only case in which new lrc data is created from scratch is when it's
called prior to recording the default lrc. There's no need to check for
NULL init_data since in that case the function already failed: just move
the allocation where it's needed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d2ad8fe737eb3..7cde827ddbec9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1044,7 +1044,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
-	void *init_data = NULL;
 	u32 arb_enable;
 	u32 bo_flags;
 	int err;
@@ -1076,25 +1075,26 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	if (!gt->default_lrc[hwe->class]) {
-		init_data = empty_lrc_data(hwe);
-		if (!init_data) {
-			err = -ENOMEM;
-			goto err_lrc_finish;
-		}
-	}
-
 	/*
 	 * Init Per-Process of HW status Page, LRC / context state to known
-	 * values
+	 * values. If there's already a primed default_lrc, just copy it, otherwise
+	 * it's the early submission to record the lrc: build a new empty one from
+	 * scratch.
 	 */
 	map = __xe_lrc_pphwsp_map(lrc);
-	if (!init_data) {
+	if (gt->default_lrc[hwe->class]) {
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
 				 lrc_size - LRC_PPHWSP_SIZE);
 	} else {
+		void *init_data = empty_lrc_data(hwe);
+
+		if (!init_data) {
+			err = -ENOMEM;
+			goto err_lrc_finish;
+		}
+
 		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
 		kfree(init_data);
 	}

-- 
2.49.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B24AC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58A010E960;
	Thu, 10 Jul 2025 20:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVvulmmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5310E952
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179724; x=1783715724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZhmXry1+6utAaXvqrJ0RA/p3HZZNDH8qa4Vbq0H6WUc=;
 b=XVvulmmj5mmVaD8J8IxCJgsCnJrM+7suDiIlJG7MGDctcryj9GGybrDu
 tcO5SXRlLeNE0SX5QvrKj9fl/JI4tyW9JGoXT9RIiAj+An+4JXS9M36Ky
 G2CqZF4rJFK10Yw78/mCVtN+xRCf+SFFqMDFGjfIzcrkRh9B6b1UGDDiT
 /tMxX2jBC0Syz5hM0E2BNQ211zyWrtjha+9T7ND2d/+s6nNeuTQNzVby0
 KJp7WLMIwMTZpr3pzXhDPDTrtJiY3TV6hhOYO46zNogMR3d5CWbcZrYYh
 id9sqqRr/Jx+x+b30deL5fXZrkmdd5JEa8NB1RNQjZvT7hBxhUDRqDpBx A==;
X-CSE-ConnectionGUID: o0nxI4P/Sayt1V3+tuXPYQ==
X-CSE-MsgGUID: mzzFfaB3SWuNDgqdw0LWiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908467"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:24 -0700
X-CSE-ConnectionGUID: KWA9S1uvRWSGEwqnut3rnQ==
X-CSE-MsgGUID: HM7lNZ+/SEOoKf1vGphE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744240"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 1/7] drm/xe/lrc: Reduce scope of empty lrc data
Date: Thu, 10 Jul 2025 13:33:46 -0700
Message-ID: <20250710-lrc-refactors-v2-1-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
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

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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


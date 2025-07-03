Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225BC83F05
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB8A10E91A;
	Thu,  3 Jul 2025 22:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqM+sCDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CE410E912
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582488; x=1783118488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NOPVVdQ92tgD7bQkKeH7yGqvJD/Z6vDHcvNHcbxTN+s=;
 b=WqM+sCDgxomwxzHcqSs5t+zWEAtvMcRoDTWmJFbf4GaOyA4UAkUsr2LB
 ckqqkjXZ4ZESgJ64ThNJ6tNi8Qr7gutdFsl1AcoBgKsdnMxcEMrVYCh66
 MamUXmbrCUIInze4aoj29K0MaJIFvn3WhfNJCbFLcwy6nc0x3AYUhvGnY
 e4ux0Wf/HgzkJBrzWGVAalKvHVFL7fUrYX8Pfoss3JRyblHPnniQR+LB6
 k/5wPCmHr3vDxdSYVF+DEyD3v/AwXRDwmT8LfEaNMRjGdU+KKwSN6M+Bm
 AUAaG5Dop/WDOgOHDZb9wSs7a4uOiE3BvTvTkU/7ezeNQVBgzymUvthIC g==;
X-CSE-ConnectionGUID: pG/U3lXqSvK2+V6tVgzIgQ==
X-CSE-MsgGUID: 2l/3kVOVTK6C8P50CgI9TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468780"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: nXoyeQxpQGi24B4vN+D+Yw==
X-CSE-MsgGUID: rm6+f+5DTk+PB8BjEC982Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048797"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/7] drm/xe: Count dwords before allocating
Date: Thu,  3 Jul 2025 15:41:11 -0700
Message-ID: <20250703-lrc-refactors-v1-2-6aa22f174041@intel.com>
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

The bb allocation in emit_wa_job() is wrong in 2 ways: first it's
allocating enough space for the 3DSTATE or hardcoding 4k depending on
the engine. In the first case it doesn't account for the WAs and in the
former it may not be sufficient. Secondly it's using the size instead of
number of dwords, causing the buffer to be 4x bigger than needed.

While it's unlikely this is causing any real issue, let's calculate the
needed space and allocate just enough.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d397df056e4cd..a926f560f2e36 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -189,16 +189,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	long timeout;
 	int count_rmw = 0;
 	int count = 0;
-
-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
-		/* Big enough to emit all of the context's 3DSTATE */
-		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
-	else
-		/* Just pick a large BB size */
-		bb = xe_bb_new(gt, SZ_4K, false);
-
-	if (IS_ERR(bb))
-		return PTR_ERR(bb);
+	size_t bb_len;
 
 	/* count RMW registers as those will be handled separately */
 	xa_for_each(&sr->xa, idx, entry) {
@@ -211,8 +202,26 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (count || count_rmw)
 		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
 
+	bb_len = count * 2;
+	if (count_rmw)
+		bb_len += count_rmw * 20 + 7;
+
+	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
+		/*
+		 * Big enough to emit all of the context's 3DSTATE via
+		 * xe_lrc_emit_hwe_state_instructions()
+		 */
+		bb_len += xe_gt_lrc_size(gt, q->hwe->class) / sizeof(u32);
+
+	/* Make sure accounting offsets downward is also aligned */
+	bb_len = ALIGN(bb_len, SZ_4K);
+
+	bb = xe_bb_new(gt, bb_len, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
 	if (count) {
-		/* emit single LRI with all non RMW regs */
+		/* Emit single LRI with all non RMW regs: 2 dw per reg */
 
 		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
 
@@ -236,7 +245,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	}
 
 	if (count_rmw) {
-		/* emit MI_MATH for each RMW reg */
+		/* Emit MI_MATH for each RMW reg: 20dw per reg + 7 trailing dw */
 
 		xa_for_each(&sr->xa, idx, entry) {
 			if (entry->reg.masked || entry->clr_bits == ~0)

-- 
2.49.0


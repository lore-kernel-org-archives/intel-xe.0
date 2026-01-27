Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963A4D2FEDC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580F310E5B6;
	Tue, 27 Jan 2026 19:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXaVipxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95710E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769542660; x=1801078660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t7fBdaRF6jI5CHsjqOSzO13aF58Q2O/5+MtRfU36gTg=;
 b=TXaVipxgoNLycSIRddNGpOKp6s3cTFt+jfZ7e4qEFY4BdsSs7hn41i3E
 Q5lnJCXIlzJktMTYFY0S4yDm7KfGMLueZ0NoI6FStHsLkYL1H4UboRFU8
 9HSSLIqTdMPZng5MnHW9rNdJis72DT7B2VD7ctxR5u6MZhSRL3q1eHlWE
 FL06I+Cq3oVVtWL2yPqI6qZvXQpH+YhNb7bOuFC65MFaRR78wPEUer3Cu
 XDDsLOb6x7fbgCXjbwxWibEEui/3Z/b9muITPSBG0HgR/wZXI5oz4isc+
 fAVaBXKB5Jau20UzGv5xh+239EQ69O7LcWilP2XmoZtOVQ0pkLhKhqXEF w==;
X-CSE-ConnectionGUID: B5bNXJkYSZa13lpS2Pud4Q==
X-CSE-MsgGUID: eSbM68hmQ9mHfxFhKgWmgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69764781"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69764781"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:40 -0800
X-CSE-ConnectionGUID: lcKKZ3TtS5e3Fp5busZFKA==
X-CSE-MsgGUID: 2AoLBxXORxGFDVu7kqaVMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207958945"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:39 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/6] drm/xe/guc: Limit sleep while waiting for H2G credits
Date: Tue, 27 Jan 2026 20:37:23 +0100
Message-ID: <20260127193727.601-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127193727.601-1-michal.wajdeczko@intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

Instead of endlessly increasing the sleep timeout while waiting
for the H2G credits, use exponential increase only up to the given
limit, like it was initially done in the GuC submission code.

While here, fix the actual timeout to the 1s as it was documented.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..d4111124cd5f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -32,6 +32,7 @@
 #include "xe_guc_tlb_inval.h"
 #include "xe_map.h"
 #include "xe_pm.h"
+#include "xe_sleep.h"
 #include "xe_sriov_vf.h"
 #include "xe_trace_guc.h"
 
@@ -1101,7 +1102,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct);
  */
 static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
 				       u32 g2h_len, struct g2h_fence *g2h_fence,
-				       unsigned int *sleep_period_ms)
+				       unsigned int *sleep_period_ms,
+				       unsigned int *sleep_total_ms)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 
@@ -1115,15 +1117,14 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
 	if (!h2g_has_room(ct, len + GUC_CTB_HDR_LEN)) {
 		struct guc_ctb *h2g = &ct->ctbs.h2g;
 
-		if (*sleep_period_ms == 1024)
+		if (*sleep_total_ms > 1000)
 			return false;
 
 		trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g->info.tail,
 						 h2g->info.size,
 						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
-		msleep(*sleep_period_ms);
-		*sleep_period_ms <<= 1;
+		xe_sleep_exponential_ms(sleep_period_ms, 64);
 	} else {
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
@@ -1161,6 +1162,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	struct xe_gt *gt = ct_to_gt(ct);
 	unsigned int sleep_period_ms = 1;
+	unsigned int sleep_total_ms = 0;
 	int ret;
 
 	xe_gt_assert(gt, !g2h_len || !g2h_fence);
@@ -1173,7 +1175,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	if (unlikely(ret == -EBUSY)) {
 		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
-						&sleep_period_ms))
+						&sleep_period_ms, &sleep_total_ms))
 			goto broken;
 		goto try_again;
 	}
-- 
2.47.1


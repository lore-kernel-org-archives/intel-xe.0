Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5338CD3447
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FE010E0BD;
	Thu,  7 May 2026 16:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnKbNp5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC7B10E0BD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170825; x=1809706825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N5Yh3rHcscW4lvHpsWXA0O08lWE+2tJRdrCyXTGEn+w=;
 b=hnKbNp5N3PvOBoU9QN6X72OjIPHzJ1B+yxF/Vf7Tfuf5fJIwGwVhfLDH
 H1Mgku4Z7kMH9aakPI+zCiYg5ImVRQvH8FgWux0yBxg3CKv2v8bhprC2U
 glUCZcCe6PKPgwf2RYLtdQBAq5s73zhAR68vQtGj73b20ImjyXun/9s7Q
 iwaZG6tnlwMSaQ5+Akp4dSJvzyLh5/6XKtlG0Pq6T1O2Wm/bEGQf2mcAK
 6Nw3kGtzcO0OPjx2Hhuwbi5CzQYDigJzRHVs85MuABPOsYV62QsRnQuoV
 vrjsmdgd2HlR30Xr/Pr9/Pwen1QTvlr/tBslGoMEB1PeeQWIA901OjPja w==;
X-CSE-ConnectionGUID: 0PZWVzTrQnq3TXamw7Npkw==
X-CSE-MsgGUID: Bg/CzpVxQQ6WhJm6s0MZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063600"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: UHSAs0UbT0i+QRt0LrwFDg==
X-CSE-MsgGUID: LCJuDUKBQOyJFGC1zpYAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876569"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 03/11] drm/xe/lrc: Refactor xe_lrc_timestamp to simplify
 logic
Date: Thu,  7 May 2026 09:20:20 -0700
Message-ID: <20260507162016.3888309-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
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

Use a context_active() helper and simplify the timestamp logic.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2: Add a comment if context switched out (Niranjana)
---
 drivers/gpu/drm/xe/xe_lrc.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 66682a678cc2..b31525bd2a4c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2585,6 +2585,11 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
 	return 0;
 }
 
+static bool context_active(struct xe_lrc *lrc)
+{
+	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
+}
+
 /**
  * xe_lrc_timestamp() - Current ctx timestamp
  * @lrc: Pointer to the lrc.
@@ -2597,33 +2602,23 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
  */
 u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 {
-	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
-	u32 engine_id;
+	u64 reg_ts, new_ts = lrc->ctx_timestamp;
 
-	lrc_ts = xe_lrc_ctx_timestamp(lrc);
 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
-	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
-		new_ts = lrc_ts;
-		goto done;
-	}
-
-	if (lrc_ts == CONTEXT_ACTIVE) {
-		engine_id = xe_lrc_engine_id(lrc);
-		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
-			new_ts = reg_ts;
+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
+		return xe_lrc_ctx_timestamp(lrc);
 
-		/* read lrc again to ensure context is still active */
-		lrc_ts = xe_lrc_ctx_timestamp(lrc);
-	}
+	if (context_active(lrc) &&
+	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
+		new_ts = reg_ts;
 
 	/*
-	 * If context switched out, just use the lrc_ts. Note that this needs to
-	 * be a separate if condition.
+	 * If context swicthed out while we were here, just return the latest
+	 * LRC CTX TIMESTAMP value.
 	 */
-	if (lrc_ts != CONTEXT_ACTIVE)
-		new_ts = lrc_ts;
+	if (!context_active(lrc))
+		return xe_lrc_ctx_timestamp(lrc);
 
-done:
 	return new_ts;
 }
 
-- 
2.51.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD9EFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F0C10EC68;
	Tue,  5 May 2026 23:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv0gA/eq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B273010E4C1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q/MDs6rT8o5FrPE5Gbb9f8g9VLuNUH9YwNaSRTOOZ5Y=;
 b=cv0gA/eqb4HdbrbCcZa8Elzx80etC6B19wZTjvsiZAwjiKYX0lMmLiu+
 dJVkiuvvrnS9GKRJdhaShJGhx2TDocHj0Z2yea6HzHpDihpSjRLWx0tdQ
 OetDXshYK/1lLbxc1UofL/iTi8Z8QdN6kPRpnkf5Fc+jCEdvama3b/E+N
 29U+u8bN8RwJt+SrpKZ9gc5FX7TpCFvh7G09ssI9UkRoCWDydwALpLpij
 albMfPO19waj1G1BEyNDkhJ/AP0k1n1LnUFqh7LEmRSajI11GVhMfF8mk
 YyAyFHFb+Ax0uJ8atmfpLjsOdBZ2GANPE6YFOXuXpUx/HyTrhF3U0F16a A==;
X-CSE-ConnectionGUID: ChhPQP4nRKyDbQV/RtbV3A==
X-CSE-MsgGUID: 55AFlsmZQTieQMARJCkLHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771094"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
X-CSE-ConnectionGUID: 5UynHwz4TI6RbRS+z9Zo8Q==
X-CSE-MsgGUID: ggcXMd66Qhy7pUWCeUbtvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569037"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 03/11] drm/xe/lrc: Refactor xe_lrc_timestamp to simplify
 logic
Date: Tue,  5 May 2026 16:44:12 -0700
Message-ID: <20260505234408.3552147-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 66682a678cc2..3b6990d68a5a 100644
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
@@ -2597,33 +2602,19 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
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
+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
+		return xe_lrc_ctx_timestamp(lrc);
 
-	if (lrc_ts == CONTEXT_ACTIVE) {
-		engine_id = xe_lrc_engine_id(lrc);
-		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
-			new_ts = reg_ts;
+	if (context_active(lrc) &&
+	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
+		new_ts = reg_ts;
 
-		/* read lrc again to ensure context is still active */
-		lrc_ts = xe_lrc_ctx_timestamp(lrc);
-	}
-
-	/*
-	 * If context switched out, just use the lrc_ts. Note that this needs to
-	 * be a separate if condition.
-	 */
-	if (lrc_ts != CONTEXT_ACTIVE)
-		new_ts = lrc_ts;
+	if (!context_active(lrc))
+		return xe_lrc_ctx_timestamp(lrc);
 
-done:
 	return new_ts;
 }
 
-- 
2.51.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A7C55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 04:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCB810F148;
	Fri, 31 Jul 2026 04:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXFGSDn5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8EC10F147
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 04:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785470422; x=1817006422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v/abIqqHqK2SdYjWIoE4f3HoCDauu07TDf4i3A+i91Y=;
 b=WXFGSDn5xxSKDsRPRyRHxobJz8kl72L4DLio5B5WtNnsBj6XYVHcasZ8
 GTKqHye0b06BrmlBXhi0/QO+fFqS4sXy1cEEx9qC8xc8wlFu/QVF6j3El
 Cheq1Y9Brr9rmLXfqME4Sb9ffmKAoeGFqJAd96n2/l6zbJzUOq6LzMK0V
 w/BMGzC9qI1p44+v2kShW02AYrizPxopkRSzgX3cFFZTHHP1wSwVxxgwH
 0iUCpR6PBOCNbhUNLTJ8cPep+aKRCyEijqT4CHamOcA9KZ5DamxZDfJmj
 TgnlJU9UoiaMuDjmpFVanvc5pcu0Lhk299w9PA6Qhv51Hfs5GSd6wXEIg A==;
X-CSE-ConnectionGUID: 9apO2WRyR7iDrZKidlFsJA==
X-CSE-MsgGUID: GTsRyw3DRA2UfsRzifKMPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96756109"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="96756109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 21:00:22 -0700
X-CSE-ConnectionGUID: o2TB3jKdQL6wyj/pUXNixw==
X-CSE-MsgGUID: dAmMJdynROqhZUGLHZxk8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="298680200"
Received: from vkollerx-mobl.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.208.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 21:00:19 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v9 3/3] drm/xe/lrc: Fix ABA race on engine migration in
 context timestamp read
Date: Fri, 31 Jul 2026 04:00:08 +0000
Message-ID: <20260731040004.1345502-8-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
References: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
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

xe_lrc_context_timestamp() reads the engine id once via
xe_lrc_engine_id(lrc) and uses it to fetch the live CTX_TIMESTAMP MMIO
register, then re-checks the LRC-stored value to detect whether the
context switched out while the MMIO read was in flight. That check
only confirms the context is (still/again) active - it does not
confirm it is active on the *same* engine the MMIO read targeted.

If the context is saved and restored onto a different engine between
the initial engine id read and the final activity check, the
CONTEXT_ACTIVE sentinel will be observed again (now for the new
engine), and the stale MMIO value read from the old, now-unrelated
engine is returned as if it were valid.

Pin the engine id used for the MMIO read and re-validate it against
the current engine id after the final activity check. If the engine
changed, retry the whole read (bounded by a small retry count) instead
of trusting a timestamp sampled from an unrelated context, falling
back to the last cached value if the context keeps migrating.

Assisted-by: GitHub-Copilot:claude-sonnet-5
Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6f0247bdf8e4..3603642ed0e6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2742,39 +2742,44 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 	return lrc->queue_timestamp;
 }

+/*
+ * Bound the number of times we retry the full read sequence when a
+ * context migration between engines is detected. A small bound (3)
+ * prevents long loops; if we exhaust retries we fall back to the
+ * last cached `lrc->ctx_timestamp`.
+ */
+#define CTX_TIMESTAMP_MAX_RETRIES 3
+
 static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
 {
-	u64 reg_ts, new_ts = lrc->ctx_timestamp;
+	u64 reg_ts;
 	u64 stored;
+	u32 engine_id;
+	int retries = CTX_TIMESTAMP_MAX_RETRIES;

 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
 		return xe_lrc_ctx_timestamp(lrc);

-	/*
-	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
-	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
-	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
-	 * otherwise accept the MMIO value only if the context remained active.
-	 */
+	do {
+		/* Read LRC-stored timestamp before/after MMIO to avoid TOCTOU. */
+		stored = xe_lrc_ctx_timestamp(lrc);
+		if (stored != CONTEXT_ACTIVE)
+			return stored;

-	stored = xe_lrc_ctx_timestamp(lrc);
-	if (stored != CONTEXT_ACTIVE)
-		return stored;
+		engine_id = xe_lrc_engine_id(lrc);
+		if (get_ctx_timestamp(lrc, engine_id, &reg_ts))
+			continue;

-	/* Context is active: read the live timestamp from the engine's MMIO register. */
-	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
-		new_ts = reg_ts;
+		stored = xe_lrc_ctx_timestamp(lrc);
+		if (stored != CONTEXT_ACTIVE)
+			return stored;

-	/* Re-check the LRC-stored timestamp: if the context switched out while
-	 * reading MMIO the hardware saved the canonical timestamp into the LRC
-	 * during context-save, so return that value instead of the MMIO read.
-	 */
-	stored = xe_lrc_ctx_timestamp(lrc);
-	if (stored != CONTEXT_ACTIVE)
-		return stored;
+		if (xe_lrc_engine_id(lrc) == engine_id)
+			return reg_ts;
+	} while (--retries);

-	return new_ts;
+	return lrc->ctx_timestamp;
 }

 static u64 xe_lrc_update_context_timestamp(struct xe_lrc *lrc, u64 *old_ts)
--
2.43.0


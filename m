Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED3CC531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 09:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094E110F039;
	Thu, 23 Jul 2026 09:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgvcUdqN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4F610E57D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784798898; x=1816334898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Rbtzg0WblOzxjmU+mFsLoeyxtuGE9qrB2Qo6oyKHWM=;
 b=bgvcUdqNnQVl4nkP8Hf4q8GbCWO9RSpZop6/IpWv3gdgNQkOOsHc1sAP
 mxZacxOjmYqqF60U1v49J5BXQ6Jpzd+sbANiJ4gA6RiHFHmB98EdRe/xo
 e7XgC5yVjItheF3ITiqGEiZATOMgjmTghFccLzj3eMvuUS1/4mxTzxGGA
 qpAGyI7wuXwhSg7Ry4DdPNolGMXGOnBMIE2DO6Ejv3eV8zu9KUi8p6XaH
 g7FRYgz+snTKstWTIBS763FSW11QxJO7YY2s5PcrNWshYmus/7ex+qLrw
 tkhlZ+fhtygImhy3NM1Rw5P5Y2WkN6iWjyHXJHNRZT7TjqfrCDw3gGJvU Q==;
X-CSE-ConnectionGUID: DlRhQ5X8QymqUjYWED/VrQ==
X-CSE-MsgGUID: Cyw2P+54QAaG6bfT8SOoug==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102858745"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="102858745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:28:18 -0700
X-CSE-ConnectionGUID: fGPZ9RACQ7e3v8wzvD5CXg==
X-CSE-MsgGUID: Tq6lyzRtSkibsQnTft007w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282873633"
Received: from nbidikar-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.130.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:28:15 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v6 3/3] drm/xe/lrc: Fix ABA race on engine migration in
 context timestamp read
Date: Thu, 23 Jul 2026 09:27:55 +0000
Message-ID: <20260723092751.250613-8-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723092751.250613-5-gajendra.uttamchand@intel.com>
References: <20260723092751.250613-5-gajendra.uttamchand@intel.com>
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

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 66 ++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 1e910669e8d1..314de730ace6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2736,39 +2736,65 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 	return lrc->queue_timestamp;
 }

+/*
+ * Between reading the engine id and re-checking that the context is
+ * still active below, the context may have been saved and restored
+ * onto a *different* engine, in which case the MMIO read in between
+ * targeted an unrelated context on the old engine.
+ * Bound the number of times we retry the full read sequence when a
+ * context migration between engines is detected. A small bound (3)
+ * prevents long loops; if we exhaust retries we fall back to the
+ * last cached `lrc->ctx_timestamp`.
+ */
+#define CTX_TIMESTAMP_MAX_RETRIES 3
+
 static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
 {
 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
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
+		/*
+		 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
+		 * after the MMIO read to avoid a TOCTOU where a context switch makes the
+		 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
+		 * otherwise accept the MMIO value only if the context remained active.
+		 */

-	stored = xe_lrc_ctx_timestamp(lrc);
-	if (stored != CONTEXT_ACTIVE)
-		return stored;
+		stored = xe_lrc_ctx_timestamp(lrc);
+		if (stored != CONTEXT_ACTIVE)
+			return stored;

-	/* Context is active: read the live timestamp from the engine's MMIO register. */
-	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
-		new_ts = reg_ts;
+		/* Context is active: read the live timestamp from the engine's MMIO register. */
+		engine_id = xe_lrc_engine_id(lrc);
+		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
+			new_ts = reg_ts;

-	/* Re-check the LRC-stored timestamp: if the context switched out while
-	 * reading MMIO the hardware saved the canonical timestamp into the LRC
-	 * during context-save, so return that value instead of the MMIO read.
-	 */
-	stored = xe_lrc_ctx_timestamp(lrc);
-	if (stored != CONTEXT_ACTIVE)
-		return stored;
+		/* Re-check the LRC-stored timestamp: if the context switched out while
+		 * reading MMIO the hardware saved the canonical timestamp into the LRC
+		 * during context-save, so return that value instead of the MMIO read.
+		 */
+		stored = xe_lrc_ctx_timestamp(lrc);
+		if (stored != CONTEXT_ACTIVE)
+			return stored;
+
+		/*
+		 * Still active, but possibly on a different engine than the one
+		 * we just read MMIO from (context switched out and back in
+		 * elsewhere). Only trust new_ts if the engine id hasn't changed;
+		 * otherwise retry the whole sequence against the current engine.
+		 */
+		if (xe_lrc_engine_id(lrc) == engine_id)
+			return new_ts;
+	} while (--retries);

-	return new_ts;
+	return lrc->ctx_timestamp;
 }

 static u64 xe_lrc_update_context_timestamp(struct xe_lrc *lrc, u64 *old_ts)
--
2.43.0


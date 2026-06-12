Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030BECD98CC
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 03:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A889510E91E;
	Fri, 12 Jun 2026 03:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGAN10RG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9B310E916
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 03:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781234877; x=1812770877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ov5AYTM//KEKvayhucmIJy6qnFcURTPVPw+upZHi+UE=;
 b=mGAN10RG5U2NFzjbf6MHNTWNgGG5S/cZhAt1wsqv77m8XcTCEcrVCQ8r
 001RGjC1sh0r723Bak4wxyt9ZtDudog3EqFjRfWA3galdYSiu81mUeWKm
 iCPHFu8eQzgyFpWtuwAqySFX6NPoufYe2gWiKKkf54cet9ji/5xezBxAI
 8LMj9WEqT9Dg7fzg9y1Jpl3/PceCXh+zxUtYOnhEIeQ99ItVZ83qSLOTH
 xGqhaT4jfVI47obudaDtUY+T0QIRkbunXJ441zW6t9uxPfYu9I3fzwUOa
 UmPV0zbVJAQ20frQQIxXJsbMVcesFy1K7sz2zx8Pn2NGx+ry/XP0UHKGX Q==;
X-CSE-ConnectionGUID: D6r2q8O/SQ6xsxLe6JZbuw==
X-CSE-MsgGUID: svzFFLUpTvK8SGCO1/hGKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85902933"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85902933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 20:27:57 -0700
X-CSE-ConnectionGUID: MypLLOuGQ7W5ROICNocCEA==
X-CSE-MsgGUID: 5lHBsMJRT5OXMd0N66wk5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="251789707"
Received: from adarshdx-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.178.18])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 20:27:55 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org
Cc: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
	Uttamchand@freedesktop.org
Subject: [PATCH 1/2] [PATCH] drm/xe/lrc: document sentinel and make
 CTX_TIMESTAMP read TOCTOU-safe
Date: Fri, 12 Jun 2026 03:27:47 +0000
Message-ID: <20260612032745.179673-5-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
References: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
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

From: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>

Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
switched out between check and read; LRC stores a sentinel while
a context starts that must not be treated as a real timestamp.

Fix: Check the LRC-stored sentinel before and after the MMIO read;
return the LRC value if the context switched out to avoid TOCTOU.

Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
canonical sentinel.

Signed-off-by: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..e284c008c126 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1096,7 +1096,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
  * store it in the PPHSWP.
  */
-#define CONTEXT_ACTIVE 1ULL
+#define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
 static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 				    struct xe_hw_engine *hwe,
 				    u32 *batch,
@@ -2720,21 +2720,34 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
 {
 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
+	u64 stored;

 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
 		return xe_lrc_ctx_timestamp(lrc);

-	if (context_active(lrc) &&
-	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
+	/*
+	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
+	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
+	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
+	 * otherwise accept the MMIO value only if the context remained active.
+	 */
+
+	stored = xe_lrc_ctx_timestamp(lrc);
+	if (stored != CONTEXT_ACTIVE)
+		return stored;
+
+	/* Context is active: read the live timestamp from the engine's MMIO register. */
+	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
 		new_ts = reg_ts;

-	/*
-	 * If context swicthed out while we were here, just return the latest
-	 * LRC CTX TIMESTAMP value.
+	/* Re-check the LRC-stored timestamp: if the context switched out while
+	 * reading MMIO the hardware saved the canonical timestamp into the LRC
+	 * during context-save, so return that value instead of the MMIO read.
 	 */
-	if (!context_active(lrc))
-		return xe_lrc_ctx_timestamp(lrc);
+	stored = xe_lrc_ctx_timestamp(lrc);
+	if (stored != CONTEXT_ACTIVE)
+		return stored;

 	return new_ts;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 0a3a611391ee..7be5e3da8bc8 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -9,6 +9,13 @@

 #include "xe_lrc_types.h"

+/*
+ * Sentinel value stored in lrc->ctx_timestamp while a context is starting.
+ * The hardware hasn't yet written the real CTX_TIMESTAMP, so this is not a
+ * valid elapsed-time sample and must not be used as one.
+ */
+#define XE_LRC_CTX_TIMESTAMP_ACTIVE 1ULL
+
 struct drm_printer;
 struct xe_bb;
 struct xe_device;
--
2.43.0


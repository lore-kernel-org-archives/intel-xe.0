Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2F1C5516F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 04:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A9410F149;
	Fri, 31 Jul 2026 04:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anCIlluW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E779310F146
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 04:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785470417; x=1817006417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DGfLf81p2dPfki4mCffHBNHe+cOgkoDWoNFDqgd6eK8=;
 b=anCIlluWcZBhx86VaF/f5nBn6yo0iIHNKrcA2JCTgOQxkxZiWubx5QZ5
 jdiQxo2zwoKVR0ImSkvaZDm2mhpbRZbsInW5z59MpOZD6vggC2J6czKow
 g9AgtA25r6w/is7EzWney+GVCrksfazb64XvACV3AvQnGOBCzeD3tABSN
 OnbPW36chZXStR2lR582mMDdCTVfLEwx/mhbag8TwGm9TNmbebDsGQd2K
 saHF58tCicLvU4FPEYHjCtaNA1N3Zt4zGns+3SuqK0pBt1dlfbJStXYum
 SFMy7BXOvYRo1y/xhciBvAw5uXES4AHRx40mbkxx3zFepzYZXEL4Ua84l g==;
X-CSE-ConnectionGUID: Rki6Sbd9S4e1dwx53ON/MQ==
X-CSE-MsgGUID: X/xUbe8pTmWo8P8nQwGiSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96756104"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="96756104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 21:00:17 -0700
X-CSE-ConnectionGUID: LoqdvLAdTsq9rr3gXA0JDw==
X-CSE-MsgGUID: MLhI4n6nQRm7lzVJmO4t6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="298680146"
Received: from vkollerx-mobl.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.208.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 21:00:14 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v9 1/3] [PATCH] drm/xe/lrc: document sentinel and make
 CTX_TIMESTAMP read TOCTOU-safe
Date: Fri, 31 Jul 2026 04:00:06 +0000
Message-ID: <20260731040004.1345502-6-gajendra.uttamchand@intel.com>
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

Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
switched out between check and read; LRC stores a sentinel while
a context starts that must not be treated as a real timestamp.

Fix: Check the LRC-stored sentinel before and after the MMIO read;
return the LRC value if the context switched out to avoid TOCTOU.

Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
canonical sentinel.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3e7c995085d0..78d0456cf3c9 100644
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
@@ -2726,21 +2726,34 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
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


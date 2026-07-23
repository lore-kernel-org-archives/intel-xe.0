Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570BEC531CB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 09:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC8910F038;
	Thu, 23 Jul 2026 09:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPhkoCE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE0510E57D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784798895; x=1816334895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU960I+SFblhQwrDJsHJYZODYxJ/8M+E7SJCxqIrv/8=;
 b=YPhkoCE93bA/qbkRSArp0xhe+WrRe+j9YFkAHmL0UFfYhiWGm+gBDQlI
 Peq4dsavOEf/e146lVuoR9pu9hn7DDfgUsbIHcz3IDZdX7uw+qXRJqFlA
 3C2TsSOWtbxmGT62DHtl2xSjNHGHgXLJWDv7ujHfeU+l0p0YMrdAOSVDw
 vZ0ZyXwEeTcNAO278ESMDcn6gWz2WJfqhMUnPQvtQNr0ISJVOJ74ugYhC
 ohSJMRJhh/Lh36Z8FhUj+n9UvOT23eEPfKGzOQufyqdWRUUxnp0DwoJsV
 WW5GzbrDOlAk7O8ToKT7speD6ccjLeF2NZgeJtoytv0+/7aWb5WpwDG8z A==;
X-CSE-ConnectionGUID: E1EVzm+6Sv6jA9fOIVwR5w==
X-CSE-MsgGUID: 0f8zAsO3STKsoS92dIO4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102858741"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="102858741"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:28:15 -0700
X-CSE-ConnectionGUID: sgnJmt0ITNm06xU1ZHXiMw==
X-CSE-MsgGUID: U/aKkgxyTKCOSsWp/a7RiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282873628"
Received: from nbidikar-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.130.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:28:12 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v6 2/3] drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
Date: Thu, 23 Jul 2026 09:27:54 +0000
Message-ID: <20260723092751.250613-7-gajendra.uttamchand@intel.com>
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

xe_lrc_ctx_timestamp() reads the 64-bit CTX_TIMESTAMP value stored in
the LRC as two independent 32-bit reads (ldw, then udw). The GPU can
concurrently overwrite this location as part of a context-save, so a
plain back-to-back read of the two dwords can observe a torn
combination that matches neither the previous value (e.g. the
CONTEXT_ACTIVE sentinel written on context-restore) nor the final
saved timestamp written by hardware. Callers such as context_active()
and xe_lrc_context_timestamp() rely on this value being coherent to
decide whether the context is still active, so a torn read can lead to
an incorrect/garbage timestamp being sampled or reported.

Make xe_lrc_ctx_timestamp() robust against torn reads by reading the
upper 32-bit half first and re-reading the lower/upper pair until the
upper half stabilizes across two consecutive reads (bounded to a small
retry limit), then combine them into the final 64-bit value.

This fixes the problem at the source so all callers get a coherent
timestamp, instead of patching individual callers.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e284c008c126..1e910669e8d1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -868,20 +868,39 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
  * @lrc: Pointer to the lrc.
  *
+ * The ldw and udw halves are stored at independent offsets and can be
+ * written by the GPU (context-save) concurrently with this read, so a
+ * naive back-to-back read of the two dwords can observe a torn value
+ * that matches neither the previous value (e.g. the CONTEXT_ACTIVE
+ * sentinel) nor the final saved timestamp. Guard against that by
+ * re-reading until the udw half stabilizes across two consecutive reads.
+ *
  * Returns: ctx timestamp value
  */
 static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
 {
 	struct xe_device *xe = lrc_to_xe(lrc);
 	struct iosys_map map;
-	u32 ldw, udw = 0;
+	u32 ldw, udw = 0, old_udw;
+	int retries;

-	map = __xe_lrc_ctx_timestamp_map(lrc);
-	ldw = xe_map_read32(xe, &map);
+	if (!xe->info.has_64bit_timestamp) {
+		map = __xe_lrc_ctx_timestamp_map(lrc);
+		return xe_map_read32(xe, &map);
+	}

-	if (xe->info.has_64bit_timestamp) {
+	map = __xe_lrc_ctx_timestamp_udw_map(lrc);
+	old_udw = xe_map_read32(xe, &map);
+	for (retries = 5; retries; --retries) {
+		map = __xe_lrc_ctx_timestamp_map(lrc);
+		ldw = xe_map_read32(xe, &map);
 		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
 		udw = xe_map_read32(xe, &map);
+
+		if (udw == old_udw)
+			break;
+
+		old_udw = udw;
 	}

 	return (u64)udw << 32 | ldw;
--
2.43.0


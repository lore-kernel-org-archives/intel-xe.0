Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D2DC531D0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 05:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52A210E645;
	Thu, 30 Jul 2026 05:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZDY5nqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347810E645
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785389040; x=1816925040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/iJuZFQrm3ZKJg6nNYJadkt6h15kywM0l101BVtFe0=;
 b=hZDY5nqwKcyxGsUsnU7hNAWfuG8U1e09njsY5igKk+sXFkSFQZLXV0+y
 jWFAnBLHoY5KO7/xHwZI6J+IE2DL/mhQ/e7Slfq7CDDTfIGDEm6riyZaI
 C4IlGLlmEm1A0PdYCsUswxWEd+mdKFKlBRWpL3TYQt1DuqzAC0Ps0njF8
 1L7d+3gKonZdpUhTrG6vWf1w7hiVnOEbBUj60UgamQ5NkuksLEH0rQm5U
 Xu2MjQResHiN7tgDBTeKtyaRkeVKp4K3afRukQThnr3TV5yT6wImCUcnc
 Mra2/xlgh6f3vdwKvsNWKtdIAE/vpOy3qV6GumPhXQNB4h1g6u1+KMKcW w==;
X-CSE-ConnectionGUID: xeQjFY8zSlCXrTZz2EwLtA==
X-CSE-MsgGUID: HPVqcRUDSgupOFLvhHxxNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86078526"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86078526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 22:24:00 -0700
X-CSE-ConnectionGUID: FaP84W2UTV6ZzcW4Hikt5Q==
X-CSE-MsgGUID: PKTnD+IdTyCITuQHNeMvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="260256330"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.65.194])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 22:23:57 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v8 2/3] drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
Date: Thu, 30 Jul 2026 05:23:46 +0000
Message-ID: <20260730052343.1205472-7-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730052343.1205472-5-gajendra.uttamchand@intel.com>
References: <20260730052343.1205472-5-gajendra.uttamchand@intel.com>
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

Assisted-by: GitHub-Copilot:claude-sonnet-5
Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 78d0456cf3c9..b9dde26611e3 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -874,14 +874,29 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
 {
 	struct xe_device *xe = lrc_to_xe(lrc);
 	struct iosys_map map;
-	u32 ldw, udw = 0;
+	u32 ldw, udw = 0, old_ldw, old_udw;
+	int retries;

-	map = __xe_lrc_ctx_timestamp_map(lrc);
-	ldw = xe_map_read32(xe, &map);
+	if (!xe->info.has_64bit_timestamp) {
+		map = __xe_lrc_ctx_timestamp_map(lrc);
+		return xe_map_read32(xe, &map);
+	}
+
+	for (retries = 5; retries; --retries) {
+		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
+		old_udw = xe_map_read32(xe, &map);
+
+		map = __xe_lrc_ctx_timestamp_map(lrc);
+		old_ldw = xe_map_read32(xe, &map);

-	if (xe->info.has_64bit_timestamp) {
 		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
 		udw = xe_map_read32(xe, &map);
+
+		map = __xe_lrc_ctx_timestamp_map(lrc);
+		ldw = xe_map_read32(xe, &map);
+
+		if (udw == old_udw && ldw == old_ldw)
+			return (u64)udw << 32 | ldw;
 	}

 	return (u64)udw << 32 | ldw;
--
2.43.0


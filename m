Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A61CAC588
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE9E10E509;
	Mon,  8 Sep 2025 12:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmesqGcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721B10E508
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334640; x=1788870640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTNCa8Xu4k+g6BOrBk5zOuj4KbeO1VPvAwbbKBjfbM0=;
 b=FmesqGcSTFatOLy3a+DAoSWtbtn8QGiTsM4VN0ShqSKvyjMDrhpEWSMY
 DRV39hj/JjZheddSimcVjy2EARzBztSMU/ZsfdNVeqObtNBY7IyUsHO3L
 7ElbN6Q/TaU622os3+OKEnhzOlCRB2e3+qZBf79jMXydp//xbbsKVXZfj
 BWSr8ga23RKffOVyFnO3iP1Ns8HRpy3k2718NL+O1z5YGmogEOi0Oh1i6
 vPG6aX9HZqFR9b4kDMAotsuLU50k0GaUAFmsLF38cUvsZIwJ+k+ESm5zE
 l9rXBG4YRFPCHj4vMWv4Y2EhoUv+MzJ3c4zJgoXccIv/XmgVFyRXs3lDq Q==;
X-CSE-ConnectionGUID: Rltoh2NORIyAx6jffFr9VA==
X-CSE-MsgGUID: Lka7P5cvRBC9B3mjjLlL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526298"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:40 -0700
X-CSE-ConnectionGUID: pr4yTqllSLi6KnNe43tlrw==
X-CSE-MsgGUID: Jf+/3ammQPygP/txvsoByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656389"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/7] drm/xe/guc: Use proper flag definitions when
 registering context
Date: Mon,  8 Sep 2025 14:30:19 +0200
Message-ID: <20250908123025.747-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908123025.747-1-michal.wajdeczko@intel.com>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
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

In H2G action context type is specified in flags dword in bits 2:1.
Use generic FIELD_PREP macro instead of misleading BIT logic.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 457d914097c8..a72ff8a68568 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -65,6 +65,7 @@ struct guc_ctxt_registration_info {
 	u32 hwlrca_hi;
 };
 #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
+#define CONTEXT_REGISTRATION_FLAG_TYPE	GENMASK(2, 1)
 
 /* 32-bit KLV structure as used by policy updates and others */
 struct guc_klv_generic_dw_t {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b8da44493ae..5ab242be50dd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -558,10 +558,8 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	info.engine_submit_mask = q->logical_mask;
 	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
-	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
-
-	if (ctx_type != GUC_CONTEXT_NORMAL)
-		info.flags |= BIT(ctx_type);
+	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
+		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
 
 	if (xe_exec_queue_is_parallel(q)) {
 		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
-- 
2.47.1


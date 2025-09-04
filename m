Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60B3CA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B37210EAC3;
	Thu,  4 Sep 2025 19:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ylp4jBie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30A10EAC3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757014171; x=1788550171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q6S+NiArNa/DiEvQ6P0DnyxzZg+Bhpd3VHodrfzh5aY=;
 b=Ylp4jBieJHeYX9+JGaN6zrKkcNN5OIQGD+h40/lGi/iUURoleFLbFR6Z
 nCnyIs7wus6lJjZ30nY6CXhXZu7AlsGt0ueu75sHAfUNZcX938cN3AkWF
 saXEfkkp+3GLEKbe960OqrG+fO91tIhMTGydnmBBUO5dvhUARhDRVM9+5
 UiF7t4FXSIS+GsLwmfCR1VAgTSxoyFU8sbvrE7JlR1xlr3GgQDGoieTqp
 f9tq/eNme0lmX3zzzfQ0HvfX6no/p9EqeAF1TzlkwijNG6uiW9HOT6ev8
 B/VqE0cZoOa/7NJsEm/VnVXRBkL7wy3LCLDdPzvtSwZ+md9XXKu7xmpSA w==;
X-CSE-ConnectionGUID: pGH6vtmQQ/SmwNb/yBJioQ==
X-CSE-MsgGUID: LFum7UltRSaVg+oBCwtWDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70793967"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70793967"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:31 -0700
X-CSE-ConnectionGUID: YE/rz71jTKior1mjFtsR0g==
X-CSE-MsgGUID: LXgw13PRQgyM4eM4Vlmv1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="209153131"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/5] drm/xe/guc: Use proper flag definitions when registering
 context
Date: Thu,  4 Sep 2025 21:29:14 +0200
Message-ID: <20250904192918.7346-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904192918.7346-1-michal.wajdeczko@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 0508f1064178..561e15e86d58 100644
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
index f2920b047b2c..3437206c4a55 100644
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


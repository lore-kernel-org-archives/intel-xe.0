Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E2DCCFA05
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B476410E66F;
	Tue,  4 Nov 2025 19:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z40N66vQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE7D10E326
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286182; x=1793822182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SO9ewQCqbSaLvde/CEKT/IeRogJixuWdZ6dYEvAgbls=;
 b=Z40N66vQHiP30ABfoMeZs8A4AxDUrr9qUMIHIvfJsOl8kMAJVx3uWw3e
 jT5QBVbt1Rnwpt44z1who8jWSlEPutDtyPwZIYNQc9VmcJCjnSUY19qqb
 EuskmSrgTHIjCI0ZbSCm5ImSu1Kla7sBKq65BPQlnmdjTvEjH8x9vDRf+
 pWNyAKrE95oEyxG6cTZVeKhmqnGbB4afKf2oivv7MGFMiZIiXVjAEqc4S
 cPtmySxcIr6X3MZ7JM3jeNJa+CbHgt47Czr/CeEAXhBves4kApf8PCr6n
 OPp9BMYfmiP4VvEsjPwkECcnAmvkfzW4y2x081FHo8OC9SBpQyMhls2yJ w==;
X-CSE-ConnectionGUID: qikZ1STRSTKVRqu68zMaCw==
X-CSE-MsgGUID: pgtLcyU4SXyStqAYA1/glg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686111"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:22 -0800
X-CSE-ConnectionGUID: uSuzOsYaQ82gW5wiGNACug==
X-CSE-MsgGUID: Wlq+SGiwQqKPpWzU3v5MWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051140"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 06/12] drm/xe: Do not forward invalid TLB invalidation
 seqnos to upper layers
Date: Tue,  4 Nov 2025 11:56:10 -0800
Message-Id: <20251104195616.3339137-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104195616.3339137-1-matthew.brost@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Context-based TLB invalidations send multiple H2G messages per seqno,
with only the final H2G containing a valid seqno — the others carry an
invalid seqno. The G2H handler drops these invalid seqnos to avoid
prematurely signaling a TLB invalidation fence.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 3 ++-
 drivers/gpu/drm/xe/xe_tlb_inval_types.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 61bfa0d485f6..995789f0d31f 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -235,7 +235,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(len != 1))
 		return -EPROTO;
 
-	xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
+	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
+		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..7a6967ce3b76 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -80,6 +80,7 @@ struct xe_tlb_inval {
 	const struct xe_tlb_inval_ops *ops;
 	/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
+#define TLB_INVALIDATION_SEQNO_INVALID	TLB_INVALIDATION_SEQNO_MAX
 	int seqno;
 	/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
 	struct mutex seqno_lock;
-- 
2.34.1


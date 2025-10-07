Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90990CCD189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C963B10E63B;
	Tue,  7 Oct 2025 11:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UU/cUJQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012ED10E674
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836408; x=1791372408;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kiz+jerG8Hx1DiGBkWQWSS6oHpKcTCE/T9d9vU2nJ8M=;
 b=UU/cUJQ6mf0xwX2dvjcVuyvBkByE1xxM/pGVTf/JGfdW3c+scFzblhlQ
 FWyISyk6HHmbSPIWfX0vc6yTFuhRVEDgea6EWb82/ycKMgqCXV3q5OBpx
 pTHcnPieBUx68e7karuUmMw2AerDa6VtPARwyc4UxPmjiggX2IixPwBNK
 DAcSOhoG5AgK+YZP7m6F9nFHqA6dDrGAqbNJrZS034A9dFLjRjpV+TOQu
 UHu6w7tIq/XfdybAvE730UrM8ID6Gxxyq2gBJ2GmyyoIv859VBYC8vgPa
 T+JsXyXkJ3/59rszxJTgyY6Mm9HmrfYpssl/tSgnCD5YKjRuBaWNcUKAJ Q==;
X-CSE-ConnectionGUID: qDkMsbPNSqGPFwgIADOwWg==
X-CSE-MsgGUID: 0qd2wVB3STWJGbh42FM2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660678"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:48 -0700
X-CSE-ConnectionGUID: P7OqwYiMQJiqCyHDSTmV3Q==
X-CSE-MsgGUID: D1X7pPH9RfmrhY7Og544zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180923995"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 09/32] drm/xe/vf: Abort H2G sends during VF post-migration
 recovery
Date: Tue,  7 Oct 2025 04:26:18 -0700
Message-Id: <20251007112641.2669655-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

While VF post-migration recovery is in progress, abort H2G sends with
-ECANCEL. These messages are treated as lost, and TLB invalidation
errors are suppressed. During this phase, the H2G channel is down, and
VF recovery requires the CT lock to proceed.

v3:
 - Use xe_gt_recovery_inprogress (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 47079ab9922c..9f0090ae64a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -851,7 +851,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
 {
-	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	u16 seqno;
 	int ret;
 
@@ -872,7 +872,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+	if (ct->state == XE_GUC_CT_STATE_STOPPED || xe_gt_recovery_pending(gt)) {
 		ret = -ECANCELED;
 		goto out;
 	}
-- 
2.34.1


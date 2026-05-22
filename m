Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32E3CD5BB8
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE9A10F754;
	Fri, 22 May 2026 12:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Osdn+Uys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF0E10F746
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779453462; x=1810989462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LWZ0v264dvwHJmeDTqJ5di04g69fLPSSO9YK06LJlx4=;
 b=Osdn+UysZClAdf6BdkQcskvZY+M9s4KBtlu8w7hN2HipxeIBKNMsQDPR
 juodVGkqgsoVPcMFcBQ5MwEv8fuG6R/iwKpZqHkx1ER8BFPKTo8MKTetq
 QbFNoztAjCwKRM5nbJ+5P1aMT9055/JH66J2n0lt488+DcCV7eWSpPTVc
 LlyJvaAwnG0/HJdHvM3XPshSRmFOg7jdWvTalOAjboblwuxNeD0jGEA3c
 uisIFypxK1U4m9MSUjXatGZQQG8ZeObRquJLUFeA/TbUm02o2zzriRXOK
 rxsTeA0XHb2O8rUfGvP0nxtBWePHbUDj1f3C779br3YHzmm4TrfsdXOB3 g==;
X-CSE-ConnectionGUID: M2bmUkumRziHR1H0eiTSKg==
X-CSE-MsgGUID: TJUIoomxTtO9Qboo32IY+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84264591"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84264591"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:41 -0700
X-CSE-ConnectionGUID: xOdRlOrRQE2CiToPfiBzDA==
X-CSE-MsgGUID: fkFlapkQRn2nNmLxu/545A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238302163"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:37:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 07/10] drm/xe/guc: handle submit mask with paging engine
Date: Fri, 22 May 2026 13:37:28 +0100
Message-ID: <20260522123720.39656-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123720.39656-12-matthew.auld@intel.com>
References: <20260522123720.39656-12-matthew.auld@intel.com>
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

We need to also re-map the submit mask so that we correctly account for
the remapped logical mask of, if the GUC_PAGING_CLASS is in play.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c    | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c |  3 ++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 61e3ee19a59b..dd98ceb81026 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -70,6 +70,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
 
 u16 xe_hwe_to_guc_class(struct xe_hw_engine *hwe);
 u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe);
+u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u32 logical_mask);
 
 static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 8dd6400827be..7437d443343e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -552,6 +552,27 @@ u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
 	return hwe->logical_instance;
 }
 
+u32 xe_hwe_guc_logical_to_submit_mask(struct xe_hw_engine *hwe, u32 logical_mask)
+{
+	struct xe_gt *gt = hwe->gt;
+
+	if (xe_gt_is_usm_hwe(gt, hwe)) {
+		int shift = gt->usm.paging_hwe0->logical_instance;
+		u32 paging_logical_mask = gt->usm.paging_logical_mask;
+
+		xe_gt_assert(gt, (logical_mask & paging_logical_mask) == logical_mask);
+
+		/*
+		 * Remap to GUC_PAGING_CLASS logical instance mask, if
+		 * applicable.
+		 */
+		if (xe_guc_has_paging_engine(&hwe->gt->uc.guc))
+			return logical_mask >> shift;
+	}
+
+	return logical_mask;
+}
+
 /*
  * Write the offsets corresponding to the golden LRCs. The actual data is
  * populated later by guc_golden_lrc_populate()
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1ee4f2434876..53df499df968 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -986,7 +986,8 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
 	info.engine_class = xe_hwe_to_guc_class(q->hwe);
-	info.engine_submit_mask = q->logical_mask;
+	info.engine_submit_mask =
+		xe_hwe_guc_logical_to_submit_mask(q->hwe, q->logical_mask);
 	info.hwlrca_lo = lower_32_bits(xe_lrc_descriptor(lrc));
 	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
 	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
-- 
2.54.0


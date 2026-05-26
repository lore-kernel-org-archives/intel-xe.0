Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74740CD6E41
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A610E65B;
	Tue, 26 May 2026 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSz0tXGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C234710E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805163; x=1811341163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xC5y7nxwqU/1EIQ88zxKCe9s7fqzHFP46l7H1nXjO1k=;
 b=mSz0tXGklSJVmkfhD0QOmlCwpyn+aCKNU5MBkGXNY6qxNqldudSDtW1r
 a4a+7vX4DsCSAfKlMcsHmR4sdmMs3krANKd8KFBeYL8tPjxheUJNQeHRi
 qjayJi+1Jj5Y9iLFpkqiP4K5ezTcVBeNXZCb1VQ/xTXKLsTqmNiaSXymF
 k9dAdk/V/M+yFzF4ypINp2UQOjTozzWRRTS0Am5JF8ApCYAzlS1eLnhKs
 Oh2ZVIc6MU9ad5OE0GWy8k4Ws0cQlYzA+cDpUCvdj4xLl3tWuYyixD0D3
 8VtMmS5a8jTalVQfaJZZQlsJbJxhdo7P+urIb19SqQhUpGtbItAodDNcf Q==;
X-CSE-ConnectionGUID: I7Xlm9l2TUCk6Jpkp88syg==
X-CSE-MsgGUID: FWsEh/e7QQ+wEBFyTIHbGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505752"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:22 -0700
X-CSE-ConnectionGUID: Aym2fm2EQ+eIt0Gb9PqhMg==
X-CSE-MsgGUID: 3/AK4zd/RBKFn3avTsTf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015751"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 07/10] drm/xe/guc: handle submit mask with paging engine
Date: Tue, 26 May 2026 15:19:09 +0100
Message-ID: <20260526141901.62207-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526141901.62207-12-matthew.auld@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
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

We need to re-map the submit mask so that we correctly account for the
logical mask of paging engines, if the GUC_PAGING_CLASS is in play. We
could also have multiple instances (possible on VF), so we need to
handle that also.

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
index b7d7eb4f3296..10ebcfb11c70 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -544,6 +544,27 @@ u16 xe_hwe_guc_logical_instance(struct xe_hw_engine *hwe)
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C80D172CD
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 05:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6194410E108;
	Mon,  2 Feb 2026 05:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAGHchBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ECA10E108
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 05:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770009931; x=1801545931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKAVV/KPz41jVFHbvCgWRgBGoZ4E2eu6XcMkIXzBZns=;
 b=GAGHchBEQuR8r0lAq6UUYB8Hny8aB9mtBIXyr5N0+4jeSNPbqTIMOD29
 s9mOtP/VJZAYcxHcfg3+qIfF8/NuB8sHB2BPt9sst8wcdePwg5MX+jepI
 JV9+2sF2toVfpobKCteOiH0TsOdfVEQCc4MoR4CePq2/1XLA9vT1aXGKi
 wxMEOHnNUAF9TfbewcWqp3my9TdtclV5reSAVpnItiey0sJWcA8Gncfb9
 PcLiB2rNwbu7IwbkmwurBnNiqVnrbkkxma33DBVPnz8z5SZrcyBwX+8IV
 zPlDxiBzPs0GFk0XgoDak0lhO0k8/en6imkXs9oEI2/eDqz9Zj2qNSXFC g==;
X-CSE-ConnectionGUID: 4SR9pNDDRcW9Ab1b++sy1g==
X-CSE-MsgGUID: SA+IZjvORp6ptPQVagltiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71059561"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71059561"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:25:31 -0800
X-CSE-ConnectionGUID: jCHJBbDcTem6ySoeNZcqIQ==
X-CSE-MsgGUID: 8a/W7/sLSliaNyvDuDDa2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209497675"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 21:25:30 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH v3 1/2] drm/xe: Add counter for invalid prefetch pagefaults
Date: Mon,  2 Feb 2026 10:55:14 +0530
Message-ID: <20260202052515.840084-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202052515.840084-1-varun.gupta@intel.com>
References: <20260202052515.840084-1-varun.gupta@intel.com>
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

Add a stats counter for invalid prefetch page faults to avoid
excessive logging.

Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>

---
v3:
 - New patch splitting stats counter from main prefetch implementation (Matt Brost)
 - Renamed from PREFETCH_PAGEFAULT_COUNT to INVALID_PREFETCH_PAGEFAULT_COUNT (Matt Brost)
---
 drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index fb2904bd0abd..202aebe3300b 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -35,6 +35,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
 	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
 	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
+	DEF_STAT_STR(INVALID_PREFETCH_PAGEFAULT_COUNT, "invalid_prefetch_pagefault_count"),
 	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
 	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
 	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b92d013091d5..bc4116c70171 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -13,6 +13,7 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+	XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
-- 
2.43.0


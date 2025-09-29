Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E7CCA471
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5875510E3A2;
	Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9Y9nHMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4168A10E20E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Yu2L3wYQjoWfDOMYOpf5L53il55lseOgp6qom4cSqpI=;
 b=V9Y9nHMxwa/AH29Z4iIACKLNs9VxDPFH6ws5I+6AnbTsPuuixtwO6JKM
 DnhXscIwhPN0q9M5Iw7e+j55/tr2CpnYCksQ9MbxlvArnFhFnFnEyR3KK
 CLwZopAKFYmKkwLsOmUrRWBBinMTsZt4AyZ2G0SLdwiwapzzgNxykZjIX
 pYRBk94CiaIf1kDiHDGhoMmLmY26G6v2Q9z8hSBi6XCHqUYdsDcY2ZwRg
 teOghmO3r0eBGPuXRjs/UKqjNpTMGSjadb2OHTbhoPd46EhvC+WkIKhiC
 3XmjOPr7JnaFWboFXBhTlnRnIUmQQrHm6HQdrnM4DA0Ifb6CKH88iCEeR A==;
X-CSE-ConnectionGUID: 0kxZcNq5RHSCw98VNBYrtw==
X-CSE-MsgGUID: 3zApGejpRBat5Hsng45h1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398530"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
X-CSE-ConnectionGUID: i7Ex/QvqSba91sWySxw/ZQ==
X-CSE-MsgGUID: vceF3MghRXCw0V3VqE+0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529264"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 14/36] drm/xe/vf: Abort H2G sends during VF post-migration
 recovery
Date: Sun, 28 Sep 2025 19:55:20 -0700
Message-Id: <20250929025542.1486303-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 47079ab9922c..d0fde371fae3 100644
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
 
@@ -872,7 +872,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
+	if (ct->state == XE_GUC_CT_STATE_STOPPED ||
+	    xe_gt_recovery_inprogress(gt)) {
 		ret = -ECANCELED;
 		goto out;
 	}
-- 
2.34.1


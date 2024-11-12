Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA4ED42BB7
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 17:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951FF10E096;
	Tue, 12 Nov 2024 17:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bstko5a+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B94410E096
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731433413; x=1762969413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V852K6lkcSC1ZIcljA0JY1hSiQ4uKp55qf7gJsii/0g=;
 b=Bstko5a+doLBv99V7VilgBnqhZWZZvk0dacsDZLqFDlXg4wThPhzAN79
 B23+xdqUME4QTWN62HKxSSCRyB4Rl1fRFwdVmaO9OVGOGk9a+bw3pcwH4
 7a0I/hJKNVqM6jWmIFgwuFZVXpFcNtJC6ssBJTYyVsEiCa0P8ATlkW3Q6
 LttqPhNZNMgpcKvl6jfyB6BZe0RHOWvvEPaByPxpUKFTbg565OFDvr5zA
 KsdTFMqXkSYNayFA5IWChbCBkk5Nz4G/qaDS2MuLO/2BkVUpC5KHuDldn
 185GEJLSKcI1fUZ+OAAkhTF0M6Ib+ywHtVq+vp14eaScxeQRGkE7mmP2B g==;
X-CSE-ConnectionGUID: Fkb7yMyHQJWQUFvf+P9yGw==
X-CSE-MsgGUID: Zx/9iCkASKSyMs9NaAtCsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18897004"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="18897004"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:43:31 -0800
X-CSE-ConnectionGUID: 7z4wbHfJS0GT9iKMYGVoxQ==
X-CSE-MsgGUID: 6oxidWSKTneL/iN/uCxvAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87743045"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:43:30 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Ignore GGTT TLB inval errors during GT reset
Date: Tue, 12 Nov 2024 18:01:23 +0100
Message-ID: <20241112170123.1236443-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

During GT reset, GGTT TLB invalidations may fail. This is acceptable
as the reset will clear GGTT caches. Suppress only -ECANCELED other
return codes are still unexpected error.

v2: Add code comment(Matt).

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3389
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 3cb228c773cd..4e9f89392160 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -253,9 +253,18 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 		0,  /* seqno, replaced in send_tlb_invalidation */
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
+	int ret;
+
+	ret = send_tlb_invalidation(&gt->uc.guc, fence, action,
+				    ARRAY_SIZE(action));
+	/*
+	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
+	 *  should be nuked on a GT reset so this error can be ignored.
+	 */
+	if (ret == -ECANCELED)
+		return 0;
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action,
-				     ARRAY_SIZE(action));
+	return ret;
 }
 
 /**
-- 
2.46.0


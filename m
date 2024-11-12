Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11053D42BAF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 17:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ABD10E0E2;
	Tue, 12 Nov 2024 17:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktNzVOwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0210E0E2
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731431504; x=1762967504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NtrRvDT40Ch4AHTrUhRcE52D665nCRf00rbJ2e1q3ak=;
 b=ktNzVOwSOGFqwl07xiDhJrBTjj2Eu+48eiSqYoz3FmysqmzuBHM9dM5E
 ExEUcw5LeSpYz23XqCdPyXkHE46DS/UtjXZJnRDcC+F4Fm1D5G/5t0FCi
 ZhbXemdZSqRbdG0+u239YiXN4WEcsc57ibkfmUDW3S0VHS5b4PrPp6IIB
 EACK1oDl5xznCGeZmMudB1ry6ZNvchIh748dlm/aspHHMU9OXW81lHipM
 LjnFuVTIvtp9edwvZP4+fQ+HRzA69d9yJUQXIE9Ve6l78CmmhwXMDFM43
 RFeBv7kHKwTUkXXtCTvAtn8beb40kOIQBzfsB9crG9TFUEB4giBX577rf Q==;
X-CSE-ConnectionGUID: 35qLbnOYQE+FnM5Rlr42aQ==
X-CSE-MsgGUID: +lcZe3mIT2GG4gM35C+15g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48790577"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="48790577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:11:43 -0800
X-CSE-ConnectionGUID: 2XWKvfpxTxio8EYT5q4Okw==
X-CSE-MsgGUID: WeD+O157Qk+q0AHkeooDWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87724307"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:11:43 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Ignore GGTT TLB inval errors during GT reset
Date: Tue, 12 Nov 2024 17:29:34 +0100
Message-ID: <20241112162934.1119772-1-nirmoy.das@intel.com>
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

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3389
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 3cb228c773cd..acd6ec535ef9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -253,9 +253,14 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 		0,  /* seqno, replaced in send_tlb_invalidation */
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
+	int ret;
+
+	ret = send_tlb_invalidation(&gt->uc.guc, fence, action,
+				    ARRAY_SIZE(action));
+	if (ret == -ECANCELED)
+		return 0;
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action,
-				     ARRAY_SIZE(action));
+	return ret;
 }
 
 /**
-- 
2.46.0


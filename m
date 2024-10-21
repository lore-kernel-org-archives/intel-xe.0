Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE6D17122
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 17:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2118B10E57A;
	Mon, 21 Oct 2024 17:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHkbGrqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6ED10E530;
 Mon, 21 Oct 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729533402; x=1761069402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVNM1bzYPKyIS0dI7rcyYwfed75CqkKaVMtfoqIOppc=;
 b=YHkbGrqqAM6JUsMHNZzal7OLVb0i98PhPxznC/EYIDMWBzuTWJ/mWsRF
 zYTWj5YkNCPib+PcR1vizJkqHA+ihxRafLIRfvYEPcxpOv/0h5+FtKsZT
 ai7HDk+yceFZce7+ZqqMcSyQTkQhMLuS+vGYsLcbIU4wB5yyyonAlPtdO
 l9EBXbo+i6BiIsK0kzcxNYJ48n+fQtLKeiAjLmxFug1tmzHxe9vYADJPq
 MBKtT2qpj2BLXdGuR+BFRXXhxTgiAZusuhmUw69a87ptOTe5kQbbm1IyK
 5o3jbbCASv0riuxBSvvh5ispCGQ5oMYIcwyHCFLU3r5EDSJna2g0US68c w==;
X-CSE-ConnectionGUID: FDxVlF0kRlObsaN12gfvHA==
X-CSE-MsgGUID: +bQu2Iz8QvOanP74fp63pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28910184"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28910184"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:41 -0700
X-CSE-ConnectionGUID: 9HTm0Tf1QfeMPN8Xxs/O8A==
X-CSE-MsgGUID: 4k3/2iMIRruMI+I50aIRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79680272"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	pstanner@redhat.com
Subject: [PATCH 4/4] drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
Date: Mon, 21 Oct 2024 10:57:05 -0700
Message-Id: <20241021175705.1584521-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021175705.1584521-1-matthew.brost@intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
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

GT ordered work queue can be used to free memory via resets and fence
signaling thus we should allow this work queue to run during reclaim.
Mark with GT ordered work queue with WQ_MEM_RECLAIM appropriately.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89e9d9d4db06..d6744be01a68 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -77,7 +77,8 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 		return ERR_PTR(-ENOMEM);
 
 	gt->tile = tile;
-	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
+	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
+						 WQ_MEM_RECLAIM);
 
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 	if (err)
-- 
2.34.1


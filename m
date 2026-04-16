Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E24FA0C4E
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 07:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B57410E838;
	Thu, 16 Apr 2026 07:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKyO5CT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797C310E845
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776325835; x=1807861835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cwUUQPbf05UeKhWlbQ0dDvQIwfoildGyd6SmYyyFpy8=;
 b=mKyO5CT8dbKQhxK6WYLDmTr6ihlV9kmfiBqcenurtds759V+4W29e80q
 6Byxdi0sjNLFOEeXosGylAb14pWQaZ8RsUpZr2oEyFxYpfgUKSYTBMg62
 Rnx/bwyvA+pTz8w/cmijbTZpj+uUYaQw3nLCEKnI2T1lRfMm9yrgFRjx0
 nl4VKtQRixsoJUm22zNYDf2stxEUampg2ofSn3lebOhm7H7WT9v3QBzEc
 hMmmdQKKTX2+cuYjwIsxf99RfP5VTRtBahDYmy0D3sIQXTe9rrw593XxL
 0Tw9+pLxm7wuJwviwn6qVGQCgz6oh7eh5PKLjsWzGkiOVAeuWHhFR+kXE w==;
X-CSE-ConnectionGUID: xm05NsnmSyOloO1yFIiPtg==
X-CSE-MsgGUID: Xh9obvz8Q8ySfEX7FIx7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81188795"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81188795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 00:50:35 -0700
X-CSE-ConnectionGUID: NU1XfoIvTnC7uNOKPNQKkQ==
X-CSE-MsgGUID: Q5n7DpmcSSyVIBlTNeNIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235036531"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 00:50:33 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 01/10] drm/xe: Link VRAM object with gpu buddy
Date: Thu, 16 Apr 2026 13:19:50 +0530
Message-ID: <20260416074958.3722666-13-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
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

Setup to link TTM buffer object inside gpu buddy. This functionality
is critical for supporting the memory page offline feature on CRI,
where identified faulty pages must be traced back to their
originating buffer for safe removal.

V2(MattB): Clear block->private in xe_ttm_vram_mgr_del as well

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5fd0d5506a7e..01a9b92772f8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 
 	mgr->visible_avail -= vres->used_visible_size;
+	list_for_each_entry(block, &vres->blocks, link)
+		block->private = tbo;
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
@@ -176,8 +179,11 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 		to_xe_ttm_vram_mgr_resource(res);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
 
 	mutex_lock(&mgr->lock);
+	list_for_each_entry(block, &vres->blocks, link)
+		block->private = NULL;
 	gpu_buddy_free_list(mm, &vres->blocks, 0);
 	mgr->visible_avail += vres->used_visible_size;
 	mutex_unlock(&mgr->lock);
-- 
2.52.0


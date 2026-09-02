Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98027C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CF910E35F;
	Wed,  2 Sep 2026 14:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvY+Jx+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D6110E197
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360888; x=1819896888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5QKfsC+fg6k/YtfwanNAgpIC+ajsHsKit/Z1fiwEyo=;
 b=FvY+Jx+5BlBNZ2Rzmk9OxTt1IB4d1TbDKjv14wKKq1P8M6HENAKPT9LN
 gyZUhS22/OB3fV/JQ+oMCaMMySKtEXzEgJeHK62b+CXlam42vB5hoPVrh
 xPJtpCVy5UBFhXzan1YE0rx9nXLcgSNYpk/Z3bW3mteAIxCdIdEUxzF0A
 JeP8aeyPLn1NTfMJx9YgxPtnLj/GAM0FFKV0oaofp30ZkP/ULyl2PL+hC
 xIarRtEpcoaWieZfSXDT9GCTmFR2M+rny+aIxi551FLu7+5TLjam79i+T
 uH8nDKbp7r3te/3BFCX90miobnj+FQZrNZRLJH8BvIHPvZUNXUuDwl/p1 g==;
X-CSE-ConnectionGUID: jNf8yCu1TvCjAdGHKXG2Pg==
X-CSE-MsgGUID: Te0GJdgLRWi+y3yltWvxeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92525986"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92525986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:48 -0700
X-CSE-ConnectionGUID: mag6Je0kQTGzR3UOkz3czg==
X-CSE-MsgGUID: tQaej+15RXiDCbC5YK2uYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263259964"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:46 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V20 01/15] drm/xe: Link VRAM object with gpu buddy
Date: Wed,  2 Sep 2026 20:23:44 +0530
Message-ID: <20260902145343.465686-18-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 05911904c1f9..51e983ee3bad 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -57,6 +57,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -141,6 +142,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 
 	mgr->visible_avail -= vres->used_visible_size;
+	list_for_each_entry(block, &vres->blocks, link)
+		block->private = tbo;
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
@@ -179,8 +182,11 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
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


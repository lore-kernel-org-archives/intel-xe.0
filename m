Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902610ED65E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D226C10E396;
	Fri, 27 Mar 2026 11:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkxjsTyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5E410EC58
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774612145; x=1806148145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PBjtbvgNkzD8yDng0J8w5otpcaEK/aNGqjUyqBzBZMY=;
 b=IkxjsTyRggS0a+lo+XeEbsOFW6SCCywa8TU7ZqCPm0GR0WeCJaUAjxyF
 2vsb5Kf5jphU8ytOu9jDPRem64lLtu2nThZVpzWVFIr0X89ZiiA/zbmAj
 uMzs3pFyRP7PaDUKF29dE/Cga7l8+hm+a+nnISt9i11DfFr8aLTIjHMDS
 jOolgZrZ6Szb+DIvIb6Y+4pF7K6uxcE5DhqFUNMpcCHM6KO2y1irLSGui
 d97bJAdwN3eyXPUGyuS3V0/7az4rAndL8M1UUlQajkn4UxsTb3/j1gcgJ
 uvSs/Dzw3pypGA5lwIQopVlwaQeoUm0LU0UHBPYBa33yNf2jPe70u/jlP g==;
X-CSE-ConnectionGUID: cuuKexxeQmeKSdwdpsdxbg==
X-CSE-MsgGUID: lyGVLmGjSxaNs4Xf3xJigw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87157676"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87157676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:49:05 -0700
X-CSE-ConnectionGUID: vYHMT4JHT8asWpE2dC0fDw==
X-CSE-MsgGUID: sf0w9OlURsa0qEfj/cwrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224335017"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:49:03 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V6 1/7] drm/xe: Link VRAM object with gpu buddy
Date: Fri, 27 Mar 2026 17:18:14 +0530
Message-ID: <20260327114829.2678240-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5fd0d5506a7e..c627dbf94552 100644
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
-- 
2.52.0


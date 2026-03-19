Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4981075265
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 06:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9F10E880;
	Thu, 19 Mar 2026 06:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1Dsd2XV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0CB10E880
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773903237; x=1805439237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PBjtbvgNkzD8yDng0J8w5otpcaEK/aNGqjUyqBzBZMY=;
 b=J1Dsd2XVcfvRrfZmt9zRkfnLtvp2xPjylzU2FFM0pCiCN+0qr+5c7uCV
 mtN4GDUBmZPlleDlU9hzEKJXjNXRrnGx5uA9PDaS+e+H/jC2BDAx9RFF9
 57IcW2aN7WL3ONAtvWU1Aq8nEDK/Lkbhdbt5mHY+Uavdsc34RLiEwQBeG
 O9ebxOIKOT0w8D00zk0/S5f52OWXj8VkLcDBqVXijuEGEfGP4i5XtPZLJ
 GWPwr+A/TsjTCgx98f4m6zCrfWHt7pB+zIRKHKeCbsgoM1wVi52ax9qkC
 wqdU+5uDOxoqZ3E/RPviPwsCynJdYTvpg34pJjQpzUY06mFv0Ztp9ikK1 w==;
X-CSE-ConnectionGUID: vdKFXGhXTkOMJJmx8eTsOA==
X-CSE-MsgGUID: Jztk4vNLQgGzF198OoU1uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75045673"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="75045673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:53:57 -0700
X-CSE-ConnectionGUID: k4TvpRRMSUK9DkWerGFKiw==
X-CSE-MsgGUID: cwbeRujMSimCvvewjlzq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="227571224"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 23:53:55 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V5 1/7] drm/xe: Link VRAM object with gpu buddy
Date: Thu, 19 Mar 2026 12:23:40 +0530
Message-ID: <20260319065340.2531231-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
References: <20260319065340.2531231-9-tejas.upadhyay@intel.com>
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


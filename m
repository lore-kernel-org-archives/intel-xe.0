Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92998C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5360510E072;
	Mon, 12 May 2025 22:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNoCKzdr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D935410E072
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747087232; x=1778623232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8XmbB+Z4ITtT5dxtSHDl3bZ0RSi4DTViDg78C3DMDkE=;
 b=nNoCKzdrrT3DEmx0SRQunO5zTtdIngh1nBBmFEcqnRM064YHjOiPTEfs
 ZiFfZ+9peQFouGdc/f1ae+7gvlztb+emseRHvsUQfIGy86pgtlYeCQ7XW
 NEvdS4iro52clclGhqqVyfIlVTkkH0qB4G4NZsg1tuqLLAd7W/0naJM6P
 o4Z5Urj+0/Eex3Uc4n+PoDRT7xqzikqSqQyvj1c4WV6chFATDGB96L7aH
 y15D2j9AKJjKUILeginUPlYQeGFvTXt+F0BMDnMvqLbJZsWvefwPrStqZ
 0jkEL5NE8nAUoKFzwESAULpjX0NOKVyYXzbizFdDf8Zl3tqYTA+h/qEDI Q==;
X-CSE-ConnectionGUID: KydCFKs2QK2f8gZ1GMPO1A==
X-CSE-MsgGUID: qCRA/cRuQwyOvamWSD4VwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66317910"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="66317910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:00:31 -0700
X-CSE-ConnectionGUID: Yq4odSt6Re2pUGxWAPhVOA==
X-CSE-MsgGUID: BlkGaFfbTZa++40k7LXkJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137390397"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.179])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:00:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Unblock GuC buffer cache for all modes
Date: Tue, 13 May 2025 00:00:17 +0200
Message-Id: <20250512220018.172-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250512220018.172-1-michal.wajdeczko@intel.com>
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
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

Today we were using GuC buffer cache only in the PF mode, but
shortly we will want to use it also in native and VF mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c     | 4 ++++
 drivers/gpu/drm/xe/xe_guc_buf.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bac5471a1a78..350434a8b953 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -710,6 +710,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	err = xe_guc_buf_cache_init(&guc->buf);
+	if (err)
+		return err;
+
 	/* XXX xe_guc_db_mgr_init not needed for now */
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
index 0193c94dd6a0..14a07dca48e7 100644
--- a/drivers/gpu/drm/xe/xe_guc_buf.c
+++ b/drivers/gpu/drm/xe/xe_guc_buf.c
@@ -37,10 +37,6 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
 	struct xe_gt *gt = cache_to_gt(cache);
 	struct xe_sa_manager *sam;
 
-	/* XXX: currently it's useful only for the PF actions */
-	if (!IS_SRIOV_PF(gt_to_xe(gt)))
-		return 0;
-
 	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
 	if (IS_ERR(sam))
 		return PTR_ERR(sam);
-- 
2.47.1


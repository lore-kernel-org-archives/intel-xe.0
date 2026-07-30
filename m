Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7ACC54FCD
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 00:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC6E10E0E0;
	Thu, 30 Jul 2026 00:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqENbWe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA30710E0CB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 00:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785372483; x=1816908483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1o9nHdqBIEmzwRhLvhdgmT5ujlyImk7jUbtTJjgS28=;
 b=VqENbWe5uW0+UP+jqZ17xFnATd0fcFmCHT7s9XGadVyf+FWWpk0EmSDG
 YvVumbC2mSEFRXRi9dIKEJwkrTf54u2UmCs3TLTV7XAOu6bESB25kYpJZ
 Zsjv3TKIgI9N2humTYVPrSUhn1bFsFRkVFMVSluPYHXfzafWclwfCgEEN
 JGgrCCFENbqbhcxt24h0+tiNoWdjeVSnmXeNN8iIgtyV9L1+s8c0TbP1T
 zhBvR7RkyZsqMcbYN4EW+wFADSvZlWJsEBimDnDKyi9CZql/nVggX4doh
 mohJ8syCMZeqT1RM+Yi9yzed3yAc367UcvuDNhfel49wuFn4M5h+wDyf3 A==;
X-CSE-ConnectionGUID: 7NlhtrEmRim3kRuc36D0TQ==
X-CSE-MsgGUID: m574XsrDQ2+xTLZKnXMktg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85935349"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="85935349"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 17:48:03 -0700
X-CSE-ConnectionGUID: NvDJS+czSV2YP1waaDPLDQ==
X-CSE-MsgGUID: UKXZnaLhR1KgXnhKXyF8Vg==
X-ExtLoop1: 1
Received: from unknown (HELO DUT6094BMGFRD.fm.intel.com) ([10.80.55.54])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2026 17:48:03 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, gwan-gyeong.mun@intel.com, stable@vger.kernel.org,
 Jia Yao <jia.yao@intel.com>
Subject: [PATCH v4 2/3] drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
Date: Thu, 30 Jul 2026 00:47:34 +0000
Message-ID: <20260730004735.344627-3-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730004735.344627-1-jia.yao@intel.com>
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730004735.344627-1-jia.yao@intel.com>
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

On dGFX the original ADS BO is explicitly migrated to VRAM by
xe_guc_realloc_post_hwconfig() so that xe_bo_main_addr() returns a
real device-physical address (DPA) rather than an IOMMU IOVA.  A
separate SYSTEM BO for the UM queues would not go through that migration
path, so its IOVA would differ from the physical address on systems
where pages are allocated above 4 GB.  GuC/GAM accesses the UM queue
ring via base_dpa (with_dpa=true on pre-Xe3p), so an incorrect DPA
causes all-zero fault descriptors to be forwarded to the driver.

Use XE_BO_FLAG_VRAM_IF_DGFX() for the UM queue BO so that on dGFX the
BO is allocated directly in VRAM and xe_bo_main_addr() returns the
correct DPA without needing a post-hwconfig migration step.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c     |  6 ------
 drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++-----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 21cf3edef922..4023700ff2a9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -714,12 +714,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	if (guc->ads.um_queue_bo) {
-		ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.um_queue_bo);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 7f371f9c7268..53636333fb45 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -409,11 +409,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
 						    GUC_UM_HW_QUEUE_MAX);
 
-		bo = xe_managed_bo_create_pin_map(xe, tile, um_size,
-						  XE_BO_FLAG_SYSTEM |
-						  XE_BO_FLAG_GGTT |
-						  XE_BO_FLAG_GGTT_INVALIDATE |
-						  XE_BO_FLAG_PINNED_NORESTORE);
+		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+			       XE_BO_FLAG_GGTT |
+			       XE_BO_FLAG_GGTT_INVALIDATE |
+			       XE_BO_FLAG_PINNED_NORESTORE;
+
+		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
 		if (IS_ERR(bo))
 			return PTR_ERR(bo);
 
-- 
2.43.0


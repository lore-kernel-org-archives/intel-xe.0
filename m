Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA912C55167
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 23:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8866D10F0F3;
	Thu, 30 Jul 2026 23:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNIU4t+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C612910F0EE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785454037; x=1816990037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c06bulpfqKxGKzJcgyLQBmeDhSjy0u6O1VX8Mvk6Yic=;
 b=YNIU4t+H1U/HvONDDScgWb1BHgXQcIMnorEYCboRTaXl+JhaNlEKEvPs
 aZ2V7sZnKPpWjhRE3c59TxN47oEw+zPDhZLo7QRnXeuOqv51i55nteIya
 IIWXGfo5lPK7c66NUqLvWeAzhmU75enrX27wmnLegwMBV1rtivtSXE3JI
 9tOxzO9Jq+nyb+s+5Nxlx1bQihrNZpDeU2vj6ybjZ1uLGDeCYtkK71mFu
 xzHLKnhyHNsFlnVeipCLrNrtks9q2cbpl88JANCj4ovsOuAK2aGeq4qqm
 FSeFotH155IJgfhe3DKQ3ib1KV2oXt65W5//aMfkcOUTgE3HOygT47X6P A==;
X-CSE-ConnectionGUID: ZoBl6qfeRnCYR+5ajjfbgQ==
X-CSE-MsgGUID: jH1fXECWSBar8jb6v6sy1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89895252"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="89895252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:27:17 -0700
X-CSE-ConnectionGUID: 4P652JnmSX6ViozzFiJIRQ==
X-CSE-MsgGUID: 1Tq8ICO/S0aVM8Kqeq4wwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="283764152"
Received: from unknown (HELO DUT6094BMGFRD.fm.intel.com) ([10.80.55.54])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2026 16:27:17 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, gwan-gyeong.mun@intel.com, stable@vger.kernel.org,
 Jia Yao <jia.yao@intel.com>
Subject: [PATCH v5 2/3] drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
Date: Thu, 30 Jul 2026 23:27:11 +0000
Message-ID: <20260730232712.517989-3-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730232712.517989-1-jia.yao@intel.com>
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730232712.517989-1-jia.yao@intel.com>
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

On pre-Xe3p dGFX, GuC/GAM accesses the UM queue ring buffer via
base_dpa, which is interpreted as a raw device-physical address.
Unlike the GGTT PTE, there is no flag to indicate whether base_dpa
points to VRAM or system memory; the hardware assumes it is always
a VRAM address.

A separate SYSTEM BO for the UM queues would cause xe_bo_main_addr()
to return an IOMMU IOVA instead of a true VRAM device-physical address.
GuC then accesses the wrong memory and forwards all-zero fault
descriptors to the driver (Faulted Address = 0, ASID = 0).

Use XE_BO_FLAG_VRAM_IF_DGFX() so that on dGFX the UM queue BO is
placed directly in VRAM and xe_bo_main_addr() returns the correct
device-physical address.

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
index 4f132bf8539d..4286bd05c686 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -732,12 +732,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
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
index 3b6e1c45a0e9..57a0614dbf6d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -461,11 +461,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
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


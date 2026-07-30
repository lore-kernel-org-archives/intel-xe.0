Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D9C54FCD
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 00:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2B810E572;
	Thu, 30 Jul 2026 00:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bid4+Fkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14C210E572
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 00:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785372487; x=1816908487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tx5kBI0vAL1hYSKRWj97O3O0eaj/dAxe9aPb9OAipq0=;
 b=Bid4+FkfZjUUNM9AMsMrDvaV0Y0oE2Ric6Sz5rBHJ/ic6SKNYMRDQHp/
 W/jkNMGk+Gkxp3ojqkOWpowEGucER8GhP1+2lDdcQiFfaywmQDs6A/Eo0
 PMpryI8A9Q19KRVqz3QRUc+ZjEq5aOMoUIZkNPUt15A8qz5GcsUJEvBOC
 mJpRbCtgzYA3Ja8TmOkOAd5opndguOKKWPfJLdCRjIQeg8SQrANlDOYyr
 0aAkEwabd2r1Is47RMvbOEBSiF6FLN31WEed/AT37l8clANbobwEXGLZx
 aT/Ff7suy+YJjTUsB4njUgTLNK8EQElNRm8h23tmaEFHbhPbsNAI7lwPV w==;
X-CSE-ConnectionGUID: BmACdThhSDiKuPwudkoh8g==
X-CSE-MsgGUID: TXtJ+4sRRm+zeW8bgw0G2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85935363"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="85935363"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 17:48:07 -0700
X-CSE-ConnectionGUID: QUZcQdoIRqyVAHoI8TwYRg==
X-CSE-MsgGUID: L5vLLhW+Qny6yrmR0eGaxg==
X-ExtLoop1: 1
Received: from unknown (HELO DUT6094BMGFRD.fm.intel.com) ([10.80.55.54])
 by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2026 17:48:06 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, gwan-gyeong.mun@intel.com, stable@vger.kernel.org,
 Jia Yao <jia.yao@intel.com>
Subject: [PATCH v4 3/3] drm/xe/guc_ads: use uncached mapping for UM queue BO
Date: Thu, 30 Jul 2026 00:47:35 +0000
Message-ID: <20260730004735.344627-4-jia.yao@intel.com>
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

The HW unit that writes fault descriptors into the UM queue ring buffer
may not be coherent with the CPU cache.  If a descriptor write is still
sitting in a GPU L3 cache line when GuC reads the slot, GuC sees the
stale (all-zero) content from DRAM and forwards an invalid descriptor to
the driver (Faulted Address = 0, ASID = 0).

Mark the UM queue BO as uncached (XE_BO_FLAG_NEEDS_UC) so that writes
bypass the cache and are immediately visible to GuC.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 53636333fb45..76029575aa45 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -412,7 +412,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 			       XE_BO_FLAG_GGTT |
 			       XE_BO_FLAG_GGTT_INVALIDATE |
-			       XE_BO_FLAG_PINNED_NORESTORE;
+			       XE_BO_FLAG_PINNED_NORESTORE |
+			       XE_BO_FLAG_NEEDS_UC;
 
 		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
 		if (IS_ERR(bo))
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B50BC88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 07:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0610E59F;
	Tue, 15 Sep 2026 07:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQkueknU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A618A10E595
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789456339; x=1820992339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DDkB9egvhZRYtamTRr5F1qFkWqVDFivK0gh2HlXLoaE=;
 b=HQkueknUPx/kzUcoZ0Cg4oSfTGJe1gqnencP8hd3TQmdBmU41NIblfp/
 z34ypQaLIhO3i41cN4NAwZKHLN9nNuEnW2IySeLkTNJTOXFAyrms9lFHJ
 wDH4jcn1PXRDHA4WYBTIkSf3bQPWtOpYLo4gNMLmtV2uE9dQNq7j8hO2o
 /bsWtPQVgLfyF8uwBjdiChLZMGpvPcXNYhyEq15W97ly1GpUF4YRbGnBD
 WeJFoh/gJ7eU3p3vUjnJpJPaY5UnGz3OfoMKGvW9EpT5ZvSNLVH3/FZxq
 p1a7WpqwhqQS5uwx59NxqFv7Vx1nkNoct5BoFtLXOQGG4XFWGQiCSXKxm g==;
X-CSE-ConnectionGUID: KVLHUUYwTDWzzVUuF2Z/8A==
X-CSE-MsgGUID: 7nXOxORYSYq0SaUmz/R2og==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93511756"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93511756"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 00:12:19 -0700
X-CSE-ConnectionGUID: r+lgB144ScyHbtRiFekTJw==
X-CSE-MsgGUID: w3P9U62BSYyzx002/xQSkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1081609"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 15 Sep 2026 00:12:18 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v8 07/10] drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE
Date: Tue, 15 Sep 2026 12:42:04 +0530
Message-ID: <20260915071159.51402-19-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
References: <20260915071159.51402-12-satyanarayana.k.v.p@intel.com>
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

Currently, PF aligns VF GGTT ranges to 4K/64K on DGPUs based on VRAM
alignment. Aligning VF GGTT allocations to the host CPU size allows
finer-grained GGTT partitioning without imposing VRAM alignment
constraints on the GGTT base address.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458e..91ec8e898e3b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -441,9 +441,7 @@ static int pf_refresh_vf_cfg(struct xe_gt *gt, unsigned int vfid)
 
 static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	return PAGE_SIZE;
 }
 
 static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
-- 
2.53.0


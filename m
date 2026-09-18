Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161C4C982DC
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E9110F2B8;
	Fri, 18 Sep 2026 10:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5PLw+NI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B057810F2D5
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725953; x=1821261953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMEz8fegl7svFmmK0umWcsJmwiKK3B3jxf8SsMxqfb8=;
 b=P5PLw+NI8ZhX+kDRgslWMRzNceuAoLMnjYSBSx6NJnENHgnEHNAwCgsw
 LI+yRwXrRfC5lzKRjclhrSUoiKkj16K+V9+28hzuX59/rDNIMA36ZjQTH
 GEM9asm0hCMeYZcZCQM7zjbld4qx9DC6H9ZVdJFSUPDewOm6LAzIEIA9U
 ImwKDsRKqYWnobCnjVwOxCwxkQbDIidQUk6uKesQmTRlJHiJEjkKWJq30
 bz/1aYlkZkhya/aeVwQ2liHOm6KchLpfJy03Ztgj5H3/KBrRqL+4PmNJI
 RaEOwQ26BB6pZ4wTU6psQGNqQ1u7naPKNv+v794DS2o5SokZTGWpK8dQ9 A==;
X-CSE-ConnectionGUID: RCNp17bOTLOjK35ZWl1Y0g==
X-CSE-MsgGUID: zwE9zTEITHizB9EaR+W65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="737235"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="737235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:05:53 -0700
X-CSE-ConnectionGUID: ogcaI84KQB6U/M8ZC0WZIg==
X-CSE-MsgGUID: y0K/1uYYTKenLjwDiHLz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271003579"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 03:05:51 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 07/10] drm/xe/pf: Align VF GGTT allocations to PAGE_SIZE
Date: Fri, 18 Sep 2026 15:35:31 +0530
Message-ID: <20260918100533.567225-19-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
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
V8 -> V9:
- Update PF GGTT alignment to XE_PAGE_SIZE (Sashiko).
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458e..a2083d3b2eee 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -441,9 +441,7 @@ static int pf_refresh_vf_cfg(struct xe_gt *gt, unsigned int vfid)
 
 static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	return XE_PAGE_SIZE;
 }
 
 static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
-- 
2.53.0


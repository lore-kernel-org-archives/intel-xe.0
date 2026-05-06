Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DAACD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 09:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91AE10E18C;
	Wed,  6 May 2026 09:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfCWyFKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB6710E18C;
 Wed,  6 May 2026 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778059346; x=1809595346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pzGBaCuxQyXYO0Cq7NhTRLF2PwskXM86QD3Ndt8qBYs=;
 b=GfCWyFKWwwGva91Fi9vm4xvmIUQI1jGnvy/EX/g5qaXuMmWhdzfhlKhX
 1wQHeCYZAFmFwGqRQBjxEBf3SDugkjzk5GlmEu0oA/azFIFD04SUev7Dk
 DSheulsHyUNJTg8Zv0JzQyR6Yv/C8VIQZybYh/a9OGCVmLzXkIE6wEcVD
 u3Bfr/dOXc9SrjyxUoZIFaWAgzRVR9VnEi4AuPtMbm14FK+0kAKmUs93W
 UeeXtIS8xdt7qc5Iee6v8WTTzd/QEQew058kubCNRaZva0J2lzPxFWxep
 fHNU5mIR1GXwywhX7mYswCWPSIQ/gsne8y+o94bDYpCr01QRM/i/qQAgf g==;
X-CSE-ConnectionGUID: QpQp6BO0Tp6RSBSfMP9Ngw==
X-CSE-MsgGUID: JLLu6Rc0R0mAUdjeXLzcnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78698876"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78698876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:22:25 -0700
X-CSE-ConnectionGUID: MOXTMGk2QoCGMJejmKYH0w==
X-CSE-MsgGUID: 7ZCyesUUQz6sEK4df6v/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231709525"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa010.fm.intel.com with ESMTP; 06 May 2026 02:22:23 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] drm/i915/display: Fix color pipeline state copy for joiner
 secondary planes
Date: Wed,  6 May 2026 14:46:38 +0530
Message-ID: <20260506091638.421030-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
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

intel_plane_color_copy_uapi_to_hw_state() is meant to copy color
pipeline state from the source plane (from_plane_state) to the
destination plane (plane_state). However, it was incorrectly iterating
the color_pipeline from the destination plane_state instead of the
source from_plane_state.

In non-joiner configurations this doesn't matter since both point to
the same plane. But in bigjoiner mode, the secondary pipe's plane has
no color_pipeline set from userspace (only the primary pipe's plane is
visible to userspace). This causes the while loop to never execute,
leaving the secondary plane's hw.ctm, hw.degamma_lut, and hw.gamma_lut
as NULL.

As a result, xelpd_load_plane_csc_matrix() skips programming the plane
CSC on the secondary joiner pipe (early return due to NULL blob),
causing a visible color split between the left and right halves of the
display when HDR color pipelines are active.

Fix this by reading color_pipeline from from_plane_state (the source/
primary plane) so that the HDR CTM and LUT blobs are properly copied to
the secondary joiner plane's hw state.

Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index c181a7d063ec..e403fe4a8a20 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -396,7 +396,7 @@ intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 	bool changed = false;
 	int i = 0;
 
-	iter_colorop = plane_state->uapi.color_pipeline;
+	iter_colorop = from_plane_state->uapi.color_pipeline;
 
 	while (iter_colorop) {
 		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
-- 
2.45.2


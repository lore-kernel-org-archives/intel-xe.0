Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A4C369D7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 12:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD2D10E9EC;
	Wed, 25 Sep 2024 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iz+imdPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4FF10E9EC
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727267084; x=1758803084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fpuuog2Slwd0+2O86P5sxtTYu/68ey+P7zbJKjC7SQc=;
 b=iz+imdPlbd7wlgjo9AHLsbQ6GrfM0ksNnFMiA1nNe2YNF1QPnFHdtXEt
 rtQU+3vWWc5DjgWr5glYljIunWfpoXiU/WtOlczc1hgYtKnW+pIWiYfok
 FnZDjhuDx0RNqhBT/KGKDaXv9MHqECHFKRlQXLfFvq44cs/h77TT3xwPP
 JKRp4UGWddJhC8gD/aL4imJRTGpaBmuZjGolrAZPGIBH3Lp6eDXWvUuDU
 wVHyJdeItmxB4k/tFgIuIh9TSWvQDDKZDcOvA1L+jiEmzno4U2W08KYz/
 /Kl1OC3TpiiVMjyx8SVKDWxI/yQk/s+i37IccMTWqolDDapAsqzotq6nK A==;
X-CSE-ConnectionGUID: MeUAndXJRi+1rHOf3bjq2Q==
X-CSE-MsgGUID: yXYWY8u9Th2YV5iQ1SJGYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25781420"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="25781420"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:24:43 -0700
X-CSE-ConnectionGUID: f1a5OAj9SI+CFqpSoBxRvg==
X-CSE-MsgGUID: xU/0JPrmSbaTWHVC4esLxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71642421"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa010.jf.intel.com with ESMTP; 25 Sep 2024 05:24:42 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
Date: Wed, 25 Sep 2024 17:55:13 +0530
Message-Id: <20240925122513.2455181-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

Disable the support for odd x pan for NV12 format as underrun
issue is seen.

WA: 16024459452

v2: Replace HSD with WA in commit message [Suraj]
    Modified the condition for handling odd panning

v3: Simplified the condition for checking hsub
    Using older framework for wa as rev1[Jani]

v4: Modify the condition for hsub [Sai Teja]
    Initialize hsub in else path [Dan]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..dfe795b8e917 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1029,8 +1029,16 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		 * This allows NV12 and P0xx formats to have odd size and/or odd
 		 * source coordinates on DISPLAY_VER(i915) >= 20
 		 */
-		hsub = 1;
 		vsub = 1;
+		/*
+		 * Wa_16023981245 for display version 20.
+		 * Do not support odd x-panning for even xsize for NV12.
+		 */
+		if (IS_LUNARLAKE(i915) && fb->format->format == DRM_FORMAT_NV12
+		    && src_w % 2 == 0)
+			return -EINVAL;
+
+		hsub = 1;
 	} else {
 		hsub = fb->format->hsub;
 		vsub = fb->format->vsub;
-- 
2.25.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DC1D35161
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 09:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427B10EF5D;
	Wed,  1 Apr 2026 09:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EG59xB6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DD110ECFB;
 Wed,  1 Apr 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775034220; x=1806570220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ttNQ2g8OZ/aDV2y5mC9zMTdyVBoIvin+li42MXqLzSQ=;
 b=EG59xB6KOOPnxP0wJLuV9f3Bn1A9lIcif9nLOo/ANnqQHSLZDabUzhm7
 siCcTxCbbuP2K83dXiK8v83ImLFmRVNy3JgQvxUgoXllZHhngWxSNMR9Y
 kLWyu3TIewrKVgm26OjzyY6ztRTgK+0vZPPxQsE2p3qeqF8t9rgtkEH+C
 yqHA/wu+aHRGJ2MHM/wO29AdAt2qIzzOscuCU8UlneW7LYhwku4mwykoY
 08F3e1CCBi4aP/Z5Ljg797MOkFwQI7w1YCZZQQs35+jlWOTxeRgbLsxp/
 JYOPgwBGIONQOFvA5hOWB5rfHb0im6xmBZX5bbuhMPlEpn6Ii8AfVBiQO A==;
X-CSE-ConnectionGUID: uSa/9MWhRVWJ6LzQi5z8CQ==
X-CSE-MsgGUID: 5p5ZgnWERpuFEUJU5XlEOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75238106"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75238106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:03:40 -0700
X-CSE-ConnectionGUID: 9WXeqK4+Ri2I4TQc+a9t8w==
X-CSE-MsgGUID: d9zjw7yKQgurunuPuDhRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228232903"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2026 02:03:37 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 pranay.samala@intel.com
Subject: [PATCH 3/3] drm/i915/display: Do not program color pipeline for Y
 plane
Date: Wed,  1 Apr 2026 14:08:41 +0530
Message-Id: <20260401083841.4081587-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401083841.4081587-1-chaitanya.kumar.borah@intel.com>
References: <20260401083841.4081587-1-chaitanya.kumar.borah@intel.com>
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

The Y plane is only responsible for fetching luma data from a YCbCr
frame buffer. After chroma upsampling, pixel data is forwarded
through the UV plane for further processing. Programming the color
pipeline on the Y plane is therefore unnecessary.

The Y plane may still carry color pipeline state due to state copying
between the Y and UV planes. The hw state copying needs to be more
nuanced but until then, skip programming the color pipeline for the
Y plane.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 11ba42c67e3e..2f622a2d5e04 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1567,7 +1567,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	plane_color_ctl = plane_state->color_ctl |
 		glk_plane_color_ctl_crtc(crtc_state);
 
-	intel_color_plane_program_pipeline(dsb, plane_state);
+	if (!plane_state->is_y_plane)
+		intel_color_plane_program_pipeline(dsb, plane_state);
 
 	/* The scaler will handle the output position */
 	if (plane_state->scaler_id >= 0) {
-- 
2.25.1


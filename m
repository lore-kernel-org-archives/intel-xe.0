Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDA3CA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 07:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D196410E24A;
	Wed,  7 Oct 2026 07:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pc+yLGV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C64110E24A;
 Wed,  7 Oct 2026 07:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791356830; x=1822892830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=grg/dZHsD/m3/1iNDT7N9gmiTUfRdj+5XMs3rrmKI7Y=;
 b=Pc+yLGV2bue/Jeibr9YY5LUh5U4lV9oPEQNsBZpNLsZ/dpGEwHj9s1fx
 wsrU3esklFxoKgk0uO9mctLYKFnDoaIiNMctSDqECh9aXCItYPAgW3UDa
 B9L7cG/YMrtmsnePh2JczeB6B8gSymMxpcnLoQBTUDFLOQ16+XKqgfiEO
 K71BsYoWidKpEgH4a7owcxaKpsyygNyImiPfJcBgV4LiIsUw7F5tYXZL4
 Ent3ugAXjO+J4NAn86/P1ZP1VxV9T7KCyYLhGJRuiIBUPD65QeXswakk+
 LvSCH3iW8gt3SxgKGmSIkHUy4SnnoK6sgF5m0cx13NRAZ17hsjyxAOl8V g==;
X-CSE-ConnectionGUID: ETBV7QO5QqCgGz7EAyI2dA==
X-CSE-MsgGUID: KeAtUZToR7uyt+QXVcMDiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="5576"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="5576"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 00:07:10 -0700
X-CSE-ConnectionGUID: BpEkSBnpS7afrFHdv+VZRg==
X-CSE-MsgGUID: 6Fvl+rutSDquEXcvMW+R5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1468688"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa011.fm.intel.com with ESMTP; 07 Oct 2026 00:07:08 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/scaler: Prune YUV420 modes against the max source
 width
Date: Wed,  7 Oct 2026 12:36:01 +0530
Message-Id: <20261007070601.3611674-1-arun.r.murthy@intel.com>
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

skl_scaler_mode_valid() compares the mode's hdisplay against the pipe
scaler maximum source height instead of the maximum source width, so
single pipe YUV420 modes are pruned against the wrong limit.

Commit 3347b55f2c6c ("drm/i915/xe3lpd: Prune modes for YUV420") intended
to reject modes whose hdisplay exceeds the scaler horizontal source
limit, since pipe scaling does not support YUV420 for a source width
above 4096. Comparing against max_h makes the check far too permissive
from display 12 onwards, where max_h is 8192, and too strict on display
11, where max_h is 4096 while the horizontal limit is 5120.

Compare against max_w instead.

Fixes: 3347b55f2c6c ("drm/i915/xe3lpd: Prune modes for YUV420")
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7994b983d509..7e65c4fffbc0 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -145,7 +145,7 @@ skl_scaler_mode_valid(struct intel_display *display,
 
 	if (num_joined_pipes < 2 && output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		skl_scaler_max_src_size(display, &max_w, &max_h);
-		if (mode->hdisplay > max_h)
+		if (mode->hdisplay > max_w)
 			return MODE_NO_420;
 	}
 
-- 
2.25.1


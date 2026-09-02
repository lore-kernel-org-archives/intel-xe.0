Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB10C624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A13E10F07B;
	Wed,  2 Sep 2026 08:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1fG9kQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CD710F07B;
 Wed,  2 Sep 2026 08:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788337081; x=1819873081;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xE6n1/onZAalq1L5nOOxjKV6YEeXWBJRmsXSrBTpZ5c=;
 b=E1fG9kQiLRSd5kT8UfyD5hTp5LMp+udZQ+6VhQ8YBJC44qRD1x2FX7bI
 0D1GVlSieNkS3FD62oAdRMUryfLgETv5YunbOBAKeTGwb0jooBYmNRPDL
 AL/RFRFURy9nFyQKOX0LxCqHVWisFvA5OORR2+Rp0/Iq1YNVsgSGteiZR
 wEp+f4En1udloetfbKu8GB8C5ng2T3D1B0VnjpkvPUs8LZH4IeoAsNHeC
 OyHG8XIESbLEnWLtRGTuD1aBv/65SAeUpM/B9BHk9B0mdHEDUPqu3E2mC
 e3nAQNm1LWDwI//oscNhMj+yDt7KTp3oiTxek/O8TMkCINpDsKy5ahNai Q==;
X-CSE-ConnectionGUID: 6uqzu17cSACoDPH+QnriLw==
X-CSE-MsgGUID: xAqjSXMXROuhLul1GJTuzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299822"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100299822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:18:01 -0700
X-CSE-ConnectionGUID: zV+f9PclRWiOWtB1nO70dA==
X-CSE-MsgGUID: qd62NiBQSjabgoP76b6kmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263193684"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:18:00 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [CI 8/9] drm/i915/color: Add color pipeline support for SDR planes
Date: Wed,  2 Sep 2026 13:24:16 +0530
Message-ID: <20260902075417.656673-9-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

Now that everything is in place expose the SDR plane color pipeline
to user-space.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 53e55ce0a5a3..38cfd6ed585d 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -177,17 +177,11 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 
 int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 {
-	struct drm_device *dev = plane->dev;
-	struct intel_display *display = to_intel_display(dev);
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] = {};
 	int len = 0;
 	int ret = 0;
 	int i;
 
-	/* Currently expose pipeline only for HDR planes */
-	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
-		return 0;
-
 	/* Add pipeline consisting of transfer functions */
 	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
 	if (ret)
-- 
2.50.1


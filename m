Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08146FCC050
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F52210EDFB;
	Fri,  6 Mar 2026 17:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jw0OtDRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E0310EE03;
 Fri,  6 Mar 2026 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817561; x=1804353561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R9Hdw5pJjES+AgdRxJhXwKZttg3yqLZXT3EvL9QRocs=;
 b=jw0OtDRyjsSXI9tRhsKSYCjS0UnjZLMLCkUCbGTXSc4OeRhoSm1M/t2+
 +hvxeqO3+jJFZsOYQehuxb9HJcv49tsTsKMVEysM0t3OZ1J7NCFtJ5irl
 Nzn1qZg0QHr+kAk3srUTt3JNuNKFXt29EcqakcAj/Mdfl3OCXXFJchQbI
 mtgQ1hUSJFriFw3ERGgnyqaNkv9YYZU3aNdY7WKZJLHU224MXi4AhEav9
 2gNisE0Mnoo/y1vdp7T3pu/etGKmtxhLvN3nRI5bU15YjdU7znKc+jo5Q
 0+lzUU7+CBFv2J9x7CVRYNpylEOsAAajk1xgUc0rOxDkTxHWTLkYC+p3w w==;
X-CSE-ConnectionGUID: hEAzAV6oTGaKih6cH86aag==
X-CSE-MsgGUID: ptRhGdS7Q0S5fhvrEnqUAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530928"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:19:20 -0800
X-CSE-ConnectionGUID: EFszbaZNSHmEpaHNKq4aBA==
X-CSE-MsgGUID: 3Hd2lGNXR3mq9P5TwAJuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175801"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:19:16 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 10/10] drm/i915/color: Add color pipeline support for SDR
 planes
Date: Fri,  6 Mar 2026 22:23:07 +0530
Message-Id: <20260306165307.3233194-11-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 47b3bcec7b18..ec1c60bd8bc2 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -182,17 +182,11 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 
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
2.25.1


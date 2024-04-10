Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96585CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2188C113172;
	Wed, 10 Apr 2024 05:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbK8N9xn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC39113172
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727402; x=1744263402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bsDlq1eBwPPWNc3zjKidWZkOwCJQBdJf1llKhCxqwjw=;
 b=hbK8N9xncoRFcnvW/5lZ3o4KOGYI4Il/fiFis/PHjatctTQKZwnOJ7RK
 +4t9jjMoX/VUXyN50ifWbT4LWks7rViXC9Udx7FLRwmyBr3IXc0kmwQLL
 Up/eRpJOxH3jKvUT97ZlatZqfYhgRHox/p+K3i02qn7orUR6o9uHwkfR/
 YOI7KMphKoezWr5n6vcIcRnPOHjE68bK4L7P+bvdwzXRHIndscelXjNsm
 0QKSg/t8eE73oV+UCE8eL6uIcGkAbr2MQF9HbTNKj5T0gqWMeGHgX3r+6
 HzkVzM7BmYgx/ku/LAqXLcSJA8OSDIZmEsRIhE3Ml6L/aNytlZz6xfUJu Q==;
X-CSE-ConnectionGUID: RZ9sSmknTF2RS1mkmfhvZw==
X-CSE-MsgGUID: K+7A0DRxRG+CRNIfoO3oqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11037575"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11037575"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:36:41 -0700
X-CSE-ConnectionGUID: f3EOIsjQQHiNEfgmo2W+rg==
X-CSE-MsgGUID: JwgDvwXgSaqVYS3GOc7d+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57882857"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 09 Apr 2024 22:36:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/xe2: Add workaround 14021567978
Date: Wed, 10 Apr 2024 11:19:53 +0530
Message-Id: <20240410054953.1008054-1-tejas.upadhyay@intel.com>
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

Workaround 14021567978 applies to RenderCS xe2

V2(MattR):
  - Move tuning to wa and apply to xe2

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..a77e9e85ae15 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -669,6 +669,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
+	{ XE_RTP_NAME("14021567978"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),
-- 
2.25.1


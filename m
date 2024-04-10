Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A0BCD1296
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F4710FBCC;
	Wed, 10 Apr 2024 06:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHZz+CMx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D09D10FBCC
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730807; x=1744266807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wO87lCV+Iy+W9aKS4Z1BL3bLfMdk6HxGigtReVQ8vCA=;
 b=dHZz+CMxu9UwfyiS+GLgP2vlfdNYJ7ous2tbVfqAUE+h+5ZNufsUKwaR
 7JrVJ5ut2NXT1yhwwEYioySznYLlIS/NWvROvzNbHVFVVQCoFDttt34wt
 f8TGDAxoiI/h9iVBjHSjVaGsaoR3+F8Fi+qzIBHsX5t3ElDX4TlQqVsjW
 1PYgH3hyQS7UnibzdhK2YXGTNfLz0cIhaF9vpqXag/Gb+OwAVZXsGNfru
 H6lFlREmqTQ1/e4H4gQYnPBvtNsbbm639E15YvoM7uey3cg5dqxnCWld8
 2k96CLfGgZPYt+Ps3wtsyEDcWkYaJWbzNZ9rPNI5bcWx6svQ2PqO8t1aX A==;
X-CSE-ConnectionGUID: tdAGBiwWQwKn8kUd/qz4OA==
X-CSE-MsgGUID: ua3myPMTRf25HDsQc6Wgwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948126"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:27 -0700
X-CSE-ConnectionGUID: fzYhOz8gQ2mA6+LtZEmMmQ==
X-CSE-MsgGUID: DKWnCN1VR+WdQFihUAbCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20338521"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa010.jf.intel.com with ESMTP; 09 Apr 2024 23:33:25 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3] drm/xe/xe2: Add workaround 14021567978
Date: Wed, 10 Apr 2024 12:16:40 +0530
Message-Id: <20240410064640.1010098-1-tejas.upadhyay@intel.com>
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

V3:
  - Cover xe2_hpg as its landed upstream now
V2(MattR):
  - Move tuning to wa and apply to xe2

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..56bd23e79fdb 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -669,6 +669,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
+	{ XE_RTP_NAME("14021567978"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),
-- 
2.25.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2AECA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 05:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163410E530;
	Tue, 19 Aug 2025 05:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SS2RrVpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8669110E537
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 05:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755582462; x=1787118462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bWp5ziaNl/OlhC3NFlI7G3S9gXIsG/3jyRz+lD5fzDY=;
 b=SS2RrVpxr+NiBCXfizvHMXxSm67hU3vsGm+IapWy6jPIwTd6m2moX9DS
 fGWDE1UeZOBa7vJhDDNnsS9N1yqSS5opmj9oWk6BnLPffE+n0XPPE4qbc
 ArFhzVCTU2wsUTNHfpk913s9MSVoTr4DXz+T905CfdahuQ8Aakn76Whai
 2YEFrlwC25f0nybAkWZvBQeyN1fPQD3m6ELbelus7yp5P2EgXstZQ8rHl
 U7jglcdsJCE2Xdh8hqmvA3XgaMr3y6/ZzRuQSAGZyfUe9MLGt3ngXciMV
 3rKjwfV1YtrFDlpKHbNTaJnWGpRLCvbeeDEkxbB3UmocO3/zTeQwhavOI A==;
X-CSE-ConnectionGUID: GDIbuykETd25pYDpr2aHZQ==
X-CSE-MsgGUID: /WOQuZrXTeSBMHYwD5lDog==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61628317"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="61628317"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 22:47:42 -0700
X-CSE-ConnectionGUID: CeZoKhRJToC61C1L9tcHyQ==
X-CSE-MsgGUID: l8khujuNQV62VChFAqZDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172986190"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2025 22:47:41 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, tapani.palli@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/tuning: Apply "Disable NULL query for Anyhit Shader"
 to Xe2
Date: Tue, 19 Aug 2025 11:41:51 +0530
Message-Id: <20250819061151.1272622-1-nitin.r.gote@intel.com>
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

Extend the "Disable NULL query for Anyhit Shader" tuning to Xe2
(graphics version 2000+) platforms, in addition to Xe3.

This sets the DIS_NULL_QUERY bit in RT_CTRL to disable null query
for Anyhit shaders on both Xe2 and Xe3.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 828b45b24c23..a524170a04d0 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -99,7 +99,7 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
 	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
 	},
-- 
2.25.1


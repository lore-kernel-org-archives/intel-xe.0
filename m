Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBBCC4345F
	for <intel-xe@archiver.kernel.org>; Sat, 27 Apr 2024 13:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36C510F60F;
	Sat, 27 Apr 2024 13:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYS+Nhf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76A210F60F
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Apr 2024 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714225966; x=1745761966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZwDQ3efC1ONNodfGdMkDuuMzJdqcgqFMW34ynX9USx0=;
 b=JYS+Nhf5ONeWjIRLJJ2yF7+3Gu0891ZYvVpEi24EPPhiLqLM4ACuw1Tl
 HaoBEoVqau4j8tGFhuK4/aO42XF+3d2GgKMk6RKCUwpEyed1YQKwrMv42
 EbqyopqbGTv8o+v0J+AeN2ZbHK66CX7RX5+aRh69uNxznYS7xBRQE4x8F
 uHRUuxBq6IZ+Iz6Jx6yAL2fkISj1qz9j3SBQXIle9dyUpXsI9ZsTu2nmY
 yoyoCZg1330OWq76vXW3T2wdn7cnhdXD3WvNEmgE60P5zVAj/N5mSO9lk
 6yeSP9QA0tYZNqcQzzrhcy4+bIO6k6QQOu4sIJjMmauNNhcDPkU2U32Sx w==;
X-CSE-ConnectionGUID: WnjCEOAXSJOQ3wYPBXT/0g==
X-CSE-MsgGUID: 43zuy2tRQgiYcIMDmx7LPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9810958"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="9810958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2024 06:52:46 -0700
X-CSE-ConnectionGUID: 1AjXkAFxS86bh8fQoClNZA==
X-CSE-MsgGUID: QZc5GpRERPeXNxsu3iaV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; d="scan'208";a="56595001"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2024 06:52:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Merge 16021540221 and 18034896535 WAs
Date: Sat, 27 Apr 2024 06:53:39 -0700
Message-ID: <20240427135339.3485559-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

In order to detect duplicate implementations for the same workaround,
early in the implementation of RTP it was decided to error out even if
the values set are exactly the same. With the introduction of 18034896535
in commit 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535"), LNL
stepping with graphics stepping A1 now gives the following error on
module load:

	xe 0000:00:02.0: [drm] *ERROR* GT0: [GT OTHER] \
	discarding save-restore reg e48c (clear: 00000200, set: 00000200,\
	masked: yes, mcr: yes): ret=-22

RTP may be improved in the future, but for now simply join the entries
like done with e.g. "1607297627, 1607030317, 1607186500".

Fixes: 74671d23ca18 ("drm/xe/xe2: Add workaround 18034896535")
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9d9b7fa7a8f0..db7c7c7875c5 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -449,12 +449,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
-	{ XE_RTP_NAME("16021540221"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
-	},
-	{ XE_RTP_NAME("18034896535"),
+	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
-- 
2.43.0


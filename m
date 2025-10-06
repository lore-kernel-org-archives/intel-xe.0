Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF4BCCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AC710E460;
	Mon,  6 Oct 2025 20:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TeqC0FfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219710E460
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759781792; x=1791317792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9am6ihrKUZpCdLAJL/sGRMv+X36xG4Fc7DtB9wo5RCA=;
 b=TeqC0FfT1NvgHN6uvNWgFbtkDR4trXlXEDqWT7KDfDXDeRcb0vjH5toI
 ipgnjyj32Sk/LoMOZb+m9FyGJzQU9QkThM+9AaWGpCyIrDBFBIecaJnQ9
 hNvBCHcaUuv2etnJehVtRaq0q6n95qSLJEsXGj36jhrgXIKTg/9TOAjLk
 zj43vUSXaxsD0ogTb86vYMOwIKqU1xpy/Kj8JjeE4Flfl3Lq0KLACoP2/
 3qn3O+iJqf/USdi/+/7rMmtOvcfXm/Est3BEj3LST5TjxjdCDh0h7dAWF
 7Cv6xFHFWK8HdZ2E2hNzEOYH5vAvdMrx1kU9DRXYjUyw15KVyn+FcPpCI w==;
X-CSE-ConnectionGUID: lK6VA6xjRumoMlWks2pdDw==
X-CSE-MsgGUID: 8/hCHuc/QDaUU4lcj/Nbsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61998411"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61998411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:16:32 -0700
X-CSE-ConnectionGUID: HqBMPzzgSAyI/yCSa0HedQ==
X-CSE-MsgGUID: tNLdzKAzS1W1ekDuRkyArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185245488"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2025 13:16:31 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/3] drm/xe: Change return type of detect_bar2_dgfx() from s64
 to u64
Date: Mon,  6 Oct 2025 20:13:27 +0000
Message-ID: <20251006201339.2603160-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006201339.2603160-5-shuicheng.lin@intel.com>
References: <20251006201339.2603160-5-shuicheng.lin@intel.com>
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

The function never returns a negative value, and the return value is
assigned to a u64 variable. Use u64 for better type correctness
and clarity.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 9b00bdc8ef1a..d8ded2400706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 	return wopcm_size;
 }
 
-static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
+static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
 	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
-- 
2.49.0


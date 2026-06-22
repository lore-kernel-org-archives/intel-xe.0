Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DBCDB479
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 13:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B94810E6DF;
	Mon, 22 Jun 2026 13:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbUZV3+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBE910E6D7
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782134643; x=1813670643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fxsZKj3T34mdNunoE1JfVqFqkWt+JACdtHftytZ5C9U=;
 b=LbUZV3+R4kvgjq4y6Qt2ODV9+tkYa2H9ilX4gY6o3rhhs/gjBDZMz/M7
 1Gv8jNEv1UCaPv/bOGHGsCjz1G2uhQTh27vF6/NyVxfE4CIIQvHUtndJZ
 nEdE9k4eZAJS1feqHS/HYhTigHUaPNtM3UW2dJ938zva6kiAvtJttpuCt
 Ai+/WgHfFxmePbp2eg6JA9AlO5bxkg9Uzhg3UhPdSLTboM+mvodjpL7in
 D74ZWFBe5G5np7Z6JzRZiPAVwvmQwarr3B441KGJqkLBGbho8phakLWwY
 ri3IFyMoWEVqEDDQGHec9r/lyczW/Ib0TfiRNIMk4vY1qoX9UgXlnSrgi A==;
X-CSE-ConnectionGUID: wdPl69ftQjaoAjmpDD43Uw==
X-CSE-MsgGUID: ehSzLTwARgSd+2b8Dq74hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93228692"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93228692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:03 -0700
X-CSE-ConnectionGUID: co05Dtf0ShyAamuVssoOBg==
X-CSE-MsgGUID: yBBYIfmCTii7e9ilORCGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279407177"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 4/6] drm/xe/mmio: Drop tiles_fini action
Date: Mon, 22 Jun 2026 15:23:40 +0200
Message-ID: <20260622132342.19600-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622132342.19600-1-michal.wajdeczko@intel.com>
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
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

The pointer zeroing is not required, as we check xe->mmio.regs to
test if code is not trying to access MMIO after a driver unwind.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8dd818e1184c..58226cd8b399 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -24,16 +24,6 @@
 
 #include "generated/xe_device_wa_oob.h"
 
-static void tiles_fini(void *arg)
-{
-	struct xe_device *xe = arg;
-	struct xe_tile *tile;
-	int id;
-
-	for_each_remote_tile(tile, xe, id)
-		tile->mmio.regs = NULL;
-}
-
 /*
  * On multi-tile devices, partition the BAR space for MMIO on each tile,
  * possibly accounting for register override on the number of tiles available.
@@ -74,8 +64,7 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M;
 
 	mmio_multi_tile_setup(xe, tile_mmio_size);
-
-	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
+	return 0;
 }
 
 static void mmio_fini(void *arg)
-- 
2.47.1


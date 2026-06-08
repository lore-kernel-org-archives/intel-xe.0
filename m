Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE0DCD8CAD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72C510F76A;
	Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3uYb6hW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B591D10F766
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937687; x=1812473687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i1S9OoMWVXWVJYen9KzIMSY1UppWjnpzSDP7V3DGsLg=;
 b=H3uYb6hWdemnJcqwgJzbVM8gRM/wE90eUrsSQd9wnXnHreo3PIMHLNfj
 bms//YKQCVMYpn44J7DfWicYoQaawBUeEv9hnwLt/WlWSyGuwT+OAmZ5n
 Kl5RYpEQOI2oksDCrcYMpaXDZIOgfKMhXuxPjSMbYM1QFpOmlP0qcRVu7
 mN/bz0yMEBTkhaNNJ61KSCwgvYCLNDBGTdiAmovZobSPt02AcB7QM/5P1
 imF3T/m20FQbz7V98pY9ggnR8zuVTb4mtSjCL7WUAaVWDKTJZrqYhzAnK
 0PTksuXKvhhSMwEDgSjOwonNF8zJrY48MvAS1w7b+vSnNZ9hsLuy7WOK2 Q==;
X-CSE-ConnectionGUID: i44NkCCxStCu1zgvU5Y2TQ==
X-CSE-MsgGUID: yB7cW5ssT+WvzsHSO3nKSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744537"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:45 -0700
X-CSE-ConnectionGUID: 1o/hVcHhRuikl4laoBU+Ig==
X-CSE-MsgGUID: 7WX1kJ+zSXO71oLHgtd7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467544"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 04/16] drm/xe/mmio: Drop tiles_fini action
Date: Mon,  8 Jun 2026 18:54:17 +0200
Message-ID: <20260608165429.587-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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
v2: update commit message (Michal)
---
 drivers/gpu/drm/xe/xe_mmio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bdfcc698caf9..389685aa41db 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -23,16 +23,6 @@
 
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
@@ -73,8 +63,7 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 	size_t tile_mmio_size = SZ_16M;
 
 	mmio_multi_tile_setup(xe, tile_mmio_size);
-
-	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
+	return 0;
 }
 
 static void mmio_fini(void *arg)
-- 
2.47.1


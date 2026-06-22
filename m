Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A0CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 13:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDD810E6D6;
	Mon, 22 Jun 2026 13:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5+xDCv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAD010E6DC
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 13:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782134646; x=1813670646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XE9kuhA4qTg6T9WQgRgF4Dt/WG+wAobThO9LD5cG69E=;
 b=L5+xDCv0oCmvx/JzlakImHh9nPMjCnaIr5W4dxyLQDNuNJcU5dXsHeDd
 3Cgmci6nDIlASbCFCZZ2fK/4tmcC0vqiGcLeRJljXBI2baqqzgHOI2h6i
 KRXjQc/YXZR8+SujWnWxs60iHcjHIw1/QIobE2FjlXoNSPuAgdC6hzMxS
 LXhh2naGykBn/xJA6bb6LfIR5ZBOgjqGL6x7Vbsi33+MjAj1OgybjTI6b
 olNNXXWsPry/WwLhOBzEnaomZpCXOw0e3+lARePsoqRZR7R5/zD8PnqGw
 5djOad2xk2mnuaHmWwW8r5wNMTgSvU0gTcNke+KXh8Txt8onVoQr63Kzc g==;
X-CSE-ConnectionGUID: EQqXgd8/SsCPnsHNcemMhA==
X-CSE-MsgGUID: q58dXgB+S46IqpKPEcnYkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93228701"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93228701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:06 -0700
X-CSE-ConnectionGUID: PI9NVSlbScmdhK++tgeX7g==
X-CSE-MsgGUID: as6g1+IJRbCzRMCrwFFdoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279407195"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 6/6] drm/xe/mmio: Prefer tile-based WARN message
Date: Mon, 22 Jun 2026 15:23:42 +0200
Message-ID: <20260622132342.19600-7-michal.wajdeczko@intel.com>
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

If 64-bit read operations are unstable, use tile-based WARN message
to provide more details on which tile this was observed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 41e6b753634f..7fa18dfcb5a2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -11,7 +11,6 @@
 #include <linux/pci.h>
 
 #include <drm/drm_managed.h>
-#include <drm/drm_print.h>
 
 #include "regs/xe_bars.h"
 #include "xe_device.h"
@@ -315,8 +314,8 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 		oldudw = udw;
 	}
 
-	drm_WARN(&mmio->tile->xe->drm, retries == 0,
-		 "64-bit read of %#x did not stabilize\n", reg.addr);
+	xe_tile_WARN(mmio->tile, retries == 0,
+		     "MMIO: 64-bit read of %#x did not stabilize\n", reg.addr);
 
 	return (u64)udw << 32 | ldw;
 }
-- 
2.47.1


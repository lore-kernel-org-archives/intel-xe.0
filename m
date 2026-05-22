Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67581CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EDC10E60E;
	Fri, 22 May 2026 14:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcUcIcWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E0B10E261
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779460289; x=1810996289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EU1ffkpgiPD99xec/EYV/tYCdvRhXqvtki6aKMqZvn0=;
 b=bcUcIcWh/Uaa5v9ANGN6ORyf3JOaONKW7ybm1UNW0bbYeYIcMmxesL66
 Uv6RjNI6Blq2I+/Aps8/mBpZwiGkR8Rnvzlg+ZM+9oH/09+UB2IGNKrAg
 9EBug9YmqyouyPmtsTXdx3XJUGEi0KGKNsuA9AlxvWZm7zAviD+/8YwRS
 W8VXR2psf0ZBLlmaJtzgO6iJPcR9D2nB16OSnHYc9PpFwUJGoA3BW/iTD
 Nw1mfVUWUGoKc+aO0hKlUsdBoUQubnOl1UUPesNCWVBgMG7cAwYPfM0Mh
 xeD0Wxwh8dvGxxhyqxK1fZ+lGgErZhM+nLzadX+ZkQGZbwAnM7fq+GchA w==;
X-CSE-ConnectionGUID: +V98/42tTBuTxkF9IfLBaQ==
X-CSE-MsgGUID: iShjcOWxRF6E2irv4qmBNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861634"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91861634"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:28 -0700
X-CSE-ConnectionGUID: zj4XSv0GRgOPs+DmChRnNQ==
X-CSE-MsgGUID: F4ftNt2LQc2kjoOFQeBU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240795108"
Received: from dmitriyo-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/4] drm/xe/mmio: Drop tiles_fini action
Date: Fri, 22 May 2026 16:31:11 +0200
Message-ID: <20260522143112.10643-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522143112.10643-1-michal.wajdeczko@intel.com>
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
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

The pointer zeroing is not required, as there should be no active
code running during a driver unwind.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3e31a2141886..7043289a0eb9 100644
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
 
 /**
-- 
2.47.1


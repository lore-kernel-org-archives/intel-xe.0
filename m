Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DBCC83F20
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 10:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F6B10E170;
	Sun, 13 Jul 2025 10:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWvzEuNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3268B10E161
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752403000; x=1783939000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wljks1FM3SD9oD3h3nnTTFsi/ewomDjMw85qdYMP/V4=;
 b=eWvzEuNnlgld7sF4njECujwzdetz8QXvYOOdKsCcbdkDuoFLrfxv1Xwc
 S+p1hRBiG3ARhZkwm5Zwr+Ql6WeIl5kYhZSEUTuTsrE8R1pqDmbNdp3vk
 uEzPgsm3EwtSf0ae0vtIlq0PviT11rhW+VmmiZkPPoFU4IiE73zEXv7S+
 EMEjLaBCiRiTSRO4H975bS1zBHF/3TxhezUcQjQzR4jIMxHVg5tZwJZUB
 V+Qewtgk6TD4bIf9D3pbPPVuoW2wJ/cNGoz2X+b+9WDpynCBmECJK/4Ga
 kpAvFa4hLDYUpSHWMhanoVu+9ZHYvyIZfavQ/cpovpwLSVRdL5xRzt3Ie A==;
X-CSE-ConnectionGUID: W5mODgbATmSPywGVg5Et1w==
X-CSE-MsgGUID: a8voWQYJR6yHSMJuCJKC+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64883042"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="64883042"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 03:36:40 -0700
X-CSE-ConnectionGUID: 6L85knOnR1iUMnWLpKvEqA==
X-CSE-MsgGUID: 4N7T4sBzRX+KmwrLZ8X4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="156802477"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 03:36:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [CI v4 3/7] drm/xe: Introduce xe_tile_is_root helper
Date: Sun, 13 Jul 2025 12:36:21 +0200
Message-Id: <20250713103625.1964-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250713103625.1964-1-michal.wajdeczko@intel.com>
References: <20250713103625.1964-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of looking at the tile->id member provide a small helper
to explicitly express our intentions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com> # v1
---
v2: rebase and move helper to xe_tile.h (Michal)
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 3 ++-
 drivers/gpu/drm/xe/xe_irq.c       | 3 ++-
 drivers/gpu/drm/xe/xe_tile.h      | 6 ++++++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index d0519cd6704a..464282a89eef 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -23,6 +23,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_tile.h"
 
 /*
  * GSC proxy:
@@ -483,7 +484,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 	}
 
 	/* no multi-tile devices with this feature yet */
-	if (tile->id > 0) {
+	if (!xe_tile_is_root(tile)) {
 		xe_gt_err(gt, "unexpected GSC proxy init on tile %u\n", tile->id);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index c43e62dc692e..cbb1850d0cab 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -23,6 +23,7 @@
 #include "xe_mmio.h"
 #include "xe_pxp.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 
 /*
  * Interrupt registers for a unit are always consecutive and ordered
@@ -552,7 +553,7 @@ static void xelp_irq_reset(struct xe_tile *tile)
 
 static void dg1_irq_reset(struct xe_tile *tile)
 {
-	if (tile->id == 0)
+	if (xe_tile_is_root(tile))
 		dg1_intr_disable(tile_to_xe(tile));
 
 	gt_irq_reset(tile);
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 066a3d0cea79..cc33e8733983 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -27,4 +27,10 @@ static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
 	return NULL;
 }
 #endif
+
+static inline bool xe_tile_is_root(struct xe_tile *tile)
+{
+	return tile->id == 0;
+}
+
 #endif
-- 
2.47.1


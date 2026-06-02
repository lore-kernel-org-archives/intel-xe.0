Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22704CD6E6A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 22:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6D510F630;
	Tue,  2 Jun 2026 22:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEnE3cxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A5110F62F;
 Tue,  2 Jun 2026 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780439824; x=1811975824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ak64TMxazhfpG/KQBL8iSwbrPOMvlnP/XNkrTTg1zI8=;
 b=aEnE3cxnp0PO4+14nazgw4VxGKG7uFO4Gg7wRdmuLkuGY6AroAKaerp3
 QoZkUDi8ajFtGUciNxwToYjGX2joTLKAOmMpAXDHIs4sERLm5rUS7x/T/
 F4DZXIKnNhXJqco5tN8+0IDbgVc6cxlmAbeD6PiCQFP6BSFhmTMFygjof
 LkerQ2UI/eMp8ZrsxOSeIpfwE12uAsFmh31NDHkCpA43Hoe+JK2CN34z+
 Qxm+jC5zc+HX4meWpfx3ACW2pKAkFoIceH/X7a7MhzCPB6PYqOiELF4SQ
 DhOJqJg9vuOIsn9Xu0PHCD43JX8YvSyAveL4UsXa/iZmX3/yY1zPYIvYe g==;
X-CSE-ConnectionGUID: hmOyNEaCQ4SB7H5zM/sWLw==
X-CSE-MsgGUID: FgnX1fMqTS21HfGZAXE0yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92348348"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="92348348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 15:37:03 -0700
X-CSE-ConnectionGUID: gLbtsugiSMmHOJct+W63DA==
X-CSE-MsgGUID: zI4ojpvbQ0y4+4jRe+lSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="243879085"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 02 Jun 2026 15:37:02 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v4 2/2] drm/xe/pcode: match argument naming with PCODE_DATAx
Date: Wed,  3 Jun 2026 00:36:40 +0200
Message-ID: <20260602223640.1375933-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260602223640.1375933-1-michal.grzelak@intel.com>
References: <20260602223640.1375933-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Variable naming of val and val1 should match register macro naming.

For xe, register macro naming of PCODE_DATA0 and PCODE_DATA1 is already
synced with register name. Nevertheless there are still functions
declaring val and val1. Rename val into val0 in functions declaring val1
in xe.

v4->v5
- split i915 changes from xe (Jani)

v3->v4
- apply the rename to the read()'s signature as well (Sashiko)

v2->v3
- resolve conflict from rebase

v1->v2
- rebase onto drm-tip (Jani)

Bspec: 19978, 19979
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_pcode.c | 4 ++--
 drivers/gpu/drm/xe/xe_pcode.c                 | 4 ++--
 drivers/gpu/drm/xe/xe_pcode.h                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_pcode.c b/drivers/gpu/drm/xe/display/xe_display_pcode.c
index f6820ef7e666d..8dc9cbdb18ec0 100644
--- a/drivers/gpu/drm/xe/display/xe_display_pcode.c
+++ b/drivers/gpu/drm/xe/display/xe_display_pcode.c
@@ -6,12 +6,12 @@
 #include "xe_device.h"
 #include "xe_pcode.h"
 
-static int xe_display_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
+static int xe_display_pcode_read(struct drm_device *drm, u32 mbox, u32 *val0, u32 *val1)
 {
 	struct xe_device *xe = to_xe_device(drm);
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 
-	return xe_pcode_read(tile, mbox, val, val1);
+	return xe_pcode_read(tile, mbox, val0, val1);
 }
 
 static int xe_display_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 866986694d9c4..3987ed21f397c 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -132,12 +132,12 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
 	return err;
 }
 
-int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1)
 {
 	int err;
 
 	mutex_lock(&tile->pcode.lock);
-	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
+	err = pcode_mailbox_rw(tile, mbox, val0, val1, 1, true, false);
 	mutex_unlock(&tile->pcode.lock);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 18260c29e620a..c2f549755714e 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -17,7 +17,7 @@ int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq);
-int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
-- 
2.45.2


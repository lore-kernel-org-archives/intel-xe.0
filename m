Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EDCCF8857
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 21:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642EE10E0E6;
	Fri,  4 Oct 2024 21:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV4hfGu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7CC10E0E6
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728076857; x=1759612857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W9Ox719JKg5O+SPvbqwRa5W3y3x4KjVK0wRb+LcXeAs=;
 b=VV4hfGu/taI860g+5/Ke/nnoLMoQUsmNWkvBqQdG4ESco/fd1hNHBHmB
 ZtSYaz2x6k6mB8TsmMqW8xkcdKP0jgbc13/3eDJIzn/qrSR1KSdbz6jvx
 SA1QPstaW/mhQ2Cz8h9STuTmYqTnNCqjSoVxK8S4RN8D2Qg0xJB8J3AQs
 TfGV4s/wtcIs6hmM/BcktAGe3oX7vhGgMV5t4nPHCDXE8UPuQhFW77dXJ
 U9DMrGiGepiCiHJOHGpUhPgBTsXXWQibb5WcmOLjdLWaIgIOWxsd7dSYl
 kwYgrcO5YDw//EFV0CAH7WqbqjDEFXBmhmeawI9AA4eMu2OQtbFbsPdue g==;
X-CSE-ConnectionGUID: N+fa/JXfSG2IU5SsGGSwvQ==
X-CSE-MsgGUID: yoxfDriXTDmbpe5V9DRQ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27448627"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="27448627"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 14:20:56 -0700
X-CSE-ConnectionGUID: QL0p2gSxQ36WAMlqT/O08w==
X-CSE-MsgGUID: VJ5v38qWTzuMVFKKdj/cLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74658061"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 14:20:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: L3bank mask is not available on the media GT
Date: Fri,  4 Oct 2024 14:20:38 -0700
Message-ID: <20241004212037.1431184-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.46.2
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

On PTL platforms with media version 30.00, the fuse registers for
reporting L3 bank availability to the GT just read out as ~0 and do not
provide proper values.  Xe does not use the L3 bank mask for anything
internally; it only passes the mask through to userspace via the GT
topology query.

Since we don't have any way to get the real L3 bank mask, we don't want
to pass garbage to userspace.  Passing a zeroed mask or a copy of the
primary GT's L3 bank mask would also be inaccurate and likely to cause
confusion for userspace.  The best approach is to simply not include L3
in the list of masks returned by the topology query in cases where we
aren't able to provide a meaningful value.  This won't change the
behavior for any existing platforms (where we can always obtain L3 masks
successfully for all GTs), it will only prevent us from mis-reporting
bad information on upcoming platform(s).

There's a good chance this will become a formal workaround in the
future, but for now we don't have a lineage number so "no_media_l3" is
used in place of a lineage as the OOB workaround descriptor.

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_query.c       | 19 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 +
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 651ba53623e5..df2042db7ee6 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -5,6 +5,7 @@
 
 #include "xe_gt_topology.h"
 
+#include <generated/xe_wa_oob.h>
 #include <linux/bitmap.h>
 #include <linux/compiler.h>
 
@@ -12,6 +13,7 @@
 #include "xe_assert.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
+#include "xe_wa.h"
 
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
@@ -129,6 +131,18 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
 
+	/*
+	 * PTL platforms with media version 30.00 do not provide proper values
+	 * for the media GT's L3 bank registers.  Skip the readout since we
+	 * don't have any way to obtain real values.
+	 *
+	 * This may get re-described as an official workaround in the future,
+	 * but there's no tracking number assigned yet so we use a custom
+	 * OOB workaround descriptor.
+	 */
+	if (XE_WA(gt, no_media_l3))
+		return;
+
 	if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5246a4a2740e..fd2cf8efc99f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 
 #include <drm/ttm/ttm_placement.h>
+#include <generated/xe_wa_oob.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "regs/xe_engine_regs.h"
@@ -23,6 +24,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -513,11 +515,18 @@ static int query_gt_topology(struct xe_device *xe,
 		if (err)
 			return err;
 
-		topo.type = DRM_XE_TOPO_L3_BANK;
-		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
-				sizeof(gt->fuse_topo.l3_bank_mask));
-		if (err)
-			return err;
+		/*
+		 * If the kernel doesn't have a way to obtain a correct L3bank
+		 * mask, then it's better to omit L3 from the query rather than
+		 * reporting bogus or zeroed information to userspace.
+		 */
+		if (!XE_WA(gt, no_media_l3)) {
+			topo.type = DRM_XE_TOPO_L3_BANK;
+			err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
+					sizeof(gt->fuse_topo.l3_bank_mask));
+			if (err)
+				return err;
+		}
 
 		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
 			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 920ca5060146..0154fbe154e9 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -37,3 +37,4 @@
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
+no_media_l3	MEDIA_VERSION(3000)
-- 
2.46.2


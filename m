Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E5CA0EF3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 14:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4870310E45E;
	Mon, 18 Aug 2025 14:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Wz9u5kGO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5DF10E454
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 14:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PDx1QLIk8NiWv6shO2uvjeYuuExmUaTJAHnSb2B7RDc=; b=Wz9u5kGOVq9i3uMqrTONGWYJWA
 nLZRjEnmopJ/06hlNBVi9GfX1Br2t0sfb/7y/rIkVvyJV0q2JxakE/xpE4iNdpjnUZtVGX5fLcVzT
 Js8MXYfX81VvO2OQGXbqWIE7tzns+kjuHtwGqhdXby3m54GR/Rgid8KeJl0urVeC1j2EL+J6RS6ds
 /vu9X/poTKnBY4fXJs4QiqtaZjS2Zlejhi0U4GOpb7HNMvSyIfkbheYi5pWK9W/dcY4kgY6x0HMPf
 j2tIE6Em1UoHK3Ug2jImrg5hj8U5vTsoZr70s+Wk+79wQMkUnrs9EsDoi1neRyIYHMOr+AKiLAngZ
 tRadYtAQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uo0Vn-00Fs0a-Ue
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:07:00 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/14] drm/xe: Flush GGTT writes after populating DPT
Date: Mon, 18 Aug 2025 15:06:44 +0100
Message-ID: <20250818140653.86787-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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

When DPT is placed in stolen it is populated using ioremap_wc() via GGTT.

I915 has established that on modern platforms a small flush and delay is
required for those writes to reliably land so lets add the same logic
(simplified by removing impossible platforms) to xe as well.

v2:
 * Do it only for system memory buffers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index f1f8b5ab53ef..460e330676b3 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -12,9 +12,11 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_fbdev.h"
+#include "regs/xe_engine_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
+#include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_vram_types.h"
 
@@ -79,6 +81,46 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static void gt_flush_ggtt_writes(struct xe_gt *gt)
+{
+	if (!gt)
+		return;
+
+	xe_mmio_read32(&gt->mmio, RING_TAIL(RENDER_RING_BASE));
+}
+
+static void ggtt_flush_writes(struct xe_ggtt *ggtt)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	/*
+	 * No actual flushing is required for the GTT write domain for reads
+	 * from the GTT domain. Writes to it "immediately" go to main memory
+	 * as far as we know, so there's no chipset flush. It also doesn't
+	 * land in the GPU render cache.
+	 *
+	 * However, we do have to enforce the order so that all writes through
+	 * the GTT land before any writes to the device, such as updates to
+	 * the GATT itself.
+	 *
+	 * We also have to wait a bit for the writes to land from the GTT.
+	 * An uncached read (i.e. mmio) seems to be ideal for the round-trip
+	 * timing. This issue has only been observed when switching quickly
+	 * between GTT writes and CPU reads from inside the kernel on recent hw,
+	 * and it appears to only affect discrete GTT blocks (i.e. on LLC
+	 * system agents we cannot reproduce this behaviour, until Cannonlake
+	 * that was!).
+	 */
+
+	wmb();
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		gt_flush_ggtt_writes(ggtt->tile->primary_gt);
+		gt_flush_ggtt_writes(ggtt->tile->media_gt);
+		xe_pm_runtime_put(xe);
+	}
+}
+
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma,
@@ -162,6 +204,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 					  rot_info->plane[i].dst_stride);
 	}
 
+	if (dpt->vmap.is_iomem && !xe_bo_is_vram(dpt))
+		ggtt_flush_writes(tile0->mem.ggtt);
+
 	vma->dpt = dpt;
 	vma->node = dpt->ggtt_node[tile0->id];
 
-- 
2.48.0


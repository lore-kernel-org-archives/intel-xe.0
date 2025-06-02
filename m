Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F1EC61CE7
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB79D10E50E;
	Mon,  2 Jun 2025 11:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hth4Mnry";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB2010E4F8
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZwlNpL+YqmDlRs/kcXNdyEngh+W/7yVYU4uk3omHsFw=; b=hth4MnryQ76xSTw/VICdQo2vSm
 ZRHk5zxGp70hzM0MJTp3vlUM8BSkfhfr8emC7oDzKyO2SfWhg9cnWHGo5iwYx9VLwHgc1r9+TnjGl
 XFEEpMMIsPTpxlh2p79BrJ0eLXVVXpnCOgpIx3hnFAVles/kfctXn06xRg6l+lVqVvLDnC9n39LnU
 /arK15eWf7D7iXmg7JUY4nwU9g3eFOGVgh7q0MkyksqdCMh4nBIvP59F4D9DC0pjEz59qFOT5jYq7
 pWyqv7D1E/ssj6t6vaYTgi3x1vXCuC3/i48QKgXO/slnWFzQt+pyNBw378ddA2YE1vqzWSJGLMIqF
 yQFIVKJw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM3DE-00GFqr-Fo; Mon, 02 Jun 2025 13:20:16 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 4/6] drm/xe: Add plumbing for indirect context workarounds
Date: Mon,  2 Jun 2025 12:19:54 +0100
Message-ID: <20250602111956.14854-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
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

Some upcoming workarounds need to be emitted from the indirect workaround
context so lets add some plumbing where they will be able to easily slot
in.

No functional changes for now since everything is still deactivated.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  4 ++
 drivers/gpu/drm/xe/xe_lrc.c             | 60 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 994af591a2e8..06c3a24ac381 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -12,6 +12,8 @@
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
 #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
 #define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
@@ -36,4 +38,6 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+#define XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT	0xd
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a627e4503518..6bc71f78fea1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -39,6 +39,7 @@
 #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
 
 #define LRC_PPHWSP_SIZE				SZ_4K
+#define LRC_INDIRECT_CTX_SIZE			SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 
 static struct xe_device *
@@ -47,6 +48,12 @@ lrc_to_xe(struct xe_lrc *lrc)
 	return gt_to_xe(lrc->fence_ctx.gt);
 }
 
+static bool
+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
+{
+	return false;
+}
+
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -79,6 +86,9 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size += 1 * SZ_4K;
 	}
 
+	if (gt_engine_needs_indirect_ctx(gt, class))
+		size += LRC_INDIRECT_CTX_SIZE;
+
 	/* Add indirect ring state page */
 	if (xe_gt_has_indirect_ring_state(gt))
 		size += LRC_INDIRECT_RING_STATE_SIZE;
@@ -989,6 +999,50 @@ static void xe_lrc_setup_wa_bb(struct xe_lrc *lrc)
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 }
 
+static unsigned int
+xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+			    struct iosys_map *map, unsigned int offset)
+{
+	return offset;
+}
+
+static void
+xelp_setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map = lrc->bo->vmap;
+	unsigned int start, offset;
+
+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
+		return;
+
+	offset = lrc->size - LRC_INDIRECT_CTX_SIZE;
+	iosys_map_incr(&map, offset);
+	offset /= sizeof(u32);
+	start = offset;
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
+	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
+		offset = xelp_setup_indirect_ctx_rcs(lrc, hwe, &map, offset);
+	else
+		XE_WARN_ON(1);
+
+	/* Align to 64B cacheline. */
+	while (offset & 0xf) {
+		xe_map_write32(xe, &map, MI_NOOP);
+		iosys_map_incr(&map, sizeof(u32));
+		offset++;
+	}
+
+	xe_lrc_write_ctx_reg(lrc,
+			     CTX_CS_INDIRECT_CTX,
+			     (xe_bo_ggtt_addr(lrc->bo) + start * sizeof(u32)) |
+			     ((offset - start) * sizeof(u32) / 64) /* Size in CLs. */);
+	xe_lrc_write_ctx_reg(lrc,
+			     CTX_CS_INDIRECT_CTX_OFFSET,
+			     XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);
+}
+
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
@@ -1012,6 +1066,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	lrc->size = ring_size + lrc_size;
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
+
+	if (gt_engine_needs_indirect_ctx(gt, hwe->class))
+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
+
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
@@ -1142,6 +1200,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	xe_lrc_setup_wa_bb(lrc);
 
+	xelp_setup_indirect_ctx(lrc, hwe);
+
 	return 0;
 
 err_lrc_finish:
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 559c7c831212..9ce7d02ef210 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -29,7 +29,8 @@ struct xe_lrc {
 	struct xe_gt *gt;
 
 	/** @flags: LRC flags */
-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
 	u32 flags;
 
 	/** @refcount: ref count of this lrc */
-- 
2.48.0


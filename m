Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87348C5B559
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0751310E502;
	Mon,  2 Jun 2025 11:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lgaQqll2";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FAA10E4F3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xHS1lTnDzKb/puQLAjp0wc0q+9Qfqm14k9oTQXT1rDk=; b=lgaQqll2S1pbvSy9QwgWNZLrAA
 7gF9Aa1Cpjt/+IwBljxz3kDvxLUVHo7ef75Bbiii+wfGk67MEOQB3layQ3pcjCe9otUHeSaTAh+pp
 aHxHYRMGTaylMQVFZeOzBATXHynB0ScMPYnfin9Do+NN9Gv6d4jOa9+2RfOZ+p5l/oIj/PcSMGU24
 n7lGEe7jYC8SQY3HBtEmuJLrZiRVnbqtmsyqSATEdumUAYmVRMmHfGUi7giQdw5h6uFMPyr3V8kar
 4O131gdO/pstv2gecx2lrcRXuNcsrz4/nYCjf9U9wvaf06fbotL6ckyMt7CSsMGYSCalCCkJGT2eU
 kOv0WsUQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM3DC-00GFqd-Ah; Mon, 02 Jun 2025 13:20:14 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/6] drm/xe: Clarify LRC size when allocating
Date: Mon,  2 Jun 2025 12:19:51 +0100
Message-ID: <20250602111956.14854-2-tvrtko.ursulin@igalia.com>
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

Clarify in code and kerneldoc that lrc->size is the size of the kernel
object backing both the ringbuffer and LRC in one block of memory.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 17 +++++++----------
 drivers/gpu/drm/xe/xe_lrc_types.h |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 63d74e27f54c..e81ee6c98a8a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -979,19 +979,21 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		       u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
+	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
 	void *init_data = NULL;
 	u32 arb_enable;
-	u32 lrc_size;
 	u32 bo_flags;
 	int err;
 
 	kref_init(&lrc->refcount);
 	lrc->gt = gt;
 	lrc->flags = 0;
-	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
+	lrc->size = ring_size + lrc_size;
+	lrc->ring.size = ring_size;
+	lrc->ring.tail = 0;
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
@@ -1004,7 +1006,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc->size,
 				       ttm_bo_type_kernel,
 				       bo_flags);
 	if (IS_ERR(lrc->bo))
@@ -1018,10 +1020,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		goto err_lrc_finish;
 	}
 
-	lrc->size = lrc_size;
-	lrc->ring.size = ring_size;
-	lrc->ring.tail = 0;
-
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
@@ -1042,10 +1040,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
-				 xe_gt_lrc_size(gt, hwe->class) - LRC_PPHWSP_SIZE);
+				 lrc_size - LRC_PPHWSP_SIZE);
 	} else {
-		xe_map_memcpy_to(xe, &map, 0, init_data,
-				 xe_gt_lrc_size(gt, hwe->class));
+		xe_map_memcpy_to(xe, &map, 0, init_data, lrc_size);
 		kfree(init_data);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index ae24cf6f8dd9..559c7c831212 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -22,7 +22,7 @@ struct xe_lrc {
 	 */
 	struct xe_bo *bo;
 
-	/** @size: size of lrc including any indirect ring state page */
+	/** @size: size of the ring, lrc and optional indirect ring state */
 	u32 size;
 
 	/** @gt: gt which this LRC belongs to */
-- 
2.48.0


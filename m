Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6989CCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 05:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E33210E52E;
	Wed, 18 Sep 2024 05:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="C1h3EIym";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEC510E530
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 05:39:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726637992; bh=lg1Cw2jFLQ0r9w1EYxW+gRQ11olFGsWmpFcaduBMb34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C1h3EIymT3EfHYGYkRIrJLCF7Q29jd75t6CRH7BsMx6o0LHNlOpF7b8zdqFghfQ0D
 0BUYmUEdXmMlLo477P1h2bLsWOsy+ADDkQr7VEW5dKJZ8x+ZdHnt7kiYmNuS1U8A8Z
 8DDS5XyBJ7qyBJgvSqlFg0efnZRe+nrWUVFMyNWuuYjX3Fgog3IlnNwBHy7HIl8Eo6
 sPkSiXmfDJei4XlgKAl+sXLCY2Ru14KEzWNrXFuSobhuAYIO8+xF493zEO9CVwF9UF
 ppNW8u4PwmNMy5lplzqGru7x7f9qu0oSNhrv/jRRnr1xRFdystT2/VsYU3U8WzToXC
 PK5+yjnZ30YDg==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48I5di4G1331834; Wed, 18 Sep 2024 08:39:45 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v6 2/5] drm/xe: Introduce xe_device_uses_memirq()
Date: Wed, 18 Sep 2024 08:39:39 +0300
Message-ID: <20240918053942.1331811-3-illevi@habana.ai>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240918053942.1331811-1-illevi@habana.ai>
References: <20240918053942.1331811-1-illevi@habana.ai>
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

From: Ilia Levi <ilia.levi@intel.com>

Simplify some memirq usage scenarios and asserts in memirq infrastructure.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  8 +++-----
 drivers/gpu/drm/xe/xe_device.h |  6 ++++++
 drivers/gpu/drm/xe/xe_irq.c    |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c    |  2 +-
 drivers/gpu/drm/xe/xe_memirq.c | 22 +++++++---------------
 5 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..4719d9b04069 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -671,11 +671,9 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		if (IS_SRIOV_VF(xe)) {
-			err = xe_memirq_init(&tile->sriov.vf.memirq);
-			if (err)
-				return err;
-		}
+		err = xe_memirq_init(&tile->sriov.vf.memirq);
+		if (err)
+			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index ca8d8ef6342b..11a63384d3a8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -10,6 +10,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
+#include "xe_sriov.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -159,6 +160,11 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) >= 1250;
 }
 
+static inline bool xe_device_uses_memirq(struct xe_device *xe)
+{
+	return xe_device_has_memirq(xe) && IS_SRIOV_VF(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e501002e8a04..250036abec52 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -135,7 +135,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 gsc_mask = 0;
 	u32 heci_mask = 0;
 
-	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
+	if (xe_device_uses_memirq(xe))
 		return;
 
 	if (xe_device_uc_enabled(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index aec7db39c061..50d9521ba9f5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -602,7 +602,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
 	struct xe_device *xe = gt_to_xe(hwe->gt);
 
-	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
+	if (!xe_device_uses_memirq(xe))
 		return;
 
 	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index ecb4870c3356..b48be52bf684 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -200,9 +200,7 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	struct xe_device *xe = memirq_to_xe(memirq);
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(xe));
-
-	if (!xe_device_has_memirq(xe))
+	if (!xe_device_uses_memirq(xe))
 		return 0;
 
 	err = memirq_alloc_pages(memirq);
@@ -226,8 +224,7 @@ int xe_memirq_init(struct xe_memirq *memirq)
  */
 u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
@@ -244,8 +241,7 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
  */
 u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
@@ -262,8 +258,7 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
  */
 u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_ENABLE_OFFSET;
@@ -289,8 +284,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	u32 source, status;
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	source = xe_memirq_source_ptr(memirq) + offset;
@@ -325,8 +319,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
  */
 void xe_memirq_reset(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
 	if (memirq->bo)
 		memirq_set_enable(memirq, false);
@@ -343,8 +336,7 @@ void xe_memirq_reset(struct xe_memirq *memirq)
  */
 void xe_memirq_postinstall(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
 	if (memirq->bo)
 		memirq_set_enable(memirq, true);
-- 
2.43.2


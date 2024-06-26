Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C2AC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBB010E09B;
	Wed, 26 Jun 2024 10:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="qNagGRAU";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333C810E270
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 10:34:18 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719398067; bh=5WkpggV/VvzP+mQHr26pwXRdqe1GqNTVUkA/FWN4RzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qNagGRAU3x5xbTylxUFoCFDIcy6X+JXChP562dUZVmeMRSJFkkRO9DUaPzcA77Lsl
 VBPgQEkMsLzXNkOzZ1jxVw8DMaMsH1OXBxB1VHU79iWcVnKwW1Hh63YLdvcLjAmzdi
 OhlYcVOwGVCJFYAWI/J+A8IoPmFxTfHDcphPbyl0m12RG9NRU+8PS/9c7NpevNUvIk
 qF4lxUZiEetw40V9bCVoePHoywC2BaOftPlZeDbopEbZqV7wBETgSMUBQc7Phqt66S
 e+ma/YQbfOsVCCltYx9Vh6GV9bC3YuBXE6k37MK2kDP5clQNRTPrXDqZvBfveSuzvd
 FXOLjEzROA2wQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45QAY9cw2801812
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 13:34:09 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45QAY9RE2801811; 
 Wed, 26 Jun 2024 13:34:09 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai
Subject: [PATCH 7/8] drm/xe: msix support preparations - enable memirq
Date: Wed, 26 Jun 2024 13:33:44 +0300
Message-Id: <20240626103345.2801735-8-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626103345.2801735-1-dliberman@habana.ai>
References: <20240626103345.2801735-1-dliberman@habana.ai>
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

From: Ilia Levi <illevi@habana.ai>

In order to configure the HW engines to use MSIX, we first need to
enable memory based bnterrupts (memirq). Up until now only VF used
memirq.

Thus before enabling memirq, we need to test whether MSIX is enabled.
For this purpose we move IRQ vectors allocation to an earlier entry
point.

Signed-off-by: Ilia Levi <illevi@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.c |  6 +++-
 drivers/gpu/drm/xe/xe_device.h | 12 ++++++++
 drivers/gpu/drm/xe/xe_irq.c    | 56 +++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_irq.h    |  1 +
 4 files changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 432ec038b63c..854bceff7775 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -591,6 +591,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_irq_init(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		if (IS_SRIOV_VF(xe)) {
 			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
@@ -604,7 +608,7 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		if (IS_SRIOV_VF(xe)) {
+		if (xe_device_needs_memirq(xe)) {
 			err = xe_memirq_init(&tile->memirq);
 			if (err)
 				return err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bb07f5669dbb..7b4f651652e9 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -9,6 +9,7 @@
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
+#include "xe_sriov.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -154,6 +155,17 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) >= 1250;
 }
 
+static inline bool xe_device_has_msix(struct xe_device *xe)
+{
+	return xe->irq.msix_enabled;
+}
+
+static inline bool xe_device_needs_memirq(struct xe_device *xe)
+{
+	return (IS_SRIOV_VF(xe) || xe_device_has_msix(xe)) &&
+		xe_device_has_memirq(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2ccc7475645d..efa584e90cbf 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -559,19 +559,15 @@ static void vf_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	unsigned int id;
 
-	xe_assert(xe, IS_SRIOV_VF(xe));
-
-	if (GRAPHICS_VERx100(xe) < 1210)
-		xelp_intr_disable(xe);
-	else
+	if (GRAPHICS_VERx100(xe) >= 1210) {
 		xe_assert(xe, xe_device_has_memirq(xe));
-
-	for_each_tile(tile, xe, id) {
-		if (xe_device_has_memirq(xe))
-			xe_memirq_reset(&tile->memirq);
-		else
-			gt_irq_reset(tile);
+		return;
 	}
+
+	xelp_intr_disable(xe);
+
+	for_each_tile(tile, xe, id)
+		gt_irq_reset(tile);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
@@ -579,6 +575,11 @@ static void xe_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	u8 id;
 
+	if (xe_device_needs_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_reset(xe);
 
@@ -606,13 +607,6 @@ static void xe_irq_reset(struct xe_device *xe)
 
 static void vf_irq_postinstall(struct xe_device *xe)
 {
-	struct xe_tile *tile;
-	unsigned int id;
-
-	for_each_tile(tile, xe, id)
-		if (xe_device_has_memirq(xe))
-			xe_memirq_postinstall(&tile->memirq);
-
 	if (GRAPHICS_VERx100(xe) < 1210)
 		xelp_intr_enable(xe, true);
 	else
@@ -621,6 +615,17 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
+	struct xe_tile *tile;
+	unsigned int id;
+
+	if (!xe->info.gt_count)
+		return;
+
+	if (xe_device_needs_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_postinstall(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_postinstall(xe);
 
@@ -732,7 +737,7 @@ static int xe_irq_msix_request(struct xe_device *xe)
 	return 0;
 }
 
-int xe_irq_install(struct xe_device *xe)
+int xe_irq_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int irq_flags = PCI_IRQ_MSIX;
@@ -751,14 +756,23 @@ int xe_irq_install(struct xe_device *xe)
 		return nvec;
 	}
 
-	xe_irq_reset(xe);
-
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
 	}
 
+	xe->irq.num_of_interrupts = nvec;
+
+	return 0;
+}
+
+int xe_irq_install(struct xe_device *xe)
+{
+	int err;
+
+	xe_irq_reset(xe);
+
 	if (xe->irq.msix_enabled)
 		err = xe_irq_msix_request(xe);
 	else
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 4278d8be5010..8a362ba14166 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -12,6 +12,7 @@ struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_shutdown(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
-- 
2.34.1


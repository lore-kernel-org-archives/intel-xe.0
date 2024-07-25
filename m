Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD2EC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687D110E2A6;
	Thu, 25 Jul 2024 10:22:48 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6742F10E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 10:22:47 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46PAMDbd2182929; Thu, 25 Jul 2024 13:22:34 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 08/11] drm/xe: msix support preparations - enable memirq
Date: Thu, 25 Jul 2024 13:22:10 +0300
Message-ID: <20240725102213.2182896-9-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
References: <20240725102213.2182896-1-ilia.levi@intel.com>
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

In order to configure the HW engines to use MSIX, we first need to
enable memory based interrupts (memirq). Up until now only VF used
memirq.

Thus before enabling memirq, we need to test whether MSIX is enabled.
For this purpose we move IRQ vectors allocation to an earlier entry
point.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++-
 drivers/gpu/drm/xe/xe_device.h |  7 +++++
 drivers/gpu/drm/xe/xe_irq.c    | 49 +++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_irq.h    |  1 +
 4 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8865751acf80..153b0862844b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -644,6 +644,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_irq_init(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		if (IS_SRIOV_VF(xe)) {
 			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
@@ -657,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		if (IS_SRIOV_VF(xe)) {
+		if (xe_device_needs_memirq(xe)) {
 			err = xe_memirq_init(&tile->memirq, false);
 			if (err)
 				return err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d4c6ca1da8e8..720841ff241b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -9,6 +9,7 @@
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
+#include "xe_sriov.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -164,6 +165,12 @@ static inline bool xe_device_has_msix(struct xe_device *xe)
 	return xe->irq.msix.enabled;
 }
 
+static inline bool xe_device_needs_memirq(struct xe_device *xe)
+{
+	return (IS_SRIOV_VF(xe) || xe_device_has_msix(xe)) &&
+		xe_device_has_memirq(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 821efd464021..208d961919ea 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -563,17 +563,15 @@ static void vf_irq_reset(struct xe_device *xe)
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
 
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
@@ -581,6 +579,11 @@ static void xe_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	u8 id;
 
+	if (xe_device_needs_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_reset(xe);
 
@@ -608,13 +611,6 @@ static void xe_irq_reset(struct xe_device *xe)
 
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
@@ -623,6 +619,14 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
+	struct xe_tile *tile;
+	unsigned int id;
+
+	if (xe_device_needs_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_postinstall(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_postinstall(xe);
 
@@ -740,7 +744,7 @@ static int xe_irq_msix_request(struct xe_device *xe)
 	return 0;
 }
 
-int xe_irq_install(struct xe_device *xe)
+int xe_irq_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int irq_flags = PCI_IRQ_MSIX;
@@ -761,14 +765,21 @@ int xe_irq_install(struct xe_device *xe)
 		return nvec;
 	}
 
-	xe_irq_reset(xe);
-
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
 	}
 
+	return 0;
+}
+
+int xe_irq_install(struct xe_device *xe)
+{
+	int err;
+
+	xe_irq_reset(xe);
+
 	if (xe_device_has_msix(xe))
 		err = xe_irq_msix_request(xe);
 	else
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 94b32a780c68..b1a124a551ee 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -12,6 +12,7 @@ struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
-- 
2.43.2


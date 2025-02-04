Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A56C0219A
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 13:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658AE10E63D;
	Tue,  4 Feb 2025 13:21:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9510E63D;
 Tue,  4 Feb 2025 13:21:51 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>, Ingo Molnar <mingo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 6/8] drm/xe/gsc: Use guard helper for
 xe_gsc_print_info.
Date: Tue,  4 Feb 2025 14:22:35 +0100
Message-ID: <20250204132238.162608-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
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

As an example on how it works.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gsc.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 1eb791ddc375c..aee9f58b1c3c6 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -600,7 +600,6 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	unsigned int fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -609,17 +608,12 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
-		return;
-
-	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
-			xe_mmio_read32(mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	scoped_guard(xe_force_wake_get, gt_to_fw(gt), XE_FW_GSC)
+		drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
+				xe_mmio_read32(mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
 }
-- 
2.47.1


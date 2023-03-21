Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D1C761A6
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E224010E0A7;
	Tue, 21 Mar 2023 22:06:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC55C10E090
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436379; x=1710972379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MKPmMGKH0WyZ+cdDplg7sj86vNy93T0ysz+Kjln/Qg8=;
 b=a7J1Lis6S+Q5GD3726Dq5kQy+1M/+RXI5V3+UOyoF5hAZXpA2qMBOY5t
 QV7718j/XebXztNyGy0InO0u8DZxaIi1WN1+BTcv5p+JB+Zb+rmC0AxMj
 1y35XSzck1uQGCXeCw6U9/mrozxhdPB08N75R40OwOpVw+1abbodFA3aB
 XUvWvIiZmMP3SgYDw0tItGdcEhLNAGNqZqxhZdKm5glPA6IXsnP2QYF/1
 q2uqBJ89ex8pL7yfxpvF+KYosDYvnw6jyzo1J19NUJdP4t0A2Ay1Tt8AR
 XPFGkD98gZBZbgXThetHP5cuaAk6XeA8a7/7mfRBYERviOg1CyYl8j4vc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109498"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109498"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065699"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065699"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:22 -0700
Message-Id: <20230321220527.595462-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/7] drm/xe: Extract function to initialize
 xe->info
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Extract the part setting up from xe->info from xe_pci_probe() into its
own function. This pairs nicely with the display counterpart, avoids
info initialization to be placed elsewhere and helps future
improvements to build fake devices for tests.

While at it, normalize the names a little bit: the _get() suffix may be
mistaken by lock-related operation, so rename the function to
"find_subplatform()". Also rename the variable to subplatform_desc to
make it easier to understand, even if longer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 98 ++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91fed9d3105e..b990985b5771 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -349,7 +349,7 @@ static bool id_blocked(u16 device_id)
 }
 
 static const struct xe_subplatform_desc *
-subplatform_get(const struct xe_device *xe, const struct xe_device_desc *desc)
+find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 {
 	const struct xe_subplatform_desc *sp;
 	const u16 *id;
@@ -362,49 +362,12 @@ subplatform_get(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void xe_pci_remove(struct pci_dev *pdev)
+static void xe_info_init(struct xe_device *xe,
+			 const struct xe_device_desc *desc,
+			 const struct xe_subplatform_desc *subplatform_desc)
 {
-	struct xe_device *xe;
-
-	xe = pci_get_drvdata(pdev);
-	if (!xe) /* driver load aborted, nothing to cleanup */
-		return;
-
-	xe_device_remove(xe);
-	xe_pm_runtime_fini(xe);
-	pci_set_drvdata(pdev, NULL);
-}
-
-static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
-{
-	const struct xe_device_desc *desc = (void *)ent->driver_data;
-	const struct xe_subplatform_desc *spd;
-	struct xe_device *xe;
 	struct xe_gt *gt;
 	u8 id;
-	int err;
-
-	if (desc->require_force_probe && !id_forced(pdev->device)) {
-		dev_info(&pdev->dev,
-			 "Your graphics device %04x is not officially supported\n"
-			 "by xe driver in this kernel version. To force Xe probe,\n"
-			 "use xe.force_probe='%04x' and i915.force_probe='!%04x'\n"
-			 "module parameters or CONFIG_DRM_XE_FORCE_PROBE='%04x' and\n"
-			 "CONFIG_DRM_I915_FORCE_PROBE='!%04x' configuration options.\n",
-			 pdev->device, pdev->device, pdev->device,
-			 pdev->device, pdev->device);
-		return -ENODEV;
-	}
-
-	if (id_blocked(pdev->device)) {
-		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
-			 pdev->vendor, pdev->device);
-		return -ENODEV;
-	}
-
-	xe = xe_device_create(pdev, ent);
-	if (IS_ERR(xe))
-		return PTR_ERR(xe);
 
 	xe->info.graphics_verx100 = desc->graphics_ver * 100 +
 				    desc->graphics_rel;
@@ -423,8 +386,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
 
-	spd = subplatform_get(xe, desc);
-	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 	xe->info.step = xe_step_get(xe);
 
 	for (id = 0; id < xe->info.tile_count; ++id) {
@@ -449,11 +412,58 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 				desc->extra_gts[id - 1].mmio_adj_offset;
 		}
 	}
+}
+
+static void xe_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_device *xe;
+
+	xe = pci_get_drvdata(pdev);
+	if (!xe) /* driver load aborted, nothing to cleanup */
+		return;
+
+	xe_device_remove(xe);
+	xe_pm_runtime_fini(xe);
+	pci_set_drvdata(pdev, NULL);
+}
+
+static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	const struct xe_device_desc *desc = (void *)ent->driver_data;
+	const struct xe_subplatform_desc *subplatform_desc;
+	struct xe_device *xe;
+	int err;
+
+	if (desc->require_force_probe && !id_forced(pdev->device)) {
+		dev_info(&pdev->dev,
+			 "Your graphics device %04x is not officially supported\n"
+			 "by xe driver in this kernel version. To force Xe probe,\n"
+			 "use xe.force_probe='%04x' and i915.force_probe='!%04x'\n"
+			 "module parameters or CONFIG_DRM_XE_FORCE_PROBE='%04x' and\n"
+			 "CONFIG_DRM_I915_FORCE_PROBE='!%04x' configuration options.\n",
+			 pdev->device, pdev->device, pdev->device,
+			 pdev->device, pdev->device);
+		return -ENODEV;
+	}
+
+	if (id_blocked(pdev->device)) {
+		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
+			 pdev->vendor, pdev->device);
+		return -ENODEV;
+	}
+
+	xe = xe_device_create(pdev, ent);
+	if (IS_ERR(xe))
+		return PTR_ERR(xe);
+
+	subplatform_desc = find_subplatform(xe, desc);
 
+	xe_info_init(xe, desc, subplatform_desc);
 	xe_display_info_init(xe);
 
 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
-		desc->platform_name, spd ? spd->name : "",
+		desc->platform_name,
+		subplatform_desc ? subplatform_desc->name : "",
 		xe->info.devid, xe->info.revid,
 		xe->info.is_dgfx, xe->info.graphics_verx100,
 		xe->info.media_verx100,
-- 
2.39.0


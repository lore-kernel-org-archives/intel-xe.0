Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B098C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 18:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6E10E395;
	Thu, 27 Apr 2023 18:44:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431510E395
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 18:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682621079; x=1714157079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8PwobGcXpGp1tyvFbkXYcNEqHBzm0EalwBdlKT+R23A=;
 b=IGmEbPfcVOkWjM4uu6yEA6eF3HWp76oqLz92uVbnhIrtj3wbfdY09gGy
 NmwMbQ8lorahHWy9UGDHF99d/+GFy+GsNcA4z0WoRdlCtTdEbqOX8/ew3
 CmsineKg6aha320WZNbg5S3eBRZ403dOx5MMXY/92d6Wwxpj0BZn69VGE
 Fq4gExv4jxZGDg/KhMHoKiJJm0hgzPqagnR8+HwyXfRnMSE1YdMxAFGl5
 13i2Hd5e7duMeg4zsPuFY1ul6eCRbTEoLrB5FnRcAZ82qPNt+pT6tNCsq
 yntalqVpocxPWYUAl6nm3q55lrlPbr73BBNjdMXF8QxehbS3Wf2yyXeOH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336527152"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="336527152"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 11:44:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806058685"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="806058685"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 11:44:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Apr 2023 11:44:09 -0700
Message-Id: <20230427184408.1340988-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix media detection for pre-GMD_ID
 platforms
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reading the GMD_ID register on platforms before that register
became available is not reliable. The assumption was that since the
register was not allocated, it would return 0. But on PVC for example it
returns garbage (or a very specific number), triggering the following
error:

	xe 0000:8c:00.0: [drm] *ERROR* Hardware reports unknown media version 1025.55

Fix it by stop relying on the value returned by that registers on
platforms before GMD_ID. Instead this relies on the graphics description
struct being already pre-set on the device: this can only ever be true
for platforms before the GMD_ID support. In that case, GMD_ID is skipped
and the hardcoded values are used.  This should also help on early
bring-up in case the GMD_ID returns something not expected and we need to
temporarily hardcode values. With this, PVC doesn't trigger the error
and goes straight to:

	xe 0000:8c:00.0: [drm:xe_display_info_init [xe]] No display IP, skipping
	xe 0000:8c:00.0: [drm:xe_pci_probe [xe]] XE_PVC  0bd5:002f dgfx:1 gfx:Xe_HPC (12.60) media:none (0.00) dma_m_s:52 tc:2
	xe 0000:8c:00.0: [drm:xe_pci_probe [xe]] Stepping = (G:C0, M:**, D:**, B:B3)

Fixes: d55b52daa96c ("drm/xe: Select graphics/media descriptors from GMD_ID")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 113 ++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f587bd9706af..35dcb8781f2a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -39,7 +39,9 @@ struct xe_gt_desc {
 };
 
 struct xe_device_desc {
+	/* Should only ever be set for platforms without GMD_ID */
 	const struct xe_graphics_desc *graphics;
+	/* Should only ever be set for platforms without GMD_ID */
 	const struct xe_media_desc *media;
 
 	const char *platform_name;
@@ -408,6 +410,30 @@ static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
 		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
 }
 
+/*
+ * Pre-GMD_ID platform: device descriptor already points to the appropriate
+ * graphics descriptor. Simply forward the description and calculate the version
+ * appropriately. "graphics" should be present in all such platforms, while
+ * media is optional.
+ */
+static void handle_pre_gmdid(struct xe_device *xe,
+			     const struct xe_device_desc *desc,
+			     const struct xe_graphics_desc **graphics,
+			     const struct xe_media_desc **media)
+{
+	*graphics = desc->graphics;
+	xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
+
+	*media = desc->media;
+	if (*media)
+		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
+
+}
+
+/*
+ * GMD_ID platform: read IP version from hardware and select graphics descriptor
+ * based on the result.
+ */
 static void handle_gmdid(struct xe_device *xe,
 			 const struct xe_device_desc *desc,
 			 const struct xe_graphics_desc **graphics,
@@ -415,69 +441,35 @@ static void handle_gmdid(struct xe_device *xe,
 {
 	u32 ver;
 
-	if (desc->graphics) {
-		/*
-		 * Pre-GMD_ID platform; device descriptor already points to
-		 * the appropriate graphics descriptor.
-		 */
-		*graphics = desc->graphics;
-		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
-	} else {
-		/*
-		 * GMD_ID platform; read IP version from hardware and select
-		 * graphics descriptor based on the result.
-		 */
-		ver = peek_gmdid(xe, GMD_ID.reg);
-		for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
-			if (ver == graphics_ip_map[i].ver) {
-				xe->info.graphics_verx100 = ver;
-				*graphics = graphics_ip_map[i].ip;
-
-				break;
-			}
-		}
+	ver = peek_gmdid(xe, GMD_ID.reg);
+	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
+		if (ver == graphics_ip_map[i].ver) {
+			xe->info.graphics_verx100 = ver;
+			*graphics = graphics_ip_map[i].ip;
 
-		if (!xe->info.graphics_verx100) {
-			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-				ver / 100, ver % 100);
+			break;
 		}
 	}
 
-	if (desc->media) {
-		/*
-		 * Pre-GMD_ID platform; device descriptor already points to
-		 * the appropriate media descriptor.
-		 */
-		*media = desc->media;
-		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
-	} else {
-		/*
-		 * GMD_ID platform; read IP version from hardware and select
-		 * media descriptor based on the result.
-		 *
-		 * desc->media can also be NULL for a pre-GMD_ID platform that
-		 * simply doesn't have media (e.g., PVC); in that case the
-		 * attempt to read GMD_ID will return 0 (since there's no
-		 * register at that location).
-		 */
-		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
-		if (ver == 0)
-			return;
-
-		for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
-			if (ver == media_ip_map[i].ver) {
-				xe->info.media_verx100 = ver;
-				*media = media_ip_map[i].ip;
-
-				break;
-			}
-		}
+	if (!xe->info.graphics_verx100) {
+		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
+			ver / 100, ver % 100);
+	}
+
+	ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
+	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
+		if (ver == media_ip_map[i].ver) {
+			xe->info.media_verx100 = ver;
+			*media = media_ip_map[i].ip;
 
-		if (!xe->info.media_verx100) {
-			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-				ver / 100, ver % 100);
+			break;
 		}
 	}
+
+	if (!xe->info.media_verx100) {
+		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
+			ver / 100, ver % 100);
+	}
 }
 
 
@@ -492,9 +484,14 @@ static int xe_info_init(struct xe_device *xe,
 
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
-	 * descriptor to use from hardware registers.
+	 * descriptor to use from hardware registers. desc->graphics will only
+	 * ever be set at this point for platforms before GMD_ID. In that case
+	 * the IP descriptions and versions are simply derived from that.
 	 */
-	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
+	if (desc->graphics)
+		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
+	else
+		handle_gmdid(xe, desc, &graphics_desc, &media_desc);
 
 	/*
 	 * If we couldn't detect the graphics IP, that's considered a fatal
-- 
2.40.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEEFC021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A9B10EB2C;
	Fri, 21 Feb 2025 18:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5ArJfQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02F210EB2E
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163964; x=1771699964;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Fju8Ah5XNIeuaDpM+CxvbWGssbWQTBEJdzJ6qjJkjN8=;
 b=g5ArJfQJsxEcukRnidHaVCFdxbgy5RhsYCFkngBB/n7MmDvLm6z1f1K/
 z/8bh5yE0JKfflbTHkZpvH+fHGt0fkRqJypS5Ag8vKM6ETfjsCWNVOYmR
 jle72SXHlsD6pXPKMomoBv2/D5SfZnB8BH1uyWfhmSgVBAoKx30Tw1ePt
 oCCcerppbuCslDNMA7E0+9MdJd4AEKK+XC1hZBh+hqkvUAlP72lUwTuaY
 tdOHXvRC00F4ROudEU4TV8nRb0sKw0LgHDzKAtZZo7qWh1eZfF82tCFZP
 K8P2xu5Ds2d0ETavZzv0MbscTrTAYrkn9L9KJLQSR9xfopqFyxtoVjpSV A==;
X-CSE-ConnectionGUID: IDUFLwgcQkS6DBoEHz0z4g==
X-CSE-MsgGUID: moMNpa8uRpGpylbljHD62A==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403692"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403692"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:43 -0800
X-CSE-ConnectionGUID: thmEbIEYRcuYIWbBCDDavw==
X-CSE-MsgGUID: PihwxoWMSL+1FKi56rTw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071346"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:42 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:46 -0300
Subject: [PATCH v2 7/7] drm/xe: Simplify setting release info in xe->info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-7-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

Now that we have all IPs being described via struct xe_ip, where release
information (version and name) is represented in a single struct type,
we can extract duplicated logic from handle_pre_gmdid() and
handle_gmdid() and apply it in the body of xe_info_init().

With this change, there is no point in keeping handle_pre_gmdid()
anymore, so we just remove it and inline the assignment of
{graphics,media}_ip.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 71 ++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 55162296e01873681af006c3102a188ee9a9d100..f010c9471a01fadb7ff2206ec20b1aa1072f6767 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -515,62 +515,35 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 }
 
 /*
- * Pre-GMD_ID platform: device descriptor already points to the appropriate
- * graphics descriptor. Simply forward the description and calculate the version
- * appropriately. "graphics" should be present in all such platforms, while
- * media is optional.
- */
-static void handle_pre_gmdid(struct xe_device *xe,
-			     const struct xe_device_desc *desc,
-			     const struct xe_graphics_desc **graphics,
-			     const struct xe_media_desc **media)
-{
-	xe->info.graphics_verx100 = desc->pre_gmdid_graphics_ip->verx100;
-	xe->info.graphics_name = desc->pre_gmdid_graphics_ip->name;
-	*graphics = desc->pre_gmdid_graphics_ip->desc;
-
-	if (desc->pre_gmdid_media_ip) {
-		xe->info.media_verx100 = desc->pre_gmdid_media_ip->verx100;
-		xe->info.media_name = desc->pre_gmdid_media_ip->name;
-		*media = desc->pre_gmdid_media_ip->desc;
-	} else {
-		xe->info.media_name = "none";
-		*media = NULL;
-	}
-
-}
-
-/*
- * GMD_ID platform: read IP version from hardware and select graphics descriptor
+ * Read IP version from hardware and select graphics/media IP descriptors
  * based on the result.
  */
 static void handle_gmdid(struct xe_device *xe,
-			 const struct xe_graphics_desc **graphics,
-			 const struct xe_media_desc **media,
+			 const struct xe_ip **graphics_ip,
+			 const struct xe_ip **media_ip,
 			 u32 *graphics_revid,
 			 u32 *media_revid)
 {
 	u32 ver;
 
+	*graphics_ip = NULL;
+	*media_ip = NULL;
+
 	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
 
 	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
 		if (ver == graphics_ips[i].verx100) {
-			xe->info.graphics_verx100 = ver;
-			xe->info.graphics_name = graphics_ips[i].name;
-			*graphics = graphics_ips[i].desc;
+			*graphics_ip = &graphics_ips[i];
 
 			break;
 		}
 	}
 
-	if (!xe->info.graphics_verx100) {
+	if (!*graphics_ip) {
 		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
 			ver / 100, ver % 100);
 	}
 
-	xe->info.media_name = "none";
-
 	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
@@ -578,15 +551,13 @@ static void handle_gmdid(struct xe_device *xe,
 
 	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
 		if (ver == media_ips[i].verx100) {
-			xe->info.media_verx100 = ver;
-			xe->info.media_name = media_ips[i].name;
-			*media = media_ips[i].desc;
+			*media_ip = &media_ips[i];
 
 			break;
 		}
 	}
 
-	if (!xe->info.media_verx100) {
+	if (!*media_ip) {
 		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
 			ver / 100, ver % 100);
 	}
@@ -640,6 +611,8 @@ static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc)
 {
 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
+	const struct xe_ip *graphics_ip;
+	const struct xe_ip *media_ip;
 	const struct xe_graphics_desc *graphics_desc;
 	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
@@ -654,11 +627,12 @@ static int xe_info_init(struct xe_device *xe,
 	 * versions are simply derived from that.
 	 */
 	if (desc->pre_gmdid_graphics_ip) {
-		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
+		graphics_ip = desc->pre_gmdid_graphics_ip;
+		media_ip = desc->pre_gmdid_media_ip;
 		xe->info.step = xe_step_pre_gmdid_get(xe);
 	} else {
 		xe_assert(xe, !desc->pre_gmdid_media_ip);
-		handle_gmdid(xe, &graphics_desc, &media_desc,
+		handle_gmdid(xe, &graphics_ip, &media_ip,
 			     &graphics_gmdid_revid, &media_gmdid_revid);
 		xe->info.step = xe_step_gmdid_get(xe,
 						  graphics_gmdid_revid,
@@ -670,9 +644,22 @@ static int xe_info_init(struct xe_device *xe,
 	 * error and we should abort driver load.  Failing to detect media
 	 * IP is non-fatal; we'll just proceed without enabling media support.
 	 */
-	if (!graphics_desc)
+	if (!graphics_ip)
 		return -ENODEV;
 
+	xe->info.graphics_verx100 = graphics_ip->verx100;
+	xe->info.graphics_name = graphics_ip->name;
+	graphics_desc = graphics_ip->desc;
+
+	if (media_ip) {
+		xe->info.media_verx100 = media_ip->verx100;
+		xe->info.media_name = media_ip->name;
+		media_desc = media_ip->desc;
+	} else {
+		xe->info.media_name = "none";
+		media_desc = NULL;
+	}
+
 	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;

-- 
2.48.1


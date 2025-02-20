Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FE5C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 17:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8253710E9C2;
	Thu, 20 Feb 2025 17:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJ+UdxYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6075610E9C4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740072360; x=1771608360;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G8eXwPWqHM1y3t7srx9/NQuRc5X5STBaD+gsWaU38Go=;
 b=GJ+UdxYuUMjTkwGsrzQbPvoDnuFjPuWOFp0oaBCycIYlsTIa27/MDRI2
 WTG5ZUA3EYmwzkJGOLSHbTCUExFVP0T/wK5aip9untNFzuNnJlACcjfCm
 7A5YJH6eg8ca8WGvti10jAVD/GXyAqnHaDjp/7QS3MjAgHt2VDeenZqNW
 hYTx2vu3iK7PtBRSkCeq7GlOA48gQSCETEEw2mtXpNQQqy5K8S+bOk9pB
 3d1ZoOGpgE6IhOMZYNb7abP2DyyhMmnJUIN3ShKszGjs+P/HH/PAGe1gZ
 jM3y+fGdY/yXH6gak/SQFZUeMjgtfeHiJaY2M4HHy1YFon1V/ewJgXA+1 Q==;
X-CSE-ConnectionGUID: acw6gLsuSJmE8oRC6J/zjg==
X-CSE-MsgGUID: R+PI6qvhQH+6r1LJPAiLsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40788074"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40788074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:25:59 -0800
X-CSE-ConnectionGUID: 2FbCCVAbSI6qzvqslOvqLQ==
X-CSE-MsgGUID: UDfukKAdR2OswILGvTeUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115634860"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:25:59 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe: Set IP names in functions handling IP version
Date: Thu, 20 Feb 2025 14:25:08 -0300
Message-ID: <20250220172532.66613-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220172532.66613-1-gustavo.sousa@intel.com>
References: <20250220172532.66613-1-gustavo.sousa@intel.com>
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

In an upcoming change, we will handle setting graphics_name and
media_name differently for GMDID-based IPs. As such, let's make both
handle_pre_gmdid() and handle_gmdid() functions responsible for
initializing those fields. While now we have both doing essentially the
same thing with respect to those fields, handle_pre_gmdid() will diverge
soon.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 70b697fde5b9..feea897f130d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -564,9 +564,14 @@ static void handle_pre_gmdid(struct xe_device *xe,
 			     const struct xe_media_desc *media)
 {
 	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
+	xe->info.graphics_name = graphics->name;
 
-	if (media)
+	if (media) {
 		xe->info.media_verx100 = media->ver * 100 + media->rel;
+		xe->info.media_name = media->name;
+	} else {
+		xe->info.media_name = "none";
+	}
 
 }
 
@@ -588,6 +593,7 @@ static void handle_gmdid(struct xe_device *xe,
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
 			*graphics = graphics_ip_map[i].ip;
+			xe->info.graphics_name = (*graphics)->name;
 
 			break;
 		}
@@ -598,8 +604,9 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
+	xe->info.media_name = "none";
 
+	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
 		return;
@@ -608,6 +615,7 @@ static void handle_gmdid(struct xe_device *xe,
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
 			*media = media_ip_map[i].ip;
+			xe->info.media_name = (*media)->name;
 
 			break;
 		}
@@ -698,9 +706,6 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.graphics_name = graphics_desc->name;
-	xe->info.media_name = media_desc ? media_desc->name : "none";
-
 	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
-- 
2.48.1


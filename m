Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AE2C021B3
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 17:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874FA10E9C3;
	Thu, 20 Feb 2025 17:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX1c5+lH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E652F10E9C2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740072361; x=1771608361;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qkjnoHPYiKLMxZN1r+qB5LlWaT5z0WeuO4SyEu0twYo=;
 b=IX1c5+lHXyAM0Owmi6ptdEqkNZDZrzZ4g+dwZ1wlxxF1aHT5tDA1EvqQ
 VDRLDnD92UBUQEgXgp7H6xtjZq+XwRraNc2irXlHuTPs8NUsbw4Q5vRYV
 SMsdARYWFCNJ5LyK1HEKiHK4e82XmQuMxKXZK1nPVscPxrBwr+KuS4qs2
 PceV+9xIJu9Oza0OFmU8XvXdbYMmKgCc7tkQdOgzI19rxM5Gd/sexIkaw
 mmUjsNeL7curJ4WYqiD8fahvYS5IFENE6TtkABEvfa4i/Vz24pQMfze8j
 xtLU/Px3AYVzRO0wBm0q+0wA69Wuvej0SXOJjNziXxlEk+1fG/auSmG3d g==;
X-CSE-ConnectionGUID: jBe8r7//Sv6VJOCc7i5Jzw==
X-CSE-MsgGUID: TCIKhHcKQcSrGc6maLenMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40788077"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40788077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:26:00 -0800
X-CSE-ConnectionGUID: sll470LET3Sz6x4zLpVq1g==
X-CSE-MsgGUID: G2Bl0G0uTnqwMlBHJg1q0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115634868"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:26:00 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Disambiguate GMDID-based IP names
Date: Thu, 20 Feb 2025 14:25:09 -0300
Message-ID: <20250220172532.66613-3-gustavo.sousa@intel.com>
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

The name of an IP is a function of its version. As such, given an IP
version, it should be clear to identify the name of that IP release.

With the current code, we keep that mapping clear for pre-GMDID IPs, but
ambiguous for GMDID-based ones. That causes two types of inconveniences:

 1. The end user, who might not have all the necessary mapping at hand,
    might be confused when seeing different possible IP names in the
    dmesg log.

 2. It makes a developer who is not familiar with the "IP version" to
    "Release name" need to resort to looking at the specs to understand
    see what version maps to what. While the specs should be the
    authority on the mapping, we should make our lives easier by
    reflecting that mapping in the source code.

Thus, since the IP name is tied to the version, let's  remove the
ambiguity by using a "name" field in struct gmdid_map instead of
accumulating names in the descriptor instances.

This does result in the code having IP name being defined in
different structs (gmdid_map, xe_graphics_desc, xe_media_desc), but that
will be resolved in upcoming changes.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 31 +++++++++++++------------------
 drivers/gpu/drm/xe/xe_pci_types.h |  1 +
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index feea897f130d..a61a8982ab67 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -149,7 +149,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
-	.name = "Xe_LPG",
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0),
@@ -172,8 +171,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
 
 static const struct xe_graphics_desc graphics_xe2 = {
-	.name = "Xe2_LPG / Xe2_HPG / Xe3_LPG",
-
 	XE2_GFX_FEATURES,
 };
 
@@ -198,7 +195,6 @@ static const struct xe_media_desc media_xehpm = {
 };
 
 static const struct xe_media_desc media_xelpmp = {
-	.name = "Xe_LPM+",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -206,7 +202,6 @@ static const struct xe_media_desc media_xelpmp = {
 };
 
 static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -376,21 +371,21 @@ __diag_pop();
 
 /* Map of GMD_ID values to graphics IP */
 static const struct gmdid_map graphics_ip_map[] = {
-	{ 1270, &graphics_xelpg },
-	{ 1271, &graphics_xelpg },
-	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
-	{ 2001, &graphics_xe2 },
-	{ 2004, &graphics_xe2 },
-	{ 3000, &graphics_xe2 },
-	{ 3001, &graphics_xe2 },
+	{ 1270, "Xe_LPG", &graphics_xelpg },
+	{ 1271, "Xe_LPG", &graphics_xelpg },
+	{ 1274, "Xe_LPG+", &graphics_xelpg },
+	{ 2001, "Xe2_HPG", &graphics_xe2 },
+	{ 2004, "Xe2_LPG", &graphics_xe2 },
+	{ 3000, "Xe3_LPG", &graphics_xe2 },
+	{ 3001, "Xe3_LPG", &graphics_xe2 },
 };
 
 /* Map of GMD_ID values to media IP */
 static const struct gmdid_map media_ip_map[] = {
-	{ 1300, &media_xelpmp },
-	{ 1301, &media_xe2 },
-	{ 2000, &media_xe2 },
-	{ 3000, &media_xe2 },
+	{ 1300, "Xe_LPM+", &media_xelpmp },
+	{ 1301, "Xe2_HPM", &media_xe2 },
+	{ 2000, "Xe2_LPM", &media_xe2 },
+	{ 3000, "Xe3_LPM", &media_xe2 },
 };
 
 /*
@@ -592,8 +587,8 @@ static void handle_gmdid(struct xe_device *xe,
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
+			xe->info.graphics_name = graphics_ip_map[i].name;
 			*graphics = graphics_ip_map[i].ip;
-			xe->info.graphics_name = (*graphics)->name;
 
 			break;
 		}
@@ -614,8 +609,8 @@ static void handle_gmdid(struct xe_device *xe,
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
+			xe->info.media_name = media_ip_map[i].name;
 			*media = media_ip_map[i].ip;
-			xe->info.media_name = (*media)->name;
 
 			break;
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index b96423844952..8e586d02d089 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -39,6 +39,7 @@ struct xe_media_desc {
 
 struct gmdid_map {
 	unsigned int ver;
+	const char *name;
 	const void *ip;
 };
 
-- 
2.48.1


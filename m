Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD9AC021B6
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18E10EB2C;
	Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkGIV40R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566DC10EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163958; x=1771699958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=GjKx3C4N1RM/y2ZjakgoX8pTVOHge7P5XzfKQJ0mayY=;
 b=NkGIV40RgP+4bxARAvb7Y2i+A/PoUabkRUcpMD5ulIBcqitaJsytXgZ/
 59f2EuD9aGJUUGvr5uJBCiUsrSss4RafPnUeNzJpljSLgmSNohEubDdQo
 IhDeSRiWA5z/KK0+v2OrMvTzJhyO586j4ReCFAUtmk/X6Gk2CFprDAie4
 UTY1sjATU14qYw0enV8F6opvWhIPcjV5uXHtKcZ0swqBwPP+oPBvEdCrR
 43kTrDoxK884mvV1y+8NmlcFgHO+n8MGmw8kdfrg29VSpSR9156STsMNV
 HTu0VCfMkqEhPow1ATRo+QmzUPH50CSJSyc8YN7L+/wA7+wEWvkl+DbLd Q==;
X-CSE-ConnectionGUID: KFfqggekRnaqTqgfR3KBoA==
X-CSE-MsgGUID: iptkI7pJS5+e+rTbLf10NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403681"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:38 -0800
X-CSE-ConnectionGUID: bFHm35uoR3SJR7L0kkhMbA==
X-CSE-MsgGUID: /IJftsUXRg63JrA6cgpcBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071319"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:37 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:41 -0300
Subject: [PATCH v2 2/7] drm/xe: Disambiguate GMDID-based IP names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-2-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

A side-effect of this change is that media_xe2 exactly matches
media_xelpmp now, so we just re-use the latter.

v2:
  - Drop media_xe2 and re-use media_xelpmp. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 38 +++++++++++++-------------------------
 drivers/gpu/drm/xe/xe_pci_types.h |  1 +
 2 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index feea897f130d9bbf2d880a0b419764b96c0bc4ad..16add7bd3d028df17b1d308f86ecaa11fa6bd670 100644
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
 
@@ -198,15 +195,6 @@ static const struct xe_media_desc media_xehpm = {
 };
 
 static const struct xe_media_desc media_xelpmp = {
-	.name = "Xe_LPM+",
-	.hw_engine_mask =
-		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
-		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
-		BIT(XE_HW_ENGINE_GSCCS0)
-};
-
-static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -376,21 +364,21 @@ __diag_pop();
 
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
+	{ 1301, "Xe2_HPM", &media_xelpmp },
+	{ 2000, "Xe2_LPM", &media_xelpmp },
+	{ 3000, "Xe3_LPM", &media_xelpmp },
 };
 
 /*
@@ -592,8 +580,8 @@ static void handle_gmdid(struct xe_device *xe,
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
+			xe->info.graphics_name = graphics_ip_map[i].name;
 			*graphics = graphics_ip_map[i].ip;
-			xe->info.graphics_name = (*graphics)->name;
 
 			break;
 		}
@@ -614,8 +602,8 @@ static void handle_gmdid(struct xe_device *xe,
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
+			xe->info.media_name = media_ip_map[i].name;
 			*media = media_ip_map[i].ip;
-			xe->info.media_name = (*media)->name;
 
 			break;
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index b96423844952664ce38592c12a68d680a97e8d6a..8e586d02d089847cc9b0dbce20ceae894e7c7fcd 100644
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


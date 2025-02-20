Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2286AC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 17:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E128A10E9C4;
	Thu, 20 Feb 2025 17:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIFKTJyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF62D10E9C3
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740072363; x=1771608363;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qBFGtxxW58kkB9CdctCyNxJYszj+WE0hp7sMU+Wvs38=;
 b=EIFKTJyWLW6QPJKMzxfD52qYuyxlFGzTnt+9i6atAbz9iqMmTuOwNqfa
 WWFaz50nOOFJB9+EeBlOhhYwUoeDgsPhNRb8rr4qPbRP6lvzArZAy0QQq
 j5CderOsDxWCmdypkQ7xWngs6Uog6lx6Gf9RSqhN14LZHQSUw2+b65Dtq
 6iAUz1Z3U4HjUGfDdTVRgs6cLPEiHUapJdDCkXi+cWmzi4NDhiX2JOwFS
 JqGu8TlO05Wft+Gt02l/C6p+tGPpYKhtGonkfn7lENBU3XVsU7PjnZ/2y
 ahgzuLVRtscNe6i0hRvDgjVRJnCa86mzMrTszwJpusc/V9ZQxlgUdh19w Q==;
X-CSE-ConnectionGUID: 0XXxE0F2Qqy09OiqgFV0nQ==
X-CSE-MsgGUID: wHbkEPQ4TuinM3K6pKn/OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40788083"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40788083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:26:02 -0800
X-CSE-ConnectionGUID: zH/YFOyzQ72e3ngkR+ZkLA==
X-CSE-MsgGUID: IEqu0NZmTXyGTjL/M/E1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115634880"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 09:26:02 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Convert pre-GMDID IPs to struct xe_ip
Date: Thu, 20 Feb 2025 14:25:11 -0300
Message-ID: <20250220172532.66613-5-gustavo.sousa@intel.com>
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

We have now a struct xe_ip to fully describe an IP, but we are only
using that for GMDID-based IPs.

For pre-GMDID IPs, we still describe release info (version and name) via
feature descriptors (struct xe_{graphics,media}_desc). Let's convert
those to use struct xe_ip.

With this, we have a uniform way of describing IPs in the xe driver
instead of having different approaches based on whether the IPs use
GMDIDs or not.

A nice side-effect of this change is that now we have an easy way to
lookup, in the source code, mappings between versions, names and
features for all supported IPs.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 60 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_pci_types.h |  8 -----
 2 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8b8111e954c1..c88c2da1e731 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 #define NOP(x)	x
 
 static const struct xe_graphics_desc graphics_xelp = {
-	.name = "Xe_LP",
-	.ver = 12,
-	.rel = 0,
-
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
 	.va_bits = 48,
@@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp = {
 };
 
 static const struct xe_graphics_desc graphics_xelpp = {
-	.name = "Xe_LP+",
-	.ver = 12,
-	.rel = 10,
-
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
 	.va_bits = 48,
@@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
 	.vm_max_level = 3
 
 static const struct xe_graphics_desc graphics_xehpg = {
-	.name = "Xe_HPG",
-	.ver = 12,
-	.rel = 55,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
@@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
 };
 
 static const struct xe_graphics_desc graphics_xehpc = {
-	.name = "Xe_HPC",
-	.ver = 12,
-	.rel = 60,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
 		BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
@@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2 = {
 };
 
 static const struct xe_media_desc media_xem = {
-	.name = "Xe_M",
-	.ver = 12,
-	.rel = 0,
-
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
 };
 
 static const struct xe_media_desc media_xehpm = {
-	.name = "Xe_HPM",
-	.ver = 12,
-	.rel = 55,
-
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
@@ -369,6 +345,13 @@ static const struct xe_device_desc ptl_desc = {
 #undef PLATFORM
 __diag_pop();
 
+static const struct xe_ip pre_gmdid_ips[] = {
+	{ 1200, "Xe_LP", &graphics_xelp },
+	{ 1210, "Xe_LP+", &graphics_xelpp },
+	{ 1255, "Xe_HPG", &graphics_xehpg },
+	{ 1260, "Xe_HPC", &graphics_xehpc },
+};
+
 /* GMDID-based Graphics IPs */
 static const struct xe_ip graphics_ips[] = {
 	{ 1270, "Xe_LPG", &graphics_xelpg },
@@ -380,6 +363,11 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
 };
 
+static const struct xe_ip pre_gmdid_media_ips[] = {
+	{ 1200, "Xe_M", &media_xem },
+	{ 1255, "Xe_HPM", &media_xehpm },
+};
+
 /* GMDID-based Media IPs */
 static const struct xe_ip media_ips[] = {
 	{ 1300, "Xe_LPM+", &media_xelpmp },
@@ -558,12 +546,28 @@ static void handle_pre_gmdid(struct xe_device *xe,
 			     const struct xe_graphics_desc *graphics,
 			     const struct xe_media_desc *media)
 {
-	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
-	xe->info.graphics_name = graphics->name;
+	for (int i = 0; i < ARRAY_SIZE(pre_gmdid_ips); i++) {
+		if (pre_gmdid_ips[i].desc == graphics) {
+			xe->info.graphics_verx100 = pre_gmdid_ips[i].verx100;
+			xe->info.graphics_name = pre_gmdid_ips[i].name;
+
+			break;
+		}
+	}
+
+	xe_assert(xe, xe->info.graphics_verx100);
 
 	if (media) {
-		xe->info.media_verx100 = media->ver * 100 + media->rel;
-		xe->info.media_name = media->name;
+		for (int i = 0; i < ARRAY_SIZE(pre_gmdid_media_ips); i++) {
+			if (pre_gmdid_media_ips[i].desc == media) {
+				xe->info.media_verx100 = pre_gmdid_media_ips[i].verx100;
+				xe->info.media_name = pre_gmdid_media_ips[i].name;
+
+				break;
+			}
+		}
+
+		xe_assert(xe, xe->info.media_verx100);
 	} else {
 		xe->info.media_name = "none";
 	}
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f46426ef8ed8..e9b9bbc138d3 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -9,10 +9,6 @@
 #include <linux/types.h>
 
 struct xe_graphics_desc {
-	const char *name;
-	u8 ver;
-	u8 rel;
-
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
@@ -28,10 +24,6 @@ struct xe_graphics_desc {
 };
 
 struct xe_media_desc {
-	const char *name;
-	u8 ver;
-	u8 rel;
-
 	u64 hw_engine_mask;	/* hardware engines provided by media IP */
 
 	u8 has_indirect_ring_state:1;
-- 
2.48.1


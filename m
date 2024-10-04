Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAA9CF8860
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75510E0CF;
	Fri,  4 Oct 2024 22:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7nV0ZZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7F410E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728079562; x=1759615562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmX/iHEBb4PBl8YQCtLbBlKe7lEd+tmu+fW22LxMzXw=;
 b=W7nV0ZZ+kcrMW4hd6BtEis2AZxePhg8S4rJPDNNqSS3HQcLXkZ/dUlU9
 M23RdtsVfNqxSLsU5FC0BWsfFT8t/mQit+Yb25bM2sTwYQylwLwMQAlc+
 za3B5fat+r070owpo1hW+UdO6t+rbSoDawtQPL9SRCyeLQTZndmFSVW2E
 9nYeo+vvOKLwTi19XLUmJQPIXD9qenE71JuvxelLL5pfNEl2DjkcTQmd1
 B3y8SVNbyk1A8khLpCtZ+BUX+STBPaYEOzCfCVIgZ1Vir3Qw09j/0xoht
 U7HMFw2t/f89xIrijYcqjWitR7+c8HDcrC3uPLRNdq3lQe1s10U8CMsqR A==;
X-CSE-ConnectionGUID: 70POv2byTJiP9V9ecg+4rw==
X-CSE-MsgGUID: WaQF/UZYT++RBCQHjtrd4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30199416"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="30199416"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:02 -0700
X-CSE-ConnectionGUID: rCkl378LQLOHF135HLEt8Q==
X-CSE-MsgGUID: x9c/InlpRHqI4kJWAEslKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74836973"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:06:00 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
Date: Fri,  4 Oct 2024 15:05:46 -0700
Message-ID: <20241004220550.94308-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241004220550.94308-1-matthew.s.atwood@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
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

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

Define a common set of Xe3 feature flags and definitions that will be
used for all platforms in this family.

The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
platform.

Following B-spec details inherited from Xe2 feature flag definition
commit.

Bspec: 58695
 - dma_mask_size remains 46   (not documented in bspec)
 - supports_usm=1             (Bspec 59651)
 - has_flatccs=1              (Bspec 58797)
 - has_4tile=1                (Bspec 58788)
 - has_asid=1                 (Bspec 59654, 59265, 60288)
 - has_range_tlb_invalidate=1 (Bspec 71126)
 - five-level page table      (Bspec 59505)
 - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
 - platform engine mask       (Bspec 60149)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7ffee06fab13..6b2dfe4b305f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -179,6 +179,11 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_xe3 = {
+	.name = "Xe3_LPG",
+	XE2_GFX_FEATURES,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -208,7 +213,7 @@ static const struct xe_media_desc media_xelpmp = {
 };
 
 static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM / Xe2_HPM",
+	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -360,6 +365,8 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
 	{ 2001, &graphics_xe2 },
 	{ 2004, &graphics_xe2 },
+	{ 3000, &graphics_xe3 },
+	{ 3001, &graphics_xe3 },
 };
 
 /* Map of GMD_ID values to media IP */
@@ -367,6 +374,7 @@ static const struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
 	{ 1301, &media_xe2 },
 	{ 2000, &media_xe2 },
+	{ 3000, &media_xe2 },
 };
 
 #define INTEL_VGA_DEVICE(id, info) {			\
-- 
2.45.0


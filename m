Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF19AE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7A810EB00;
	Fri,  6 Sep 2024 21:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQWrMHKl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A00A10EB00
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659522; x=1757195522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cTh2UDWu/BbV5ZZ60HENJN9kk08rqwYGl+soK/f1+Go=;
 b=AQWrMHKl4qpNLL7k3SxpMX14Xh0QUzK+a2ZY5kcq8pBpwvzvIXmWxAaU
 WekTJbBWMEdFhPZhUOqCEh8i+IaHYc1Fw7C8dHA4AFalhwf8dzf3lgcCy
 eVNXvHvuTFzMFmX7mx5hciALVB+2UdLMQE5THyv/1l+ZX5A781KtCH+RP
 UTjMT16bCgy5OL2zstuBkJXEatgY/0Qxrkcygl1sFjpL1tGP/eeF+47KH
 8XASuIA2K6RSlOA9pRl7OWeu/zphBjhbAZECbr6XL6crglPbca2BVFNUU
 kQ0X7W0eNPRQoMKXIYjtZHNXw3PJfG4QZaOss4UmsjgAMHs7KxeezW6g2 Q==;
X-CSE-ConnectionGUID: 7HFVIFsER8acMST+02cewg==
X-CSE-MsgGUID: BnOlekWpRluqM9/R3SAMPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580573"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580573"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:02 -0700
X-CSE-ConnectionGUID: yXQI7//0QUW8L/W0x8JVsA==
X-CSE-MsgGUID: 3g5umH20Rq+OgYfd9ieoIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656321"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:02 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 2/9] drm/xe/xe3: Define Xe3 feature flags
Date: Fri,  6 Sep 2024 14:51:46 -0700
Message-ID: <20240906215153.31210-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

Define a common set of Xe3 feature flags
and definitions that will be used for all
platforms in this family.

The feature flags are inherited unchanged from
Xe2 (XE2_FEATURES) platform.

Following B-spec details inherited from Xe2 feature
flag definition commit.

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
 drivers/gpu/drm/xe/xe_pci.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c05ca61787be..b30d09508a38 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -180,6 +180,25 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+#define XE3_GFX_FEATURES \
+	.dma_mask_size = 46, \
+	.has_asid = true, \
+	.has_atomic_enable_pte_bit = 1, \
+	.has_flat_ccs = true, \
+	.has_range_tlb_invalidation = true, \
+	.has_usm = true, \
+	.va_bits = 48, \
+	.vm_max_level = 4, \
+	.hw_engine_mask = \
+		BIT(XE_HW_ENGINE_RCS0) | \
+		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
+		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
+
+static const struct xe_graphics_desc graphics_xe3 = {
+	.name = "Xe3_LPG",
+	XE3_GFX_FEATURES,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -209,7 +228,7 @@ static const struct xe_media_desc media_xelpmp = {
 };
 
 static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM / Xe2_HPM",
+	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -361,6 +380,8 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
 	{ 2001, &graphics_xe2 },
 	{ 2004, &graphics_xe2 },
+	{ 3000, &graphics_xe3 },
+	{ 3001, &graphics_xe3 },
 };
 
 /* Map of GMD_ID values to media IP */
@@ -368,6 +389,7 @@ static const struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
 	{ 1301, &media_xe2 },
 	{ 2000, &media_xe2 },
+	{ 3000, &media_xe2 },
 };
 
 #define INTEL_VGA_DEVICE(id, info) {			\
-- 
2.44.0


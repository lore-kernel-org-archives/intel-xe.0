Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E0ECED24F
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAD110E352;
	Tue,  8 Oct 2024 01:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9jGi1jB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DB910E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351317; x=1759887317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WBdzxGSqmbyyVi2ooggoWVLFeWU5ltGs01ZhvC5rdEQ=;
 b=C9jGi1jBHOXllsMNNNN/9KX0RivTeQHgD90eZLysB+t+3APBnfVJ/CAa
 hiUxqw5UvzZG4b5uCkSrVJ8OLM0db0VbS+7485omq7kI3LpoxRpzvthBF
 8zx4kW63fT3oqYq1QApCGmqPyfZd7egUmeoQSlAohPbeO1pMRE07HuP1s
 AfkYug0isd+af4qO/lAJoAt1BEDy3DKQ2JZsdtkYtzOvRTIcBPHnyZFwk
 QLJtu3gFdpHdVu5qeeuWoyrhOwCL+z/Urfe4ZrctCN/bsGTHFBLLRawaG
 oSGdbeUIY+4TKv2u27HI5ucxdOMpVp8BZLOW4VaXWFRmoJdubB+KOiYvM Q==;
X-CSE-ConnectionGUID: 2BmsuI8TR6y0jQzBBsPwIg==
X-CSE-MsgGUID: U0ih88WdSHiqAic1afmdxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652974"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:17 -0700
X-CSE-ConnectionGUID: AytfambSTUanemPdKrSqXg==
X-CSE-MsgGUID: a5wPxds3S/uVvm7wXCsZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454300"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:16 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
Date: Mon,  7 Oct 2024 18:35:05 -0700
Message-ID: <20241008013509.61233-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

v2: reuse graphics_xe2 defintion

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
 drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7ffee06fab13..2139edba9062 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -208,7 +208,7 @@ static const struct xe_media_desc media_xelpmp = {
 };
 
 static const struct xe_media_desc media_xe2 = {
-	.name = "Xe2_LPM / Xe2_HPM",
+	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -360,6 +360,8 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
 	{ 2001, &graphics_xe2 },
 	{ 2004, &graphics_xe2 },
+	{ 3000, &graphics_xe2 },
+	{ 3001, &graphics_xe2 },
 };
 
 /* Map of GMD_ID values to media IP */
@@ -367,6 +369,7 @@ static const struct gmdid_map media_ip_map[] = {
 	{ 1300, &media_xelpmp },
 	{ 1301, &media_xe2 },
 	{ 2000, &media_xe2 },
+	{ 3000, &media_xe2 },
 };
 
 #define INTEL_VGA_DEVICE(id, info) {			\
-- 
2.45.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DDAC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 15:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8810E723;
	Wed,  1 Nov 2023 15:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762110E71F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698851697; x=1730387697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dqsAiNBdhzpNxL2hUEkBgbDwERWMIcxNmmz7ge0ooyc=;
 b=iYOIabxACfknqqhIjqmO0SLzWhMZD2bHXcIItnA6DJQuCnAd30sWyb+Q
 UDRYDPLXliGXEccYWP4ZeLXZdMNAiBNlzAiJdHv/bZ55oYKMNH4SYkgFC
 hblMKMDu3IGEmNnm/ZZcY5pVtPLqlgmObXqMf69is1dWybFaK1eC9RqAQ
 dgjG95mBF8+8TKzIukWuoGbEK5fl4sEZabmd6x1Nszp9QZLwrfRcpczzQ
 eDEw9BvIjOWPCa454uW8Wl8bWpZx2Ag7ixBLFL7BmAvjMqSN4zlg8+EWi
 +BTlPSIE5dHIvzpuJdFC5hpsBKSzglkdcjlumJTXHfqtrCk2+fRkGGZWR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378896867"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="378896867"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="831371928"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="831371928"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:14:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 08:15:26 -0700
Message-Id: <20231101151528.1840900-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/i915/lnl: Extend C10/C20 phy
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For Lunar Lake, DDI-A is connected to C10 PHY, while TC1-TC3 are connected
to C20 phy, like in Meteor Lake. Update the check in intel_is_c10phy()
accordingly.

This reverts the change in commit e388ae97e225 ("drm/i915/display:
Eliminate IS_METEORLAKE checks") that turned that into a display engine
version check. The phy <-> port connection is very SoC-specific and not
related to that version.

IS_LUNARLAKE() is defined to 0 in i915 as it's expected that the
(upcoming) xe driver is the one defining the platform, with i915 only
driving the display side.

Bspec: 70818
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231026184045.1015655-2-lucas.demarchi@intel.com
(cherry picked from commit 10184a8a7f70d28ba6aae22142a7375a8c8c1924)
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h              | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index abd607b564f1..2f37b2d670fd 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -31,7 +31,7 @@
 
 bool intel_is_c10phy(struct drm_i915_private *i915, enum phy phy)
 {
-	if (DISPLAY_VER_FULL(i915) == IP_VER(14, 0) && phy < PHY_C)
+	if ((IS_LUNARLAKE(i915) || IS_METEORLAKE(i915)) && phy < PHY_C)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 557b17d1e7a6..98fb68944064 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -574,6 +574,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_DG2(i915)	IS_PLATFORM(i915, INTEL_DG2)
 #define IS_PONTEVECCHIO(i915) IS_PLATFORM(i915, INTEL_PONTEVECCHIO)
 #define IS_METEORLAKE(i915) IS_PLATFORM(i915, INTEL_METEORLAKE)
+#define IS_LUNARLAKE(i915) 0
 
 #define IS_DG2_G10(i915) \
 	IS_SUBPLATFORM(i915, INTEL_DG2, INTEL_SUBPLATFORM_G10)
-- 
2.40.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7F6EE0215
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A853F10E1F7;
	Wed, 13 Sep 2023 23:14:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE67210E1DD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694646890; x=1726182890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HfdIcs6FCBMf7gyebQreHFEruHDaI8PqQBThzbafVYw=;
 b=cwnCtpT725Yag3B7e4gIwv8SVcI1rypVsW6H9xlJSnwow/DpNxW1gFjM
 MKEMFVH63Fv4H6SolxGyQbLOKw/IUFzZDyZPj3cG95vaIug6F0PqvEq8Q
 6i/afThHvoDwCD3Kk03TsCW+MzSFCbW1xgESdFEZtw9BZCDQkKwYrfHeM
 Ux4MP3tP9lvFDW8t5eiGQLoNRafwCc0MXcu7+uRc9TikDfmqHMRzz3ZP0
 JC/zHZ3aQZQ2H9tufTtRImEexfR0BZdDCfa3GR53j552+AkKsNlTdUltZ
 mo8qUNuvDPolOCfWnQ/NScBzsPMaWMJerqQQf30cBI2T2b1Z5ezXzayJj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377714987"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377714987"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773659697"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773659697"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:14:13 -0700
Message-ID: <20230913231411.291933-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/i915: Stop forcing clock gating init for
 future platforms
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the early days of i915, pretty much every platform needed to
initialize _something_ in the clock gating init functions.  In some
cases the items initialized were inside the GT (and really should have
been initialized through the GT workaround infrastructure instead).
In other cases they were display programming (sometimes not even related
to "clock gating" at all!) which probably needs to move inside the
display-specific code.  The number of initialization tasks that are
truly "clock gating" and don't fall within the GT or display domains is
relatively limited.  Let's stop forcing future platforms to always
define a clock gating init hook.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230906234732.3728630-7-matthew.d.roper@intel.com
(cherry picked from commit 7ed888fa78129941255af09eddbf4cc51a3351d1)
---
 drivers/gpu/drm/i915/intel_clock_gating.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c66eb6abd4a2..1f2e2d7087cb 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -835,9 +835,7 @@ CG_FUNCS(nop);
  */
 void intel_clock_gating_hooks_init(struct drm_i915_private *i915)
 {
-	if (IS_METEORLAKE(i915))
-		i915->clock_gating_funcs = &nop_clock_gating_funcs;
-	else if (IS_PONTEVECCHIO(i915))
+	if (IS_PONTEVECCHIO(i915))
 		i915->clock_gating_funcs = &pvc_clock_gating_funcs;
 	else if (IS_DG2(i915))
 		i915->clock_gating_funcs = &dg2_clock_gating_funcs;
@@ -845,7 +843,7 @@ void intel_clock_gating_hooks_init(struct drm_i915_private *i915)
 		i915->clock_gating_funcs = &xehpsdv_clock_gating_funcs;
 	else if (IS_ALDERLAKE_P(i915))
 		i915->clock_gating_funcs = &adlp_clock_gating_funcs;
-	else if (GRAPHICS_VER(i915) == 12)
+	else if (DISPLAY_VER(i915) == 12)
 		i915->clock_gating_funcs = &gen12lp_clock_gating_funcs;
 	else if (GRAPHICS_VER(i915) == 11)
 		i915->clock_gating_funcs = &icl_clock_gating_funcs;
@@ -885,8 +883,6 @@ void intel_clock_gating_hooks_init(struct drm_i915_private *i915)
 		i915->clock_gating_funcs = &i85x_clock_gating_funcs;
 	else if (GRAPHICS_VER(i915) == 2)
 		i915->clock_gating_funcs = &i830_clock_gating_funcs;
-	else {
-		MISSING_CASE(INTEL_DEVID(i915));
+	else
 		i915->clock_gating_funcs = &nop_clock_gating_funcs;
-	}
 }
-- 
2.41.0


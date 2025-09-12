Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAB5CAC58F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716FD10EC8C;
	Fri, 12 Sep 2025 14:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQlO4dkd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649B10EC8A;
 Fri, 12 Sep 2025 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757688587; x=1789224587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wLedpA/LJC4hQUmthq03/oGW1NHKE2vNAp+WI7CEBEg=;
 b=IQlO4dkdrwhbwNEHrDvZQY6YCK02dNl+X10C+yR6aFSfGo71lz9CQhsX
 tuZ0TGcyppB6/3JYndfGib9DP9w5FwffKMcV7Hdv5xAcJBNqoh2w4ORlU
 9TDFkihZVzvo1Jse073HNDPPLHM5SWvQPg3O7HjOVo1J6KYH+G5orHpLJ
 YEuf6EaiDNacvGno+xpLQUkpbWGSk4AgNJHKxu6sS4qQbkUV3QZU1ONMl
 SalPZAWo6KCc6cF4LpJUax+Q112XmqeG04223HwA1odMUfEYISGyYvFkb
 E7TL7bYRgixB3zJBr22SeV7LKmDUYWl+lW2gX9CullFFXwucesV3QOqHZ Q==;
X-CSE-ConnectionGUID: v/4IW8lQT8qD2ag91KmZew==
X-CSE-MsgGUID: QST+1r2ZQcq5WtDykhdHEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="63858232"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="63858232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:49:46 -0700
X-CSE-ConnectionGUID: 2dj6Al+0SMaUVIHxr39lvw==
X-CSE-MsgGUID: jF9bFyk4Tda36MrEz6pawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174424135"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:49:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 michal.grzelak@intel.com
Subject: [PATCH v2 08/15] drm/i915: make vlv_get_cck_clock() static
Date: Fri, 12 Sep 2025 17:48:47 +0300
Message-ID: <bac1fe98d9d458ef30e973f680342b69a6cde4d6.1757688216.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757688216.git.jani.nikula@intel.com>
References: <cover.1757688216.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

vlv_get_cck_clock() is no longer used outside of intel_display.c, make
it static.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_display.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4a19a3ce060c..462771435c4b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -157,8 +157,8 @@ int vlv_get_hpll_vco(struct drm_device *drm)
 	return vco_freq[hpll_freq] * 1000;
 }
 
-int vlv_get_cck_clock(struct drm_device *drm,
-		      const char *name, u32 reg, int ref_freq)
+static int vlv_get_cck_clock(struct drm_device *drm,
+			     const char *name, u32 reg, int ref_freq)
 {
 	u32 val;
 	int divider;
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 9fdbc4ad5391..57b06cad314b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -436,8 +436,6 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state);
 void i830_enable_pipe(struct intel_display *display, enum pipe pipe);
 void i830_disable_pipe(struct intel_display *display, enum pipe pipe);
 int vlv_get_hpll_vco(struct drm_device *drm);
-int vlv_get_cck_clock(struct drm_device *drm,
-		      const char *name, u32 reg, int ref_freq);
 int vlv_clock_get_hrawclk(struct drm_device *drm);
 int vlv_clock_get_czclk(struct drm_device *drm);
 int vlv_clock_get_cdclk(struct drm_device *drm);
-- 
2.47.3


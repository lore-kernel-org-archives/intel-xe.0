Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2BC44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 12:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3440A10F034;
	Wed, 15 Jul 2026 12:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FujN+/ID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1252610F036;
 Wed, 15 Jul 2026 12:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117379; x=1815653379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EMK5Y8+swBHlHMX9nsbSsIrjrxvatLUDCraIvA5CVuE=;
 b=FujN+/IDgk1Z38QNlkdzwXWJInw/He6YUoZaRE00LFCfrx6PzLFkgUxI
 lbd+GTuEWHCuirqqxRhibfDBprk1Ml1wbvN1yUEX88lgSJWI5ZbEb8cbv
 nlsYUxdaFiOtUSQ3CirsjlQ+i4u1gTOhLNzGCepqA7lPT09pvS04rC2HM
 nCbP7O2XT8c3N9PUvuWzeje3PRsMKmHfzj9FjnpHi4BVMlfXxAxPyTVR/
 SFUjj9kBiJRHI6mycQv8TkzFiLSH+CPQMDzfGnCb9x6VqdGwq1sJcsEr2
 nfpgTjtUc2J1DYziNO8VwotZmga8wOIoKf79FBEfIBblr+8DcUrkwQnau Q==;
X-CSE-ConnectionGUID: ho/1C2+YSv2KMSm3InygNw==
X-CSE-MsgGUID: Kv/smVZHQBm7nwpDmE8KMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84778038"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84778038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:09:38 -0700
X-CSE-ConnectionGUID: J1V2qKNQQfSOcUTX+7CVaA==
X-CSE-MsgGUID: Cegjh212TEm0PcrVGXM0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="260461828"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.168])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:09:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/cdclk: Introduce HAS_2PPC()
Date: Wed, 15 Jul 2026 15:09:24 +0300
Message-ID: <20260715120926.10786-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
References: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We'll need to check for the "does the platform do 2 pixels per clock?"
thing in a few places. Add a feature macro for it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 1d7ff2cbaebb..12bb6c414683 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2910,7 +2910,7 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 /* pixels per CDCLK */
 int intel_cdclk_ppc(struct intel_display *display, bool double_wide)
 {
-	return DISPLAY_VER(display) >= 10 || double_wide ? 2 : 1;
+	return HAS_2PPC(display) || double_wide ? 2 : 1;
 }
 
 /* max pixel rate as % of CDCLK (not accounting for PPC) */
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 9aeba329b9bd..7121e7cd9512 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -146,6 +146,7 @@ struct intel_display_platforms {
 	func(supports_tv);
 
 #define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)
+#define HAS_2PPC(__display)		(DISPLAY_VER(__display) >= 10)
 #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
 #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
-- 
2.54.0


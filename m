Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A25C44515
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8FF10E4B3;
	Fri, 17 Jul 2026 15:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdQfzEtW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9C610E4B3;
 Fri, 17 Jul 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302992; x=1815838992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNyhnKOp5sBsFriJOIKqyCPBRxLxdrO7sATLg+TG9tk=;
 b=UdQfzEtWDDP03yQYpy+OHXIL8WnxTkagPrqfBh8SVuCA/brhi5HWZT7M
 RLY0kb2PZHdqdZxfz4eN31Pd7XzXgDY1JqftjMgDzXkInw+mzKzyaHZ/3
 /htmKHccr+f2021jARQaU5VhzA4EFIujFmUdS/QuxC+3yqlhvxNN/tRI+
 yIAlvJud/gaR/EXATuAeeIIiuj4IpqaAichDDElnuCvJvs9SGnISetYdx
 9fowSEK225omaz/TfNzVgsmZhA06O7aNjnyMvgKiAm/D8cs+YiacHuwOM
 bLBmKki5PaTwhNdv8IZ9j2MjGKkS2zPNYam0jjCsWj30WsVYWU2z8k3nE w==;
X-CSE-ConnectionGUID: GbOPgSp0TU6/gDHLXLfT2w==
X-CSE-MsgGUID: R2FCom98TT6kLENhLJI2bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88876576"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88876576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:43:12 -0700
X-CSE-ConnectionGUID: 9v1BZ7HJT1alBgJP87xalw==
X-CSE-MsgGUID: znkDyBXfTNKO2D/iLWdfbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="286885337"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:43:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915: s/dev_priv/i915/ in the initial fb .setup()
Date: Fri, 17 Jul 2026 18:42:38 +0300
Message-ID: <20260717154238.10792-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
References: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
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

Use the modern 'i915' variable name instead of the old 'dev_priv'
in the initial fb .setup().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_initial_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 559e1b98ca2f..b4e7d6e804dc 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -221,10 +221,10 @@ i915_free_initial_plane_obj(struct drm_gem_object *obj)
 
 static void i915_initial_plane_setup(struct drm_device *drm, u64 modifier)
 {
-	struct drm_i915_private *dev_priv = to_i915(drm);
+	struct drm_i915_private *i915 = to_i915(drm);
 
 	if (modifier != DRM_FORMAT_MOD_LINEAR)
-		dev_priv->preserve_bios_swizzle = true;
+		i915->preserve_bios_swizzle = true;
 }
 
 const struct intel_display_initial_plane_interface i915_display_initial_plane_interface = {
-- 
2.54.0


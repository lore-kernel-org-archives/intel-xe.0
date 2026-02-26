Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7108AFC591C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475410E8AB;
	Thu, 26 Feb 2026 10:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrLN0tjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E610E8BB;
 Thu, 26 Feb 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100506; x=1803636506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M74vhuHyqP83ds8CzQ+HHa49ViPw9GSmr819DAGa8KA=;
 b=ZrLN0tjtc0xq13FtDFlCElIgtHjPmN9Kwia3pViXYqzMPwPrtTivzgaR
 UamZ8f+q2T+xlkVd2bXF9XIYFl4VzuGYtHQt96lKujY4ct8IFgpib9HZ0
 NmhqBWU1xNJYTl+vQ0zHyp0hXhG5R5RZNs5bY82e5EC8L3+ZfmBYsLi6S
 zT374m6zN0wVADIDKHPtOLlJ6UjY9CjkgmVjLvbnjNU2YhmsOQHJMaw99
 APc+EY3PxUL8Rfbkyc7BfAyn5humYRPOZLhTTAGCP+wKUOt1eynEjDwoK
 icdFbMsCs7lOpWqlIpN/my18KbowD5v26JBe8WCZoya47eG7GqOH9A3bK A==;
X-CSE-ConnectionGUID: OFxcd1sARzyL9JRDw1JTJQ==
X-CSE-MsgGUID: ppXL07zCQf+aazIu3rqz9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83866909"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83866909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:26 -0800
X-CSE-ConnectionGUID: uMD3p1+ZTPm/Hxwht0gyGA==
X-CSE-MsgGUID: +9F0WFmVS662A2UR3lM3jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216533265"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:23 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 10/19] drm/i915/overlay: Extract i915_overlay_cleanup()
Date: Thu, 26 Feb 2026 12:07:29 +0200
Message-ID: <20260226100738.29997-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
References: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
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

Pull the i915 specific bits of the overlay cleanup into
a separate function (i915_overlay_cleanup()) to accommodate
the upcoming parent vs. display driver split.

For now we'll also have to pass in the overlay struct, but
that will disappear once the i915 vs. display split is completed.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 1b84790a63b2..1edc0ae09c68 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1490,23 +1490,29 @@ bool intel_overlay_available(struct intel_display *display)
 	return display->overlay;
 }
 
-void intel_overlay_cleanup(struct intel_display *display)
+static void i915_overlay_cleanup(struct drm_device *drm,
+				 struct intel_overlay *overlay)
 {
-	struct intel_overlay *overlay;
-
-	overlay = fetch_and_zero(&display->overlay);
-	if (!overlay)
-		return;
-
 	/*
 	 * The bo's should be free'd by the generic code already.
 	 * Furthermore modesetting teardown happens beforehand so the
 	 * hardware should be off already.
 	 */
-	drm_WARN_ON(display->drm, i915_overlay_is_active(display->drm));
+	drm_WARN_ON(drm, i915_overlay_is_active(drm));
 
 	i915_gem_object_put(overlay->reg_bo);
 	i915_active_fini(&overlay->last_flip);
+}
+
+void intel_overlay_cleanup(struct intel_display *display)
+{
+	struct intel_overlay *overlay;
+
+	overlay = fetch_and_zero(&display->overlay);
+	if (!overlay)
+		return;
+
+	i915_overlay_cleanup(display->drm, overlay);
 
 	kfree(overlay);
 }
-- 
2.52.0


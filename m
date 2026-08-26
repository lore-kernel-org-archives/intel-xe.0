Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F134C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04B10ED13;
	Wed, 26 Aug 2026 13:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X91eig6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9476910ED1A;
 Wed, 26 Aug 2026 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751649; x=1819287649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zu2MrAf5F5Xcd76NTVvmP+RW29jCVZlCbqFrgL9Wpyo=;
 b=X91eig6e9FikDEgqplPrpq4KCI0R/bE5b6kPGfbVsTM3jenBMddpGUmJ
 EQ5GUz5KJHIKkiUkqYk2vfPCL/fl4anD2VoX1yslRBdr7J1n26bu7PLQd
 o74+s2Q0F9gxJ5JjX8On0Z8bYHyMnGo/SCsBi4zIpnktkwFhaJHOLJvVR
 vH4ArICUAybrvfU/DsEqpouh0C6M93FEc6WHJXI23u/zUg07t9ckuYwI9
 G8wNxhKbC5dgIUMsPWtBEmOlCapuivqh5UraQlM8mRIqz8X0QeV8JCmXv
 11z9Eg4QqcO4qTj8vRCYas9JFHEgdBbImPgtKK3Y+kIi30JbfGrs56usx A==;
X-CSE-ConnectionGUID: fmpcvWppQWy4HIBwA3+BfQ==
X-CSE-MsgGUID: BdB91dHRSauJJPZ/XtmkgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="90743277"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="90743277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:49 -0700
X-CSE-ConnectionGUID: YB8QFCsFSYquZWjmjI0OOw==
X-CSE-MsgGUID: EzRfcYOrS5GW/kAqtYsBGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="263283738"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 03/14] drm/i915/cdclk: Do the DG2 CDCLK/pipe power well
 notify properly
Date: Wed, 26 Aug 2026 16:40:22 +0300
Message-ID: <20260826134033.13976-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

The pcode post notify needs to happen after the CDCLK has been
changed, not before. Also move the pre_notify call a bit for the
sake of symmetry.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 308bcdd01699..37b1bdaa78d4 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2850,9 +2850,6 @@ intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 				 &new_cdclk_state->actual))
 		return;
 
-	if (display->platform.dg2)
-		intel_cdclk_pcode_pre_notify(state);
-
 	if (new_cdclk_state->disable_pipes) {
 		cdclk_config = new_cdclk_state->actual;
 		pipe = INVALID_PIPE;
@@ -2877,6 +2874,9 @@ intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 
 	drm_WARN_ON(display->drm, !new_cdclk_state->base.changed);
 
+	if (display->platform.dg2)
+		intel_cdclk_pcode_pre_notify(state);
+
 	intel_set_cdclk(display, &cdclk_config, pipe,
 			"Pre changing CDCLK to");
 }
@@ -2905,9 +2905,6 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 				 &new_cdclk_state->actual))
 		return;
 
-	if (display->platform.dg2)
-		intel_cdclk_pcode_post_notify(state);
-
 	if (!new_cdclk_state->disable_pipes &&
 	    new_cdclk_state->actual.cdclk < old_cdclk_state->actual.cdclk)
 		pipe = new_cdclk_state->pipe;
@@ -2918,6 +2915,9 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 
 	intel_set_cdclk(display, &new_cdclk_state->actual, pipe,
 			"Post changing CDCLK to");
+
+	if (display->platform.dg2)
+		intel_cdclk_pcode_post_notify(state);
 }
 
 /* pixels per CDCLK */
-- 
2.54.0


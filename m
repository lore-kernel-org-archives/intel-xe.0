Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ECCC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 19:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DEA10E2E8;
	Thu, 10 Sep 2026 19:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZ/fivwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9F510E2E1;
 Thu, 10 Sep 2026 19:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789069371; x=1820605371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=klvyFzXgrLTJKLBrznEMXsGdZOAaFD8PXpEClS62hes=;
 b=EZ/fivwT3hr9oDnNxqleQ+2mxuNn+NJ7KfIOcMC+Vpjdv20OKwht8111
 lQnFQJEoAaoevlGESdC3z/dbrIzKAko3mwGSivqRP3x0dfk8X6oscLkvD
 TqAZySX1iPXbEAGCoHJCoeluFpCys77HAb0wBadgEVxjkKU8QoqwQtcTq
 YTqT6Ul1wAMvJMrhOYnVlSMp3XG4NuZSxUckLFLCNSEJjjY/a64ow6Z3D
 ICeaO9b7d5k2SkLXtUfctxAV6hkWST7qC5vJwcToyHp9IJgKBtmA01dPs
 okL8QTMqFivyVyfRzYhFZSa0JVuX4nwpSrLZO8Qp3TevD9gFaOPUr36oG w==;
X-CSE-ConnectionGUID: br+y9SG9RbK7NMfOwb9X8A==
X-CSE-MsgGUID: Elc373QVSYyUQzBmSh0aWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92041698"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92041698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:50 -0700
X-CSE-ConnectionGUID: 7wLxMyHsToe5mtBjdsMqBg==
X-CSE-MsgGUID: mwlbDLMjRBO2hVwFKpTxpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="276959666"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH 2/4] drm/i915/display: use struct intel_atomic_state *state
 variable naming
Date: Thu, 10 Sep 2026 22:42:34 +0300
Message-ID: <988f1253004e68d565f3915cbd24182ca95dee49.1789069102.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789069102.git.jani.nikula@intel.com>
References: <cover.1789069102.git.jani.nikula@intel.com>
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

The struct intel_atomic_state * pointer variables and parameters are
named "state" everywhere. Follow suit in
intel_atomic_commit_fence_wait().

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 579b03034c46..1c2e50c6d98a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7288,14 +7288,14 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	drm_WARN_ON(display->drm, update_pipes);
 }
 
-static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
+static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 {
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	long ret;
 	int i;
 
-	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
+	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
 		if (new_plane_state->fence) {
 			ret = dma_fence_wait(new_plane_state->fence, false);
 			if (ret < 0)
-- 
2.47.3


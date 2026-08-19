Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB23C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283710E5DA;
	Wed, 19 Aug 2026 14:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGQwuaWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E112F10E57E;
 Wed, 19 Aug 2026 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148333; x=1818684333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LZ35bmQwrts4STloih14zY3amvjBfXS1vY7v4h0wAOY=;
 b=eGQwuaWMlXL3Y31W82Y5/zIjQM3iWIZGNhsB6xVbhZn4SbTNN8zpzmAi
 XoT9fa51o6EMmZFDGBfUvRCq74LrLd7AC8LHkXXZ8xscmVjcPm3PD6Uae
 C3Np+K4fHoH0IgSmYJW26DPAIIwSclCZus4Rw+ko0EwguP8aa79tuP2mK
 qHSUkgxHUqlK1qh4sYDhCJYCNRSWlalnV1uynshU7HujwCx4Ems7BWR1B
 CUr5nidE44VWOE9GrQJPvMwifrSIXzPtbG1mFz9B2J3uCUw/aJGztXVje
 +FU2y3IFpyrkK44eUM0AcQu+mQSgO85z7lGjkrNY5HUnppkFEXIcNRNKP Q==;
X-CSE-ConnectionGUID: eYtKBHFoTZa2uCzdZ5qRVQ==
X-CSE-MsgGUID: XAzFrnPURp+O8DHEtWtJOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87582440"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87582440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:33 -0700
X-CSE-ConnectionGUID: rC8q+p0VRTa05qi+C2ZQEw==
X-CSE-MsgGUID: IhuZlQfGRiSXALDFcrloYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="259393290"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 3/4] drm/i915/display: debug log about fence wait timeouts and
 other errors
Date: Wed, 19 Aug 2026 17:05:12 +0300
Message-ID: <6e6531be9fb529b59ceca8aa0194a3d73abd0808.1787148235.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787148235.git.jani.nikula@intel.com>
References: <cover.1787148235.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Currently there's no indication if fence wait timed out. Debug log about
timeouts and other errors.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index eed906a30749..aa5d41dac8a9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7274,6 +7274,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 
 static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	long ret;
@@ -7285,8 +7286,13 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 
 		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
 					     i915_fence_timeout());
-		if (ret <= 0)
+		if (!ret)
+			ret = -ETIMEDOUT;
+		if (ret < 0) {
+			drm_dbg_kms(display->drm, "[PLANE:%d:%s] fence wait failed (%pe)\n",
+				    plane->base.id, plane->name, ERR_PTR(ret));
 			break;
+		}
 
 		dma_fence_put(new_plane_state->fence);
 		new_plane_state->fence = NULL;
-- 
2.47.3


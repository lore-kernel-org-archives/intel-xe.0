Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20847C61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD8510EFEC;
	Thu, 27 Aug 2026 12:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0tFJRD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A159410EFEC;
 Thu, 27 Aug 2026 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834126; x=1819370126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTmBNKYpDAc21nAtB7Y0eD7Wexewn8Sd09pZcAaSlPI=;
 b=D0tFJRD4nt6e1PWszxl0C/+it5bDvq4oeH8MA35x3/3uuHSYoERr7jMx
 /1IPYh451wFoKeDN8g1+mVjNmE13x7/oamHob5SxuB1DEPb7TE5x8bdh7
 a5gY4NmZsZOd9JpqjpJrXA+KCicQIbk/y2UIPq8HrKpFgbhouYtXL3EDY
 XW8lMBRD3l9fID1Uu7MtVi6vXmQGCDiSTuTyckwqlFsW41O/dr0N2Uj65
 P3xEgrNJ9G94yPT2oxyO7cPkCndlNcAgOlPnsm+yEZEU0Z4wpGN4lnAeu
 /SsysK1zFZo9Kv3zdA7qnKoRHrtwk1aM0MvRtfv2CkVJtvI6cyIMDo+rG w==;
X-CSE-ConnectionGUID: EB7GaqK/QTmIW2CC4BntdQ==
X-CSE-MsgGUID: mVAr2OA8RaOfpYA7/Mynkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105853463"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="105853463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:26 -0700
X-CSE-ConnectionGUID: yBTUHfoBSL6UoS9L6fKS3g==
X-CSE-MsgGUID: KFiCXJhPR8mfKh+f8kBDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291370697"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 5/7] drm/i915/display: debug log about fence wait timeouts
 and other errors
Date: Thu, 27 Aug 2026 15:34:55 +0300
Message-ID: <eb862a07865dfbac20cb18c268ace1a003ca53f5.1787833879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787833879.git.jani.nikula@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
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

Currently there's no indication if fence wait timed out. Debug log about
timeouts and other errors.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
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


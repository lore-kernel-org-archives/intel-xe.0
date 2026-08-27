Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448C8C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C9110E32D;
	Thu, 27 Aug 2026 12:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhkZCIp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E63910EFD6;
 Thu, 27 Aug 2026 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834130; x=1819370130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BaqlGNzRuT3bApWbR6D2SzOAZbLMMcokWq6ZzeqsrYk=;
 b=LhkZCIp2vv4ZooHGH3ZhfnqHCDx0Pqb5MRphYqvyquJBQUwFVLVT5wSP
 hYlPxo056SXNwztP0al4tqDVc0Fc4oOTDoNGb0+obSJBRu2t3VHrHzmUh
 HhFmdbqafX8Wb3E0T/YU91B3+HCv1L2fYFa9ZHx7+pDY1hl1ro0MI17Sc
 pHREy9Py+CbSdN/4FQNIxUO8eOQvnV0GX6yTMwd13qzAhfUR1Wi8EJAWO
 iWSD/YsbYaFxgT4XQNueTDNijY9/9XCeAKlUQlvI6az+v1mSrotzJHy7U
 fJcz1b6dXeu4pWjFFx1Nq5sihTQYFcL3FZGOjJY8v4p725BmU0Hlq/klB Q==;
X-CSE-ConnectionGUID: GIY0nKl+RLywNOiyIKCqvw==
X-CSE-MsgGUID: TAzOLXmnR/iqcHbTj07I5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105853465"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="105853465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:30 -0700
X-CSE-ConnectionGUID: SsvNvTTrRuqgI1wjOHf3lQ==
X-CSE-MsgGUID: FGiYzz3aQo28AYTcROED7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291370701"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 6/7] drm/i915: only timeout on fence waits for display reset
Date: Thu, 27 Aug 2026 15:34:56 +0300
Message-ID: <bae61991e23be3bd8b16b7cab7d623f53c10a984.1787833879.git.jani.nikula@intel.com>
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

As written by Maarten: Not waiting on fences until they're signaled is
an existing issue in i915, and was added as a workaround for a deadlock
when GPU reset has to reset display as well on old platforms. This
requires a modeset to disable everything, which may hang since it could
wait on a fence that may only be signaled after GPU reset completes.

Limit the timeout on fence waits a) to platforms where GPU reset
clobbers display, and b) when we're running forced display reset tests.

This change only impacts i915, as xe has MAX_SCHEDULE_TIMEOUT in any
case.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aa5d41dac8a9..76ec9161aaa3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -74,6 +74,7 @@
 #include "intel_display_driver.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
+#include "intel_display_reset.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
@@ -7277,15 +7278,20 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 	struct intel_display *display = to_intel_display(state);
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
-	long ret;
+	long timeout, ret;
 	int i;
 
+	if (intel_display_reset_needed_after_gpu_reset(display) ||
+	    intel_display_reset_test(display))
+		timeout = i915_fence_timeout();
+	else
+		timeout = MAX_SCHEDULE_TIMEOUT;
+
 	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
 			continue;
 
-		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
-					     i915_fence_timeout());
+		ret = dma_fence_wait_timeout(new_plane_state->fence, false, timeout);
 		if (!ret)
 			ret = -ETIMEDOUT;
 		if (ret < 0) {
-- 
2.47.3


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5705C79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 19:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBB010E2F6;
	Thu, 10 Sep 2026 19:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWHmITT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848AA10E2F7;
 Thu, 10 Sep 2026 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789069374; x=1820605374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZmJtNjf9X/vwO3mmp6Snh0TmM584dpY7mjntNqn9wZI=;
 b=MWHmITT+VoDqBgBzPXRyOXBT4rkih666NCapcqajHi+mSLaHzyGN7gzn
 tOQTTQHQs+XcRkCANyVIbkX5h6+7772nufy+wcQrcssbqCzolj//XTOi4
 ya/UQRVcNcM5mOg6wh+73cT77i/7V+nlWWtYIGIke8hjPZC0/oDu+TJn7
 Z+RHLVuZusrYL+1N07XbmT9Wr66i9EQaV4nN5Mr0dK++U9ZFq+qNavC1i
 dPrP4eafEyvoeTsEZxDrfUy8n/6NMxmA2QOIrbVR4PFb4u9vg1dk+5N7E
 KVOExsWCfgJPUq15Gi6MPfhMBtf9V6LsdmUro9ooYx9fYLPohGf0RIpdS g==;
X-CSE-ConnectionGUID: 3HDSfsg/Sv2DBYLS8pw1aw==
X-CSE-MsgGUID: DT+nSR1US/Oo2KXrt3dCYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92041700"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="92041700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:54 -0700
X-CSE-ConnectionGUID: L4IqkLy2TCehFJtYhzrmxQ==
X-CSE-MsgGUID: Z7kG6YZSQpK84H78itwF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="276959674"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH 3/4] drm/i915/display: reduce indent in
 intel_atomic_commit_fence_wait()
Date: Thu, 10 Sep 2026 22:42:35 +0300
Message-ID: <8ee588437fb214a20c57d8c181f28c57b81cacaa.1789069102.git.jani.nikula@intel.com>
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

Continue early in the loop for no fence in order to reduce indent.

v2: Rebase

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Tip: 'git show -w' for easy review
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 1c2e50c6d98a..983e84bca1ee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7296,14 +7296,15 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 	int i;
 
 	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
-		if (new_plane_state->fence) {
-			ret = dma_fence_wait(new_plane_state->fence, false);
-			if (ret < 0)
-				break;
+		if (!new_plane_state->fence)
+			continue;
 
-			dma_fence_put(new_plane_state->fence);
-			new_plane_state->fence = NULL;
-		}
+		ret = dma_fence_wait(new_plane_state->fence, false);
+		if (ret < 0)
+			break;
+
+		dma_fence_put(new_plane_state->fence);
+		new_plane_state->fence = NULL;
 	}
 }
 
-- 
2.47.3


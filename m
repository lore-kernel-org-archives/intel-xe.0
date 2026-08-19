Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFB1C5DF86
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122DD10E576;
	Wed, 19 Aug 2026 14:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYQwbbTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FF910E576;
 Wed, 19 Aug 2026 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148327; x=1818684327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QUG9yvA7TsWK4DKoFpKoJ5XgkfJBPNi1D6NWxYNNOA8=;
 b=SYQwbbTuwTVgvI8kIXOoGt8cStII+/00Gv4Z+ASDkUNYVOYOtnu3+fqX
 oh0EF0yfbZjp/6QFrGSVyd12rxAJPISVI5M4RHt/TyGhXJfW1iW/r7mH+
 o3D5T7V7m0oHwYo6z0GaUHtq5/XC1ZYr97+BRF85q+TBpluDEvdBiKmlY
 KWOxRvdpBqf0lG4dTI39RaQs383vkNJTBCksiXfNd6m3AgjZtgQT/Ewy/
 0d4Sxf0U59kbsd07BqNEMFP7IDwwVpPMnrDeHR5dBScNa6/Xt5WYXTgZv
 Lm7+DkPUJn8xEmNWwnAlxCd9FrA9IyDag317Xfc2yzxookNfq4Ny4Ohw8 A==;
X-CSE-ConnectionGUID: exTivk5WRH6Ts9xj72dVWQ==
X-CSE-MsgGUID: s8Ttk4/DSuWybKMd8J9a0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87582416"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87582416"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:26 -0700
X-CSE-ConnectionGUID: zi5YX+5gRzuLrc9R7uP9ug==
X-CSE-MsgGUID: CU44gYdKS7OqQExBxdFQtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="259393275"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 2/4] drm/i915/display: reduce indent in
 intel_atomic_commit_fence_wait()
Date: Wed, 19 Aug 2026 17:05:11 +0300
Message-ID: <80ac31b402fe214551b42f667614511adbec55dd.1787148235.git.jani.nikula@intel.com>
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

Continue early in the loop for no fence in order to reduce indent.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Tip: 'git show -w' for easy review
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 12916e313821..eed906a30749 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7280,15 +7280,16 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 	int i;
 
 	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
-		if (new_plane_state->fence) {
-			ret = dma_fence_wait_timeout(new_plane_state->fence, false,
-						     i915_fence_timeout());
-			if (ret <= 0)
-				break;
+		if (!new_plane_state->fence)
+			continue;
 
-			dma_fence_put(new_plane_state->fence);
-			new_plane_state->fence = NULL;
-		}
+		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
+					     i915_fence_timeout());
+		if (ret <= 0)
+			break;
+
+		dma_fence_put(new_plane_state->fence);
+		new_plane_state->fence = NULL;
 	}
 }
 
-- 
2.47.3


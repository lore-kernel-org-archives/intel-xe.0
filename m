Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF97FF8874
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360E810EC90;
	Tue, 28 Apr 2026 14:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QskWz6D7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4E10EBE1;
 Tue, 28 Apr 2026 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386071; x=1808922071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eioWoQujhyzDkDqDJMJvBv0YNTPKizO7Vnj/lxbygfc=;
 b=QskWz6D7pyvkaNCWSTOM9lWR2Pz974pHb7QtmOxZypyTKN8bKoJWiJvB
 rrTLzuFuDFyDpI4viPKFpE9O7IdLhJRfv3vS5eIdeepyVX2/hid+NunQR
 M8ftAlM2jWG+EPyIw6FFUwDh9t/NOf7Bsm+ZKifBDDPq/26Wbuiuiop80
 PmGhRsESDEKfMgUqZyQvqN0AJFGklhL8OyRdGsHa5iJW10apezWVAKjm7
 g8613NcL9+u477xFqmkImFjxZiDGxqaVhyDs1GmuvHA4aIof2Gqek8+iq
 jLNUlXfTDIyZ5nyst6b5kXFTnbuvWUhCSvmCCV5ArgCgOFANEUHCWL4/8 g==;
X-CSE-ConnectionGUID: eo2jRDCnTxiHb9lKvOvzAQ==
X-CSE-MsgGUID: Pt/QkJtxRs65UO94noDL7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89756392"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89756392"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:21:10 -0700
X-CSE-ConnectionGUID: dCSZzpNRTA+zhmazwgXFCA==
X-CSE-MsgGUID: D6BjZI0LQviRxP1UBNs2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227445440"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 07:21:09 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/6] drm/i915/cursor: Program secondary cursor planes
Date: Tue, 28 Apr 2026 19:46:38 +0530
Message-Id: <20260428141639.2373678-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428141639.2373678-1-nemesa.garg@intel.com>
References: <20260428141639.2373678-1-nemesa.garg@intel.com>
MIME-Version: 1.0
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

During the vblank-evade, program all joined cursor
planes using intel_plane_update_noarm()/intel_plane_update_arm()
or intel_plane_disable_arm() based on plane visibility.

V2: Check primary and secondary pipe together. [Ville]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 71795f4dfc3f..d1a70650b9b0 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1072,11 +1072,20 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		local_irq_disable();
 	}
 
-	if (new_plane_state->uapi.visible) {
-		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
-		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
-	} else {
-		intel_plane_disable_arm(NULL, plane, crtc_state);
+	for (int i = 0; i < num_pipes; i++) {
+		const struct intel_crtc_state *pipe_crtc_state =
+						pipe_crtc_states[i];
+
+		if (new_pipe_states[i]->uapi.visible) {
+			intel_plane_update_noarm(NULL, pipe_planes[i],
+						 pipe_crtc_state,
+						 new_pipe_states[i]);
+			intel_plane_update_arm(NULL, pipe_planes[i],
+					       pipe_crtc_state,
+					       new_pipe_states[i]);
+		} else {
+			intel_plane_disable_arm(NULL, pipe_planes[i], pipe_crtc_state);
+		}
 	}
 
 	local_irq_enable();
-- 
2.25.1


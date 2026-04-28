Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183FDFF886F
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D303210EC6D;
	Tue, 28 Apr 2026 14:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IudDDNsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F91B10EBB7;
 Tue, 28 Apr 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386068; x=1808922068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BV5TQKjQiPujyudnskFS6bc8p6Uz/sPqQkr7rzn/fWc=;
 b=IudDDNsCSOBFAs+igDs4ujw0aKODB4ti7NOeX6xOGtlsjdePizdk4tVY
 /QE8gfKa0ySnwcKkak7n8Wzsll/GXxhq6cztPFVflsZzzJW5WjSFJZiup
 bqubeCCjtdtrepyOY+tsuHKZlWKUcK2vSbQWhoKeN6ZlRrO6NRLTyF/wg
 M3RYhNOkBPYZj0/OapCrWq+YOY7qTDFVoHclU7axEJoTxemKGwKmhsw5s
 Dnsjjq0oD15Gil28s096bKrdOG00RSEudhRWQaX2i9WDchGC16qaOxLyK
 YBcQi01SRuJ+GIe65fybaGz9MbaqgMlImhwDNUdxPKNxTR63RsFQdVT8G Q==;
X-CSE-ConnectionGUID: 9r9Ivev6TxeSF1hDrND9ZQ==
X-CSE-MsgGUID: GJvVo2WvRoq8mAPJsezbAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89756383"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89756383"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:21:05 -0700
X-CSE-ConnectionGUID: SaISIy4pTyGHX9AF0cUCvg==
X-CSE-MsgGUID: diQtvxMwQOSTtolFgCj9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227445414"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 07:21:04 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit status
Date: Tue, 28 Apr 2026 19:46:34 +0530
Message-Id: <20260428141639.2373678-2-nemesa.garg@intel.com>
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

In joiner mode, secondary cursor commits may still be running
even when the primary cursor commit is done.
Check all joined cursor commit status before taking the fast path.
If any commit is still pending, fallback to slow path.

v2: Use intel_crtc_joined_pipe_mask(). [Ville]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 26 +++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 18d1014de361..f4db795448bf 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -13,6 +13,7 @@
 #include <drm/drm_vblank.h>
 
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_cursor_regs.h"
 #include "intel_de.h"
@@ -797,6 +798,27 @@ void intel_cursor_unpin_work(struct kthread_work *base)
 	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
 }
 
+static bool
+intel_cursor_joiner_commits_idle(struct intel_display *display,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *pipe_crtc;
+
+	for_each_intel_crtc_in_pipe_mask(display->drm, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_plane *pipe_plane =
+					intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+		struct intel_plane_state *pipe_plane_state =
+					to_intel_plane_state(pipe_plane->base.state);
+
+		if (pipe_plane_state->uapi.commit &&
+		    !try_wait_for_completion(&pipe_plane_state->uapi.commit->hw_done))
+			return false;
+	}
+
+	return true;
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -843,6 +865,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    !try_wait_for_completion(&old_plane_state->uapi.commit->hw_done))
 		goto slow;
 
+	/* Check all joined pipes for pending commits */
+	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
+		goto slow;
+
 	/*
 	 * If any parameters change that may affect watermarks,
 	 * take the slowpath. Only changing fb or position should be
-- 
2.25.1


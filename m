Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F791F94CDB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 07:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106F510E26B;
	Wed, 22 Apr 2026 07:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAdQr+0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABE110E152;
 Wed, 22 Apr 2026 07:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776843673; x=1808379673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lAGgIKdY80jJhxlZW/2SmJn6ugjKuJy8Ul2C2CIenMk=;
 b=YAdQr+0WYQRkIKXq/RLVC7HzBsn9pyFrXoti9P+IcyptoKF05lW2/e9M
 N18V+WBcZjz7KqL56JLlvt7dsi65JBcnEPgRfCTrmmqUX7tyiRPLFkfiO
 0h/GPt0tKl0EmPXt5V9bZjC2r//QImDTh0MEaiiDHfWRttHpTfJWSu/QH
 jVJIG0cM1wAQ9c+zcJDCqDcTb25MNT5iiif6l/4Ed9+SwQz8FYZlC5k0S
 zZG6hhpJFcADS+dbKB3iMiro+NMvdTRdyyWIOFSIG+/2RQjrc/RkCCxNp
 oQLYjc/zFp/eMwPm7IxAQVYqSZmZ/z/3Ezonaq+1m0NfupiiV7L/ZFd8a g==;
X-CSE-ConnectionGUID: 4vAjK+ghRqW8dki0GZCuRQ==
X-CSE-MsgGUID: OaNe4k60Q2icJMgRJdrH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89177158"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89177158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:41:13 -0700
X-CSE-ConnectionGUID: DHiCZaHBSxG3TUIKPHoaCg==
X-CSE-MsgGUID: UcX/ZLq8TnSi//JEIFR0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229114678"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 00:41:12 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit status
Date: Wed, 22 Apr 2026 13:07:17 +0530
Message-Id: <20260422073722.1861494-2-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260422073722.1861494-1-nemesa.garg@intel.com>
References: <20260422073722.1861494-1-nemesa.garg@intel.com>
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
Check secondary cursor commit status before taking the fast path.
If any secondary commit is still pending, fallback to slow path.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 18d1014de361..609915c798ba 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -13,6 +13,7 @@
 #include <drm/drm_vblank.h>
 
 #include "intel_atomic.h"
+#include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_cursor_regs.h"
 #include "intel_de.h"
@@ -797,6 +798,30 @@ void intel_cursor_unpin_work(struct kthread_work *base)
 	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
 }
 
+static bool
+intel_cursor_joiner_commits_idle(struct intel_display *display,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *secondary_crtc;
+	u8 secondary_pipes = intel_crtc_joiner_secondary_pipes(crtc_state);
+
+	if (!secondary_pipes)
+		return true;
+
+	for_each_intel_crtc_in_pipe_mask(display->drm, secondary_crtc, secondary_pipes) {
+		struct intel_plane *secondary_plane =
+					intel_crtc_get_plane(secondary_crtc, PLANE_CURSOR);
+		struct intel_plane_state *secondary_plane_state =
+					to_intel_plane_state(secondary_plane->base.state);
+
+		if (secondary_plane_state->uapi.commit &&
+		    !try_wait_for_completion(&secondary_plane_state->uapi.commit->hw_done))
+			return false;
+	}
+
+	return true;
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -843,6 +868,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    !try_wait_for_completion(&old_plane_state->uapi.commit->hw_done))
 		goto slow;
 
+	/* For joiner case also do the same thing as above */
+	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
+		goto slow;
+
 	/*
 	 * If any parameters change that may affect watermarks,
 	 * take the slowpath. Only changing fb or position should be
-- 
2.25.1


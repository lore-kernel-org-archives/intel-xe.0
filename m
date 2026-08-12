Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFE9C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 21:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9154710F133;
	Wed, 12 Aug 2026 21:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEj7Dgv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEF510F145;
 Wed, 12 Aug 2026 21:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786571736; x=1818107736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FOg1L5wFGlo/u2Epu58SyFd88mygrvBWFptaUJ7Xmr0=;
 b=GEj7Dgv03AkTzyk9qT2MjnE3qx/b8cs3vviKHu93nc8E28/Cg65BUnez
 GVXDxlfFfJ9HPdFN7JoYX0jmh2CJB06OwrnZEuy556NyJgoUsB4uftqCh
 ibqPm3YAWuC8Uu844uPPgPxZvGxijgGRpCCi3zKdZ8X/tSQGHofQWI41T
 VZotco5vqqccEwnqwI2hmRcU9euiH1zP2oZ6LCZyE4cCMDnowZb02Zu1U
 GOXbszu//lPU+E7+kC/hbK/VPgJ4BW2rtbPh3+WrSWrhAbeEPvDcewmOY
 WgZNCiN0ZCmZVBK0AWhhfHLd3QO/ZBEFRNctq+/k2FWyfDNN7c4OapVO3 g==;
X-CSE-ConnectionGUID: JQizlRCoTxO2O4pp+nSN5g==
X-CSE-MsgGUID: JKapa9BTQFqRGgTY8UgEMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97803707"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="97803707"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 14:55:35 -0700
X-CSE-ConnectionGUID: avZUHV8bTaWIrA6s09rXsg==
X-CSE-MsgGUID: 6B7bEcBJSl+H/ApaJWtZJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="260456797"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 14:55:35 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com
Subject: [PATCH 1/2] drm/i915/fbc: fbc_dirty_rect restrictions and logging
Date: Wed, 12 Aug 2026 14:53:49 -0700
Message-Id: <20260812215350.3753102-2-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260812215350.3753102-1-austin.hu@intel.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
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

From: Charlton Lin <charlton.lin@intel.com>

Clamp the FBC dirty rectangle coordinates to the valid frame buffer
range [y_offset, y_end] to prevent out-of-bounds coordinates, and
log a debug message when clamping occurs.

Signed-off-by: Charlton Lin <charlton.lin@intel.com>
Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 39 ++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index f61b4a218d6e..c0fed695af0d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1521,11 +1521,14 @@ __intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
 			       const struct intel_crtc_state *crtc_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
+	struct intel_display *display = to_intel_display(plane_state);
 	struct intel_fbc *fbc = plane->fbc;
 	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
 	int width = drm_rect_width(&plane_state->uapi.src) >> 16;
+	int height = drm_rect_height(&plane_state->uapi.src) >> 16;
 	const struct drm_rect *damage = &plane_state->damage;
 	int y_offset = plane_state->view.color_plane[0].y;
+	int y_end = y_offset + height;
 
 	lockdep_assert_held(&fbc->lock);
 
@@ -1535,11 +1538,41 @@ __intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
 		return;
 	}
 
-	if (drm_rect_visible(damage))
-		*fbc_dirty_rect = *damage;
-	else
+	if (drm_rect_visible(damage)) {
+		int y1, y2;
+
+		if (plane_state->hw.rotation & DRM_MODE_ROTATE_180) {
+			/* Under 180 degree rotation, coordinate system is inverted */
+			int inv_y1 = height - damage->y2;
+			int inv_y2 = height - damage->y1;
+
+			y1 = clamp(y_offset + inv_y1, y_offset, y_end);
+			y2 = clamp(y_offset + inv_y2, y_offset, y_end);
+		} else {
+			y1 = clamp(damage->y1, y_offset, y_end);
+			y2 = clamp(damage->y2, y_offset, y_end);
+		}
+
+		/*
+		 * Clamp dirty rect to the valid FB range [y_offset, y_end].
+		 * Per Bspec:
+		 *   start_line >= y_offset
+		 *   end_line <= y_offset + plane_height
+		 */
+		if (y1 != damage->y1 || y2 != damage->y2)
+			drm_dbg_kms(display->drm,
+				    "[PLANE:%d:%s] FBC dirty rect out of range: y1=%d y2=%d clamped to y1=%d y2=%d (y_offset=%d y_end=%d)\n",
+				    plane->base.base.id, plane->base.name,
+				    damage->y1, damage->y2, y1, y2, y_offset, y_end);
+
+		fbc_dirty_rect->x1 = damage->x1;
+		fbc_dirty_rect->x2 = damage->x2;
+		fbc_dirty_rect->y1 = y1;
+		fbc_dirty_rect->y2 = y2;
+	} else {
 		/* dirty rect must cover at least one line */
 		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, 1);
+	}
 }
 
 void
-- 
2.34.1


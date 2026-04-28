Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC69FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC6410EBD1;
	Tue, 28 Apr 2026 14:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY+EtWGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6610EBC3;
 Tue, 28 Apr 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386069; x=1808922069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cw06jwuqBd7nlQNPdY3g1V/Nv3sXabjKK8ZO7ImfNHE=;
 b=iY+EtWGOKr3wo2i0gv60tG6RwV8Q3TnuSn5Yx3f66Qlx47ehduaLfQJp
 DzPBNjZ6WpRliuwbfDPynzY46bAYcnXXlaow+bHugLMYMiCSYe4s9M0D4
 ekqjxeAi8Uye9ajcmiqjxPIwNLSiz/EZk47jYnjsLXbcHcUTcfAlAUfAF
 EygZLbgELVcrs71m9LOss4fn6jPwSwgGJarosHQZ9ShxlRry5vc/8wkZF
 J6Dn1tpslOXZNwRHl8IuP5UiELyUIm1TcJZAf91QnZKayDnv8d91iovVD
 IscBYxG2N7MJtvsYgyHn+YykzS6UWf4wfEaS9dOQvdOvPyB4RcW1+kTyo Q==;
X-CSE-ConnectionGUID: nwNDvTXCSsWwImtTj1wXDQ==
X-CSE-MsgGUID: iErFmkkNTlWlVX3dRIssZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89756384"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89756384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:21:06 -0700
X-CSE-ConnectionGUID: taXE5kMxRWaZyFymmdZ3Ng==
X-CSE-MsgGUID: DlFPQkhJQTimcixq8Gzf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="227445419"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2026 07:21:05 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 2/6] drm/i915/cursor: Add helper to update cursor plane
Date: Tue, 28 Apr 2026 19:46:35 +0530
Message-Id: <20260428141639.2373678-3-nemesa.garg@intel.com>
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

Move cursor fast path plane state update into helper
function.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 41 +++++++++++++++------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index f4db795448bf..5871881d93b4 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -819,6 +819,31 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
 	return true;
 }
 
+static void
+intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
+					 struct drm_framebuffer *fb,
+					 struct drm_crtc *uapi_crtc,
+					 struct intel_crtc *hw_crtc,
+					 int crtc_x, int crtc_y,
+					 unsigned int crtc_w, unsigned int crtc_h,
+					 u32 src_x, u32 src_y,
+					 u32 src_w, u32 src_h)
+{
+	drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
+
+	plane_state->uapi.crtc = uapi_crtc;
+	plane_state->uapi.src_x = src_x;
+	plane_state->uapi.src_y = src_y;
+	plane_state->uapi.src_w = src_w;
+	plane_state->uapi.src_h = src_h;
+	plane_state->uapi.crtc_x = crtc_x;
+	plane_state->uapi.crtc_y = crtc_y;
+	plane_state->uapi.crtc_w = crtc_w;
+	plane_state->uapi.crtc_h = crtc_h;
+
+	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, hw_crtc);
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -892,18 +917,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		goto out_free;
 	}
 
-	drm_atomic_set_fb_for_plane(&new_plane_state->uapi, fb);
-
-	new_plane_state->uapi.src_x = src_x;
-	new_plane_state->uapi.src_y = src_y;
-	new_plane_state->uapi.src_w = src_w;
-	new_plane_state->uapi.src_h = src_h;
-	new_plane_state->uapi.crtc_x = crtc_x;
-	new_plane_state->uapi.crtc_y = crtc_y;
-	new_plane_state->uapi.crtc_w = crtc_w;
-	new_plane_state->uapi.crtc_h = crtc_h;
-
-	intel_plane_copy_uapi_to_hw_state(new_plane_state, new_plane_state, crtc);
+	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
+						 &crtc->base, crtc,
+						 crtc_x, crtc_y, crtc_w, crtc_h,
+						 src_x, src_y, src_w, src_h);
 
 	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
 						  old_plane_state, new_plane_state);
-- 
2.25.1


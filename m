Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148D5F94CDE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 07:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC8010E889;
	Wed, 22 Apr 2026 07:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnOh8L4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC8B10E81D;
 Wed, 22 Apr 2026 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776843678; x=1808379678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=544/d/RuzBOgqeQMWgz6Zv4XCQyLKhoSS4Dy/UGgLa0=;
 b=MnOh8L4snpiFXfHjPZ/VDKLbdhlPvpVYys+IPz/jEthmpcbq8fLBnv9l
 hnJBH8NloGVzij1eoe0gu28V8JJ8RHsKrBCNbWmWYIS4GIMoM7gq5nOFy
 tyntr7hrdoebDJnTRTtSnR/6Ul9GELljtJovzEcI4LV6zvMcz15Sw8yCg
 tQV6+Yc2LPqlBjehbXVs0X06JnBH3ePyNglii+K/CxjdE0wQC0mS8jzx3
 7Q0S4ZH+5AQSxJahkI1386kWr2uQ9VPo7ZOWIV2DjLJP7HuJgePy+MZjk
 hLCj6i9Ah6/0c1YP9PqowY+sauuBSIyxU+k4t2uFZ3Vuq4QRUhExmoU90 g==;
X-CSE-ConnectionGUID: 0nOmKMx8RF+ueySXgDasiw==
X-CSE-MsgGUID: B/DpxE3yQiGBcUFI8nilKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89177164"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89177164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:41:17 -0700
X-CSE-ConnectionGUID: G9MU/3OASSm5svdfTwMyzA==
X-CSE-MsgGUID: nM4XOrxYQHeYW94RdhjAEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229114708"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 00:41:16 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 4/6] drm/i915/cursor: Sync joiner secondary cursor state
Date: Wed, 22 Apr 2026 13:07:20 +0530
Message-Id: <20260422073722.1861494-5-nemesa.garg@intel.com>
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

Before entering the vblank evade window, swap in the new
plane states for joiner secondary cursor planes and update
each secondary crtc's active_planes bitmask to reflect the
new cursor visibility.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index e16353b4d7f9..e61a019ba3b0 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1006,6 +1006,19 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 */
 	crtc_state->active_planes = new_crtc_state->active_planes;
 
+	for (int i = 0; i < num_sec; i++) {
+		struct intel_plane *sec_plane = to_intel_plane(new_sec_states[i]->uapi.plane);
+		struct intel_crtc *sec_crtc = to_intel_crtc(new_sec_states[i]->hw.crtc);
+		struct intel_crtc_state *sec_crtc_state = to_intel_crtc_state(sec_crtc->base.state);
+
+		sec_plane->base.state = &new_sec_states[i]->uapi;
+
+		if (new_sec_states[i]->uapi.visible)
+			sec_crtc_state->active_planes |= BIT(PLANE_CURSOR);
+		else
+			sec_crtc_state->active_planes &= ~BIT(PLANE_CURSOR);
+	}
+
 	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
 
 	intel_psr_lock(crtc_state);
-- 
2.25.1


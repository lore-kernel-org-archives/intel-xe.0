Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3DAC43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 11:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395710E930;
	Mon,  6 Jul 2026 11:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFoydDzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33B10E913;
 Mon,  6 Jul 2026 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783339193; x=1814875193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2pVyGDwD9rqkOI0FysJlAGmpM12u1smPkbQ6vjzCQ/8=;
 b=YFoydDzIbklws4GAAppveat4giK01IlWbwfvJH0+vOsXU14SnC6WsewV
 s7tQvAiiyyKpRgxlpY1idmhfodIbm11lSeFHI3eyH/BKETNxunPl0wVay
 fsZkNMCblvD5JcBd5VgF4SoQAPgh3cG+wFqrB5h2LSBHtpIEioiBTzu8j
 DxhQl+r0RvpBsfCkuT3byijqAyvtc4Mv4mwQ/A6iy9D9HQZ4s9s8ESBPV
 jEC+HHsCSIgljvL+sPHlMWH/wbSUAQ8Y4VnCiEv+xbJFCsjjdMeFglmQ9
 mAY/U4NVZt8X7S46PoRrWPsAlgq9HdQXj4xs22qCpQeHzXmE/nR07jdfo g==;
X-CSE-ConnectionGUID: MKiNurC5RAi6hI67W6o7dA==
X-CSE-MsgGUID: OkPnBEp8RUqcHr40J9qCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95481127"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95481127"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 04:59:53 -0700
X-CSE-ConnectionGUID: G4256QSwSZOQ5wklD/ILzA==
X-CSE-MsgGUID: 0H4d/JDuSceAaCiaw/FdnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253797544"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 04:59:51 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 4/6] drm/i915/cursor: Program secondary cursor planes
Date: Mon,  6 Jul 2026 17:26:27 +0530
Message-Id: <20260706115629.2984258-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706115629.2984258-1-nemesa.garg@intel.com>
References: <20260706115629.2984258-1-nemesa.garg@intel.com>
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

Iterate over all joined pipes when arming/disabling the cursor plane so
secondary pipes are updated together with the primary. The pin, check
and state duplication for secondary pipes was already prepared in the
previous commit; this converts the update_arm pass to a loop over the
joined[] array.

Because the whole loop runs inside a single primary vblank-evade,
sample intel_crtc_get_vblank_counter() per pipe around each arm and
emit a drm_err() if the counter ticks during that pipe's own
programming.

v2: Check primary and secondary pipe together. [Ville]
v3: Use struct intel_cursor_pipe. [Ville]
v4: Add per-pipe vblank straddle detection around the arm loop. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 26 +++++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index fad5d5302b36..65e1fa60a606 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1039,11 +1039,27 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		local_irq_disable();
 	}
 
-	if (new_plane_state->uapi.visible) {
-		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
-		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
-	} else {
-		intel_plane_disable_arm(NULL, plane, crtc_state);
+	for (int i = 0; i < num_pipes; i++) {
+		u32 start_vbl_count = intel_crtc_get_vblank_counter(joined[i].crtc);
+		u32 end_vbl_count;
+
+		if (joined[i].new_plane_state->uapi.visible) {
+			intel_plane_update_noarm(NULL, joined[i].plane,
+						 joined[i].crtc_state,
+						 joined[i].new_plane_state);
+			intel_plane_update_arm(NULL, joined[i].plane,
+					       joined[i].crtc_state,
+					       joined[i].new_plane_state);
+		} else {
+			intel_plane_disable_arm(NULL, joined[i].plane, joined[i].crtc_state);
+		}
+
+		end_vbl_count = intel_crtc_get_vblank_counter(joined[i].crtc);
+		if (start_vbl_count != end_vbl_count)
+			drm_err(display->drm,
+				"Atomic update failure on pipe %c (start=%u end=%u)\n",
+				pipe_name(joined[i].crtc->pipe),
+				start_vbl_count, end_vbl_count);
 	}
 
 	local_irq_enable();
-- 
2.25.1


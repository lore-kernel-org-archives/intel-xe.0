Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785E1C44501
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 11:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2027810E91C;
	Mon,  6 Jul 2026 11:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eD+mjBta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78B110E918;
 Mon,  6 Jul 2026 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783339194; x=1814875194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PhANHKbyPDi8i90NMQaPO+qoLf9n+XbCXZimgyWCeTA=;
 b=eD+mjBtaLyVQfATyjS7U/jQZiYrnw3jc1keqmOhAlPo3US04OxZwi/Mm
 E0yLRr9QZ5Mbs5ukJ6alNAV9KqQYwaYOfkON+mrCefYtQ6WBG1D3BM6ew
 Ki24iGDDXfuuTf5sxrjDZ+u9sM9ilHaEbo0uzfXPSG5Fkx2K2l31MpWCw
 7LIm6WcMjHMbLhoZzw4eRVnMDfKrFwb6cX8VchRlicY0QDKpRvA7zot7Q
 z60rTfRDjpb2vBURxBafIIqdg9ObQZeYDgXrcLn+FhllpIoE9rylaRsQ8
 cHC2SvIL0D66Es9DUUPDYjc6nSquRljddJpi8BTGh66KMdHHuRWivjg2q g==;
X-CSE-ConnectionGUID: Qq2OZl0pTuiwsdJiXByYlw==
X-CSE-MsgGUID: zeFf4L/eQ2a4Fz63N4O66A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95481134"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="95481134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 04:59:54 -0700
X-CSE-ConnectionGUID: +RjRXxG5S8+HrAc0NmIHrw==
X-CSE-MsgGUID: q0uS08RMQR2tmnTAUx5ZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="253797570"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 06 Jul 2026 04:59:53 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/6] drm/i915/cursor: Schedule cursor unpin per joined pipe
Date: Mon,  6 Jul 2026 17:26:28 +0530
Message-Id: <20260706115629.2984258-6-nemesa.garg@intel.com>
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

Convert the primary-only vblank unpin block into a loop over the
joined[] array so each pipe's old cursor framebuffer is scheduled for
unpin (or unpinned inline when unchanged) independently. All unpin
work is armed on the primary crtc's vblank (&crtc->base), consistent
with the single primary vblank evasion used above.

v4: Split from the update_arm loop conversion. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 65e1fa60a606..68e73afad330 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -887,7 +887,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_display *display = to_intel_display(plane);
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(plane->base.state);
-	struct intel_plane_state *new_plane_state = NULL;
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_vblank_evade_ctx evade;
@@ -987,7 +986,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		num_pipes++;
 	}
 
-	new_plane_state = joined[0].new_plane_state;
 	intel_frontbuffer_flush(to_intel_frontbuffer(joined[0].new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
 
@@ -1070,17 +1068,19 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * Schedule or immediately unpin old framebuffers.
 	 * Protect against concurrent access.
 	 */
-	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
-		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
-				     intel_cursor_unpin_work);
-
-		drm_vblank_work_schedule(&old_plane_state->unpin_work,
-					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
-					 false);
-
-		joined[0].old_plane_state = NULL;
-	} else {
-		intel_plane_unpin_fb(old_plane_state);
+	for (int i = 0; i < num_pipes; i++) {
+		struct intel_plane_state *old = joined[i].old_plane_state;
+
+		if (old->ggtt_vma != joined[i].new_plane_state->ggtt_vma) {
+			drm_vblank_work_init(&old->unpin_work, &crtc->base,
+					     intel_cursor_unpin_work);
+			drm_vblank_work_schedule(&old->unpin_work,
+						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+						 false);
+			joined[i].old_plane_state = NULL;
+		} else {
+			intel_plane_unpin_fb(old);
+		}
 	}
 
 out_free:
-- 
2.25.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED80F94CD8
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 07:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58E510E81D;
	Wed, 22 Apr 2026 07:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZKpP7Wn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB2110E291;
 Wed, 22 Apr 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776843676; x=1808379676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L6wDsDy1WCVA6pYJRHaSI1LTGLFxgcms8Qm4dr6056E=;
 b=iZKpP7WnUfsmutiRhtQxT7HgAEN+W8S5KxdiADd9CYWGeHxfXlEtDNZE
 Vjzjqi18sPBk1ZJ+wfYCuM13xGhAvtjTbThtHAaTvYWStHMXJH+TWoSOd
 ZeQTCUd/wmqbzmWWm9vrhx9S/PizziTlgIlrIMPZjRDRXA1hHKHpi+Eq0
 Cl45bqUkdziX+fuSoIp4kOZJo4d3NCSAIp+LM1dkaw5CQ7dIjvOZooYBI
 Cug+XDB/zQPj5A7x9pyrFyq8BzuGhgpoDJd3bKkJoEBuMs2dD+5r9JqUo
 23RT4PdVqNa0SDKLOfT8vhg0LKOkvuaSDpAODBFzcsvddY0lZBktI3dm1 Q==;
X-CSE-ConnectionGUID: gByl1z02Sq29/nStgtqWWg==
X-CSE-MsgGUID: FZGR6EnwQjS62O7qMcM17g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89177161"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89177161"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:41:16 -0700
X-CSE-ConnectionGUID: g0IZidMTQ6SBVKNnVN0kYA==
X-CSE-MsgGUID: WwQAjowwSfe3CX1WABjkqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229114699"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 00:41:15 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state
Date: Wed, 22 Apr 2026 13:07:19 +0530
Message-Id: <20260422073722.1861494-4-nemesa.garg@intel.com>
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

In joiner mode the fast path cursor update must
handle secondary pipes. Duplicate secondary cursor
plane state and pin fb so secondary cursor updates
are prepared along with primary cursor.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 80 ++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 5752ac637a8e..e16353b4d7f9 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -867,6 +867,12 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_crtc_state *new_crtc_state;
 	struct intel_vblank_evade_ctx evade;
+	struct intel_plane_state *old_sec_states[3] = {};
+	struct intel_plane_state *new_sec_states[3] = {};
+	struct intel_crtc *sec_crtc;
+	u8 joiner_secondary_pipes;
+	bool new_plane_pinned = false;
+	int num_sec = 0;
 	int ret;
 
 	/*
@@ -934,6 +940,51 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	if (ret)
 		goto out_free;
 
+	new_plane_pinned = true;
+
+	joiner_secondary_pipes = intel_crtc_joiner_secondary_pipes(crtc_state);
+	if (joiner_secondary_pipes) {
+		for_each_intel_crtc_in_pipe_mask(display->drm, sec_crtc,
+						 joiner_secondary_pipes) {
+			struct intel_plane *sec_plane =
+					intel_crtc_get_plane(sec_crtc, PLANE_CURSOR);
+			struct intel_crtc_state *sec_crtc_state =
+					to_intel_crtc_state(sec_crtc->base.state);
+			struct intel_plane_state *old_sec_plane_state =
+					to_intel_plane_state(sec_plane->base.state);
+			struct intel_plane_state *new_sec_plane_state;
+
+			new_sec_plane_state =
+			to_intel_plane_state(intel_plane_duplicate_state(&sec_plane->base));
+
+			if (!new_sec_plane_state) {
+				ret = -ENOMEM;
+				goto out_free;
+			}
+
+			intel_cursor_fastpath_update_plane_state(new_sec_plane_state, fb,
+								 new_plane_state->uapi.crtc,
+								 sec_crtc,
+								 crtc_x, crtc_y,
+								 crtc_w, crtc_h,
+								 src_x, src_y,
+								 src_w, src_h);
+
+			ret = sec_plane->check_plane(sec_crtc_state, new_sec_plane_state);
+
+			if (ret)
+				goto out_free;
+
+			ret = intel_plane_pin_fb(new_sec_plane_state, old_sec_plane_state);
+			if (ret)
+				goto out_free;
+
+			old_sec_states[num_sec] = old_sec_plane_state;
+			new_sec_states[num_sec] = new_sec_plane_state;
+			num_sec++;
+		}
+	}
+
 	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
 	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
@@ -999,13 +1050,38 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		intel_plane_unpin_fb(old_plane_state);
 	}
 
+	for (int i = 0; i < num_sec; i++) {
+		struct intel_plane_state *old_sec = old_sec_states[i];
+
+		if (old_sec->ggtt_vma != new_sec_states[i]->ggtt_vma) {
+			drm_vblank_work_init(&old_sec->unpin_work,
+					     &crtc->base,
+					     intel_cursor_unpin_work);
+			drm_vblank_work_schedule(&old_sec->unpin_work,
+						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+						 false);
+		} else {
+			intel_plane_unpin_fb(old_sec);
+		}
+	}
+
 out_free:
 	if (new_crtc_state)
 		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
-	if (ret)
+	if (ret) {
+		if (new_plane_pinned)
+			intel_plane_unpin_fb(new_plane_state);
+
 		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
-	else if (old_plane_state)
+
+		for (int i = 0; i < num_sec; i++) {
+			intel_plane_unpin_fb(new_sec_states[i]);
+			intel_plane_destroy_state(new_sec_states[i]->uapi.plane,
+						  &new_sec_states[i]->uapi);
+		}
+	} else if (old_plane_state) {
 		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
+	}
 	return ret;
 
 slow:
-- 
2.25.1


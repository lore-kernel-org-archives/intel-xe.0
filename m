Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97425606A331
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U9dMK2m4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AD1112870;
	Fri, 20 Nov 2026 09:56:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3DD112862;
 Fri, 20 Nov 2026 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795168565; x=1826704565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAqtI2ETMNwRVRD1r81/oC7zcIBFJc9YBrsVgD1i+3o=;
 b=U9dMK2m4by+Z7ZKnsI7wEiHSihpLyRwb39JllvRDI9hFyQUM60TJ8ua8
 /7JyBWiAGNNwK2lVwkeDwkcMzt2Q4GNycZ0vSH8ZgEUc6HvoJWfIMhsqb
 Hem/m9dJztkXIjDb/d7HdvytvtrLoOTBXe/Vi2H3Abmgs0Jwe048tIsig
 PhxidlZlGnNAlFFRNOEq/RLWBr/HyMHnCaXERu604btXzXEwD73xmDe04
 +zGV78Q4Nu4jhMUDI2E5x7ZLgwzmdcwlhZEtDL0Neh3tXkCxtE1I0wK26
 pHOKfzSmJzMV7IxG1uj7/RAOoSxXvv+wCYfUz5aYL74ESylcGltsSXt7e Q==;
X-CSE-ConnectionGUID: ZhsnIfoASiy8cU1r9szW/w==
X-CSE-MsgGUID: FVRQSj2BSV+TrK8VBQKYRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072521"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4072521"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:05 -0800
X-CSE-ConnectionGUID: rahWYZLtS+ywS821NqtyZg==
X-CSE-MsgGUID: ruL+DdeQTFWwQLnirau8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10566999"
Received: from lpankiew-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:03 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/4] drm/i915/psr: Keep planar planes in the selective update
 area
Date: Fri, 20 Nov 2026 11:55:39 +0200
Message-ID: <20261120095541.1325118-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120095541.1325118-1-jouni.hogander@intel.com>
References: <20261120095541.1325118-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Turning selective fetch off and back on for a planar plane corrupts it
when it is not at the top of the pipe. This happens when the selective
update area stops and later again starts to intersect the plane.

As a workaround extend the selective update area to cover visible planar
planes fully, so their selective fetch stays enabled.

Fixes: a4f477e6ac17 ("drm/i915/psr: Add proper handling for disabling sel fetch for planes")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 2c759f9e81fca..11e3189360f28 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2926,6 +2926,33 @@ intel_psr_apply_su_area_workarounds(struct intel_crtc_state *crtc_state)
 		intel_psr_apply_pr_link_on_su_wa(crtc_state);
 }
 
+static int psr2_sel_fetch_add_biplanar_planes(struct intel_atomic_state *state,
+					    struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_plane *plane;
+
+	for_each_intel_plane_on_crtc(display->drm, crtc, plane) {
+		const struct intel_plane_state *plane_state =
+			to_intel_plane_state(plane->base.state);
+		struct intel_plane *linked = plane_state->planar_linked_plane;
+		struct intel_plane_state *new_plane_state;
+
+		if (!linked)
+			continue;
+
+		new_plane_state = intel_atomic_get_plane_state(state, plane);
+		if (IS_ERR(new_plane_state))
+			return PTR_ERR(new_plane_state);
+
+		new_plane_state = intel_atomic_get_plane_state(state, linked);
+		if (IS_ERR(new_plane_state))
+			return PTR_ERR(new_plane_state);
+	}
+
+	return 0;
+}
+
 static void psr2_sel_fetch_compute_su_area(struct intel_atomic_state *state,
 					   struct intel_crtc *crtc,
 					   bool *full_update)
@@ -3008,6 +3035,18 @@ static void psr2_sel_fetch_compute_su_area(struct intel_atomic_state *state,
 			continue;
 		}
 
+		/*
+		 * Work around corruption when selective fetch is disabled and
+		 * re-enabled for biplanar planes by keeping them fully in the SU area.
+		 */
+		if (new_plane_state->uapi.visible && new_plane_state->planar_linked_plane) {
+			damaged_area.y1 = new_plane_state->uapi.dst.y1;
+			damaged_area.y2 = new_plane_state->uapi.dst.y2;
+			clip_area_update(&crtc_state->psr2_su_area, &damaged_area,
+					 &display_area);
+			continue;
+		}
+
 		src = drm_plane_state_src(&new_plane_state->uapi);
 		drm_rect_fp_to_int(&src, &src);
 
@@ -3233,6 +3272,10 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	joined_pipes = intel_crtc_joined_pipe_mask(crtc_state);
 
 	for_each_intel_crtc_in_pipe_mask(display, joined_crtc, joined_pipes) {
+		ret = psr2_sel_fetch_add_biplanar_planes(state, joined_crtc);
+		if (ret)
+			return ret;
+
 		psr2_sel_fetch_compute_su_area(state, joined_crtc, &full_update);
 
 		/* One pipe falling back takes all of them with it. */
-- 
2.53.0


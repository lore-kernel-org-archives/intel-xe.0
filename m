Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E4606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XsSIq7rV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEEF10F25D;
	Mon, 23 Nov 2026 22:52:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A14210F25B;
 Mon, 23 Nov 2026 22:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474331; x=1827010331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Znb7dXwzCm+5Y9F6CHbJzOjC+0tQgq8wWzHIUa1UkLw=;
 b=XsSIq7rVTNXiVCt1oAZXS8F98H6YmWejAQKRkB+PZtXmYg3+3XA3R7dd
 7A5Si4E/Deydh9ZEiKNpT8uDj9RzCHk4APvTbslMqvpAOB1jiwgq/TwBK
 19m2+kSdguhHWMkyR0nhUDpy7bZFiv5Ef1dqgSk8LGlRiwy9JenefmmSi
 KXJiF9fH30OK6gfrY9PIhHhv4xNUfTzMS/bO9+97tYP+ajB+imOOY4em8
 luupMRhXTYhlHVs3APRsko72uFki4R2HckfeycAWJMEB0MI0BQE3cybEO
 CbaLud3x5+T7QHs0ZLQbsyy1q7cpomaeWjoSgCoUMWStG8y4ol/iMAG8Y w==;
X-CSE-ConnectionGUID: ui3l+lCkSkGkLjwBEx8bhA==
X-CSE-MsgGUID: uIEiClwIRUqZnO9Tz/Kxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4276482"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4276482"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:11 -0800
X-CSE-ConnectionGUID: uIxX2k41RUWaHEm5+FrZQw==
X-CSE-MsgGUID: 24+y+hRqSb+iCWjo7k++RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13400388"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/global_state: Pass the full atomic state into
 intel_atomic_{lock, serialize}_global_state()
Date: Tue, 24 Nov 2026 00:51:36 +0200
Message-ID: <20261123225139.23087-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
References: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_atomic_{lock,serialize}_global_state() is using the
obj_state->state footgun to find the full atomic state.
Stop that and pass the full atomic state in from the caller.

The obj_state->state pointer is only valid up to swap_state()
after which it becomes NULL. In this case using it is not too
bad since the lock/serialize operations themselves are only
valid during atomic_check(). But still better to not give
people any bad examples, since someone is bound to copy
the approach.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c       | 25 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 18 ++++++-------
 drivers/gpu/drm/i915/display/intel_dbuf_bw.c  |  2 +-
 .../gpu/drm/i915/display/intel_global_state.c |  9 ++++---
 .../gpu/drm/i915/display/intel_global_state.h |  6 +++--
 drivers/gpu/drm/i915/display/intel_pmdemand.c |  4 +--
 drivers/gpu/drm/i915/display/skl_watermark.c  | 12 ++++-----
 7 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 99fd84a5ac13..44024154cb27 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -1123,18 +1123,19 @@ void icl_sagv_post_plane_update(struct intel_atomic_state *state)
 	icl_pcode_restrict_qgv_points(display, new_mask);
 }
 
-static int mtl_find_qgv_points(struct intel_display *display,
+static int mtl_find_qgv_points(struct intel_atomic_state *state,
 			       unsigned int data_rate,
 			       unsigned int num_active_planes,
 			       struct intel_bw_state *new_bw_state)
 {
+	struct intel_display *display = to_intel_display(state);
 	unsigned int best_rate = UINT_MAX;
 	unsigned int num_qgv_points = display->bw.num_qgv_points;
 	unsigned int qgv_peak_bw  = 0;
 	int i;
 	int ret;
 
-	ret = intel_atomic_lock_global_state(&new_bw_state->base);
+	ret = intel_atomic_lock_global_state(state, &new_bw_state->base);
 	if (ret)
 		return ret;
 
@@ -1188,12 +1189,13 @@ static int mtl_find_qgv_points(struct intel_display *display,
 	return 0;
 }
 
-static int icl_find_qgv_points(struct intel_display *display,
+static int icl_find_qgv_points(struct intel_atomic_state *state,
 			       unsigned int data_rate,
 			       unsigned int num_active_planes,
 			       const struct intel_bw_state *old_bw_state,
 			       struct intel_bw_state *new_bw_state)
 {
+	struct intel_display *display = to_intel_display(state);
 	unsigned int num_psf_gv_points = display->bw.num_psf_gv_points;
 	unsigned int num_qgv_points = display->bw.num_qgv_points;
 	u16 psf_points = 0;
@@ -1201,7 +1203,7 @@ static int icl_find_qgv_points(struct intel_display *display,
 	int i;
 	int ret;
 
-	ret = intel_atomic_lock_global_state(&new_bw_state->base);
+	ret = intel_atomic_lock_global_state(state, &new_bw_state->base);
 	if (ret)
 		return ret;
 
@@ -1268,7 +1270,7 @@ static int icl_find_qgv_points(struct intel_display *display,
 	 * the commits are serialized(in case this is a nomodeset, nonblocking)
 	 */
 	if (new_bw_state->qgv_points_mask != old_bw_state->qgv_points_mask) {
-		ret = intel_atomic_serialize_global_state(&new_bw_state->base);
+		ret = intel_atomic_serialize_global_state(state, &new_bw_state->base);
 		if (ret)
 			return ret;
 	}
@@ -1276,10 +1278,11 @@ static int icl_find_qgv_points(struct intel_display *display,
 	return 0;
 }
 
-static int intel_bw_check_qgv_points(struct intel_display *display,
+static int intel_bw_check_qgv_points(struct intel_atomic_state *state,
 				     const struct intel_bw_state *old_bw_state,
 				     struct intel_bw_state *new_bw_state)
 {
+	struct intel_display *display = to_intel_display(state);
 	unsigned int data_rate = intel_bw_data_rate(display, new_bw_state);
 	unsigned int num_active_planes =
 			intel_bw_num_active_planes(display, new_bw_state);
@@ -1287,10 +1290,10 @@ static int intel_bw_check_qgv_points(struct intel_display *display,
 	data_rate = DIV_ROUND_UP(data_rate, 1000);
 
 	if (HAS_PMDEMAND(display))
-		return mtl_find_qgv_points(display, data_rate, num_active_planes,
+		return mtl_find_qgv_points(state, data_rate, num_active_planes,
 					   new_bw_state);
 	else
-		return icl_find_qgv_points(display, data_rate, num_active_planes,
+		return icl_find_qgv_points(state, data_rate, num_active_planes,
 					   old_bw_state, new_bw_state);
 }
 
@@ -1370,11 +1373,11 @@ static int intel_bw_check_sagv_mask(struct intel_atomic_state *state)
 
 	if (intel_bw_can_enable_sagv(display, new_bw_state) !=
 	    intel_bw_can_enable_sagv(display, old_bw_state)) {
-		ret = intel_atomic_serialize_global_state(&new_bw_state->base);
+		ret = intel_atomic_serialize_global_state(state, &new_bw_state->base);
 		if (ret)
 			return ret;
 	} else if (new_bw_state->pipe_sagv_reject != old_bw_state->pipe_sagv_reject) {
-		ret = intel_atomic_lock_global_state(&new_bw_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_bw_state->base);
 		if (ret)
 			return ret;
 	}
@@ -1420,7 +1423,7 @@ int intel_bw_atomic_check(struct intel_atomic_state *state)
 	if (!changed)
 		return 0;
 
-	ret = intel_bw_check_qgv_points(display, old_bw_state, new_bw_state);
+	ret = intel_bw_check_qgv_points(state, old_bw_state, new_bw_state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 0f2f693c78d4..5d50f0e3b0df 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3014,7 +3014,7 @@ static int intel_cdclk_update_crtc_min_cdclk(struct intel_atomic_state *state,
 
 	cdclk_state->min_cdclk[crtc->pipe] = new_min_cdclk;
 
-	ret = intel_atomic_lock_global_state(&cdclk_state->base);
+	ret = intel_atomic_lock_global_state(state, &cdclk_state->base);
 	if (ret)
 		return ret;
 
@@ -3061,7 +3061,7 @@ static int intel_cdclk_update_crtc_min_voltage_level(struct intel_atomic_state *
 
 	cdclk_state->min_voltage_level[crtc->pipe] = new_min_voltage_level;
 
-	ret = intel_atomic_lock_global_state(&cdclk_state->base);
+	ret = intel_atomic_lock_global_state(state, &cdclk_state->base);
 	if (ret)
 		return ret;
 
@@ -3104,7 +3104,7 @@ int intel_cdclk_update_dbuf_bw_min_cdclk(struct intel_atomic_state *state,
 
 	cdclk_state->dbuf_bw_min_cdclk = new_min_cdclk;
 
-	ret = intel_atomic_lock_global_state(&cdclk_state->base);
+	ret = intel_atomic_lock_global_state(state, &cdclk_state->base);
 	if (ret)
 		return ret;
 
@@ -3195,7 +3195,7 @@ static int bxt_compute_min_voltage_level(struct intel_atomic_state *state)
 
 		cdclk_state->min_voltage_level[crtc->pipe] = min_voltage_level;
 
-		ret = intel_atomic_lock_global_state(&cdclk_state->base);
+		ret = intel_atomic_lock_global_state(state, &cdclk_state->base);
 		if (ret)
 			return ret;
 	}
@@ -3455,7 +3455,7 @@ static int intel_cdclk_modeset_checks(struct intel_atomic_state *state,
 	new_cdclk_state->active_pipes =
 		intel_calc_active_pipes(state, old_cdclk_state->active_pipes);
 
-	ret = intel_atomic_lock_global_state(&new_cdclk_state->base);
+	ret = intel_atomic_lock_global_state(state, &new_cdclk_state->base);
 	if (ret)
 		return ret;
 
@@ -3511,7 +3511,7 @@ int intel_cdclk_state_set_joined_mbus(struct intel_atomic_state *state, bool joi
 	cdclk_state->actual.joined_mbus = joined_mbus;
 	cdclk_state->logical.joined_mbus = joined_mbus;
 
-	return intel_atomic_lock_global_state(&cdclk_state->base);
+	return intel_atomic_lock_global_state(state, &cdclk_state->base);
 }
 
 int intel_cdclk_init(struct intel_display *display)
@@ -3565,12 +3565,12 @@ static int intel_modeset_calc_cdclk(struct intel_atomic_state *state)
 		 * Also serialize commits across all crtcs
 		 * if the actual hw needs to be poked.
 		 */
-		ret = intel_atomic_serialize_global_state(&new_cdclk_state->base);
+		ret = intel_atomic_serialize_global_state(state, &new_cdclk_state->base);
 		if (ret)
 			return ret;
 	} else if (intel_cdclk_changed(&old_cdclk_state->logical,
 				       &new_cdclk_state->logical)) {
-		ret = intel_atomic_lock_global_state(&new_cdclk_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_cdclk_state->base);
 		if (ret)
 			return ret;
 	} else {
@@ -3674,7 +3674,7 @@ int intel_cdclk_atomic_check(struct intel_atomic_state *state)
 
 	if (new_cdclk_state &&
 	    old_cdclk_state->force_min_cdclk != new_cdclk_state->force_min_cdclk) {
-		ret = intel_atomic_lock_global_state(&new_cdclk_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_cdclk_state->base);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dbuf_bw.c b/drivers/gpu/drm/i915/display/intel_dbuf_bw.c
index 6cf674c586dc..50529d8fce75 100644
--- a/drivers/gpu/drm/i915/display/intel_dbuf_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_dbuf_bw.c
@@ -211,7 +211,7 @@ int intel_dbuf_bw_calc_min_cdclk(struct intel_atomic_state *state,
 		return 0;
 
 	if (intel_dbuf_bw_state_changed(display, old_dbuf_bw_state, new_dbuf_bw_state)) {
-		ret = intel_atomic_lock_global_state(&new_dbuf_bw_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_dbuf_bw_state->base);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_global_state.c b/drivers/gpu/drm/i915/display/intel_global_state.c
index 886caf29c9ae..436fbaa02831 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.c
+++ b/drivers/gpu/drm/i915/display/intel_global_state.c
@@ -295,9 +295,9 @@ void intel_atomic_clear_global_state(struct intel_atomic_state *state)
 	state->num_global_objs = 0;
 }
 
-int intel_atomic_lock_global_state(struct intel_global_state *obj_state)
+int intel_atomic_lock_global_state(struct intel_atomic_state *state,
+				   struct intel_global_state *obj_state)
 {
-	struct intel_atomic_state *state = obj_state->state;
 	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc *crtc;
 
@@ -315,11 +315,12 @@ int intel_atomic_lock_global_state(struct intel_global_state *obj_state)
 	return 0;
 }
 
-int intel_atomic_serialize_global_state(struct intel_global_state *obj_state)
+int intel_atomic_serialize_global_state(struct intel_atomic_state *state,
+					struct intel_global_state *obj_state)
 {
 	int ret;
 
-	ret = intel_atomic_lock_global_state(obj_state);
+	ret = intel_atomic_lock_global_state(state, obj_state);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_global_state.h b/drivers/gpu/drm/i915/display/intel_global_state.h
index e1efa530cc86..9759b9339d9b 100644
--- a/drivers/gpu/drm/i915/display/intel_global_state.h
+++ b/drivers/gpu/drm/i915/display/intel_global_state.h
@@ -53,8 +53,10 @@ intel_atomic_get_new_global_obj_state(struct intel_atomic_state *state,
 
 void intel_atomic_swap_global_state(struct intel_atomic_state *state);
 void intel_atomic_clear_global_state(struct intel_atomic_state *state);
-int intel_atomic_lock_global_state(struct intel_global_state *obj_state);
-int intel_atomic_serialize_global_state(struct intel_global_state *obj_state);
+int intel_atomic_lock_global_state(struct intel_atomic_state *state,
+				   struct intel_global_state *obj_state);
+int intel_atomic_serialize_global_state(struct intel_atomic_state *state,
+					struct intel_global_state *obj_state);
 
 int intel_atomic_global_state_setup_commit(struct intel_atomic_state *state);
 void intel_atomic_global_state_commit_done(struct intel_atomic_state *state);
diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index f96545a5b881..4916f145f970 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -383,9 +383,9 @@ int intel_pmdemand_atomic_check(struct intel_atomic_state *state)
 	new_pmdemand_state->params.scalers = 7;
 
 	if (state->base.allow_modeset)
-		return intel_atomic_serialize_global_state(&new_pmdemand_state->base);
+		return intel_atomic_serialize_global_state(state, &new_pmdemand_state->base);
 	else
-		return intel_atomic_lock_global_state(&new_pmdemand_state->base);
+		return intel_atomic_lock_global_state(state, &new_pmdemand_state->base);
 }
 
 static bool intel_pmdemand_check_prev_transaction(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index ec1bfe46edef..a5d933f7475c 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -569,7 +569,7 @@ skl_crtc_allocate_ddb(struct intel_atomic_state *state, struct intel_crtc *crtc)
 				&new_dbuf_state->ddb[pipe]))
 		return 0;
 
-	ret = intel_atomic_lock_global_state(&new_dbuf_state->base);
+	ret = intel_atomic_lock_global_state(state, &new_dbuf_state->base);
 	if (ret)
 		return ret;
 
@@ -2519,7 +2519,7 @@ skl_compute_ddb(struct intel_atomic_state *state)
 		intel_calc_active_pipes(state, old_dbuf_state->active_pipes);
 
 	if (old_dbuf_state->active_pipes != new_dbuf_state->active_pipes) {
-		ret = intel_atomic_lock_global_state(&new_dbuf_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_dbuf_state->base);
 		if (ret)
 			return ret;
 	}
@@ -2545,7 +2545,7 @@ skl_compute_ddb(struct intel_atomic_state *state)
 		if (old_dbuf_state->slices[pipe] == new_dbuf_state->slices[pipe])
 			continue;
 
-		ret = intel_atomic_lock_global_state(&new_dbuf_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_dbuf_state->base);
 		if (ret)
 			return ret;
 	}
@@ -2554,7 +2554,7 @@ skl_compute_ddb(struct intel_atomic_state *state)
 
 	if (old_dbuf_state->enabled_slices != new_dbuf_state->enabled_slices ||
 	    old_dbuf_state->joined_mbus != new_dbuf_state->joined_mbus) {
-		ret = intel_atomic_serialize_global_state(&new_dbuf_state->base);
+		ret = intel_atomic_serialize_global_state(state, &new_dbuf_state->base);
 		if (ret)
 			return ret;
 
@@ -2575,7 +2575,7 @@ skl_compute_ddb(struct intel_atomic_state *state)
 		if (old_dbuf_state->weight[pipe] == new_dbuf_state->weight[pipe])
 			continue;
 
-		ret = intel_atomic_lock_global_state(&new_dbuf_state->base);
+		ret = intel_atomic_lock_global_state(state, &new_dbuf_state->base);
 		if (ret)
 			return ret;
 	}
@@ -3484,7 +3484,7 @@ int intel_dbuf_state_set_mdclk_cdclk_ratio(struct intel_atomic_state *state,
 
 	dbuf_state->mdclk_cdclk_ratio = ratio;
 
-	return intel_atomic_lock_global_state(&dbuf_state->base);
+	return intel_atomic_lock_global_state(state, &dbuf_state->base);
 }
 
 void intel_dbuf_mdclk_cdclk_ratio_update(struct intel_display *display,
-- 
2.56.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC6DCD98E3
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 06:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5661310E850;
	Tue, 16 Jun 2026 06:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq6Z81I7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB9410E83B;
 Tue, 16 Jun 2026 06:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781590652; x=1813126652;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/XGrpxPGb55IpTx7akQQugcWr2GN9ixap6aMES0KxIk=;
 b=Aq6Z81I7vhMfptIrx5JE13L+aMgNfMPJRLzB5WvIXBqdQpPMelq50j6i
 dqlAo9cKenRjyxRkFvoE58fktpZn8UWuG7ig2IgbJ0zoAhcyG27jsZrkj
 X9k78Cndy1EdCcpjNWhnRvagJA+APXobt6M7qDiw3mffO7VMZ7Sq4iafE
 hGZ1Zrrc+NdAYYCs5rQWsbs2KmEEfABiu+a2b9AB8t1rhOgz1MhfFUkXj
 CrkKiThhNV1WWBM0S1bDsRgAOmkuKlUR7SY4q6YtEHNywL4Ez8lLrLjnQ
 IlOU85RXYmC1sc3VZ/kgEMjTSdEuVJj9ndm177NR3O08AJwoNMxFLuLZS A==;
X-CSE-ConnectionGUID: usu+tGJYQ3uzATS3FmqrgA==
X-CSE-MsgGUID: 5tJCdcQ1TFKnK3Phm9Lnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82088145"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82088145"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 23:17:32 -0700
X-CSE-ConnectionGUID: BE64fp1eTlyaDsFN+y5xig==
X-CSE-MsgGUID: ArUsgMj/SdCJ4Hu2ES9qmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="251973659"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 15 Jun 2026 23:17:31 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 16 Jun 2026 11:45:51 +0530
Subject: [PATCH v2 1/2] drm/i915/mst: Unify fec_enable across mst streams
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-fec-v2-1-49a22680138c@intel.com>
References: <20260616-fec-v2-0-49a22680138c@intel.com>
In-Reply-To: <20260616-fec-v2-0-49a22680138c@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>, 
 Stephen Fuhry <fuhrysteve@gmail.com>
X-Mailer: b4 0.15-dev
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

FEC is a link-wide property: DP_TP_CTL_FEC_ENABLE is a per-port HW bit
while crtc_state->fec_enable is per-stream. With DP MST several streams
share the same port, so if any sibling stream needs FEC the per-port HW
bit is on for every sibling. If sibling crtc_states disagree the
following two symptoms appear:

- intel_pipe_config_compare() rejects fastset on the sibling whose new
  crtc_state->fec_enable disagrees with the old (HW) value
  ("fastset requirement not met in fec_enable"), forcing an
  unnecessary full modeset.
- verify_crtc_state() after commit reports a fec_enable mismatch
  ("[CRTC:..] mismatch in fec_enable (expected no, found yes)") because
  the per-port HW bit is read back into every sibling's hw state.

Walk every MST connector on @mst_mgr, pulling currently-active siblings
into @state if they are not already in it (covers the case where the
user's commit touches only a subset of MST streams on the link). Then OR
all sibling fec_enable values together and write the unified result back
into every sibling crtc_state. The unification only widens
(false -> true), never narrows, so a stream that genuinely needs FEC
keeps it.

This runs from intel_dp_mst_atomic_check_link(), which is invoked after
intel_atomic_check_config_and_link() has finished all per-stream
compute_config and compute_config_late passes but before
intel_crtc_check_fastset() and the post-commit verify, so the unified
value is visible to both checks.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16073
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Stephen Fuhry <fuhrysteve@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 70 +++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index bcdc504913471a1ac7d255cde49a907c9f3d88a6..d487f1c90dcd2671754e6c6f28f207f32ace9ee2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -881,6 +881,72 @@ static int intel_dp_mst_check_bw(struct intel_atomic_state *state,
 	return ret ? : -EAGAIN;
 }
 
+/*
+ * Unify crtc_state->fec_enable across every MST sibling stream on @mst_mgr.
+ */
+static int intel_dp_mst_unify_fec_enable(struct intel_atomic_state *state,
+					 struct drm_dp_mst_topology_mgr *mst_mgr)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct drm_connector_list_iter connector_list_iter;
+	struct intel_connector *connector;
+	struct intel_crtc *crtcs[I915_MAX_PIPES];
+	int n_crtcs = 0;
+	bool need_fec = false;
+	int ret = 0;
+	int i;
+
+	drm_connector_list_iter_begin(display->drm, &connector_list_iter);
+	for_each_intel_connector_iter(connector, &connector_list_iter) {
+		struct intel_digital_connector_state *conn_state;
+		struct intel_crtc_state *crtc_state;
+		struct intel_crtc *crtc;
+
+		if (&connector->mst.dp->mst.mgr != mst_mgr)
+			continue;
+
+		conn_state = intel_atomic_get_digital_connector_state(state,
+								      connector);
+		if (IS_ERR(conn_state)) {
+			ret = PTR_ERR(conn_state);
+			break;
+		}
+
+		if (!conn_state->base.crtc)
+			continue;
+
+		crtc = to_intel_crtc(conn_state->base.crtc);
+		crtc_state = intel_atomic_get_crtc_state(&state->base, crtc);
+		if (IS_ERR(crtc_state)) {
+			ret = PTR_ERR(crtc_state);
+			break;
+		}
+
+		if (!crtc_state->hw.active)
+			continue;
+
+		if (drm_WARN_ON(display->drm, n_crtcs >= ARRAY_SIZE(crtcs)))
+			break;
+
+		crtcs[n_crtcs++] = crtc;
+		if (crtc_state->fec_enable)
+			need_fec = true;
+	}
+	drm_connector_list_iter_end(&connector_list_iter);
+
+	if (ret || !need_fec)
+		return ret;
+
+	for (i = 0; i < n_crtcs; i++) {
+		struct intel_crtc_state *crtc_state =
+			intel_atomic_get_new_crtc_state(state, crtcs[i]);
+
+		crtc_state->fec_enable = true;
+	}
+
+	return 0;
+}
+
 /**
  * intel_dp_mst_atomic_check_link - check all modeset MST link configuration
  * @state: intel atomic state
@@ -908,6 +974,10 @@ int intel_dp_mst_atomic_check_link(struct intel_atomic_state *state,
 	int i;
 
 	for_each_new_mst_mgr_in_state(&state->base, mgr, mst_state, i) {
+		ret = intel_dp_mst_unify_fec_enable(state, mgr);
+		if (ret)
+			return ret;
+
 		ret = intel_dp_mst_check_dsc_change(state, mgr, limits);
 		if (ret)
 			return ret;

-- 
2.25.1


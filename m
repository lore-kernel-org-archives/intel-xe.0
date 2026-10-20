Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA8E606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 02:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mfXXeqYM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C245C10F1BA;
	Tue, 20 Oct 2026 02:19:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8553310F1BA;
 Tue, 20 Oct 2026 02:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792462773; x=1823998773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mF6ARC3Yz2YyuIVTGKo4p5bDE3WZu3Zu1St/zewOtoI=;
 b=mfXXeqYMJSlUvkr4Ju3FuNsjun+MQJYB4q/1n81JkpxVplrXGMmN/JgI
 VzTdFiA8ogECXKCN8T7rMy7l2KMbPga6wXYRQBtHjsQj+U98TZk3IM5Up
 S3QSjBwxp9/lQdp/c2u1N4kzf2M4NYCn7kXSeu3j25+NB6ViVKIaVLywP
 e04XLBKrj7wrgdE2RWiIezq/xlicria1WQWUhAUI/8m1pjFmu6Zv6H6gL
 yKVhJlksEqriZWNiF3feKXL7ZZkCqM3CiG23YtQ5JB2RqMAZOv6v2nQBM
 hRY7tlHfV/rO7WMe2O/L57SgsDrj884UdG1VJZVrwKiLOF9EeB7OodOxT g==;
X-CSE-ConnectionGUID: sc/k9Nk4RVilmQN5dGaPQA==
X-CSE-MsgGUID: y8D+eTyOQBiujH4/uQj8nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1260124"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1260124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 19:19:32 -0700
X-CSE-ConnectionGUID: xTv/b8qTQyKoLfgI4GgtMA==
X-CSE-MsgGUID: c+MAB2IjQGmuECpwzC0SaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3019287"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2026 19:19:30 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, Xiao Lu <xiaolu.xie@intel.com>,
 Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v2] drm/i915/dp: clear and restore MSTM_CTRL around MST DPMS
 off/on
Date: Tue, 20 Oct 2026 10:17:14 +0800
Message-ID: <20261020021714.62573-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014081448.2320363-1-xiaolu.xie@intel.com>
References: <20261014081448.2320363-1-xiaolu.xie@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the last MST stream is disabled, i915 sends SET_POWER D3 to the
MST trunk while MSTM_CTRL (DPCD 0x111) still has MST mode enabled.
On re-enable, POWER_UP_PHY is sent before MSTM_CTRL is restored, so
the hub may process the PHY power-up in an inconsistent state and
fail to retrain its downstream links.

Fix this by clearing MST_EN and UP_REQ_EN in MSTM_CTRL before sending
D3 on the last stream disable. On re-enable, restore MSTM_CTRL after
writing D0 and before sending POWER_UP_PHY, so the hub is back in MST
mode when it processes the PHY power-up and retrains its downstream
links.

Keep UPSTREAM_IS_SRC set while MST mode is disabled this way, and
accept this value in intel_dp_mst_verify_dpcd_state() while no MST
stream is active. Otherwise a connector detection during DPMS off,
for instance after a runtime resume, would see MSTM_CTRL as reset and
tear down the MST topology. A real DPCD reset still clears
UPSTREAM_IS_SRC and so it's still detected.

v2: Write UPSTREAM_IS_SRC instead of 0 and accept it in
    intel_dp_mst_verify_dpcd_state(), to avoid removing the topology
    on a connector detection during DPMS off. (Marco)

Cc: Marco Nenciarini <mnencia@kcore.it>
Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c    |  3 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a46ab5d3d..6b7665206 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3163,6 +3163,9 @@ static void intel_ddi_post_disable_dp(struct intel_atomic_state *state,
 	 * Power down sink before disabling the port, otherwise we end
 	 * up getting interrupts from the sink on detecting link loss.
 	 */
+	if (is_mst)
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
+				       DP_UPSTREAM_IS_SRC);
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
 
 	if (DISPLAY_VER(display) >= 12) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7023619aa..da3cf7493 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1270,8 +1270,12 @@ static void mst_stream_pre_enable(struct intel_atomic_state *state,
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 12 && first_mst_stream &&
 		    !intel_dp_mst_is_master_trans(pipe_config));
 
-	if (first_mst_stream)
+	if (first_mst_stream) {
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
+				       DP_MST_EN | DP_UP_REQ_EN |
+				       DP_UPSTREAM_IS_SRC);
+	}
 
 	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, true);
 
@@ -2254,6 +2258,14 @@ bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
 
 	ret = drm_dp_dpcd_read_byte(intel_dp->mst.mgr.aux, DP_MSTM_CTRL, &val);
 
+	/*
+	 * MST mode is disabled while all MST streams are disabled, keeping
+	 * UPSTREAM_IS_SRC set to tell this apart from a DPCD reset.
+	 */
+	if (ret == 0 && val == DP_UPSTREAM_IS_SRC &&
+	    intel_dp_mst_active_streams(intel_dp) == 0)
+		return true;
+
 	/* Adjust the expected register value for SST + SideBand. */
 	if (ret < 0 || val != (DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC)) {
 		drm_dbg_kms(display->drm,
-- 
2.43.0


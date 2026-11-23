Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B168606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W3H9ZU3H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2C710E09F;
	Mon, 23 Nov 2026 05:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C4010E09F;
 Mon, 23 Nov 2026 05:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795410284; x=1826946284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tcrMtoWPqRZ3VwHw5W4Cyd40df7ekHLTZcJ3oc8DTaA=;
 b=W3H9ZU3HlxJ4exQ62Xa7AVetpBAR5FT/06M0Rs/5Fde5nxMn+tuI5OYK
 f0LHcLhRIeOvlpug+hwKeGL6ggcA1Y5SCsWtSISaOmGC535I/MUnz9fx2
 aJWag8WJ/4poXdurBJOFAFU+ws2eixtNgi+QCZILRStKor5Mpcpzw7ZAa
 +64ktpXOGPn1s7jwroIh4Gs8WGpvCAbQ0UcsEYyusBrhZ2OY7yRw9VbJW
 OlKQ93yTO7WyOeJLCBv6zh60xvHAfyfhJFz3UZNDsWdw0EGPOL18QYsnW
 6+5s3MxtHK7kedROSUPDnvTN/P4ZooxBi+szroPzQLnp+sPU2KoXCPi/q Q==;
X-CSE-ConnectionGUID: xmql2RmuTFONCaPVC+L4mQ==
X-CSE-MsgGUID: Euldfdk7TPOy4zQCV5qGWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4198060"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4198060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:04:43 -0800
X-CSE-ConnectionGUID: W6XyZj+OTc2/U95XXbPVaA==
X-CSE-MsgGUID: 4+bWwf2aQs2yAl80o9Qd9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11409762"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2026 21:04:41 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, mika.kahola@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/pps: Don't steal VDD from another eDP port sharing
 the PPS
Date: Mon, 23 Nov 2026 10:34:23 +0530
Message-Id: <20261123050422.3130438-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some VBTs declare an unpopulated eDP port next to the real panel and
assign both the same PPS. The ghost port adopts the VDD bit the real
port turned on, and when its DPCD read fails it clears EDP_FORCE_VDD
underneath the real port. The real port's VDD reference is then never
released, leaking an AUX power domain reference and a runtime PM
wakelock:

  drm_WARN_ON(intel_dp->pps.vdd_wakeref)
  i915 raw-wakerefs=1 wakelocks=1 on cleanup

Don't adopt or turn off VDD owned by another eDP port on the same PPS.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17232
Cc: stable@vger.kernel.org # v6.15+
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pps.c | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 442b00491a88..653b8bf7ec6d 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -570,6 +570,30 @@ static bool edp_have_panel_vdd(struct intel_dp *intel_dp)
 	return intel_de_read(display, _pp_ctrl_reg(intel_dp)) & EDP_FORCE_VDD;
 }
 
+static bool pps_vdd_owned_by_other_port(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_encoder *encoder;
+
+	lockdep_assert_held(&display->pps.mutex);
+
+	if (display->platform.valleyview || display->platform.cherryview)
+		return false;
+
+	for_each_intel_dp(display->drm, encoder) {
+		struct intel_dp *dp = enc_to_intel_dp(encoder);
+
+		if (dp == intel_dp || encoder->type != INTEL_OUTPUT_EDP)
+			continue;
+
+		if (dp->pps.pps_idx == intel_dp->pps.pps_idx &&
+		    dp->pps.vdd_wakeref)
+			return true;
+	}
+
+	return false;
+}
+
 void intel_pps_check_power_unlocked(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -839,6 +863,9 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
 	if (!edp_have_panel_vdd(intel_dp))
 		return;
 
+	if (!intel_dp->pps.vdd_wakeref && pps_vdd_owned_by_other_port(intel_dp))
+		return;
+
 	drm_dbg_kms(display->drm, "[ENCODER:%d:%s] %s turning VDD off\n",
 		    dig_port->base.base.base.id, dig_port->base.base.name,
 		    pps_name(intel_dp));
@@ -1334,6 +1361,14 @@ static void pps_vdd_init(struct intel_dp *intel_dp)
 	if (!edp_have_panel_vdd(intel_dp))
 		return;
 
+	if (pps_vdd_owned_by_other_port(intel_dp)) {
+		drm_dbg_kms(display->drm,
+			    "[ENCODER:%d:%s] %s VDD owned by another eDP port, not adopting it\n",
+			    dig_port->base.base.base.id, dig_port->base.base.name,
+			    pps_name(intel_dp));
+		return;
+	}
+
 	/*
 	 * The VDD bit needs a power domain reference, so if the bit is
 	 * already enabled when we boot or resume, grab this reference and
-- 
2.34.1


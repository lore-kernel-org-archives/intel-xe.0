Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAA2606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fS8qSaum
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A54310FC5B;
	Wed, 21 Oct 2026 07:25:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D0F10FC66;
 Wed, 21 Oct 2026 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792567501; x=1824103501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0jnXKomCxwK+aCcK8+FXkY3IPEzsMOSln2xsego4RVw=;
 b=fS8qSaumqLWkyKPZ33tMlab+9Or/IWiu9Id58/TV3pKNJ0MRO/AGartj
 1CIW1rqyjvBW7PKPKQqaWz1uZ4C2d91prmICGw+u9r1p7MmMcQmRjOo7T
 lTMAgxxYclx2JNyBs8YqdhKEY00pF/LRNZIiIdErlo/pp+f1m/yKLQD1i
 +1LAqqm7YDrNri/jTUTP5nh5sCVuQw2NWZtxf91Gg92+PMXxwDj6u3YSM
 H8vb7ibmdxLhHHWsZAiBWtVB9JIPUigfYJQMi5E21qdRwtp8vAUXuGKHS
 s7hahAsqBQLU/frjoj0A7hx3Czl/gQU3TQXxaUK9DCDQO4omHJq7dcogM g==;
X-CSE-ConnectionGUID: RpvtO2UHRa+J102BPc52+Q==
X-CSE-MsgGUID: w0kPaZWvRUuZwvptz7PQCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1186362"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1186362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:25:00 -0700
X-CSE-ConnectionGUID: VYcjBSEMQAmGWiKq6qwUgA==
X-CSE-MsgGUID: 7Uo428dNRqq6cMFsy9gMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2966395"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 00:24:58 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v6 09/11] drm/i915/display: Implement Wa_14021768792 for BMG
 DP for link_m/n ratio > 10
Date: Wed, 21 Oct 2026 12:54:36 +0530
Message-Id: <20261021072438.1164249-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021072438.1164249-1-suraj.kandpal@intel.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Handle the bypass logic for the M/N ratio limit for DP.
Calculate the M/N ratio, check if it can bypass the limit, and set the
appropriate flags for the workaround.

v2:
-Restrict the workaround to 128b/132b links.
-Clear bypass_m_n_ratio_limit on entry, so a rejected link rate cannot
leave it set for the rate that gets used. (Sashiko)
v3:
-Rebase on the reworked M/N ratio check, which no longer checks m_n and
link_n. m_n is no longer const, as the flag is set through it. (Mitul)
-Pass the cpu transcoder to intel_display_can_bypass_m_n_limit() instead
of the pipe. (Mitul)

Bspec: 49266
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.h |  2 +-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8ef6b4c4fc8e..8e6ba5b9fde6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1300,18 +1300,32 @@ intel_dp_can_support_m_n(struct intel_display *display,
 }
 
 void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
-			      const struct intel_link_m_n *m_n)
+			      struct intel_link_m_n *m_n)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
 	int m_n_ratio;
 
+	m_n->bypass_m_n_ratio_limit = false;
+
 	m_n_ratio = intel_dp_link_m_n_ratio(m_n->link_m, m_n->link_n);
 
-	if (m_n_ratio > max_m_n_ratio)
+	if (m_n_ratio <= max_m_n_ratio)
+		return;
+
+	if (intel_dp_is_uhbr(crtc_state) &&
+	    intel_display_can_bypass_m_n_limit(display, m_n_ratio,
+					       crtc_state->cpu_transcoder)) {
+		m_n->bypass_m_n_ratio_limit = true;
 		drm_dbg_kms(display->drm,
-			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
-			    m_n_ratio, max_m_n_ratio);
+			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
+			    m_n_ratio);
+		return;
+	}
+
+	drm_dbg_kms(display->drm,
+		    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
+		    m_n_ratio, max_m_n_ratio);
 }
 
 static int intel_dp_mso_pixel_clock(struct intel_dp *intel_dp, int pixel_clock)
@@ -3393,6 +3407,9 @@ static bool can_enable_drrs(struct intel_connector *connector,
 	if (pipe_config->vrr.enable)
 		return false;
 
+	if (pipe_config->dp_m_n.bypass_m_n_ratio_limit)
+		return false;
+
 	/*
 	 * DRRS and PSR can't be enable together, so giving preference to PSR
 	 * as it allows more power-savings by complete shutting down display,
@@ -3427,7 +3444,8 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 	 * FIXME all joined pipes share the same transcoder.
 	 * Need to account for that when updating M/N live.
 	 */
-	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes)
+	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes &&
+	    !pipe_config->dp_m_n.bypass_m_n_ratio_limit)
 		pipe_config->update_m_n = true;
 
 	if (!can_enable_drrs(connector, pipe_config, downclock_mode)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1e3da678c9b6..c834d90a1f81 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -246,6 +246,6 @@ int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
 
 void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
-			      const struct intel_link_m_n *m_n);
+			      struct intel_link_m_n *m_n);
 
 #endif /* __INTEL_DP_H__ */
-- 
2.34.1


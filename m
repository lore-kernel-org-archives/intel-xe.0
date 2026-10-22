Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5C606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IlrJ2htg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8F4112313;
	Thu, 22 Oct 2026 03:23:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE8A1122FE;
 Thu, 22 Oct 2026 03:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792639397; x=1824175397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QpJFkseZRfgrB0o5nPs2fbpsvX6hJNXImRfkhDzVBQg=;
 b=IlrJ2htgwCtbUbA1+XGZaENUYZKyN9V3nXbtGQnv9Waw6jypYHbgKz1z
 Ul/6Q0DP5MSZrhWI5WLjlLM+LC65FdxmUj3ldJ+okx0KDioAb157Ka6fC
 AxpzxKU7fOkLysl98WHwggw9BqXsQiucFSM5OoELRP/ldoaSnBYQCzDRx
 NVFP4lh28WlHnQQqh0+FjaO8nC+INodaZtcN3M6mo+sLwi6PPec7dKpbx
 gFjHQ/V7ogsCmlxhTs36lAqaH48UZAlE5vVRtK6TeNtFjR9Zgu5yOytCs
 NgOn9iO+ttrROsFrMBStxVBSuVydN6PFg0khqhf+w0oLZ1E800LDc1y0h Q==;
X-CSE-ConnectionGUID: RbPfiy7rRaW58XvoGAvltg==
X-CSE-MsgGUID: XmP/2QznS9CBhnf6/i3D4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1383518"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1383518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 20:23:15 -0700
X-CSE-ConnectionGUID: BWu9WC3bQZWkLsYlb42aeg==
X-CSE-MsgGUID: bFziYemjQGejYANVFoZIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3197383"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 20:23:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 12/13] drm/i915/dp: Extend intel_dp_can_support_m_n() for
 BMG M/N bypass
Date: Thu, 22 Oct 2026 08:52:46 +0530
Message-Id: <20261022032247.1378809-13-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022032247.1378809-1-suraj.kandpal@intel.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On BMG platforms, the standard M/N ratio limit of 10 can be bypassed
under specific conditions, as permitted by hardware capabilities.

Modify the helper intel_dp_can_support_m_n() to account for this by
checking whether the platform supports bypassing the limit. The
workaround is only intended for 128b/132b links, so restrict it to
those.

During the mode_valid phase, the check assumes that TRANSCODER_A will be
used, to allow the mode where the M/N ratio is within the limits for the
workaround.

v2:
-Keep the helper static: the MST mode_valid now goes through the shared
intel_dp_mode_valid_m_n() rather than calling it directly, so it no
longer needs to be exported.
v3:
-Use the cpu transcoder instead of the pipe, following the change to
intel_display_can_bypass_m_n_limit(). (Mitul)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8e6ba5b9fde6..045524994d85 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1285,9 +1285,11 @@ static int intel_dp_link_m_n_ratio(u32 link_m, u32 link_n)
 
 static bool
 intel_dp_can_support_m_n(struct intel_display *display,
+			 const struct intel_crtc_state *crtc_state,
 			 int pixel_clock, int link_rate)
 {
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
+	enum transcoder cpu_transcoder = TRANSCODER_A;
 	u32 link_m, link_n;
 	int m_n_ratio;
 
@@ -1296,7 +1298,16 @@ intel_dp_can_support_m_n(struct intel_display *display,
 
 	m_n_ratio = intel_dp_link_m_n_ratio(link_m, link_n);
 
-	return m_n_ratio <= max_m_n_ratio;
+	if (m_n_ratio <= max_m_n_ratio)
+		return true;
+
+	if (!drm_dp_is_uhbr_rate(link_rate))
+		return false;
+
+	if (crtc_state)
+		cpu_transcoder = crtc_state->cpu_transcoder;
+
+	return intel_display_can_bypass_m_n_limit(display, m_n_ratio, cpu_transcoder);
 }
 
 void intel_dp_check_m_n_ratio(const struct intel_crtc_state *crtc_state,
@@ -1386,7 +1397,7 @@ bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int pixel_clock)
 	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
 				      INTEL_DP_LINK_CAPS_FILTER_ALL);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (intel_dp_can_support_m_n(display, m_n_pixel_clock,
+		if (intel_dp_can_support_m_n(display, NULL, m_n_pixel_clock,
 					     link_config.rate)) {
 			found = true;
 
@@ -2775,7 +2786,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 
 	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits->link_config_filter);
 	for_each_dp_link_config(&iter, &link_config) {
-		if (!intel_dp_can_support_m_n(display, pixel_clock, link_config.rate))
+		if (!intel_dp_can_support_m_n(display, crtc_state, pixel_clock,
+					      link_config.rate))
 			continue;
 
 		intel_dp_link_caps_filter_add(link_caps, &new_filter, &link_config);
-- 
2.34.1


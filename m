Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328BD606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BflWQCl5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA48810E527;
	Fri, 23 Oct 2026 05:02:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763D210E4D8;
 Fri, 23 Oct 2026 05:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731754; x=1824267754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EqjDVIEo6MkEZItT0mljrbv833x8mNAhL+hrizlsXP0=;
 b=BflWQCl5JeGt6UJ90J8q3gC/rW7vuoVqNoFTgEOEpsnJDGpAQn5AE1bw
 lJ9lUDEmvQmP2ausG2mmcBAiB6h8e2J9mssr1kLafwC6Ie95rUZ2e3vmT
 FnA+RMwFocA8lDv2qyKmXTQ+T28B12aR2ve4v4AT7end4LfbkF0YkpvUQ
 aFRoj2DkP00j51jrb8IdexP+HCBGTCSe3qGeKTIWny7EqywYmtkROsjdp
 S6rh1icDU6C4Qw1gwiMvMIj36XCvNXgtNMK1pRDQp8GrmS9f7MrmZxNu3
 m/rfvNgmxyIgskv7W+WtOqHpk4ZbqDa8V7dho6FJ9gAiMEiwaoJX6X1P5 A==;
X-CSE-ConnectionGUID: CbajMJRJTouzLIpT+vyMfg==
X-CSE-MsgGUID: A+pCri7+QN2YJakYFe5Mhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499151"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499151"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:34 -0700
X-CSE-ConnectionGUID: 65xIWJEVSSOXagRVm3cebw==
X-CSE-MsgGUID: 923Dpvr1SJKHb1I/v32TYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926565"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:31 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 01/14] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Date: Fri, 23 Oct 2026 10:32:14 +0530
Message-Id: <20261023050227.2068466-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Introduce intel_display_compute_link_m_n() to compute the link M/N ratio
from the pixel clock and the link symbol clock. This logic was
previously embedded within intel_link_compute_m_n().
The new helper allows reuse of link M/N computation in other contexts
without requiring the full data M/N calculation and will be used in
later commits.

No functional changes intended.

v2:
- Rename function (Jani)
- The link symbol clock is passed in rather than derived here, so that the
DP specific conversion from the link rate stays with the caller. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7602f633f49d..580c36a52921 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2650,13 +2650,20 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
 	intel_reduce_m_n_ratio(ret_m, ret_n);
 }
 
+static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
+					   int pixel_clock, int link_symbol_clock)
+{
+	compute_m_n(link_m, link_n,
+		    pixel_clock, link_symbol_clock,
+		    0x80000);
+}
+
 void
 intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
 		       int pixel_clock, int link_clock,
 		       int bw_overhead,
 		       struct intel_link_m_n *m_n)
 {
-	u32 link_symbol_clock = intel_dp_link_symbol_clock(link_clock);
 	u32 data_m = intel_dp_effective_data_rate(pixel_clock, bits_per_pixel_x16,
 						  bw_overhead);
 	u32 data_n = drm_dp_max_dprx_data_rate(link_clock, nlanes);
@@ -2673,9 +2680,9 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
 		    data_m, data_n,
 		    0x8000000);
 
-	compute_m_n(&m_n->link_m, &m_n->link_n,
-		    pixel_clock, link_symbol_clock,
-		    0x80000);
+	intel_display_compute_link_m_n(&m_n->link_m, &m_n->link_n,
+				       pixel_clock,
+				       intel_dp_link_symbol_clock(link_clock));
 }
 
 void intel_panel_sanitize_ssc(struct intel_display *display)
-- 
2.34.1


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A42C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637D810E29E;
	Wed, 16 Sep 2026 02:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfE40yRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6B10E101;
 Wed, 16 Sep 2026 02:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527436; x=1821063436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hr+plyIqllp+MdCAdxR+qgCtNeT7/Yd4AFp4cNWY440=;
 b=EfE40yRr1OlWJ+oTPEfEIPGgxhw+9WlBghfujUHHDDsHA0UcTKJJ366U
 f436y7NLnvtFoRWcQpxZd72WaeCHMjs7oaFfZSvN9RHUfUwDwDAy0YBho
 9tjKBuOx0s8zym4seJaVbmRVsqrW0d65uJ56cjdPBEzT3zgF5shajn2tD
 3e8JYszmIIaA8r0V8TNYT9ZyBPSreUtQoiaA6IXXTTM7J182woTy2ZjqL
 B0lS9rCYAIS9nt4CE2pSTkjOeguE5oCWssCG+PgLCbyW5FHzCMGUzrUxo
 Ito0/YZ1JSuDJ+aIz1t6eRqp/bPBDlz2zK4JkW6js8YI3Uaf9fHvA8Htr A==;
X-CSE-ConnectionGUID: LJJadG2/QVmdZY/kJ+HOjw==
X-CSE-MsgGUID: hNTHhDKcRmmS8SsvGKj6RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498328"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:16 -0700
X-CSE-ConnectionGUID: SxaRwR7mTPWxaeFosslT6Q==
X-CSE-MsgGUID: 5hEBEEfkRFai65Mo6r/d2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473390"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:15 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Date: Wed, 16 Sep 2026 08:27:01 +0530
Message-Id: <20260916025710.432281-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916025710.432281-1-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Introduce intel_display_compute_link_m_n() to compute the link M/N ratio
from the pixel clock and the link symbol clock. This logic was
previously embedded within intel_link_compute_m_n().

The new helper allows reuse of link M/N computation in other contexts
without requiring the full data M/N calculation.

No functional changes intended.

v2:
- Rename function (Jani)
- The link symbol clock is passed in rather than derived here, so that the
DP specific conversion from the link rate stays with the caller. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9151ea6c15ab..f04a6f97e05a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2641,13 +2641,20 @@ static void compute_m_n(u32 *ret_m, u32 *ret_n,
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
@@ -2664,9 +2671,9 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
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


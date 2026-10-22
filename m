Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851A606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QIonJECY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4B510E37F;
	Thu, 22 Oct 2026 03:23:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1697A10E28F;
 Thu, 22 Oct 2026 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792639377; x=1824175377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EqjDVIEo6MkEZItT0mljrbv833x8mNAhL+hrizlsXP0=;
 b=QIonJECY+UmPkamIqqF7rEIeQt2QIyXTR8Wo88SU2uwzhssVcGoMfS2e
 M1qacK5LcmqK+R0VYdJahawItAFbE7goCMFzeXT4ef6MpiTk5+w4qv07e
 UiL7wHx3j8u8ZgG+okQHrRVxnoPrpFoMyWZxEchCn2U+Y7skTtXkCxG8N
 7j9jMfv0dNKfvOzT+1aacX1j+ZMOterwl3X03BBTyQ+AqhW7MEo+svt8M
 Lt/eOfFbjLU7CkT+nEq82uGjIp2NSYapeBDDyweUQeXDBA9F/JQtnRrxf
 QyX4rD3ti1wBDTXbBIHNhECTR/BKPaTMkSxQPySf7wOpYnEa6+Wl5oCjF w==;
X-CSE-ConnectionGUID: b5I7FwYGRzKk7Jsyf5yCYA==
X-CSE-MsgGUID: QA9KXsRlQMGEQEMIejtjDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1383485"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1383485"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 20:22:56 -0700
X-CSE-ConnectionGUID: s0Pb6qcMQdyrak4dElzGWg==
X-CSE-MsgGUID: cxi8YNcrSz6kwEHWvAnyJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3197264"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 20:22:55 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 01/13] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Date: Thu, 22 Oct 2026 08:52:35 +0530
Message-Id: <20261022032247.1378809-2-suraj.kandpal@intel.com>
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


Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0396606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsDMaUxc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A22610E226;
	Fri, 20 Nov 2026 07:00:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83410E1AE;
 Fri, 20 Nov 2026 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795158018; x=1826694018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4HS68ZqpVV0WKAIkSDHMCPDko6h+DCHVdXQLkoxkj3s=;
 b=nsDMaUxc1462Z+iy3E4sYQa3xoEi+WEOYLpqxz5sojsjDtmF0edmE0JI
 eygiDjHBi2M4L83635ngbV6J05bdyHjhq0I66Ia5wMJ3Nlya8cMxzqMS6
 MVVj/ybUGzTmvafqOYBT4YjMK5HKrXz/Z6zBIRYw7C8SVBvYylhapMAQT
 Yi0Q7SC77G6nHhxK342OLGzaRXiLo6FP6Bi2jrnTJxhT5ILQG8szpMdMP
 wQVSaP/O5UCyje9xiGF2C2BkPQikILinobxEdp0gHqfw90bMQOjmFFIJb
 bnfZhu4Q8QsGFShh6I/7amGTdGfR/fpMdqZ0naAJROpQJqkEPQfyPDnsH g==;
X-CSE-ConnectionGUID: KlZTO8ubTlK2esEc0jwmpQ==
X-CSE-MsgGUID: vx+5W4vcS5CmjiCFRLngRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3923130"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3923130"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:00:17 -0800
X-CSE-ConnectionGUID: cvPMFbgjSwesTJulDH05Iw==
X-CSE-MsgGUID: ViDihOOnTHypXc76ZjWnRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10970647"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 23:00:14 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH v2 1/2] drm/i915/lt_phy: Enable TX2 for single lane DP-alt
 links
Date: Fri, 20 Nov 2026 14:58:05 +0800
Message-ID: <6851ce5d3432e89b82af3ce8358c309ceb09a4ca.1795157860.git.xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795157860.git.xiaolu.xie@intel.com>
References: <cover.1795157860.git.xiaolu.xie@intel.com>
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

ML0 always uses TX2 of PHY lane 0 in DP-alt mode, regardless of the
TC pin assignment. The driver incorrectly enables TX1 instead of TX2
for pin assignment D on single lane DP-alt links.

Fixes: a54bdcb7142d ("drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence")
Bspec: 74701
Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b01..7af03e5b364 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1827,8 +1827,6 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
 	u8 lane_count = ltpll->lane_count;
 	bool is_dp_alt =
 		intel_tc_port_in_dp_alt_mode(dig_port);
-	enum intel_tc_pin_assignment tc_pin =
-		intel_tc_port_get_pin_assignment(dig_port);
 	u8 transmitter_mask = 0;
 
 	/*
@@ -1841,12 +1839,8 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
 	switch (lane_count) {
 	case 1:
 		transmitter_mask = lane_reversal ? REG_BIT8(3) : REG_BIT8(0);
-		if (is_dp_alt) {
-			if (tc_pin == INTEL_TC_PIN_ASSIGNMENT_D)
-				transmitter_mask = REG_BIT8(0);
-			else
-				transmitter_mask = REG_BIT8(1);
-		}
+		if (is_dp_alt)
+			transmitter_mask = REG_BIT8(1);
 		break;
 	case 2:
 		transmitter_mask = lane_reversal ? REG_GENMASK8(3, 2) : REG_GENMASK8(1, 0);
-- 
2.43.0


Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A660A2618
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PqqLoqUc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BD111258E;
	Thu, 19 Nov 2026 15:34:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62067112586;
 Thu, 19 Nov 2026 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795102484; x=1826638484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Bpp5fwUlXhDIGt0gR7kDpTUgryrk7fCGf60t1rbmnA=;
 b=PqqLoqUcOHhAVaBO0hew0S3UVMPrwezGU94v7IAp8sjDW4BoRjRr2Fr8
 8d/HrwHMnAdRwEy22vVgZIryiqEaifs7UL2/9eMdx+Ah4pqbDyq9s1RbR
 JMM8slDMHhJKEVK0XbzalrAjkK/kckMKACLyJMofqaX0QSfb8ZSkdy3AM
 hLWhUkBXot94+mmo7LlPj/JyX0gESggGsbQNs8OiyWRWQJ2ZmKHIkcQ3p
 xRAoMYrIQF/uE16uuKWQCcoeMvhf3PChSSsnAl+s+TVHSMe6QLs5MjCJR
 Eb4P8vqgOnT6KTQI7d8H3ZR0n5mhCP9PQBKXXxYAaRjX7WcOyJ6MTVEHU Q==;
X-CSE-ConnectionGUID: CY5nEQMyTluUakaM9yg5gQ==
X-CSE-MsgGUID: NdZKb7kLSnaGnFfaesTxFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3855009"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3855009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:34:43 -0800
X-CSE-ConnectionGUID: 5bqCM+tTRkmUn/MegeE+2Q==
X-CSE-MsgGUID: VZC7KkBmTv6B9ifDWaOryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10488469"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa002.jf.intel.com with ESMTP; 19 Nov 2026 07:34:40 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/lt_phy: Fix the PLL table values to match Bspec
Date: Thu, 19 Nov 2026 23:32:35 +0800
Message-ID: <20261119153235.2311650-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
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

Comparing the DP, eDP and UHBR PLL programming tables with the Bspec
message bus register table for the DP, eDP and UHBR link rates shows
that two registers differ, all the others already match.

PHY_VDR_9_Data3 (0xC3C), the DCO med setting, has to be 0x80 for 1.62G,
eDP 2.16G, 3.24G, 4.32G and 6.75G and for UHBR10, UHBR13.5 and UHBR20,
but was left at 0x27 for all of them. The eDP 2.43G table has no DCO
med setting at all, 0xC3C and 0xC3D were left at 0 instead of 0x27 and
0x08.

PHY_VDR_11_Data2 (0xC49), the SSC injection setting, has to be 0x57 for
all the UHBR rates, but was 0x5b for UHBR10 and UHBR20. UHBR13.5 already
has it.

Fixes: dc5742b6197f ("drm/i915/ltphy: Add LT Phy Programming recipe tables")
Bspec: 74492
Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b01..68ffd6e5107 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -107,7 +107,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_dp_rbr = {
 		{ 0x84, 0x26, 0x5,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x4b, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x5b, 0xe0, 0x0a },
 		{ 0x0,  0x0,  0x0,  0x0  },
@@ -319,9 +319,9 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_dp_uhbr10 = {
 		{ 0x84, 0x26, 0x4,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x45, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x14, 0x2a, 0x14 },
-		{ 0x0,  0x5b, 0xe0, 0x8  },
+		{ 0x0,  0x57, 0xe0, 0x8  },
 		{ 0x0,  0x0,  0x0,  0x0  },
 	},
 };
@@ -372,7 +372,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_dp_uhbr13_5 = {
 		{ 0x84, 0x26, 0x6,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x49, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x57, 0xe0, 0x0c },
 		{ 0x0,  0x0,  0x0,  0x0  },
@@ -425,9 +425,9 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_dp_uhbr20 = {
 		{ 0x84, 0x26, 0x4,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x45, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x14, 0x2a, 0x14 },
-		{ 0x0,  0x5b, 0xe0, 0x8  },
+		{ 0x0,  0x57, 0xe0, 0x8  },
 		{ 0x0,  0x0,  0x0,  0x0  },
 	},
 };
@@ -506,7 +506,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_edp_2_16 = {
 		{ 0x84, 0x26, 0x5,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x4b, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x5b, 0xe0, 0x0a },
 		{ 0x0,  0x0,  0x0,  0x0  },
@@ -559,7 +559,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_edp_2_43 = {
 		{ 0x84, 0x26, 0x6,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x47, 0x48, 0x0,  0x0  },
-		{ 0x0,  0x0,  0x0,  0x0  },
+		{ 0x27, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x5b, 0xe0, 0x0c },
 		{ 0x0,  0x0,  0x0,  0x0  },
@@ -612,7 +612,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_edp_3_24 = {
 		{ 0x84, 0x26, 0x5,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x4b, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x5b, 0xe0, 0x0a },
 		{ 0x0,  0x0,  0x0,  0x0  },
@@ -665,7 +665,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_edp_4_32 = {
 		{ 0x84, 0x26, 0x5,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x4b, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x5b, 0xe0, 0x0a },
 		{ 0x0,  0x0,  0x0,  0x0  },
@@ -718,7 +718,7 @@ static const struct intel_lt_phy_pll_state xe3plpd_lt_edp_6_75 = {
 		{ 0x84, 0x26, 0x6,  0x4  },
 		{ 0x0,  0xe0, 0x1,  0x0  },
 		{ 0x49, 0x48, 0x0,  0x0  },
-		{ 0x27, 0x8,  0x0,  0x0  },
+		{ 0x80, 0x8,  0x0,  0x0  },
 		{ 0x5a, 0x13, 0x29, 0x13 },
 		{ 0x0,  0x57, 0xe0, 0x0c },
 		{ 0x0,  0x0,  0x0,  0x0  },
-- 
2.43.0


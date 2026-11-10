Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD29606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h9kV//Sy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741E110F4F2;
	Tue, 10 Nov 2026 11:56:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BC610F4F2;
 Tue, 10 Nov 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794311775; x=1825847775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=al7863ka3QJziwbTyQmvfp5zKuVfkuOWtAVasv+ZKTQ=;
 b=h9kV//SytQn5pNtRmUuGAvyyhjW0e4W1dJ7L02F7zlgN9BYWZQ7lcqYK
 YNrcmZk4hpbUCJO0GYTMtfGVV1nhKgOVRH5mVR6qsYvXj3dZTvQ7Ijj5v
 1RvNpww1MshdM2hcPlg00UuEdWguj7BbBRAO86jqto1nf2sqbMprJu3Sc
 cw2hInEyDgEZgMbdmz2fz2r380ZuCPwQS7JVZ6FaEuDVn5Z0GaKnbab0t
 /HEh/KNz8R6geZy11DFNFRu94TVTdLnhyUcCBV4c5mfLZ6bakUhesJj0L
 iWFPxmtHZjceJcfNe0e6ZvjqDxS8NeDmvnbnO0tVdxEq5wVQkiAREVjhD w==;
X-CSE-ConnectionGUID: RJ+R+qq/QDuuVVJoIC1m2A==
X-CSE-MsgGUID: xg2z9PNMSyu+bfYfqsLtWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3055635"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3055635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:56:13 -0800
X-CSE-ConnectionGUID: oqa0ee5oT+KP+ZlXrjgBoA==
X-CSE-MsgGUID: ryhEMuHsRcu1xH4urQKb8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8004336"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 03:56:12 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 1/4] drm/i915/bios: Split out parsing the eDP fast link
 training params
Date: Tue, 10 Nov 2026 11:54:29 +0000
Message-ID: <20261110115432.894616-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110115432.894616-1-shawn.c.lee@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
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

Move parsing eDP fast link training link rate, lane count,
pre-emphasis and voltage swing params from parse_edp() to a separate
function, in preparation for parsing these params only if fast link
training is enabled.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 61 +++++++++++++----------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 7b6a6f8c3cf1..6b2924c56cae 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1440,34 +1440,13 @@ static void vbt_edp_to_pps_delays(struct intel_pps_delays *pps,
 }
 
 static void
-parse_edp(struct intel_display *display,
-	  struct intel_panel *panel)
+parse_edp_fast_link_params(struct intel_display *display,
+			   struct intel_panel *panel,
+			   const struct bdb_edp *edp)
 {
-	const struct bdb_edp *edp;
-	const struct edp_fast_link_params *edp_link_params;
 	int panel_type = panel->vbt.panel_type;
-
-	edp = bdb_find_section(display, BDB_EDP);
-	if (!edp)
-		return;
-
-	switch (panel_bits(edp->color_depth, panel_type, 2)) {
-	case EDP_18BPP:
-		panel->vbt.edp.bpp = 18;
-		break;
-	case EDP_24BPP:
-		panel->vbt.edp.bpp = 24;
-		break;
-	case EDP_30BPP:
-		panel->vbt.edp.bpp = 30;
-		break;
-	}
-
-	/* Get the eDP sequencing and link info */
-	edp_link_params = &edp->fast_link_params[panel_type];
-
-	vbt_edp_to_pps_delays(&panel->vbt.edp.pps,
-			      &edp->power_seqs[panel_type]);
+	const struct edp_fast_link_params *edp_link_params =
+		&edp->fast_link_params[panel_type];
 
 	if (display->vbt.version >= 224) {
 		panel->vbt.edp.rate =
@@ -1547,6 +1526,36 @@ parse_edp(struct intel_display *display,
 			    edp_link_params->vswing);
 		break;
 	}
+}
+
+static void
+parse_edp(struct intel_display *display,
+	  struct intel_panel *panel)
+{
+	const struct bdb_edp *edp;
+	int panel_type = panel->vbt.panel_type;
+
+	edp = bdb_find_section(display, BDB_EDP);
+	if (!edp)
+		return;
+
+	switch (panel_bits(edp->color_depth, panel_type, 2)) {
+	case EDP_18BPP:
+		panel->vbt.edp.bpp = 18;
+		break;
+	case EDP_24BPP:
+		panel->vbt.edp.bpp = 24;
+		break;
+	case EDP_30BPP:
+		panel->vbt.edp.bpp = 30;
+		break;
+	}
+
+	/* Get the eDP sequencing info */
+	vbt_edp_to_pps_delays(&panel->vbt.edp.pps,
+			      &edp->power_seqs[panel_type]);
+
+	parse_edp_fast_link_params(display, panel, edp);
 
 	if (display->vbt.version >= 173) {
 		u8 vswing;
-- 
2.53.0


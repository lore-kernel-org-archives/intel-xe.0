Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E9CDE000
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 13:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C0B10F1C8;
	Thu, 25 Jun 2026 13:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQGkW3aw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9956E10F10A;
 Thu, 25 Jun 2026 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782395497; x=1813931497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Ms9ZwlXGgSC+ZWp84GBwMd0ABoFw1BjQCGie0NcqNY=;
 b=EQGkW3awGToTL5uguL1DNw451msCl8KwI9Y4EwHUA3IUoeuSrItZkuCf
 Di6PojLkLlGDqMhrDwPWqTD1vUnsRGsjcHX/nXl2EmMDGYtfrNqbQxGhn
 5Tz1THeqSQPhn206bQ4XJBQKXBwnmD3Nvc1+PmwsOpb9PDMx0ZFTm4alK
 fK8ylfjxqstT/AQuEcJ2liYFLT2n5sVUpi9OVW1aAKVVdkIwTSW0tvJWC
 TDDHelB4sNY7WrfFzrhVt1P7f7UP2KY3qAkzBoPiZ2jXZwDhcbeLRNeE4
 +WFdfdrvJeu0qoRGs4po+zQ/ELCFT2jcqOY2JuiczwYVDZ6rQ3iGFYMyI A==;
X-CSE-ConnectionGUID: c/SieaNrQ6GsM628klk6Bw==
X-CSE-MsgGUID: xCtntpGfS1aLCnSyfUm1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="87015663"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="87015663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 06:51:37 -0700
X-CSE-ConnectionGUID: U3GQvWICS3ajz5HL+lqFGQ==
X-CSE-MsgGUID: L7WyAELvQX+xnhT9VnN6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="250901072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 06:51:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Martin Hodo <martin.hodo@intel.com>,
 stable@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@intel.com>
Subject: [PATCH] drm/i915/bios: range check LFP Data Block panel_type2
Date: Thu, 25 Jun 2026 16:51:30 +0300
Message-ID: <20260625135130.1067872-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

While the panel_type from LFP Data Block is range checked, panel_type2
is not. Add a few helpers for range checking, and use them to not only
check panel_type2, but also imrove clarity and correctness in the panel
type selection.

Discovered using AI-assisted static analysis confirmed by Intel Product
Security.

Reported-by: Martin Hodo <martin.hodo@intel.com>
Fixes: 6434cf630086 ("drm/i915/bios: calculate panel type as per child device index in VBT")
Cc: <stable@vger.kernel.org> # v6.0+
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Ville Syrjälä <ville.syrjala@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 29 +++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 15ebadc72b88..0c420019e46a 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -623,6 +623,16 @@ get_lfp_data_tail(const struct bdb_lfp_data *data,
 		return NULL;
 }
 
+static bool is_panel_type_valid(int panel_type)
+{
+	return panel_type >= 0 && panel_type < 16;
+}
+
+static bool is_panel_type_valid_or_pnp(int panel_type)
+{
+	return is_panel_type_valid(panel_type) || panel_type == 0xff;
+}
+
 static int opregion_get_panel_type(struct intel_display *display,
 				   const struct intel_bios_encoder_data *devdata,
 				   const struct drm_edid *drm_edid, bool use_fallback)
@@ -640,15 +650,21 @@ static int vbt_get_panel_type(struct intel_display *display,
 	if (!lfp_options)
 		return -1;
 
-	if (lfp_options->panel_type > 0xf &&
-	    lfp_options->panel_type != 0xff) {
+	if (!is_panel_type_valid_or_pnp(lfp_options->panel_type)) {
 		drm_dbg_kms(display->drm, "Invalid VBT panel type 0x%x\n",
 			    lfp_options->panel_type);
 		return -1;
 	}
 
-	if (devdata && devdata->child.handle == DEVICE_HANDLE_LFP2)
+	if (devdata && devdata->child.handle == DEVICE_HANDLE_LFP2) {
+		if (!is_panel_type_valid_or_pnp(lfp_options->panel_type2)) {
+			drm_dbg_kms(display->drm, "Invalid VBT panel type 2 0x%x\n",
+				    lfp_options->panel_type2);
+			return -1;
+		}
+
 		return lfp_options->panel_type2;
+	}
 
 	drm_WARN_ON(display->drm,
 		    devdata && devdata->child.handle != DEVICE_HANDLE_LFP1);
@@ -762,13 +778,12 @@ static int get_panel_type(struct intel_display *display,
 				    panel_types[i].name, panel_types[i].panel_type);
 	}
 
-	if (panel_types[PANEL_TYPE_OPREGION].panel_type >= 0)
+	if (is_panel_type_valid(panel_types[PANEL_TYPE_OPREGION].panel_type))
 		i = PANEL_TYPE_OPREGION;
 	else if (panel_types[PANEL_TYPE_VBT].panel_type == 0xff &&
-		 panel_types[PANEL_TYPE_PNPID].panel_type >= 0)
+		 is_panel_type_valid(panel_types[PANEL_TYPE_PNPID].panel_type))
 		i = PANEL_TYPE_PNPID;
-	else if (panel_types[PANEL_TYPE_VBT].panel_type != 0xff &&
-		 panel_types[PANEL_TYPE_VBT].panel_type >= 0)
+	else if (is_panel_type_valid(panel_types[PANEL_TYPE_VBT].panel_type))
 		i = PANEL_TYPE_VBT;
 	else
 		i = PANEL_TYPE_FALLBACK;
-- 
2.47.3


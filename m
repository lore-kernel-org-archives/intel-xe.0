Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30595606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eS+B0KgS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D668210E769;
	Fri, 13 Nov 2026 12:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AF610E7B3;
 Fri, 13 Nov 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794572811; x=1826108811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5TPKGzUH3cTpq0dBCUcvvSRfCucQQqopiBs1cAvyfs=;
 b=eS+B0KgSAsRVh9wYhESILXHmLathSrCEj9XQQ+ym69vQ6UZfcTCxT+xA
 Et+lSpPRxV84plwvAddhh6+bwGHrFGbW7SuvEzjK5TL0GMPsTcdIwak7o
 8WXHEmhNSQ3XQobY5uLPVO0lHmLChf37oyhzH8cbkBkHHS/HD3O1Re/Z+
 4jZ+fQjdk+uq1JaDjWLKYDtCRqfebtAzPVWxNa0dYyJ/yNcgU4Fo65qIG
 x3O3q1usAuDRXrwSzLJ+m5qPQFGeHLGP4dJfTX6dUnmXuAWF+n2yC7h55
 MiQWlkbLUoTkEzF91/Iccxv9coP20WqN7dfDibMldxUScg+n8C2blCRvz A==;
X-CSE-ConnectionGUID: 29t7T5hKRkmhSvna0J6JHQ==
X-CSE-MsgGUID: 8n/7jz9iSQimZdOtGGueaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3242551"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3242551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 04:26:51 -0800
X-CSE-ConnectionGUID: ps6VLt46SFeDH1SNEqf4zA==
X-CSE-MsgGUID: KwlBM1DlQl6+pnibIp3bKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9243326"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 04:26:48 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/i915/bios: Add quirk to allow eDP joiner on ASUS ROG
 Strix SCAR 18
Date: Fri, 13 Nov 2026 17:41:06 +0530
Message-ID: <20261113121106.3241899-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261027024334.1140596-1-ankit.k.nautiyal@intel.com>
References: <20261027024334.1140596-1-ankit.k.nautiyal@intel.com>
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

On Arrow Lake, VBT defaults the eDP pipe joiner enable bit to
disabled, and commit 650471948e49 ("drm/i915/dp: Avoid joiner for
eDP if not enabled in VBT") made the driver honor that default.

On the ASUS ROG Strix SCAR 18 (G835LXG), the bit in VBT is left to
the platform default instead of enabling it, even though the
3840x2400@240Hz panel requires the joiner to reach its native
mode. As a result the mode is pruned and the panel is limited to
120Hz.

Since the VBT bit cannot be relied upon globally for ARL (it is
needed to block the joiner on at least one other machine), add a
machine-specific quirk, to bypass the VBT restriction and allow the
joiner on this machine.

v2: set panel->vbt.edp.pipe_joiner_enable directly in intel_bios.c
(Jani)

Fixes: 650471948e49 ("drm/i915/dp: Avoid joiner for eDP if not enabled in VBT")
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: <stable@vger.kernel.org> # v7.1+
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16854
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c   |  5 +++++
 drivers/gpu/drm/i915/display/intel_quirks.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 7b6a6f8c3cf1..b77d1599482a 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -41,6 +41,7 @@
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_gmbus.h"
+#include "intel_quirks.h"
 #include "intel_rom.h"
 #include "intel_vdsc.h"
 
@@ -1575,6 +1576,10 @@ parse_edp(struct intel_display *display,
 	if (display->vbt.version >= 261)
 		panel->vbt.edp.pipe_joiner_enable =
 			panel_bool(edp->pipe_joiner_enable, panel_type);
+
+	/* Some machines need the joiner regardless of what VBT says */
+	if (intel_has_quirk(display, QUIRK_ALLOW_EDP_JOINER))
+		panel->vbt.edp.pipe_joiner_enable = true;
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a40df9b..613a847184db 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -108,6 +108,16 @@ static void quirk_enable_dpcd_backlight(struct intel_dp *intel_dp)
 	drm_info(display->drm, "Applying Enable DPCD Backlight quirk\n");
 }
 
+/*
+ * VBT on some machines defaults the eDP pipe joiner to disabled even though
+ * the panel requires it to achieve its native mode, so allow it regardless.
+ */
+static void quirk_allow_edp_joiner(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_ALLOW_EDP_JOINER);
+	drm_info(display->drm, "Applying allow eDP joiner quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -270,6 +280,9 @@ static struct intel_quirk intel_quirks[] = {
 
 	/* Xiaomi Book Pro 14 2026 */
 	{ 0xb081, 0x1d72, 0x2424, quirk_disable_psr2 },
+
+	/* ASUS ROG Strix SCAR 18 G835LXG */
+	{ 0x7d67, 0x1043, 0x3b29, quirk_allow_edp_joiner },
 };
 
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 4996419ae76b..c64d0fc39905 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -24,6 +24,7 @@ enum intel_quirk_id {
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
 	QUIRK_DISABLE_PSR2,
 	QUIRK_ENABLE_DPCD_BACKLIGHT,
+	QUIRK_ALLOW_EDP_JOINER,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.50.1


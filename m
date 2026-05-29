Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF07CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B442E112474;
	Fri, 29 May 2026 19:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1nxjQHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03C911246F;
 Fri, 29 May 2026 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780082970; x=1811618970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sFjdj/uHtmMAmB0yBqQayX/pdcIzTMLotdZ31REyfVo=;
 b=B1nxjQHdHl4RCLJb17KyR7fGkJbdWD9KsDoFMCl//Y7zNk7H3zYOY/K4
 MTo25ylsb0VdzwcWK8tvPgTuTVCKOSa/JGXYhMP2C2LRaATzI1k56VFbo
 aITGpXiFegdQT7933QBVy3qMslfjJc/gVLOn6tAzLefXxUg5ZoJQ7tx3I
 AZ7Xzodnm2hCbl4TGWIFrRD45iduw/PUqqccKdMMQnpMEw8uRNdWqpKxM
 J9gT+elPnB8L97ONmSsKORskJB4KK2MZkeA8otkxwW2+hNDsODo8RE2Bk
 8bbBgqmISe6lLeNAYlWhydillxplosuDiTe3PcA91U+ltdG2j3YMN1umt g==;
X-CSE-ConnectionGUID: jYh+oVzTRdaYz2OcoT3a4Q==
X-CSE-MsgGUID: YjEZMxl2RJOyuhNkWJU6dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="103611817"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="103611817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:29:30 -0700
X-CSE-ConnectionGUID: KQ5Vr3r0T2ukq7tP2g8o0g==
X-CSE-MsgGUID: qtseaDHUSwiXbCDHaaNoTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240393504"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 12:29:28 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v4 10/10] drm/i915/bios: remove VS/PE-O warning
Date: Fri, 29 May 2026 21:28:59 +0200
Message-ID: <20260529192859.4172376-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529192859.4172376-1-michal.grzelak@intel.com>
References: <20260529192859.4172376-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

There is not much use of warning when port asks to override default
VS/PE since it is already logged. Remove drm_WARN() and child_device
from print_ddi_port() since drm_WARN() was the only user of it.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 6adec6e60df3..1eb588712ed3 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2769,7 +2769,6 @@ static bool is_port_valid(struct intel_display *display, enum port port)
 static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 {
 	struct intel_display *display = devdata->display;
-	const struct child_device_config *child = &devdata->child;
 	bool is_dvi, is_hdmi, is_dp, is_edp, is_dsi, is_crt, supports_typec_usb, supports_tbt;
 	int dp_boost_level, dp_max_link_rate, hdmi_boost_level, hdmi_level_shift, max_tmds_clock;
 	enum port port;
@@ -2842,14 +2841,6 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 		drm_dbg_kms(display->drm,
 			    "Port %c VBT DP max link rate: %d\n",
 			    port_name(port), dp_max_link_rate);
-
-	/*
-	 * FIXME need to implement support for VBT
-	 * vswing/preemph tables should this ever trigger.
-	 */
-	drm_WARN(display->drm, child->use_vbt_vswing,
-		 "Port %c asks to use VBT vswing/preemph tables\n",
-		 port_name(port));
 }
 
 static void parse_ddi_port(struct intel_bios_encoder_data *devdata)
-- 
2.45.2


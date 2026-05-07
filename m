Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D33CD3444
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726D610EF42;
	Thu,  7 May 2026 01:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4LafZ4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706510EF3C;
 Thu,  7 May 2026 01:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117525; x=1809653525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNkQWphAMUBSvNHJNIekinEJRi2CJ5GWSidliVX6jd4=;
 b=E4LafZ4uyXmo9VdduRY/j8447NIc/82Q8sYl6B+/6uzC4vc/LLSLvJ3h
 xctu6iYgFMkGogurv80QfdgaAuBlNrJPgCsjQChrGxZItg+0Zf+DbOu2u
 BuMTIvwOX/fyUjJ4nE4sor7MQ0sKBeM1JJ2eFHIWTh/wsT0344TDOjGkZ
 AoBF7HBXojj/8k26+alPCN9O4GgSvGRoxdQVm8q4AyNSicmJ/zXEDVCcT
 vVTfSdQ48MrFOvTDZvGYUwPBm848H8r++ds0IHzJMGutsj6RqGBbV2Ufg
 yzIkEe3dZLal9SkdXDAJeVKrcpCMfgqGW7iF+Wmb2fi6hRyBL03NJMQY2 A==;
X-CSE-ConnectionGUID: JviUnDnHQtq2H2lfYQ+0+w==
X-CSE-MsgGUID: KqpTswQ2Qduzzk2RMY09vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089028"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:05 -0700
X-CSE-ConnectionGUID: xmMJKEn7Teeb0QMctRc7AQ==
X-CSE-MsgGUID: e4FyME+lRPGg0qmf6lgmIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692779"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:05 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 11/31] drm/i915/bios: remove VS/PE-O warning
Date: Thu,  7 May 2026 03:31:17 +0200
Message-ID: <20260507013137.527510-12-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
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
index 5ff7f25270cf6..1b813a3dff245 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2764,7 +2764,6 @@ static bool is_port_valid(struct intel_display *display, enum port port)
 static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 {
 	struct intel_display *display = devdata->display;
-	const struct child_device_config *child = &devdata->child;
 	bool is_dvi, is_hdmi, is_dp, is_edp, is_dsi, is_crt, supports_typec_usb, supports_tbt;
 	int dp_boost_level, dp_max_link_rate, hdmi_boost_level, hdmi_level_shift, max_tmds_clock;
 	enum port port;
@@ -2837,14 +2836,6 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
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


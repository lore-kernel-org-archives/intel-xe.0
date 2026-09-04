Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3221C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DEF10FAD4;
	Fri,  4 Sep 2026 12:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buV2MctG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABDA10FABA;
 Fri,  4 Sep 2026 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788525127; x=1820061127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9LU6g9w6KZzrliYMtfnlZJENDmKb1XZMr0sm8yvRSs0=;
 b=buV2MctGY0Ih4+u7JVIXcRlm/CVYc5m0/ZypKFwNFF7F/0y/7TGsJvkj
 Tw3NiQ5W/2htXR7BTFEmYqHb/IBGvQpRjeU6YVNydlWXRt0Yh8M1Cw+pt
 BSUHBeEPhhDLuA8jOZvrddrFgf65ASHxTgvOUNnicskE2kRHP2+hyhFgO
 3VOveRWhPVwsckKp+MPk72t8psdMSJrPgDPrySGubfIbJoL09BAg97bjA
 mNhPgUhvS8bXwCHhGyby0iXeO2CfMSIy9508jrJIXs1+82wQx+mU4wYcx
 51yeyJ/3zeslCy9by2foh5VjNyUT7jJ+PNpeTiWROhSpKdqeeLGYra+PA A==;
X-CSE-ConnectionGUID: +3qu786TTceA4FWc+JyDBA==
X-CSE-MsgGUID: sK9giBpeQyeQSWc2NGnk5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92896602"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92896602"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:32:07 -0700
X-CSE-ConnectionGUID: SPLsLkQoSfivORn5UldSVg==
X-CSE-MsgGUID: vRnZtitCQAWaq8pdbAefJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="275311638"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 04 Sep 2026 05:32:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v12 8/8] drm/i915/bios: remove VS/PE-O warning
Date: Fri,  4 Sep 2026 14:31:48 +0200
Message-ID: <20260904123148.2165596-9-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260904123148.2165596-1-michal.grzelak@intel.com>
References: <20260904123148.2165596-1-michal.grzelak@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 11d2cbb78eabf..7b6a6f8c3cf19 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2791,7 +2791,6 @@ static bool is_port_valid(struct intel_display *display, enum port port)
 static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 {
 	struct intel_display *display = devdata->display;
-	const struct child_device_config *child = &devdata->child;
 	bool is_dvi, is_hdmi, is_dp, is_edp, is_dsi, is_crt, supports_typec_usb, supports_tbt;
 	int dp_boost_level, dp_max_link_rate, hdmi_boost_level, hdmi_level_shift, max_tmds_clock;
 	enum port port;
@@ -2864,14 +2863,6 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
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


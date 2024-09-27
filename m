Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F92ACDD1BC
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 15:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8BD10ECD6;
	Fri, 27 Sep 2024 15:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGQojVcI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7808E10ECCF;
 Fri, 27 Sep 2024 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727450449; x=1758986449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5+vRL/t93ned0andninRpfo6PLrtXWh7I8V/BX46VZ8=;
 b=gGQojVcI8p2w6n8ZT7Mv4lU7T83bPdhMS0OBPU9kwj4UM1VBLLZCKohL
 mY8RCvkj8BOgWjDCyKlQM6GSVAcnXIx8nyjf64QHuBvm7l1FUy2RTWR3R
 YbCgMU+iOFnfTDPcMcjjrCmNmiLloK8jSCIHSa76rXOkGdFuWC56wlpl+
 MNpIXBawD4ahDmM2hMqRHkqijv1CRmxYR4f1RSspre32mo4b3obt0f7G/
 5az9hZPO0L3UX604Cs8bwlrtjZkA2+17PFveU6UPa+pTq10Hdg07iFJ0v
 gcSefBGO+ZFsa5wmF9Lw4Z6tV4VC6/Tvlml/dbGbuGpEIf2BdO4paINF6 g==;
X-CSE-ConnectionGUID: ytBkbNeAQvqxgddd0Tuo4Q==
X-CSE-MsgGUID: VfQ/9YqnTUWIfXvxlhtMyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37179719"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="37179719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 08:20:49 -0700
X-CSE-ConnectionGUID: iwp4gspRTvS4qygTRiqdCQ==
X-CSE-MsgGUID: nAv3hzDwQDiHUrSuliiCXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="95896883"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 08:20:47 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 02/17] drm/i915/display_debugfs: Allow force joiner only if
 supported
Date: Fri, 27 Sep 2024 20:52:26 +0530
Message-ID: <20240927152241.4014909-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927152241.4014909-1-ankit.k.nautiyal@intel.com>
References: <20240927152241.4014909-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently we support joiner only for DP encoder.
Do not create the debugfs for joiner if DP does not support the joiner.
This will also help avoiding cases where config has eDP MSO, with which
we do not support joiner.

v2: Check for intel_dp_has_joiner and avoid creating debugfs if not
supported. (Ville)
v3: Remove HAS_BIGJOINER check. (Ville)
v4: Reverse checks for connector type and intel_dp_has_joiner(). (Ville)
v5: Drop the local variable intel_dp and use intel_attached_dp() directly.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 890ef7067b77..c38023b43682 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1362,9 +1362,9 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 				    connector, &i915_dsc_fractional_bpp_fops);
 	}
 
-	if (HAS_BIGJOINER(i915) &&
-	    (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
-	     connector_type == DRM_MODE_CONNECTOR_eDP)) {
+	if ((connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+	     connector_type == DRM_MODE_CONNECTOR_eDP) &&
+	    intel_dp_has_joiner(intel_attached_dp(connector))) {
 		debugfs_create_bool("i915_bigjoiner_force_enable", 0644, root,
 				    &connector->force_bigjoiner_enable);
 	}
-- 
2.45.2


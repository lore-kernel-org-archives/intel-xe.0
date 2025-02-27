Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEF2C1B087
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 10:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6D210EA8D;
	Thu, 27 Feb 2025 10:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUUo0xCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665A610EA8B;
 Thu, 27 Feb 2025 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740653389; x=1772189389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4z5ByfQ2FEoMcZZ3z2rO9l8JTJsDFsrGIOPlfG5u2hU=;
 b=eUUo0xCZt48gO5nhJp8E8uN/VlrfDQciBzhslG16Ar9Ij+XOVaa+tn9O
 I4WVlWpGXbZbtCl7yTciJryad3hCNt5PrzH9ztFs/y3tqegtJh9ZW6vaH
 wsRyZ4x15tJM2+88C4/Cqpze4ld+HpIPv7uY2qw9MEeAoJidtmkYI47cY
 fP/1rqbZ0np9jhN5YL/7+LTOO4xd1CwDFm0ObbwRoqpePd7ci2OBJF8sn
 +JD+UwJkoiMZsQ3wAIpjWWHrZa9OjOFNXZfXEQzGdQ1Ms+652Jwbc+lhj
 WJtfIMXqgdrmNshSX/JKdlzo5+vh9OhhHULbAH9Po/i9YQAmC0OXhGgLZ g==;
X-CSE-ConnectionGUID: kTjGXA82RDKB3RALHj/OeA==
X-CSE-MsgGUID: 5N1pZA6eQiui1hzVU+zmcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44361818"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="44361818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:49:49 -0800
X-CSE-ConnectionGUID: EARKrY+lQaaPIy+W4mIXrQ==
X-CSE-MsgGUID: XkR2yeLpRNammC+NpyFAUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121593071"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2025 02:49:47 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com, william.tseng@intel.com,
 jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/vdsc: Use the DSC config tables for DSI panels
Date: Thu, 27 Feb 2025 16:19:43 +0530
Message-Id: <20250227104943.265458-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Some DSI panel vendors end up hardcoding PPS params because of which
it does not listen to the params sent from the source. We use the
default config tables for DSI panels when using DSC 1.1 rather than
calculate our own rc parameters.

--v2
-Use intel_crtc_has_type [Jani]

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13719
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 6e7151346382..affe9913f1ee 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -320,7 +320,9 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 	 * upto uncompressed bpp-1, hence add calculations for all the rc
 	 * parameters
 	 */
-	if (DISPLAY_VER(dev_priv) >= 13) {
+	if (DISPLAY_VER(dev_priv) >= 13 &&
+	    (vdsc_cfg->dsc_version_minor != 1 ||
+	     intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DSI))) {
 		calculate_rc_params(vdsc_cfg);
 	} else {
 		if ((compressed_bpp == 8 ||
-- 
2.34.1


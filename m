Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CD4C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 13:44:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2295310E26E;
	Mon, 24 Mar 2025 13:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmhqIZ4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3540810E26E;
 Mon, 24 Mar 2025 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823880; x=1774359880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wTrBq0rmVsGk9LwWbSeVbEPwVwTPlUS/aQDJWPq0ILA=;
 b=YmhqIZ4mHOMS8fU799zPwd3cqQMyDOU8IEI6qJ7GnsuIacjVdOPkwdpS
 qwnN/WQEejxZgCNzx/hYTB7ym70gU6T/VpsvMSkekLeVaCWeveDulXM6A
 nHRR/tYwTT3WIDrmP0K2OvCoGpliNjMNDtcJPjJ5fI6k6uvzdyN3C+iLo
 mHLpeJV3MojyriHbGaRebp7hftvX/RMIKfnS62NAtfPAN/BocgRy0SOg2
 zNzv+mmBcprSYy3lTgxxTdhyI8fMuRZGykxN8u5MHdwQprN59Ruwue7QM
 V1FiSb2M0Yo9ov60YqzSV/PQrZb1afn+NBJlgCaY8HfPCp7CfYww/vgtX A==;
X-CSE-ConnectionGUID: 1MXBqPERS66H6dG/Hq/RZg==
X-CSE-MsgGUID: ckJbrC8ySxuuSBGy3yjQ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43955691"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43955691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:44:39 -0700
X-CSE-ConnectionGUID: SRdC0U93Q+qPscvjr0m1pw==
X-CSE-MsgGUID: FEdTTfLdR6+W7U3ExvmbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124040466"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:44:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 01/16] drm/i915/hdmi: Use VRR Timing generator for HDMI for
 fixed_rr
Date: Mon, 24 Mar 2025 19:02:33 +0530
Message-ID: <20250324133248.4071909-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324133248.4071909-1-ankit.k.nautiyal@intel.com>
References: <20250324133248.4071909-1-ankit.k.nautiyal@intel.com>
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

Currently VRR is not supported with HDMI, but we can still leverage
the VRR Timing Generator to achieve a fixed refresh rate.
Call intel_vrr_compute_config() for HDMI which will handle the vrr
timings to have fixed refresh rate with VRR Timing Generator.

v2: Improve commit message. (Ville).

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> (#v1)
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 33b8d5229db0..f9fa17e1f584 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -64,6 +64,7 @@
 #include "intel_panel.h"
 #include "intel_pfit.h"
 #include "intel_snps_phy.h"
+#include "intel_vrr.h"
 
 static void
 assert_hdmi_port_disabled(struct intel_hdmi *intel_hdmi)
@@ -2384,6 +2385,8 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 		}
 	}
 
+	intel_vrr_compute_config(pipe_config, conn_state);
+
 	intel_hdmi_compute_gcp_infoframe(encoder, pipe_config,
 					 conn_state);
 
-- 
2.45.2


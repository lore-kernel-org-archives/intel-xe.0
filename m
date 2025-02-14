Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61959C021A7
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 12:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A23A10E2C8;
	Fri, 14 Feb 2025 12:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+dlCdP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164110E2B4;
 Fri, 14 Feb 2025 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739535763; x=1771071763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WAIE8s5e+Tk5MiZsgnFvXnSFAT4sWlQT608GpApNSvs=;
 b=M+dlCdP0qJayiYs9V4EbtHYcBJcBYhr0OeDzqRN4dfCq7qjE+DxH+NOz
 UJwPjaKqkHjADbI2Qm+oeZXqNZdUXzxM09XF6F4sXvow+ogEs4WHIiA+1
 ks9khNvSKLBW1FatsEU6FAnmq89YZAp1RXs1T+7Ddi6dMlRZq42EBokRU
 VKcjgv1037TaTSUiRb2pBOCiVt3c+CCclZVR5b08CR94R/ubIIKjXD0O1
 RwHR2G5/h8JJzFL7cFi5uLn9TZzvu2UmPCGN45LXH4T83A5GggXEw5YJh
 ybJz6waOaG15WsKE4wLH37VZVn02nkCho8W+nM17EaPUx3sSxDzx4bXlX w==;
X-CSE-ConnectionGUID: SMBmOurQSY+9CImwBaCzmQ==
X-CSE-MsgGUID: 0nucllJ+RYiKONj768FAAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51255999"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="51255999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:22:43 -0800
X-CSE-ConnectionGUID: FdnZ4FhYSbKiJjC77xfQ0g==
X-CSE-MsgGUID: dvZv73VkTEKH/9E64LV/ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113309557"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:22:40 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 08/19] drm/i915/dp: Avoid vrr compute config for HDMI sink
Date: Fri, 14 Feb 2025 17:41:18 +0530
Message-ID: <20250214121130.1808451-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250214121130.1808451-1-ankit.k.nautiyal@intel.com>
References: <20250214121130.1808451-1-ankit.k.nautiyal@intel.com>
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

Currently we do not support VRR with HDMI so skip vrr compute
config step for DP with HDMI sink.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9ed7d46143e9..bdf53d255d91 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3199,7 +3199,13 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (pipe_config->splitter.enable)
 		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
 
-	intel_vrr_compute_config(pipe_config, conn_state);
+	/*
+	 * VRR via PCON is currently unsupported.
+	 * TODO: Add support for VRR for DP HDMI2.1 PCON.
+	 */
+	if (!intel_dp_has_hdmi_sink(intel_dp))
+		intel_vrr_compute_config(pipe_config, conn_state);
+
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
-- 
2.45.2


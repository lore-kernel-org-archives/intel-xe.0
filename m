Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A544C87FD1
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 05:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0710E42E;
	Fri, 25 Jul 2025 05:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIwuuBdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C753510E442;
 Fri, 25 Jul 2025 05:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419891; x=1784955891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hXVEmnefqqtOVsU64lL3aPEXPXPgM4VcZ49lUq5b/rY=;
 b=eIwuuBdmEl+MLDql6mo1jOjTCBosZA9doW2SDR6kE6g9cKTudLIKf2h2
 SkNzIYH0aREkIB6OBo8QINw9q1e89vwPOttKyqSAax98D8K/oLwRGfJM+
 zvrwSqvF/SffEKKQLPjXLfoXSQTjNLjJL9nHCRBr/yyal1hKGlv4ZZyTH
 yV7eWWnL4cWcc7omz0SAAgvtlgqf5Htpu2cjy86AXPyvU4ZJpVkA5kCD8
 oIkDuh7b8DG4xewXeS/sXN68TDiGL+/9AScsbJoITkCboc47gDaPq2eTQ
 f4d6ecEb6RoSZAeTvRyNI5IMP3jXJfSIKv2xrah/cOYnwI/MtLWds/YOR Q==;
X-CSE-ConnectionGUID: mpRIgQhESYyu2dvTrYWMoA==
X-CSE-MsgGUID: YemyPjztTDqVKyK0ptCD/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299547"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:50 -0700
X-CSE-ConnectionGUID: dhlmuBjMTje7iXOBds+ZnA==
X-CSE-MsgGUID: wktz7LQkQwqB4Vh/i1gk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956634"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 15/28] drm/i915/writeback: Define compute_config for writeback
Date: Fri, 25 Jul 2025 10:33:56 +0530
Message-Id: <20250725050409.2687242-16-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Define the compute config function where we assign the output_type
and add the transcoder that needs to be used. We currently assign
one WD0 transcoder.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index f1570a638422..3ea09587c4c2 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -214,6 +214,25 @@ static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_f
 	.get_connector_from_writeback = intel_get_connector_from_writeback,
 };
 
+static int
+intel_writeback_compute_config(struct intel_encoder *encoder,
+			       struct intel_crtc_state *pipe_config,
+			       struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	if (!conn_state->writeback_job)
+		return 0;
+
+	if (HAS_TRANSCODER(display, TRANSCODER_WD_0))
+		pipe_config->cpu_transcoder = TRANSCODER_WD_0;
+
+	pipe_config->output_types |= BIT(INTEL_OUTPUT_WRITEBACK);
+	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
+
+	return 0;
+}
+
 static void
 intel_writeback_get_config(struct intel_encoder *encoder,
 			   struct intel_crtc_state *crtc_state)
@@ -294,6 +313,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->cloneable = 0;
 	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
+	encoder->compute_config = intel_writeback_compute_config;
 
 	connector = &writeback_conn->connector;
 	intel_writeback_connector_alloc(connector);
-- 
2.34.1


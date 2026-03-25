Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6F103A9AB
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71D10E863;
	Wed, 25 Mar 2026 11:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvOc/X/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C95B10E863;
 Wed, 25 Mar 2026 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436900; x=1805972900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v3Txxn1Cz9ZhrzG+YyeLLTbOiPuX0XkViWnaxfYpcEw=;
 b=TvOc/X/Hbl0V/A2zGo72CfOR08s/ZWhXVDfHsF3bLnATgdY1NDLtGR5M
 xkhDjIyLXOGKWFghxoPMRMfJD0ytFBjMMxrzQGWLsTGoObBrit9/G+Bqu
 qeaTDAGrPOcnKYmITVCeGjy7QKLmKK5/Gf4dAWaEW88rGbxDsLkaMEP4R
 vPmgePu5rphLuqPkGE+jq5Qg/NvS31XqDm1m4lIbVYFFjzu02mloTk1GS
 5crBx8i3xK/DPiUqg8+ho03a+WDcBRQgtmLQPEJYa0RSUErdNxsqoceQm
 ogAuaj3LLxR4toGXgD1pRstA+/+LLHlTVFu1oeaimdVR0Gc0SQPBWwkEQ Q==;
X-CSE-ConnectionGUID: tHba0aiDSEapTghBIjgiAw==
X-CSE-MsgGUID: Cmqat/ekT9CJEIZFwQnzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047522"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:20 -0700
X-CSE-ConnectionGUID: 6jwlG8/BTWmyWnFYzGEUYw==
X-CSE-MsgGUID: CHuBXMv/SuiUzZ6bdQTAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798375"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:18 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 12/26] drm/i915/writeback: Define compute_config for
 writeback
Date: Wed, 25 Mar 2026 16:37:30 +0530
Message-Id: <20260325110744.1096786-13-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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
index 4a40fda639ca..b9350d97de09 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -171,6 +171,25 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.cleanup_writeback_job = intel_writeback_cleanup_job,
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
@@ -251,6 +270,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->cloneable = 0;
 	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
+	encoder->compute_config = intel_writeback_compute_config;
 
 	connector = &writeback_conn->connector;
 	ret = intel_writeback_connector_alloc(connector);
-- 
2.34.1


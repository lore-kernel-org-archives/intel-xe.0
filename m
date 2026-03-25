Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880A1FEA807
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19510E762;
	Wed, 25 Mar 2026 05:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1EYpl4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44C110E764;
 Wed, 25 Mar 2026 04:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414799; x=1805950799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TP2k1C402cc1si/L4LMR8xxld7VMajajQhGE13rnsS4=;
 b=M1EYpl4Vm2o6qz4SpaaxYwY2+/er+KP4Pfu+xySOhhZBTIcd6RJvnSIX
 dsxuJxgfzNLq0sg9028pUqIY3wFWbVavm+M8jITtzv9hWHRuwXc8HW6J9
 7XEx/tlsv9cBcLA8q4erv+4RH/Eyr7j5kwaPLgVjtSZV6Y/Fzqkb8l4WY
 Bi3yiwmtv2Hg/Ysbs5WZms4E/tQlyUJzAuIWpdbjfE4qy39keIkN+vg7d
 b6jy356LKbf57RvBpKaqeBrYXzhyyuj7TpVtapfivtdEQ+JkAG5IZDY3X
 yIkP/J9fuYHVWGxmyzaKkyRWB0FEIgkK2TxJ0D4Ep2DXW8eQDx7cN/CTY A==;
X-CSE-ConnectionGUID: kYIZzL7rSL21A/rf4fOkmg==
X-CSE-MsgGUID: dbywguBlSSaVPJzSF+d9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922323"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 21:59:57 -0700
X-CSE-ConnectionGUID: 8A9WNGLsRpqG3Xly59J56g==
X-CSE-MsgGUID: 19+vm2/PQsezLur1NXkiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580545"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 21:59:55 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 12/26] drm/i915/writeback: Define compute_config for
 writeback
Date: Wed, 25 Mar 2026 10:29:02 +0530
Message-Id: <20260325045916.984243-13-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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
index 1de336f3d2c9..c1361a295b17 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -170,6 +170,25 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
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
@@ -250,6 +269,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->cloneable = 0;
 	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
+	encoder->compute_config = intel_writeback_compute_config;
 
 	connector = &writeback_conn->connector;
 	ret = intel_writeback_connector_alloc(connector);
-- 
2.34.1


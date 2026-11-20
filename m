Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40BA606A334
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lvkHSr1A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7112A112AE5;
	Fri, 20 Nov 2026 14:24:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0375112AA1;
 Fri, 20 Nov 2026 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184644; x=1826720644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CcRWFjpXfmzPQvwJT6CHSZDHvFe8dQnBy26Z8n/Fn3s=;
 b=lvkHSr1AUV5SNmHm/D5A5gmyD9o6eyIUU7jQF4AtMvF6IVnNIz73EYN1
 agVHwDzgxj8WPA2dxcSXgAQ3eErEmEA8VywKhlrk+V/oVHn57kbL+zZOv
 fULq4S+ylz1G4/Vkh/6s4VTXbi7ltH56373pO4k4h3Nf3RCh2L03gIwsS
 zGrpXAAAPCYDAuOahXloFW8OtEsLgagW99tkDmzezpGC9wBpYRsE1J8l9
 rPaIkQtvMDIcp6BPTWRGhiSYqh8FtRm45pkz8tHcdALtgZsyB3aqwRNW2
 QwBm7dwISeQBldvlpT6CO0XK9z11i2Nao+H7kyWPoyj4jbuxm61RWdZUT g==;
X-CSE-ConnectionGUID: SpFQ3jTZRRCsa8MNYRJFmg==
X-CSE-MsgGUID: OmKlzpqlRma5/vG/QD9q1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091020"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091020"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:46 -0800
X-CSE-ConnectionGUID: OA0cK6oWRXOoFmtII8Ka0A==
X-CSE-MsgGUID: SqnIztj+TiyhJP8VRTdCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422054"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:45 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 22/29] drm/i915/dp: Enable DSC pass-through in the PCON
Date: Fri, 20 Nov 2026 19:37:22 +0530
Message-ID: <20261120140729.466177-23-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A PCON that passes a DSC 1.2a stream through to the HDMI sink must not
decode it: the source has to write DPCD 160h = 02h, setting only the
pass-through bit, and leave the decompression bit clear.

For SST the sink's AUX channel is the one of the PCON. When the stream
goes through the PCON, set the pass-through bit there instead of
enabling decompression, and clear it again when the stream is disabled.

No PCON DSC operation selects pass-through yet, so there is no change
in behavior.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 26 ++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2d5587ec923c..9e69035a99eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4175,6 +4175,18 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 			    str_enable_disable(enable));
 }
 
+static void
+intel_dp_pcon_set_dsc_passthrough(struct intel_connector *connector, bool enable)
+{
+	struct intel_display *display = to_intel_display(connector);
+
+	if (write_dsc_decompression_flag(connector->dp.dsc_decompression_aux,
+					 DP_DSC_PASSTHROUGH_EN, enable) < 0)
+		drm_dbg_kms(display->drm,
+			    "Failed to %s PCON DSC pass-through\n",
+			    str_enable_disable(enable));
+}
+
 static int intel_dp_dsc_aux_ref_count(struct intel_atomic_state *state,
 				      const struct intel_connector *connector,
 				      bool for_get_ref)
@@ -4245,7 +4257,8 @@ static bool intel_dp_dsc_aux_put_ref(struct intel_atomic_state *state,
  * sink device, whereas on MST based on each device's DSC capabilities it's
  * either the last branch device (enabling decompression in it) or both the
  * last branch device (enabling passthrough in it) and the sink device
- * (enabling decompression in it).
+ * (enabling decompression in it). A PCON passing a DSC stream through to
+ * the HDMI sink gets passthrough enabled instead of decompression.
  */
 void intel_dp_sink_enable_decompression(struct intel_atomic_state *state,
 					struct intel_connector *connector,
@@ -4264,6 +4277,12 @@ void intel_dp_sink_enable_decompression(struct intel_atomic_state *state,
 	if (!intel_dp_dsc_aux_get_ref(state, connector))
 		return;
 
+	/* A PCON passing the DSC stream through to the HDMI sink doesn't decode it */
+	if (new_crtc_state->pcon_config.dsc_op == INTEL_PCON_DSC_PASSTHROUGH) {
+		intel_dp_pcon_set_dsc_passthrough(connector, true);
+		return;
+	}
+
 	intel_dp_sink_set_dsc_passthrough(connector, true);
 	intel_dp_sink_set_dsc_decompression(connector, true);
 }
@@ -4295,6 +4314,11 @@ void intel_dp_sink_disable_decompression(struct intel_atomic_state *state,
 	if (!intel_dp_dsc_aux_put_ref(state, connector))
 		return;
 
+	if (old_crtc_state->pcon_config.dsc_op == INTEL_PCON_DSC_PASSTHROUGH) {
+		intel_dp_pcon_set_dsc_passthrough(connector, false);
+		return;
+	}
+
 	intel_dp_sink_set_dsc_decompression(connector, false);
 	intel_dp_sink_set_dsc_passthrough(connector, false);
 }
-- 
2.50.1


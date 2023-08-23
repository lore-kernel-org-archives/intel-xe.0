Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70000C7EE43
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B679B10E491;
	Wed, 23 Aug 2023 17:09:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4BD10E485;
 Wed, 23 Aug 2023 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692810560; x=1724346560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xbqoFV6B5UMZ7XLeWlIItIOEbPaIEyFLPGmGgVJ8xes=;
 b=TIoOaBbQ4Mk2g0gBmTZNKvCa10kEWKzuMzk8lUC8sJJ/9we2k7MRu9/Z
 o/YTg2cV1naIb9yIWuuYIpMBBNf/T3QY+L7I/UanGhha3q8Nf8go1K+fs
 dGg37C81XJX+Y30X0vWLENX0ulyCsCLCc5xSabEoV1bLDpT58287NeiR1
 g70vu1FLWKLbf6dHcn9rGnsh9R7djf25a91nPqcjS29PX7gH9K+ZLSCj3
 66fPiibgb03uyzL5oj+aM2H30miJD/ohUnLn6L2Ln6Ng/IA8Ynxa4f+6a
 iLCDwKBoYGYIZCuLNJrn+fcFbxJTj7MYrXGkwG0UiyGAMNbgH3wkKPVwI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438147494"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="438147494"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802204839"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802204839"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:07:23 -0700
Message-Id: <20230823170740.1180212-26-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823170740.1180212-1-lucas.demarchi@intel.com>
References: <20230823170740.1180212-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 25/42] drm/i915/xe2lpd: Add support for DP aux
 channels
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Gustavo Sousa <gustavo.sousa@intel.com>

The location of aux channels registers for Xe2 display changed w.r.t.
the previous version.

BSpec: 69010
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 43 ++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 3fcf609a1444..1ab6964ee1c2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -714,6 +714,44 @@ static i915_reg_t xelpdp_aux_data_reg(struct intel_dp *intel_dp, int index)
 	}
 }
 
+static i915_reg_t xe2lpd_aux_ctl_reg(struct intel_dp *intel_dp)
+{
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum aux_ch aux_ch = dig_port->aux_ch;
+
+	switch (aux_ch) {
+	case AUX_CH_A:
+	case AUX_CH_B:
+	case AUX_CH_USBC1:
+	case AUX_CH_USBC2:
+	case AUX_CH_USBC3:
+	case AUX_CH_USBC4:
+		return XE2LPD_DP_AUX_CH_CTL(aux_ch);
+	default:
+		MISSING_CASE(aux_ch);
+		return XE2LPD_DP_AUX_CH_CTL(AUX_CH_A);
+	}
+}
+
+static i915_reg_t xe2lpd_aux_data_reg(struct intel_dp *intel_dp, int index)
+{
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	enum aux_ch aux_ch = dig_port->aux_ch;
+
+	switch (aux_ch) {
+	case AUX_CH_A:
+	case AUX_CH_B:
+	case AUX_CH_USBC1:
+	case AUX_CH_USBC2:
+	case AUX_CH_USBC3:
+	case AUX_CH_USBC4:
+		return XE2LPD_DP_AUX_CH_DATA(aux_ch, index);
+	default:
+		MISSING_CASE(aux_ch);
+		return XE2LPD_DP_AUX_CH_DATA(AUX_CH_A, index);
+	}
+}
+
 void intel_dp_aux_fini(struct intel_dp *intel_dp)
 {
 	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
@@ -731,7 +769,10 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 	struct intel_encoder *encoder = &dig_port->base;
 	enum aux_ch aux_ch = dig_port->aux_ch;
 
-	if (DISPLAY_VER(dev_priv) >= 14) {
+	if (DISPLAY_VER(dev_priv) >= 20) {
+		intel_dp->aux_ch_ctl_reg = xe2lpd_aux_ctl_reg;
+		intel_dp->aux_ch_data_reg = xe2lpd_aux_data_reg;
+	} else if (DISPLAY_VER(dev_priv) >= 14) {
 		intel_dp->aux_ch_ctl_reg = xelpdp_aux_ctl_reg;
 		intel_dp->aux_ch_data_reg = xelpdp_aux_data_reg;
 	} else if (DISPLAY_VER(dev_priv) >= 12) {
-- 
2.40.1


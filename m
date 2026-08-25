Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF66C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F42410E8E7;
	Tue, 25 Aug 2026 06:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5DVvIVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A87710E8DF;
 Tue, 25 Aug 2026 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638760; x=1819174760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZexWruf4An26dawRMh1aGt9P5v0TeUZ8I5yjtqKY3zQ=;
 b=d5DVvIVS6QIQecqcI9eijOBgQ/uLFwbY/DnmpUJxndK4Rz71/OX1gm4n
 zAb86J2nK1jxBWgj+GbJLBduBtjA1p4IQBmH+5ptPhW4r+YZvEXdJop51
 W3m5a0LOkXQBUcMvz4pKvXMgASa1XIaYhBKFS3qNfxPKiq54n/ITru0Vp
 IXdnbcbxhHj9OP28GS3dTi7vpc3se+JMzLdTtc6Oid2VF3JxjcPItQA22
 8Rt8eQ+wg5izUVLWKJv7kriU84yG/sQuLw6fJJn0XuYD54wvQA57kJ4n4
 7l1JChTII+RrD2JQ+yNQrJA2ZMMjcf4rFllxfdpKAFpFUEpfyszgyrIbz Q==;
X-CSE-ConnectionGUID: /l/6KrktThGOwIZ4dTdLbw==
X-CSE-MsgGUID: o7CRsjKMRW2M+RDjG+LQNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112651"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112651"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:13 -0700
X-CSE-ConnectionGUID: bghG5WGlSS6i9RsS4JzJyQ==
X-CSE-MsgGUID: dSZZfnooSESIv0Jm2Ip85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912896"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:11 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 03/15] drm/i915/alpm: alpm_init() for DP2.1
Date: Tue, 25 Aug 2026 11:15:24 +0530
Message-Id: <20260825054536.3455704-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

Initialize ALPM for DP2.1 and separate out ALPM mutex-init
from alpm-init.

v2: Separate out mutex-init. [Jani]
v3: Refactor further to avoid DISPLAY_VER check in multiple places. [Jani]
V4: Cosmetic changes. [Suraj]

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c   |  8 ++++++--
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 542900e29a01..08ad77cd32f8 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -43,6 +43,19 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
 }
 
+bool intel_alpm_source_supported(struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(connector);
+
+	if (!((connector->base.connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	       DISPLAY_VER(display) >= 35) ||
+	    (connector->base.connector_type == DRM_MODE_CONNECTOR_eDP &&
+	     DISPLAY_VER(display) >= 20)))
+		return false;
+
+	return true;
+}
+
 void intel_alpm_init_dpcd(struct intel_dp *intel_dp)
 {
 	u8 dpcd;
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index fae68d557960..7280865ed5f0 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -15,6 +15,7 @@ struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
 
+bool intel_alpm_source_supported(struct intel_connector *connector);
 void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 void intel_alpm_init(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 77d516f0bd07..042c6e8b8e60 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6343,6 +6343,9 @@ intel_dp_detect(struct drm_connector *_connector,
 	if (ret == 1)
 		connector->base.epoch_counter++;
 
+	if (intel_alpm_source_supported(connector))
+		intel_alpm_init_dpcd(intel_dp);
+
 	if (!intel_dp_is_edp(intel_dp))
 		intel_psr_init_dpcd(intel_dp, connector);
 
@@ -6986,8 +6989,6 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	intel_hpd_enable_detection(encoder);
 
-	intel_alpm_init(intel_dp);
-
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, connector);
 
@@ -7202,6 +7203,9 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 
 	intel_psr_init(intel_dp);
 
+	if (intel_alpm_source_supported(connector))
+		intel_alpm_init(intel_dp);
+
 	return true;
 
 fail:
-- 
2.29.0


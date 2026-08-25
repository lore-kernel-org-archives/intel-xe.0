Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAECC61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85F210E8D3;
	Tue, 25 Aug 2026 06:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtzFqRQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB3310E13B;
 Tue, 25 Aug 2026 06:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638753; x=1819174753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eN9NcZmZ8Qkve7AYwFOVQIS2gONTCqpbTyCzkGwh2FE=;
 b=CtzFqRQtHcKRIBxAMfyxcS/C5UxhPXLgscuuImQ2tmnBcqS+5neqhZ98
 gZuRgK4Xrp//ENnc+asQ7XJlhjFCTeE+dr1zskdGsL3R7NwPIXoCi768Y
 voTeccUNVW+U5kKNT3sDrdhJwWh3VSXlg+k0/tpdMzNTITJDa9obVRofs
 WA1za+wUkyc07L1rDtA9NBx9gmK+qwlN0E4zH0b/b+L4vXDcu1zixfC3q
 RmIjMVLjZ+5Mx8e89ApOsGhYPIFNE5mhumH/RJqvpLrA0q92SnwP7hHah
 bMxC6t7KGYjytTDgmGkwOs6PxuC4wu6Ts3vi8cvLaEx5ppSAFfCBaWkU2 w==;
X-CSE-ConnectionGUID: tDWRcVrFSnKMxT/YPcUzbg==
X-CSE-MsgGUID: zy8l7sA3S6aSrcMdbnNJdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112644"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:12 -0700
X-CSE-ConnectionGUID: zIVddpWRTVK7F7xV+ZRndg==
X-CSE-MsgGUID: seGXi3/vSfq1HxlUB1cqkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912889"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:08 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality readout in
 separate function
Date: Tue, 25 Aug 2026 11:15:23 +0530
Message-Id: <20260825054536.3455704-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

Non functional change.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 10 ++++++++++
 drivers/gpu/drm/i915/display/intel_alpm.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c   |  7 +------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f1383764b702..542900e29a01 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -43,6 +43,16 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
 }
 
+void intel_alpm_init_dpcd(struct intel_dp *intel_dp)
+{
+	u8 dpcd;
+
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP, &dpcd) < 0)
+		return;
+
+	intel_dp->alpm_dpcd = dpcd;
+}
+
 void intel_alpm_init(struct intel_dp *intel_dp)
 {
 	mutex_init(&intel_dp->alpm.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 1cf70668ab1b..fae68d557960 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -15,6 +15,7 @@ struct intel_connector;
 struct intel_atomic_state;
 struct intel_crtc;
 
+void intel_alpm_init_dpcd(struct intel_dp *intel_dp);
 void intel_alpm_init(struct intel_dp *intel_dp);
 bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 			       struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6b60e0a1c8ee..77d516f0bd07 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4764,7 +4764,6 @@ static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	int ret;
 
 	/* this function is meant to be called only once */
 	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
@@ -4804,11 +4803,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	 */
 	intel_dp_init_source_oui(intel_dp);
 
-	/* Read the ALPM DPCD caps */
-	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_RECEIVER_ALPM_CAP,
-				    &intel_dp->alpm_dpcd);
-	if (ret < 0)
-		return false;
+	intel_alpm_init_dpcd(intel_dp);
 
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
-- 
2.29.0


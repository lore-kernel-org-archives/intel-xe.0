Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAD5EA3C25
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7A310E79C;
	Thu,  9 Apr 2026 10:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TM7lIG9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8D310E78E;
 Thu,  9 Apr 2026 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775729770; x=1807265770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLBo+FaKcvzmdddjsW47zaFAJeeIc+HzyTMUJlbOz/8=;
 b=TM7lIG9T5mrZvahKLP7tTuUhDAhQqfGhDN9pl1sQSjQVM5Jx2eMolb/K
 Rwol6sQoNonrfjr1iPTCHWcZU5X9dwytXaEYgjoDqPwkeTtanPFZPJUP9
 thsVmEyczIDBwhOXEw1/7BpsfGiCzwgYzYkzMEqQqMyh+RDGatGZqhRAw
 XeqmMZbrw3GfDZ6GPMcsM75Hog7LtdfyP6h0Mk0pMumKqzPEbCvnvzxYW
 Kg78eDjXzBmAq/1UU1CkiGejKui+kKO/0/dSPy5W1SiBTT4isuB65NiJ0
 Q4a3IGWk1mdOicVOmEIwMe/2mrG6YV27Bsbtofv3HDCFle9fyTfWmFF26 w==;
X-CSE-ConnectionGUID: XoFMV+S0Qx+0/FKNlwpD2A==
X-CSE-MsgGUID: Ll7kgQS1TTWhYPAQHG1u/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87354271"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87354271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:16:10 -0700
X-CSE-ConnectionGUID: J78U3NneS6+WRvtIMSk3Fw==
X-CSE-MsgGUID: ElPFiud3TaquC/f7rWt0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="252065520"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:16:08 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 6/9] drm/i915/dp: Require a HDMI sink for YCbCr output via
 PCON
Date: Thu,  9 Apr 2026 13:15:36 +0300
Message-ID: <20260409101539.22032-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

DVI sinks can't deal with YCbCr. Make sure we have a HDMI sink connected
after the PCON before doing YCbCr 4:2:0 output.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 99672341f43e..e80682834530 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1349,10 +1349,15 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
 			   const struct drm_display_mode *mode,
 			   enum intel_output_format sink_format)
 {
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	const struct drm_display_info *info = &connector->base.display_info;
 
 	switch (sink_format) {
 	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		if (intel_dp->dfp.min_tmds_clock &&
+		    !intel_dp_has_hdmi_sink(intel_dp))
+			return MODE_NO_420;
+
 		if (!connector->base.ycbcr_420_allowed ||
 		    !drm_mode_is_420(info, mode))
 			return MODE_NO_420;
-- 
2.52.0


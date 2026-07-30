Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F903C55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A611610EEF0;
	Thu, 30 Jul 2026 11:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgVHcU2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10D710EED6;
 Thu, 30 Jul 2026 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409782; x=1816945782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dXQsOUxk2ch87fA8qRh1GOKVGpVsax1E7lYommY3zd8=;
 b=VgVHcU2AxEUBSnaigrcppB49lmG11J9iBoEm6UTYESXFXx4QrIa6XWpN
 cIsFEHbiCgirlqlbRt/QwgooLpYzfjxYakoDRqSKNOMLMb7C44lC8tdBP
 UNao3aCxxdZ4gQSFWOQVcpHpZGDS5kwhudgJNnHPzf0IkwH105+++jS1v
 3g53olDSbK3IcKMNSlMyGkqYfEjFftL2J1S8CvL483E6zOYyFvB0kK3N+
 wEZruxfY0Pzoh5Daqrzd0J4YIIhsIiksEIPoT0nrtwE3pAYIRhxeTvPsw
 5Y2ppyZd7rxEInxjHt6+O6ph+Hvda9UzYdTKuhk8xCqGfLZq2OKZtcS2l Q==;
X-CSE-ConnectionGUID: 8/LBcpvIRRSIMiECnInLiA==
X-CSE-MsgGUID: KlNqx4KWQGG0h5aLItnVTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182416"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:42 -0700
X-CSE-ConnectionGUID: cFjVogEMTUSbjDTW5dooAA==
X-CSE-MsgGUID: UjLinZvKRmWcJT7P7PcJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327119"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:39 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 07/14] drm/i915/dp: Use FRL pair check for the DFP dotclock
 limit
Date: Thu, 30 Jul 2026 16:22:19 +0530
Message-ID: <20260730105226.2731341-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
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

intel_dp_mode_valid_downstream() uses the intel_dp_hdmi_sink_max_frl()
to check if FRL is to be used, in order to skip the max dotclock limit
for the FRL cases.

Instead, use the intel_dp_pcon_sink_support_frl() that check both sink and
the pcon's FRL capabilities.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6bf42128a81d..d2d330b6c39a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1237,7 +1237,7 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	int bpc = 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw check */
 
-	if (!intel_dp_hdmi_sink_max_frl(intel_dp) &&
+	if (!intel_dp_pcon_sink_support_frl(intel_dp) &&
 	    intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
-- 
2.50.1


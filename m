Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10F2D2445E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 22:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721B610E9FE;
	Thu, 10 Oct 2024 22:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzS/HBjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A431510E9FE;
 Thu, 10 Oct 2024 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728600205; x=1760136205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Xe5S40QIsETIkl6FP2vNAvxLa1VsT1n02UD6HzUE68=;
 b=CzS/HBjJC3N2aWvFa/hpq55xZksb4PFc01swaN0XV4Xej/JnRKCVYmYB
 u7ilQB/Kcrj/r/IU68OFAzMRFWGQia1tm5GkAM4Mzua0cbm/1Esv8DbmI
 ftFE1SHt2Idg+j/VUqeQx8XRY4aO+WB+LTAevo/ykrIst5mlCxcr7/gi4
 QfGLZdVUDQS/WVJRSGhHsItvMi3O3V2GrodqU7hlJ7BOjPchK61AFKPM8
 gm8oeFBxd0vveLM5qUa3y070LrTXXzrjwgUZDu8dVE34MlUjtpHj5qsNQ
 RAw2UtiVQizFlHB5kUAJ6D1DP2Rk257ftr6dWlnslEm1NHKnG1eQ14KJT g==;
X-CSE-ConnectionGUID: S20QmQAiRBuuhyPaHN85mA==
X-CSE-MsgGUID: ac+xKheCSFOS0TAInUOpfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39380879"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="39380879"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 15:43:25 -0700
X-CSE-ConnectionGUID: Z/VoVR5lQfGuDLzw9/a6xA==
X-CSE-MsgGUID: mWHJyzGiRcGA9w9JXL6g7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="76732082"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 15:43:24 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 10/10] drm/i915/xe3lpd: Add condition for EDP to powerdown
 P2.PG
Date: Thu, 10 Oct 2024 15:43:11 -0700
Message-ID: <20241010224311.50133-11-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241010224311.50133-1-matthew.s.atwood@intel.com>
References: <20241010224311.50133-1-matthew.s.atwood@intel.com>
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

Add condition for P2.PG power down value.

v2: change subject line to better match patch condition

Bspec: 74494
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 342cd508d6f6..3d3abffdae65 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3144,7 +3144,8 @@ static u8 cx0_power_control_disable_val(struct intel_encoder *encoder)
 	if (intel_encoder_is_c10phy(encoder))
 		return CX0_P2PG_STATE_DISABLE;
 
-	if (IS_BATTLEMAGE(i915) && encoder->port == PORT_A)
+	if ((IS_BATTLEMAGE(i915) && encoder->port == PORT_A) ||
+	    (DISPLAY_VER(i915) >= 30 && encoder->type == INTEL_OUTPUT_EDP))
 		return CX0_P2PG_STATE_DISABLE;
 
 	return CX0_P4PG_STATE_DISABLE;
-- 
2.45.0


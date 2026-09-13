Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6CCC88E5C
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0710E937;
	Sun, 13 Sep 2026 15:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPNUlwlf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D63D10E948;
 Sun, 13 Sep 2026 15:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312416; x=1820848416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UH7cxbKi1gzk8lOQNdf0eT2uCy3x2FU8gdwLSG84Hy0=;
 b=nPNUlwlfxCpC1u4hrEjC5OxWJKG5wLx2fvE59DoSobEQkSR/jZmEp3oA
 ne9KET22Z+FEGYxR5eGKONAFTjOrPMFIsyUVG0i9vwPI8Oac2wTM8BpkK
 EBZiT/yKmNxyQ4DnTKyjUTLHuv0DTuromm7hSoci2tLyrP1jNA5nO3cGb
 7vEXLquUeRmUEKHvdeZAbCceSH1rSsXQsF3A3Hwqbww1CijGwvv8Vu/Wj
 w3m14TqAyg7NhTb04qEWjPViVG30s3aI5jCeFNPOBUC11SwU9tkB5T0l8
 /tGJzTvKMSfeSirSNXg6Wbg7dItlgvKrkbZ25mk212n9NC92z5CBePOX3 g==;
X-CSE-ConnectionGUID: H6zFMxM7TkuGyAgEqnTzyg==
X-CSE-MsgGUID: +6iyyknhSROgMMRrQtSTXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388774"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:35 -0700
X-CSE-ConnectionGUID: PfSlIOmPRpK0RgLjWHbclg==
X-CSE-MsgGUID: eSnbraL1Q8ygzE1TBg9+WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694167"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 08/13] drm/i915/dip: Add HAS_COMMON_SDP_TL macro
Date: Sun, 13 Sep 2026 20:26:43 +0530
Message-ID: <20260913145649.3240904-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

Add a helper macro to detect CMN SDP TL support on platforms with display
version 35 and above.

v2: Use prefix drm/i915/dip. (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 20f9aeb85c39..8ff22eb5663b 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -32,6 +32,16 @@ struct intel_crtc_state;
 #define HAS_EMP_AS_SDP_TL(__display)	(DISPLAY_VERx100(__display) == 1401 || \
 					 DISPLAY_VER(__display) >= 20)
 
+/*
+ * CMN SDP TL: Common Secondary Data Packet Transmission Line.
+ *
+ * Xe3p_lpd introduces new register CMN_SDP_TL to program a common SDP
+ * Transmission line that will be used by the Hardware to position the
+ * SDPs. Along with this, another new register CMN_SDP_TL_STGR_CTL is
+ * also added to stagger the different SDPs.
+ */
+#define HAS_COMMON_SDP_TL(__display)      (DISPLAY_VER(__display) >= 35)
+
 u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 
-- 
2.50.1


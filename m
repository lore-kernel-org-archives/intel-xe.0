Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04D6C88E77
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8BB10EE89;
	Tue, 15 Sep 2026 17:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ubo5KaaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D120110E4B6;
 Tue, 15 Sep 2026 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491827; x=1821027827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UH7cxbKi1gzk8lOQNdf0eT2uCy3x2FU8gdwLSG84Hy0=;
 b=Ubo5KaaEv/460FeTJsOXYRE7HCARYiJi718urA3jtjP6q9vfoik2muTM
 wWON+tjvn/oe3SZ5oZCa5hIzqdtohmeF2jl1HoAs6LHHj1oxBk7OUmOIt
 /bLcnWL2tygT1EY8WqYBqrTwfIUjUA5V3Fhq0c7/+/b5MSmzZrceCB4BR
 GNxFZ7nR+tPFaalY7++z6JGE/jlAXbKVUBWbm8e0/Bos9ujOtovbzxes+
 /SOqACz4nmQHFE2WZSDLp3+CEGdZWn/1Sqoxgovj73ILq37DtL75JImtt
 fAadlA1aC259XsMtpEcWOHIlFd0qj2GHyunTU14j9PK4IghkU3I7DqRcr Q==;
X-CSE-ConnectionGUID: WE0UwyORTsWl58g0lwZnaQ==
X-CSE-MsgGUID: 89dKx08kQMmkUxach6BJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371890"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371890"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:47 -0700
X-CSE-ConnectionGUID: XleHNAp6ROCKCS93FXyCqg==
X-CSE-MsgGUID: O6n6N/tIRVGgKsNScug5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443914"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:44 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 08/14] drm/i915/dip: Add HAS_COMMON_SDP_TL macro
Date: Tue, 15 Sep 2026 22:16:49 +0530
Message-ID: <20260915164657.3429075-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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


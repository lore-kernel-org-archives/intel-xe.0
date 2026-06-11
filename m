Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092A3CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042D10ED47;
	Thu, 11 Jun 2026 07:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzIvTSJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DC310ED62;
 Thu, 11 Jun 2026 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164271; x=1812700271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7LyB1E7yS+8fKyRQZUDHJkmePYa5Y5tiwX4BhAPiJsM=;
 b=TzIvTSJkKTfAGIkKSpYNXaAAcozzP4spV9BYDwxrYHuZYTyVHE4RNup1
 f9MCJ7OiQDRg1IwosN4ETUyedF+oZkaGMxP/pHY7sJpEOP9sO4bZOrWml
 EcYI0XK+gAoAuDdzJNM8NhRKOo+kYbUoVy+Vf8oD1n94FcyrZAp/6cWZA
 z3Ym20IBR9UAiZG+agYRhPM0BP1U3pVw7DnjSWaaaQrrgviiVEX4BKnyq
 lqWRdsgpKonMWL+BrgOk2rYvJ+mTr+5ZTw5JkSw2n6GMpvNpQgglkfCIC
 PKE465acvUYPaITGFgEpsqZSydiHzCtQHA5XzEgeDYQEw47zv5I7Sw8OV g==;
X-CSE-ConnectionGUID: YKeijWbMS9at8SHzWoD1Iw==
X-CSE-MsgGUID: OEgltodgShGAq3ob/CfI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078753"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:11 -0700
X-CSE-ConnectionGUID: xUIi6Px1TA+aH1jrqzWZeQ==
X-CSE-MsgGUID: wivXeW/SThibE3JuITcZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503352"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:08 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 08/12] drm/i915/display: Add HAS_COMMON_SDP_TL macro
Date: Thu, 11 Jun 2026 13:03:10 +0530
Message-ID: <20260611073316.1439306-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 600dabbf7372..e9959356226e 100644
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
2.45.2


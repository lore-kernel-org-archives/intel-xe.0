Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DD0E93814
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EABA10E30C;
	Mon, 13 Apr 2026 04:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaP09lxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDE410E2FD;
 Mon, 13 Apr 2026 04:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776053338; x=1807589338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93Z9OjpM/E+FbgSATpklQJO78YhLwMsC44bnPQujXKc=;
 b=IaP09lxkLdVMo900p5SHRWnwxlOvtMAi2R9+lvd+nwk3o6cFASV1jl+4
 UO9dcAV2Mv85GafOijNlN1MmSDjlF/J5zWPse/64ybnkpKQc3JYtQnSQx
 aupa/q025p5b/cv5lzQ9D+8VJYUeH/wO9x0xqtQmvBI3i81pQTzHusQKw
 YmPahMNoTwayT/4vIBXiidmvn11YGrCTX5QaV6SeTP4gPEe56UPvsRVXa
 ZtgOyu9kl4lAS1ItnKtAPS71xbtVjS4Ylr68uc/pB2JYRmGTTwWKHNe3G
 HXuVnfRbwsqgFOHkmLMGDpY2SrwAQMgSX9Ssb4XArRErvR5331ZxGnmL+ Q==;
X-CSE-ConnectionGUID: Zv4welaQSzecUA8zfcQSCQ==
X-CSE-MsgGUID: O1M6LxvQQiaxZZr46lmt8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80568779"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80568779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:08:58 -0700
X-CSE-ConnectionGUID: 17mzf6kjSNSkvcZr/nuSGQ==
X-CSE-MsgGUID: WrI2TQ1tTiyGJJwkPvn0pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229546621"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:08:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 07/12] drm/i915/nvl: Add register definitions for common SDP
 Transmission Line
Date: Mon, 13 Apr 2026 09:23:44 +0530
Message-ID: <20260413035349.1730312-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
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

From: Arun R Murthy <arun.r.murthy@intel.com>

Add registers definitions for common SDP transmission line CMN_SDP_TL
and CMN_SDP_TL_STGR_CTL.

Bspec: 74384
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index dada8dc27ea4..a02ced1b3052 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2122,6 +2122,25 @@
 							 _VLV_VIDEO_DIP_DATA_B, \
 							 _CHV_VIDEO_DIP_DATA_C)
 
+/* COMMON SDP TRANSMISSION LINE */
+#define _CMN_SDP_TL_A			0x6020c
+#define CMN_SDP_TL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_A)
+#define  TRANSMISSION_LINE_ENABLE	REG_BIT(31)
+#define  BASE_TRANSMISSION_LINE_MASK	REG_GENMASK(12, 0)
+#define  BASE_TRANSMISSION_LINE(x)	REG_FIELD_PREP(BASE_TRANSMISSION_LINE_MASK, x)
+
+#define _CMN_SDP_TL_STGR_CTL_A			0x60214
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)
+#define  VSC_EXT_STAGGER_MASK			REG_GENMASK(11, 8)
+#define  VSC_EXT_STAGGER(x)			REG_FIELD_PREP(VSC_EXT_STAGGER_MASK, x)
+#define  VSC_EXT_STAGGER_DEFAULT		0x2
+#define  PPS_STAGGER_MASK			REG_GENMASK(7, 4)
+#define  PPS_STAGGER(x)				REG_FIELD_PREP(PPS_STAGGER_MASK, x)
+#define  PPS_STAGGER_DEFAULT			0x1
+#define  GMP_STAGGER_MASK			REG_GENMASK(3, 0)
+#define  GMP_STAGGER(x)				REG_FIELD_PREP(GMP_STAGGER_MASK, x)
+#define  GMP_STAGGER_DEFAULT			0x0
+
 #define _VLV_VIDEO_DIP_GDCP_PAYLOAD_A	0x60210
 #define _VLV_VIDEO_DIP_GDCP_PAYLOAD_B	0x61178
 #define _CHV_VIDEO_DIP_GDCP_PAYLOAD_C	0x611f8
-- 
2.45.2


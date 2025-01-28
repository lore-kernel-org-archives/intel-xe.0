Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC46C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 15:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D240510E694;
	Tue, 28 Jan 2025 15:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPrhoJTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F80410E694;
 Tue, 28 Jan 2025 15:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738079679; x=1769615679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYsyJT8J2OF9pn7ILpJ7PNkcACDwCS/nczJsWSJyF/4=;
 b=nPrhoJTvlAmYstCytGnAv6ZiGVFTHfskkL2swdGsyeZjm9G5uDi+W2Ej
 5aicjy9+FcJAshVKa6HsdpNlobjw0/H4vCPYLyRye7XL/0db0zQfHmXIj
 CKdVVvvwyuFosdxyTPe4IFckkLOX8L5KEaBwTe+Fkj+FSjOj/uqC/H0vF
 +L8f7zsdRJFjSVrm4u/7sDWKcal4BICpk+cXen0T1z1pmFWS0MaGxnFfZ
 ijaOEYsuGrBGzcu5Y/ainm/j0M8s/qpEy5BB0GNfgTfSvEs66KuPEenV2
 atN5ty+BeSRjav2srrVFr/3qShrFdjteDnVtB3o6DC0BBptRYdJIaJyPz Q==;
X-CSE-ConnectionGUID: 5t14eDs7Ty26I9fU+iiTsw==
X-CSE-MsgGUID: MnO5r966QG+ZZwUwyOASzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49228083"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="49228083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:54:39 -0800
X-CSE-ConnectionGUID: fCOFHyCXTuaDG8cs7Crzrw==
X-CSE-MsgGUID: ZSt4ScnXQmCeT/dBXQJD1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139635261"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:54:36 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 santhosh.reddy.guddati@intel.com, jani.saarinen@intel.com
Subject: [PATCH v5 1/7] drm/i915/xe3: add register definitions for fbc dirty
 rect support
Date: Tue, 28 Jan 2025 17:54:12 +0200
Message-ID: <20250128155418.305595-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128155418.305595-1-vinod.govindapillai@intel.com>
References: <20250128155418.305595-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Register definitions for FBC dirty rect support

Bspec: 71675, 73424
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc_regs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc_regs.h b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
index ae0699c3c2fe..b1d0161a3196 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
@@ -100,6 +100,15 @@
 #define   FBC_STRIDE_MASK	REG_GENMASK(14, 0)
 #define   FBC_STRIDE(x)		REG_FIELD_PREP(FBC_STRIDE_MASK, (x))
 
+#define XE3_FBC_DIRTY_RECT(fbc_id)	_MMIO_PIPE((fbc_id), 0x43230, 0x43270)
+#define   FBC_DIRTY_RECT_END_LINE_MASK		REG_GENMASK(31, 16)
+#define   FBC_DIRTY_RECT_END_LINE(val)		REG_FIELD_PREP(FBC_DIRTY_RECT_END_LINE_MASK, (val))
+#define   FBC_DIRTY_RECT_START_LINE_MASK	REG_GENMASK(15, 0)
+#define   FBC_DIRTY_RECT_START_LINE(val)	REG_FIELD_PREP(FBC_DIRTY_RECT_START_LINE_MASK, (val))
+
+#define XE3_FBC_DIRTY_CTL(fbc_id)	_MMIO_PIPE((fbc_id), 0x43234, 0x43274)
+#define   FBC_DIRTY_RECT_EN		REG_BIT(31)
+
 #define ILK_FBC_RT_BASE		_MMIO(0x2128)
 #define   ILK_FBC_RT_VALID	REG_BIT(0)
 #define   SNB_FBC_FRONT_BUFFER	REG_BIT(1)
-- 
2.43.0


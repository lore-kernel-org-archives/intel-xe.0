Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA905E7716A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 08:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A4610E87F;
	Tue, 17 Dec 2024 08:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kti74dr3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5E210E87F;
 Tue, 17 Dec 2024 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734424997; x=1765960997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HuH8m53Oed5iG6uEP1upukBxI178/zU7kfo8CAz7GA=;
 b=kti74dr3bI1MO+dDCzJjacvBkG69wvn+1KxMrlQW4hUMOfl22AcnWXrQ
 /nXFS6eHcOkqv84I0C5bAwmHloKA8L/R7M4twPkXitBPXaEwMMLo+eAJ/
 Mg4kqqDzmBx/UVOMxiFG+ynCHlOnJgJeEoN7WjDtfo18yNy0JR1RdCYCx
 B016EaaDJxFpCVFtTAaWePB5NvwXNeUIaDOvNSNRtjgQze6gZgA3OlSm9
 Q8HPkl+maOsl+eNEJyDRzmZDF8yjMtOaXd7aeBLDaYRXuybcyVC2YgAw5
 sWnPmyIYWqksHV9XMY9IJWo69iGCn2xW/xqY7GHI8T4SmSTBBN1AaNQqn Q==;
X-CSE-ConnectionGUID: JM9sjCr1SC++/evz7zhkYA==
X-CSE-MsgGUID: zKbzpInmSsCiB4W4ri5KfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38614958"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="38614958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 00:43:17 -0800
X-CSE-ConnectionGUID: oMz+nZn4SxyUzrbvdjk8Mg==
X-CSE-MsgGUID: dyglYSLDRl2ZKqUeKdHoCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97703942"
Received: from ettammin-desk.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 00:43:15 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 santhosh.reddy.guddati@intel.com, jani.saarinen@intel.com
Subject: [PATCH v2 1/3] drm/i915/xe: add register definitions for fbc dirty
 rect support
Date: Tue, 17 Dec 2024 10:42:43 +0200
Message-Id: <20241217084245.246218-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217084245.246218-1-vinod.govindapillai@intel.com>
References: <20241217084245.246218-1-vinod.govindapillai@intel.com>
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
2.34.1


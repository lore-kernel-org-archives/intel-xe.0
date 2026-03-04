Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F78BEF8FEA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A688610E9FC;
	Wed,  4 Mar 2026 13:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxHMdSeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D5A10E9F1;
 Wed,  4 Mar 2026 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630075; x=1804166075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29GBgUZU7DhVGLj1I9LQo0QA0eCYb5ZaivVtiTJQSBs=;
 b=UxHMdSeTezorzVwD8K5Tubnl9m0avXEz8xsn/B0wn/lkgStt8wAhcJ5e
 T2HsuEP/BYpf0GvIL0ZTOIVTnUF+pWFPQrEQShm6pdBzfXyR8G6N+je8Q
 7/u+I/rWD61XHp8hPCPxSDYnmgI7+u8PF5iBk+Gwyi4UqRfiilj9/WI9v
 nH4oOGmtpHPDZIV809gxn/pabzaZq1Nnl90KK6nmtVcITlro8w0LkPFmi
 p2ibjEXZCaMIZ6HarH2Fpo/0J8WLdLFP5akEqKQeSStLOXLvcIegWmj6L
 ACwmcoeBaz5bY9ObqptBfUPzcFcbwKVgUaA89JukAZ8RNDj2P0DGUYHVh A==;
X-CSE-ConnectionGUID: kmXYVbDNSfKf0YD1TBzwxA==
X-CSE-MsgGUID: I7fWd0KkRrqEvQW3PMRFJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293464"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:35 -0800
X-CSE-ConnectionGUID: KejhcsolSaWQG5xXEoN/4g==
X-CSE-MsgGUID: dxN9O8QMQ6SHMwob49kVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350779"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:35 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 08/24] drm/i915/lt_phy: Add xe3plpd .put_dplls hook
Date: Wed,  4 Mar 2026 13:14:07 +0000
Message-ID: <20260304131423.1017821-9-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
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

Add .put_dplls function pointer to support xe3plpd platform
on dpll framework. Reuse ICL function pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 9aa8eb0a7d4a..af2613eeaf92 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4654,6 +4654,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
 	.get_dplls = mtl_get_dplls,
+	.put_dplls = icl_put_dplls,
 };
 
 /**
-- 
2.43.0


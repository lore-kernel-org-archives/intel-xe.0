Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78478EF8FE1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CA210EA0B;
	Wed,  4 Mar 2026 13:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kz++Msqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371AC10EA02;
 Wed,  4 Mar 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630084; x=1804166084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a8tEFH4/vHgAwrd9y00A7M3JRMmRDoQYFypmYE/Je/s=;
 b=kz++MsqcLVyjuwReH/pKc91j158evpZ+ReDNJH5H9NGAxUcfAFfnvCUs
 bNtAQEQajGTk5QVTx3yng/KsACdzUi0g1Q7q5gugMmkJ2EUwxwZKAd5R+
 QKWrVaaG7R0KkxpNeAdRIsyDMsQAt06tOlfMJD/b865b7Dqn1+RA2AId4
 P7fPPaoYC5MrNgBtTh5kfFxhCLvrWrYUviH4mrRG2r5l41pFrDn4/1zCL
 kLNVR0AkmE/8zObytGGaASFtZXP7mz0mEC2AEhyoO81tFpKKq/d2C/ZWI
 SoL8vkC+9FVoXvsGA6AttuVwio3zrG6z1oewuQjN15GfAcLFPXqH+YZLc A==;
X-CSE-ConnectionGUID: QuttmG8vQ16Z45C0CwVWVw==
X-CSE-MsgGUID: QSYUPQjkTd6JN3ww+Yrclw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293476"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293476"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:44 -0800
X-CSE-ConnectionGUID: m3m0uqHbQ76GN8JhQNL5wQ==
X-CSE-MsgGUID: dbtuxTS2Se6/mOk/Y3P5SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350819"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:43 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 15/24] drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
Date: Wed,  4 Mar 2026 13:14:14 +0000
Message-ID: <20260304131423.1017821-16-mika.kahola@intel.com>
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

Add .crtc_get_dpll function pointer to support xe3plpd
platform.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 88f11cb8c5e1..abc85ee9b832 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1691,6 +1691,7 @@ static int i8xx_crtc_compute_clock(struct intel_atomic_state *state,
 
 static const struct intel_dpll_global_funcs xe3plpd_dpll_funcs = {
 	.crtc_compute_clock = xe3plpd_crtc_compute_clock,
+	.crtc_get_dpll = hsw_crtc_get_dpll,
 };
 
 static const struct intel_dpll_global_funcs mtl_dpll_funcs = {
-- 
2.43.0


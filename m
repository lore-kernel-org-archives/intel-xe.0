Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A89CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BD610ECD0;
	Tue, 16 Jun 2026 16:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxl/SBLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EFF10ECD4;
 Tue, 16 Jun 2026 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781627017; x=1813163017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOSNPFtaLq1mOnC+ik8000yE9/DY6eCVABnKgT/ReAM=;
 b=fxl/SBLXV5cLbV9XIQEYEl2sstwsmTR6ZwsRJix0Rhs1QKp6x6Gf5FR6
 ss/6vT2NZeAkb+22LqZadvdDkuT8d7cCLKQUPZZ99C01nLfP/j1FBbiIh
 18blYWVtqj9FN+UA4osCr2jfAjhNj5OE9yb2ZWTn9/Vg6U8NMLcOL70d3
 VA8kiwUNvSRY27vNGeM7GS99prApq4C35HraIwB0cfrbzl9fiR5OO/Ijw
 HJvW3p2eQ7pDOVVWU2nvAicUlgofxYuDAZEY6HPNLfay5K2OM/cTBEwtF
 hBc1MxfoicM6ggn538NiVDHPBlJt64fkTWVe7u0gQMzfrnHDePhaRxhKw w==;
X-CSE-ConnectionGUID: 9H4z5i5iRMegUl0E+DFr3Q==
X-CSE-MsgGUID: cLw1+Cb3S/qhwXl7YJhJXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781342"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93781342"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:37 -0700
X-CSE-ConnectionGUID: B9yY2U1rSPCNJ02vCcK5IQ==
X-CSE-MsgGUID: rQO+mbm7SRu+6mtcd3q4KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247693566"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:36 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, animesh.manna@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v6 16/16] drm/i915/display: Enable DC3CO DC state
Date: Tue, 16 Jun 2026 21:51:54 +0530
Message-ID: <20260616162154.2630995-17-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable DC3CO mask in get_allowed_dc_mask().

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2ee38ba1fb2c..dc3b31200353 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1121,7 +1121,9 @@ static u32 get_allowed_dc_mask(struct intel_display *display, int enable_dc)
 	if (!HAS_DISPLAY(display))
 		return 0;
 
-	if (DISPLAY_VER(display) >= 20)
+	if (DISPLAY_VER(display) >= 35)
+		max_dc = 4;
+	else if (DISPLAY_VER(display) >= 20)
 		max_dc = 2;
 	else if (display->platform.dg2)
 		max_dc = 1;
-- 
2.43.0


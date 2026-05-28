Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7BFCD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 05:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6B810EC0C;
	Thu, 28 May 2026 05:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMMqyl/5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5B210EC0C;
 Thu, 28 May 2026 05:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779944543; x=1811480543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=55XkpO80ukMVWdvSoNlTzJqTzVtV8GyXu+AltXJfNVE=;
 b=eMMqyl/5tMkRczWpPcMszjsMQf9KZETnFNCQVNBUI8RusEVNb6lDit0Q
 PLD/tTy8jbEIsHVdS7NfadnLOhhds0upPHEIVGVzh/kJuMj8dWG9y7MZ5
 tvRAWECSvTP8FP7lq37spkwMW52wZeKSnVC/p0YrOvgFtsUDtwfmXDjXA
 oN5oZt8eai6OMcQvN1Td/5euZfbPZAUzA1fkSAY8bqJ5Rvl9ngCTFWBXe
 kSwrV9cpDretGw2VCk/OsQhPqv01Hjm5TK/JzrYhqPItiQufH338F+B31
 dDOlbejWxlQN9Xbd+iWhBP7mNW/Jx9oSJcJq4SqWXz+O84q9C4CgOSHLp w==;
X-CSE-ConnectionGUID: SN2sav3qSOSaD7EhGvN0mg==
X-CSE-MsgGUID: gAMlXXlfSO6E4VtPjKiqeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80895725"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80895725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:23 -0700
X-CSE-ConnectionGUID: ILj/xM6LT+Ob/naLH1MYmg==
X-CSE-MsgGUID: phkLVInTTO2PfiNf1mH53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="238026004"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:22 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v2 17/17] drm/i915/display: Enable DC3CO for display version 35+
Date: Thu, 28 May 2026 10:31:31 +0530
Message-ID: <20260528050131.466351-18-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
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

Display version 35+ supports DC3CO power state. Set max_dc to 4
for these platforms to allow DC3CO along with DC6 state.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 463f581c0b95..535c744196de 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1010,7 +1010,9 @@ static u32 get_allowed_dc_mask(struct intel_display *display, int enable_dc)
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C16E9B267
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9510E58C;
	Tue, 24 Feb 2026 13:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSTmn7+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739FD10E58C;
 Tue, 24 Feb 2026 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941171; x=1803477171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCVkFyDOoJBzSoEnSr2BUdgdZInLHI9HJCQG3BiOyk8=;
 b=CSTmn7+mb8cAl8kmxP+vmpjVG247OuOFK4zFOA9+7BCqZ2hF6K8pDd90
 Rk+9MtQuygIvFHslq+YM58n2b2h1c6Euo9ZCs8Xh+uugnn+bjFuqX98c4
 xa2PTT8zWEBCv2ZL7EOIjLzGZ959ReCJkJabo3AoAzK8QnlwcjscqqUk+
 t/EUxG/3u0DhRzjxtcDu1PnXXXnM0+bX+YaQho4luB//fGEU/lJT+d8DF
 j/Udn9bvJ9D3zIAe+O5Dw6GoDApDlRHUlEC5PzNInw4wk1ds2tm/nN2lh
 R9PDIvkNPKeFNPaqpZmG2qcPuDYrb+mobbTUw4k7Rmok7Cvd35AwS9d/t A==;
X-CSE-ConnectionGUID: 3wWU4V0rTSSUXyJvyt8UFw==
X-CSE-MsgGUID: miEcUii7REqRTo42z+TGxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60531033"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60531033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:51 -0800
X-CSE-ConnectionGUID: ubk7xV8uTwmiyEAQ+m9sjw==
X-CSE-MsgGUID: wTjf2tySReGijmImvHrWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215925264"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:50 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v4 12/16] drm/i915/display: convert W/As in
 intel_modeset_setup.c to new framework
Date: Tue, 24 Feb 2026 15:49:59 +0200
Message-ID: <20260224135208.140752-13-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224135208.140752-1-luciano.coelho@intel.com>
References: <20260224135208.140752-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c    | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h    | 1 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 81be1e875c07..b6eb22b6c6b4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -79,6 +79,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_13012396614:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 3500;
+	case INTEL_DISPLAY_WA_14010480278:
+		return (IS_DISPLAY_VER(display, 10, 12));
 	case INTEL_DISPLAY_WA_14010547955:
 		return display->platform.dg2;
 	case INTEL_DISPLAY_WA_14010685332:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 68d67b9b0263..6749e48aea7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -30,6 +30,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_1409120013,
 	INTEL_DISPLAY_WA_1409767108,
 	INTEL_DISPLAY_WA_13012396614,
+	INTEL_DISPLAY_WA_14010480278,
 	INTEL_DISPLAY_WA_14010547955,
 	INTEL_DISPLAY_WA_14010685332,
 	INTEL_DISPLAY_WA_14011294188,
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 9b0becee221c..4086f16a12bf 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -25,6 +25,7 @@
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_dmc.h"
 #include "intel_fifo_underrun.h"
 #include "intel_modeset_setup.h"
@@ -913,7 +914,7 @@ static void intel_early_display_was(struct intel_display *display)
 	 * Display WA #1185 WaDisableDARBFClkGating:glk,icl,ehl,tgl
 	 * Also known as Wa_14010480278.
 	 */
-	if (IS_DISPLAY_VER(display, 10, 12))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14010480278))
 		intel_de_rmw(display, GEN9_CLKGATE_DIS_0, 0, DARBF_GATING_DIS);
 
 	/*
-- 
2.51.0


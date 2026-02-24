Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D7AE9B268
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FEC10E59C;
	Tue, 24 Feb 2026 13:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqJuWAPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735C110E59D;
 Tue, 24 Feb 2026 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941178; x=1803477178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iWDuoess9+ByXu8hIv3ADGIbEfC9XkUkov3tNzHIJ/I=;
 b=RqJuWAPh3a/3AL9HIJBU7MAy+a1+YeKaaJKMJVsJHRwGe+DWFHRykzZ/
 EYGWK76LA1hWrOFYEaRjG99oa2HfSGk2fzWY0J0AHVutBO1Jb9hGy6HZ4
 534b/2cuiVUcaAUCH1epO4xGVjq2wYb+NvQJyh20gTxqkNTvA/4+C4lNL
 6jNrFvrvdPJ2oqVwaV6MBAmWBNR/G8YztJX261ANVGKsj0HzIGE2SSTxE
 RNnpXFg8pMm6QHwC0wQp2qJ6jyjg7Jm1VjXhwbZiHuu2lr1v8FItVYE7m
 6ihCZ/Ec03tjMMvuPwn3502XQX8cjnJ86Zb+c5jTcvx8L9cygSPRv7eTY w==;
X-CSE-ConnectionGUID: NFMacbxbRUqMItNeZeVO6Q==
X-CSE-MsgGUID: 6isuDZQKRKOBdFeDLxkRnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60531052"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60531052"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:58 -0800
X-CSE-ConnectionGUID: rCPgus3iSi+gFyMgucZCNg==
X-CSE-MsgGUID: tmHDjsZDTuKrAxkYfIC4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215925291"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:57 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v4 16/16] drm/i915/display: convert W/As in skl_watermark.c to
 new framework
Date: Tue, 24 Feb 2026 15:50:03 +0200
Message-ID: <20260224135208.140752-17-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/skl_watermark.c    | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index f05d96b4b35f..081a4092cd13 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -142,6 +142,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			 IS_DISPLAY_STEP(display, STEP_A0, STEP_B0));
 	case INTEL_DISPLAY_WA_22010178259:
 		return DISPLAY_VER(display) == 12;
+	case INTEL_DISPLAY_WA_22010947358:
+		return display->platform.alderlake_p;
 	case INTEL_DISPLAY_WA_22012278275:
 		return display->platform.alderlake_p &&
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_E0);
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 1f664366847d..15fec843f15e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -54,6 +54,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16025596647,
 	INTEL_DISPLAY_WA_18034343758,
 	INTEL_DISPLAY_WA_22010178259,
+	INTEL_DISPLAY_WA_22010947358,
 	INTEL_DISPLAY_WA_22011320316,
 	INTEL_DISPLAY_WA_22012278275,
 	INTEL_DISPLAY_WA_22012358565,
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index a520d492317b..b1f9546b8cda 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -22,6 +22,7 @@
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dram.h"
 #include "intel_fb.h"
 #include "intel_fixed.h"
@@ -3412,7 +3413,7 @@ static u32 pipe_mbus_dbox_ctl(const struct intel_crtc *crtc,
 	if (DISPLAY_VER(display) >= 14)
 		val |= dbuf_state->joined_mbus ?
 			MBUS_DBOX_A_CREDIT(12) : MBUS_DBOX_A_CREDIT(8);
-	else if (display->platform.alderlake_p)
+	else if (intel_display_wa(display, INTEL_DISPLAY_WA_22010947358))
 		/* Wa_22010947358:adl-p */
 		val |= dbuf_state->joined_mbus ?
 			MBUS_DBOX_A_CREDIT(6) : MBUS_DBOX_A_CREDIT(4);
-- 
2.51.0


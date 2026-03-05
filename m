Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F7F30928
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6B110EC06;
	Thu,  5 Mar 2026 10:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5i6MBnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D0910EC00;
 Thu,  5 Mar 2026 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772704903; x=1804240903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iWDuoess9+ByXu8hIv3ADGIbEfC9XkUkov3tNzHIJ/I=;
 b=C5i6MBnv+YfhAPrGzoZYcG9xZns6s2bJKXu+MCGgfdEBGhgZkxECA8Ly
 zHxvF13AVMqZVSSHLUqj4H/TjGSm0K+JauhhM83nA3W2rLTiOKQF1eYSX
 rRq1ECCK/qPpoj/q8CypWmfpicvlKIrXZLSAi4fkjwoHv9dXCvZcgUSHh
 RmvyRDzZrYogcrU9cjNOXhHTz7rrbjtAoo3TEc5gm9RwsMTwUb0NFsQhu
 RBNuEU02EdEPGrQ8VmVHM4Ky/JTmprSM72fhuOsd4ht9qnWBFanUjC89T
 gpOUBogA43qITydUe6g1vQU7dvW6VY4k0rRdHpxCgEdYme8vDX8d6hva7 g==;
X-CSE-ConnectionGUID: A9YCGi2SSc6OA4FRPJtr8Q==
X-CSE-MsgGUID: KWCAtQPnQw65nqjt3Po/pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73758131"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73758131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:42 -0800
X-CSE-ConnectionGUID: ovpX6cdfRZqIavzlfwY8Lw==
X-CSE-MsgGUID: I8sGrwdOTOGc38AW/edFYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215460347"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:40 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v5 16/16] drm/i915/display: convert W/As in skl_watermark.c to
 new framework
Date: Thu,  5 Mar 2026 11:59:19 +0200
Message-ID: <20260305100100.332956-17-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305100100.332956-1-luciano.coelho@intel.com>
References: <20260305100100.332956-1-luciano.coelho@intel.com>
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


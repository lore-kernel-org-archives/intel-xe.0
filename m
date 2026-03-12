Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E404BFED2EC
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AE410E198;
	Thu, 12 Mar 2026 08:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHgz5vCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC8B10E198;
 Thu, 12 Mar 2026 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773303423; x=1804839423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hDFyFgYXgAMe7GBPGtKTfOBh/QsvVOCyjf26FXBF53E=;
 b=XHgz5vCMoThc6TG+hwc0s6DnoBIjemNYIxpZBjRWlUUGBpa0NjaoCOls
 jdMoe9weexBC0XzkaLr2q3GX9NTsRtswAf/iL2x9TBfIdvqYXQ0Croprx
 1H59fdkkEzEaF9MNqDCLE9Wg0Pp4JNvesdWVHRwEdVtcW5TG8SNM3tXu3
 hn0UXzAClR6aLbbMeBo5GAgqoV9F86GJXiNtIKuCf6Ont/KNO/pgq/CjC
 W1ftb0Sx+1dTKI57Bkf4cXzOkY+uKzKYgDZwdKrUK735xYkqcG5Dpxlkb
 ZFrKvqhx+dEV/L4arnea4zES3pv0WeUSFHcxe4XC0XLprqitsS2GLUkmC Q==;
X-CSE-ConnectionGUID: EsOvHp+bRoCU21ItXzc4Rw==
X-CSE-MsgGUID: 0T/0HmB5SWqqqi6plY4m/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74428342"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74428342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:17:01 -0700
X-CSE-ConnectionGUID: z+ArkpgSRz2kN+YQ7rf4Bg==
X-CSE-MsgGUID: uya2K5dKRcaCTwPghnrXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225198438"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.94])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:17:00 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH] drm/i915/display: fail compilation on intel_display_wa() with
 invalid enums
Date: Thu, 12 Mar 2026 10:16:46 +0200
Message-ID: <20260312081647.1083777-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
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

In a previous commit, the intel_display_wa() was changed so it
wouldn't receive an integer as the workaround number, but the enum
value itself.  This caused compilation not to fail anymore when the
enum passed didn't exist.

Bring this back by using BUILD_BUG_ON() to check that the enum passed
sits within the range of defined enums.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 15fec843f15e..4239e4295ec7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -60,11 +60,14 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_22012358565,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
+
+	INTEL_DISPLAY_WA_COUNT
 };
 
 bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name);
 
-#define intel_display_wa(__display, __wa) \
-	__intel_display_wa((__display), __wa, __stringify(__wa))
-
+#define intel_display_wa(__display, __wa) ({				  \
+		BUILD_BUG_ON(__wa >= INTEL_DISPLAY_WA_COUNT);		  \
+		__intel_display_wa((__display), __wa, __stringify(__wa)); \
+	})
 #endif
-- 
2.51.0


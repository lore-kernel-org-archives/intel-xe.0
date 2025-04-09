Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C96C369A2
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 05:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51E610E7D8;
	Wed,  9 Apr 2025 05:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nffeuYra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9694010E7D8;
 Wed,  9 Apr 2025 05:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744177769; x=1775713769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EmHlQ39u3RkjbiudOXbldvRwpSHvIP2nPVdSAdaAUno=;
 b=nffeuYraRpKXIqVEckAorcwh9rznhDZuECkIu9+856gkb4jhpy69Tp2M
 a30xFJV/7xWuXOAFurv4Rz0kPlYBBbT4weJgA7ialAeLbwjwFko9NhTjb
 xV+AvMRXjgGD4Oji56yKVB3x4gS6Ilk6LDEmrCT5NXN/sgTcsrJ1PBO/u
 UCsqGgcdNp6dDFzGLeX1Un/u0oNGdno9bbuVK6+FOwUP5FsfQo4qZYipg
 gZoVC6OjuCY7PxuQ5e4U/2RUwbvPdxak3QaRz/a8EW13efAGjYydNW4YA
 YIRq1PYJoJrd1LdXe3zGj41w1m7OFLbHhFRWgaum3v5DxpcZxonSWEO2b Q==;
X-CSE-ConnectionGUID: 2inIhblhTXuSFV9Jz4DGUw==
X-CSE-MsgGUID: 5J9fprwXRzGjIMfVOUORHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45526429"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45526429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 22:49:29 -0700
X-CSE-ConnectionGUID: CU4Flpe6Tx+uc4lezOM7bA==
X-CSE-MsgGUID: nz/hpa22Slafa27FNy8mUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="165710839"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 22:49:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2] drm/i915/vrr: Stop writing VRR_CTL_IGN_MAX_SHIFT for MTL
 onwards
Date: Wed,  9 Apr 2025 08:49:09 +0300
Message-ID: <20250409054909.968531-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

According to Bspec VRR_CTL_IGN_MAX_SHIFT doesn't exist for MTL and
onwards. On LunarLake and onwards Bit 30 is "Mask Block PkgC" instead. Stop
writing the bit for MeteorLake and onwards

v2: "Ignore Max Shift" bit doesn't exist on MeteorLake either

Bspec: 68925
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 633a66f6b73b..c6565baf815a 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -444,7 +444,10 @@ static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	if (DISPLAY_VER(display) >= 13)
+	if (DISPLAY_VER(display) >= 14)
+		return VRR_CTL_FLIP_LINE_EN |
+			XELPD_VRR_CTL_VRR_GUARDBAND(crtc_state->vrr.guardband);
+	else if (DISPLAY_VER(display) >= 13)
 		return VRR_CTL_IGN_MAX_SHIFT | VRR_CTL_FLIP_LINE_EN |
 			XELPD_VRR_CTL_VRR_GUARDBAND(crtc_state->vrr.guardband);
 	else
-- 
2.43.0


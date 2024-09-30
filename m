Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF85ACF6499
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 12:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B596C10E429;
	Mon, 30 Sep 2024 12:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KD8BrZw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E45010E429;
 Mon, 30 Sep 2024 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727699581; x=1759235581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p83u157weH66jkTd1BNhPxPUQQsEUgJLLy/mWpjKaZg=;
 b=KD8BrZw6+7RuovIwLGBlJUodfe8j3z7AwmffwRy/Cs7xwDft7NcAYstu
 udjueMalwTwkTj3RjJDt6XYe1CdwB1I/LnS23uVBs5AvLy6TZ8z0akMRw
 dSDlCaSaNz4cJjTQf71eNk2WL5S3cXCIDuJErmXEEAiN/xJoU91SZToKk
 gLki27hIvUkvX1mdQvG5xkyKBBiKxw90aAXtNoFg/5gmU6CodmZxdA50c
 DwB08xxQ2sm00pTlMt/4jwaumIPwShA2txSy/W/DG/yUmkM3dZJ+D0EvY
 Sh0P9U06q4jUxa9ZtwU4kiXuyv/KeXn1n0qJbARyUcnrMfrE9b58MxDxa w==;
X-CSE-ConnectionGUID: AYcqMbDhSUCAnJrcmijcKQ==
X-CSE-MsgGUID: ypmdtkrwQeyzEemLbyw5sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37346575"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37346575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:33:01 -0700
X-CSE-ConnectionGUID: NDvQIa4DSIezkHY4tCL/hQ==
X-CSE-MsgGUID: lQnoiYhETgKf7EgXUwGzHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77672946"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.93])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:32:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v3 14/15] drm/i915/vga: use display->platform.<platform>
 instead of IS_<PLATFORM>()
Date: Mon, 30 Sep 2024 15:31:15 +0300
Message-Id: <64f0037e9cfd12308cba23612b14583ac55864a4.1727699233.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1727699233.git.jani.nikula@intel.com>
References: <cover.1727699233.git.jani.nikula@intel.com>
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

Switch to using the new display->platform.<platform> members for
platform identification in display code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 2c76a0176a35..fd18dd07ae49 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -16,9 +16,7 @@
 
 static i915_reg_t intel_vga_cntrl_reg(struct intel_display *display)
 {
-	struct drm_i915_private *i915 = to_i915(display->drm);
-
-	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+	if (display->platform.valleyview || display->platform.cherryview)
 		return VLV_VGACNTRL;
 	else if (DISPLAY_VER(display) >= 5)
 		return CPU_VGACNTRL;
-- 
2.39.5


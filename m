Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31296D41D4D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 13:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6D710E5E1;
	Tue, 12 Nov 2024 13:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COKv3XyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0898210E5E1
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418372; x=1762954372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8aA3zj5UaDmqTOXRUQwhQneHwPrFaJYsvV1ZNQCb6gw=;
 b=COKv3XyKKnGOl4NOo4QN/NM7h+qmglcnbS5lawNNg0M8tuR0U5GmBLUs
 PduGkXvBujsStQCdtejYbUizT3LOt+077ANu2GWGATjq6L8zaWjOE9zDU
 0Fm+7A8zHd9tcMAE6U1KnbzVRC0zkvpRbC/Cqwm17PeGvRHUe7ewSYTQd
 hejhfqUxAbX3Tdij6onnfYVSSAYXtW5FgDyECq4EZ1yyCTAhz1VyEo207
 dlvbkHPamXVQclzz8ERPD5DOjlVTZ7ZCtHLN+WMyujYeb4vEN9XzlT9N3
 kQERwdFA4MZ0fR6HwkSYNsvOyjUJILXkCwxRVRw+o5pvVjS6UrAQzEMNi w==;
X-CSE-ConnectionGUID: MTs1ElpHTTG5o+/UQXwPQw==
X-CSE-MsgGUID: 4wZ3gFyTS5OLG04q8mIgbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31346212"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="31346212"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:32:51 -0800
X-CSE-ConnectionGUID: CSJU9NJmRuefNUlxQQbyDw==
X-CSE-MsgGUID: X4tZOm6BR06l8w4TIJ9ndA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87044926"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2024 05:32:51 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Date: Tue, 12 Nov 2024 15:24:11 +0200
Message-ID: <20241112132411.491540-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

On xe3lpd the CD clock frequency is set by the driver
without setting voltage levels. Previously, we had 4
levels of voltages to choose from. However, having only 4
levels is rather coarse and we may end up consuming more
power than necessary. Therefore, these are now removed
and choosing the correct voltage level is now handed over
to Pcode firmware which is able to set voltage level with
higher granularity.

v2: Leave voltage level calculcations untouched as it returns
    always 0. Drop only voltage level nofication to pcode (Ville)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 5 ++++-
 drivers/gpu/drm/i915/i915_reg.h            | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 5a4c8c2410ae..325100cd3130 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2497,7 +2497,10 @@ static void intel_pcode_notify(struct intel_display *display,
 	if (!IS_DG2(i915))
 		return;
 
-	update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
+	if (DISPLAY_VER(display) == 30)
+		update_mask = DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count);
+	else
+		update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
 
 	if (cdclk_update_valid)
 		update_mask |= DISPLAY_TO_PCODE_CDCLK_VALID;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 261f388b49c7..8e4aa5584adb 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3539,6 +3539,9 @@
 		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
 		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)) | \
 		(DISPLAY_TO_PCODE_VOLTAGE(voltage_level)))
+#define   DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, num_pipes) \
+		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
+		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)))
 #define   ICL_PCODE_SAGV_DE_MEM_SS_CONFIG	0xe
 #define     ICL_PCODE_REP_QGV_MASK		REG_GENMASK(1, 0)
 #define     ICL_PCODE_REP_QGV_SAFE		REG_FIELD_PREP(ICL_PCODE_REP_QGV_MASK, 0)
-- 
2.43.0


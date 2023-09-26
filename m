Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499B6E8181D
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 05:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCBA10E0B0;
	Tue, 26 Sep 2023 05:20:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108FA10E34B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 05:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695705625; x=1727241625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RSngaWgag3dZPxk2LFWR5h/Ojaodutbyp068b5QG2L0=;
 b=R/79IvHAYZb8QW6odthW8rvSRvjiWOCAAjaJW6txJq+E3SIXDcgCZmPQ
 8XRgwRmuACgmMLn3/LPAbx0+woIsed8oV6MrSACc0hZbeVkjark6+FUDW
 JABpIuwT9jpj6xYobB0Bp63WJYgeda2xw5skBQ6ZnFeslmdkSGTofdJcw
 RWQe3EAbgojBsZM9HytF9fr2zrQ2Xfe/T9HOToFNHdzYIysvTwa1tgKd2
 AINzziTV1cQOjZPoRjCjcutscm5/FPqim2UB3wSIp28BTPhpDpdE3ktGl
 K7TkgM3iZnacMtOe/lSnUB27fZ+HlRzPBZB7+bGeiuUnbz6XrsOKD7f8e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361734683"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="361734683"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 22:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079561171"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="1079561171"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2023 22:20:23 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 uma.shankar@intel.com
Date: Tue, 26 Sep 2023 10:41:24 +0530
Message-Id: <20230926051124.583554-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926051124.583554-1-arun.r.murthy@intel.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20230926051124.583554-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCHv2 2/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fastboot module parameter has been added to xe driver.

This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0bfd4ea12065..c79aacf5ee6f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4986,7 +4986,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 
 static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 {
-#ifdef I915
 	/* Enable fastboot by default on Skylake and newer */
 	if (DISPLAY_VER(dev_priv) >= 9)
 		return true;
@@ -4997,9 +4996,6 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 
 	/* Disabled by default on all others */
 	return false;
-#else
-	return true;
-#endif
 }
 
 bool
-- 
2.25.1


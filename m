Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A56CD6E52
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0742610FD61;
	Fri, 29 May 2026 11:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jey2e1cl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101A610FD5C;
 Fri, 29 May 2026 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052762; x=1811588762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ReG2SsUNsgEQN/RWaez7zL1yh2Cxgzor4Amjw/KtVWE=;
 b=jey2e1clgpm4a8DJw3jM16R4B9OZKnHqBX8HmMJaN9V80RAhTYD+MFOv
 72AwqyvZ6AfRE8dyJYl5GQ5EkQLss44dPHxx4b6gFlUdAwmFh+E9WmK2W
 93MYrFskHQNsfZ5MdA6fmDf4lDTfQTkQrswQ8p7LGRdJtnyhIl3w8kcfJ
 tlabO0/P5ciO5soKl/xoYsf/e/7bWbaBc5uB+B6M7i6QlMM8fGGfufzej
 jHgrTIg5BCFWd8aq+DUgbmvmEbEaaUuZ4z9S+yS9n/nineEdTCzNgMh7j
 NjkiYI4ldh1y8J/EVklNhF3yZLXNOxneA18ImyrPvlzKXozsGzZNmJT18 Q==;
X-CSE-ConnectionGUID: A+oCB/zcSK6/EdQeOwCHSg==
X-CSE-MsgGUID: w6mC7yTQQeeRZyb1p8oVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="81087069"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="81087069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:06:01 -0700
X-CSE-ConnectionGUID: 8hrj6KtaRdqe/qqqvOdDog==
X-CSE-MsgGUID: fBv8sidxRyagIBzFx4EeLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240273019"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:05:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 23/24] drm/xe/display: separate d3cold handling from
 xe_display_pm_runtime_suspend_late()
Date: Fri, 29 May 2026 14:04:07 +0300
Message-ID: <5a604a4b846ef69f26586ba00a08961a82990713.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Make the special d3cold paths completely separate from the rest of the
runtime pm calls.

The intel_dmc_wl_flush_release_work() call right after
xe_display_pm_suspend_late() might be completely redundant, but this
avoids any functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b153bf9c83d8..0fadc62e1cdd 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -373,8 +373,11 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	if (xe->d3cold.allowed)
+	if (xe->d3cold.allowed) {
 		xe_display_pm_suspend_late(xe);
+		intel_dmc_wl_flush_release_work(display);
+		return;
+	}
 
 	/*
 	 * If xe_display_pm_suspend_late() is not called, it is likely
-- 
2.47.3


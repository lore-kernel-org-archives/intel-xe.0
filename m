Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB13C982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B59410E88D;
	Tue, 22 Sep 2026 15:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDjjUKSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4312910E88D;
 Tue, 22 Sep 2026 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790089273; x=1821625273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UsdJgIuSLvRF/3/n5zPxzrh9Y5BOilEszI7LT3u6jKw=;
 b=QDjjUKSMWODan/Qq3QWPITNyl+jhx0oZeOQUsfOVVP3mHoj4Lo1wV5iW
 6YEEHQzittIOMXgnEMrkdFf1oXTb2u/oiaa+MzqmnLDqwT4ikFZ+bF35w
 l2A3nsICRX8zxSTJkYsGBrfiLHdDZcwZ/H5ZIU3dfFy7ZZbhfRofeswdC
 z4ifkWA/KJ1sV8s6YE4/1ENJjS+wSVI5Urrv7//tQh4RXwSwLjwDAR4Wl
 G8WfQscUAkiDGVd5qiqwxugvFG0t+hpi2vsrW5cviHy4WwZJE24/1NgXP
 CBo2Qv9dUjvjqhg6deQ8SFZHTDkhAhUo7p7RzIOmvsEt7kRIIzKGcd9P4 g==;
X-CSE-ConnectionGUID: Fyny99QcSoWbfPuktrNbJA==
X-CSE-MsgGUID: hL+m4n9YSCK1WtOw0rgULw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101287260"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101287260"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:11 -0700
X-CSE-ConnectionGUID: X0nl36bnS9SPr3e/N02PEQ==
X-CSE-MsgGUID: /4Gm6SYKSjecf1US/XlZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="299428016"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 3/4] drm/{i915, xe}: add/move intel_opregion_suspend() to
 intel_display_driver_shutdown()
Date: Tue, 22 Sep 2026 18:00:51 +0300
Message-ID: <a913a25a45ccf18159cbabb921111ae719b44d04.1790089118.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790089118.git.jani.nikula@intel.com>
References: <cover.1790089118.git.jani.nikula@intel.com>
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

Add intel_opregion_suspend() to intel_display_driver_shutdown(). For xe,
there's no change, but for i915, this starts calling
intel_opregion_suspend() on shutdown.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
 drivers/gpu/drm/xe/display/xe_display.c             | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index abab457bce3a..d452506ecbc4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -704,6 +704,8 @@ void intel_display_driver_shutdown(struct intel_display *display)
 	__intel_display_driver_pm_suspend(display, true);
 
 	intel_encoder_shutdown_all(display);
+
+	intel_opregion_suspend(display, PCI_D3cold);
 }
 
 void intel_display_driver_shutdown_late(struct intel_display *display)
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index b013ec00b75d..1e37b1c29bb1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -176,8 +176,6 @@ void xe_display_shutdown(struct xe_device *xe)
 		return;
 
 	intel_display_driver_shutdown(display);
-
-	intel_opregion_suspend(display, PCI_D3cold);
 }
 
 void xe_display_shutdown_late(struct xe_device *xe)
-- 
2.47.3


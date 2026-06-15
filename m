Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB13CD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FAA10E5DB;
	Mon, 15 Jun 2026 18:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oD1yFcOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA610E5CB;
 Mon, 15 Jun 2026 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781549318; x=1813085318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NI55BDCmNqMNfR1pX8jjx4l31bhLrw5TA8JuyIMZLJ8=;
 b=oD1yFcOldsQxVOmaOr76QJGhlpkjF/d3oxV850Sd32cOLF33lGtYkibf
 1m8MFMleLT6OtXhYpZIWtnkfOZCQ7VP0k1yFNC2gb8VXkoPxSYJ4NjSqt
 lxE/HVdRWHvPZvNK+md6tZH3JMFYavFr5fr1E5oIEFtH0nigb9l+uOeJR
 bfCEkd176J6C1WCZcaILqf72N6iGnzQYzmrBTbRlGS4zIdXDR2ZoZroHv
 roktjlzGF1N6IFD9XETdAEie0pIEBamgU9aKHYI6RjZA+RlBWMkdyzJ8M
 ZrY83C1uL6VIHadjXRJqdwTGL8co+Vi3aHIVWjKRlq9ns5SdqHAJ85GlR g==;
X-CSE-ConnectionGUID: 65LYDOo5RMGP2aHV8TPlhg==
X-CSE-MsgGUID: cci54TG3RUCCAyMmKi2pcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81438594"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81438594"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:37 -0700
X-CSE-ConnectionGUID: rdyMAXrkSiusGVgs3oueyA==
X-CSE-MsgGUID: frAHjDv6QkSreUJFuTDHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247628634"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 6/6] drm/{i915, xe}: move intel_hpd_cancel_work() to
 intel_display_driver_remove_noirq()
Date: Mon, 15 Jun 2026 21:48:03 +0300
Message-ID: <6be8d033a6c8d0038dc14100d3ee6612d6204770.1781549229.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781549229.git.jani.nikula@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
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

intel_hpd_cancel_work() gets called before
intel_display_driver_remove_noirq(). Move it there.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
 drivers/gpu/drm/i915/i915_driver.c                  | 1 -
 drivers/gpu/drm/xe/display/xe_display.c             | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index a1c91fbf737c..bb5301b90231 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -622,6 +622,8 @@ void intel_display_driver_remove_noirq(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
+	intel_hpd_cancel_work(display);
+
 	intel_display_driver_suspend_access(display);
 
 	/*
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 68ab96b8195b..3ac7dc66085f 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -948,7 +948,6 @@ void i915_driver_remove(struct drm_i915_private *i915)
 	intel_display_driver_remove(display);
 
 	intel_irq_uninstall(i915);
-	intel_hpd_cancel_work(display);
 
 	intel_display_driver_remove_noirq(display);
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 8be3e600838b..92a4573db28a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -81,7 +81,6 @@ static void xe_display_fini_early(void *arg)
 	if (!xe->info.probe_display)
 		return;
 
-	intel_hpd_cancel_work(display);
 	intel_display_driver_remove_noirq(display);
 	intel_display_driver_remove_nogem(display);
 	intel_display_power_cleanup(display);
-- 
2.47.3


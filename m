Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB22C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4359210E2BA;
	Mon, 18 Sep 2023 17:30:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6457A10E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695058215; x=1726594215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/a8QXAQgIey2BRqvTgIjA4uQA56JvCX4sNizN7KQcHY=;
 b=CNqtZhkrMTfUtNPfNIhsg0zpGRdmSSfHHruaaQBvHDhSM/hZnA57VetN
 sc8HGAQePEfLBdkHYslp5ueOY0E6A7MBU0xpi6huNHZIavJ/GdRb19jvv
 wCfkw3apOI14uJ14SZM6KrYKz6vnsLLVzf4sE7NLpXHRbM3lJ3178Kl24
 Fjf8J69pHT6Hp7tqisdncN704BNsrc1Q2HkSB4aqaGkHN9PCVAdxhSnHP
 rZYp/4ez089/HegOqXdOBYlgWOr6ebgvEa7Vn6IpKTMMrt/t/pZw74fw5
 AvxznY0yzvuVuVqv4dmfHaUWHEmdQZ7dqoV/pSEiRAcNuL5GeLJ7Yeo/3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359140671"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="359140671"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919543206"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="919543206"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 18 Sep 2023 10:30:11 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 23:07:10 +0530
Message-ID: <20230918173711.625930-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230918173711.625930-1-uma.shankar@intel.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA decode
 setup
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some of the VGA functionality is not needed by the Intel
Xe driver. Adding a wrapper function for VGA decode setup.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
 drivers/gpu/drm/xe/xe_display.h             | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
index 981edc2788bc..aa3e9ad718c3 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
@@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
 {
 	return 0;
 }
+
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
+{
+	return -EIO;
+}
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 03b7ea9268d4..d7a200e6ec30 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -38,6 +38,7 @@ void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
+unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool enable_decode);
 
 #else
 
-- 
2.42.0


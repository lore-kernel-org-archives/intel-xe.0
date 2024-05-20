Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD76C04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CECC10E7C1;
	Mon, 20 May 2024 15:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbUcAFzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7122E10E7BB
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219956; x=1747755956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0amT0QMqrRbjKJDoc89ZGXKA2P0Pxc6I/akPpbUDlJ8=;
 b=FbUcAFzElayy5mpHzYJ4dhTjCVouNCMpmtMNuGr6CYNQO8LiKTb2jQqG
 7PX0YyYijGRdycpebnd3nfnEyjCc8pQYLLBW/9L4ZJ402yZJ/17cR1aBa
 UeHP95lxk8j+GvudTB6pw/A7bNqNe3BnHmJSsuhJDxhwNhHVjKlku0PQI
 HSciZUPOGjtM+ql1RzTuZhHBHG8qfuVHg5p7e0EKJEMCFCrqGh8NM67xy
 C9y4BDeS7a0nOgA05qVljT6FAtNjpBsLonhY9Oa9bq0L7Vu4il/YuvoJl
 WTct4BzOhW3l1XxxtBUJTZ5hFM0fY3afIYoWMOzq3ZZSjPH4IKHrvzll3 w==;
X-CSE-ConnectionGUID: 3Rxc78BASQmSlxtNDQZOjg==
X-CSE-MsgGUID: klx8AKkkTcOYd0HgarvjQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873258"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873258"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:56 -0700
X-CSE-ConnectionGUID: Jqaba721TWSxtsZcBC5qmA==
X-CSE-MsgGUID: +BFpT7ONQkuVNzvrzwMCtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610539"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 18/18] drm/xe/display: move device_remove over to drmm
Date: Mon, 20 May 2024 16:43:07 +0100
Message-ID: <20240520154249.52888-36-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

i915 display calls this when releasing the drm_device, match this also
in xe by using drmm. intel_display_device_remove() is freeing purely
software state for the drm_device.

v2: fix build error

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 20 ++++++++++++++++----
 drivers/gpu/drm/xe/display/xe_display.h |  4 ++--
 drivers/gpu/drm/xe/xe_pci.c             |  4 +++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7065e34a460e..386c356967b4 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -231,8 +231,6 @@ void xe_display_driver_remove(struct xe_device *xe)
 		return;
 
 	intel_display_driver_remove(xe);
-
-	intel_display_device_remove(xe);
 }
 
 /* IRQ-related functions */
@@ -374,17 +372,31 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_power_domains_enable(xe);
 }
 
-void xe_display_probe(struct xe_device *xe)
+static void display_device_remove(struct drm_device *dev, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	intel_display_device_remove(xe);
+}
+
+int xe_display_probe(struct xe_device *xe)
 {
+	int err;
+
 	if (!xe->info.enable_display)
 		goto no_display;
 
 	intel_display_device_probe(xe);
 
+	err = drmm_add_action_or_reset(&xe->drm, display_device_remove, xe);
+	if (err)
+		return err;
+
 	if (has_display(xe))
-		return;
+		return 0;
 
 no_display:
 	xe->info.enable_display = false;
 	unset_display_features(xe);
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 710e56180b52..e4085f841aa7 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -18,7 +18,7 @@ void xe_display_driver_remove(struct xe_device *xe);
 
 int xe_display_create(struct xe_device *xe);
 
-void xe_display_probe(struct xe_device *xe);
+int xe_display_probe(struct xe_device *xe);
 
 int xe_display_init_nommio(struct xe_device *xe);
 int xe_display_init_noirq(struct xe_device *xe);
@@ -47,7 +47,7 @@ static inline void xe_display_driver_remove(struct xe_device *xe) {}
 
 static inline int xe_display_create(struct xe_device *xe) { return 0; }
 
-static inline void xe_display_probe(struct xe_device *xe) { }
+static inline int xe_display_probe(struct xe_device *xe) { return 0; }
 
 static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
 static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682eafd84901..93c8407de759 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -769,7 +769,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_display_probe(xe);
+	err = xe_display_probe(xe);
+	if (err)
+		return err;
 
 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d",
 		desc->platform_name,
-- 
2.45.1


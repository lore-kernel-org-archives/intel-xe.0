Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FC1C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0EF10EF42;
	Fri, 10 May 2024 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qjr6G84p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D957B10EC25
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364773; x=1746900773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=feO0dpIDdydces1sA0rpmmCBjIe5rJ4H6HJqaUKDJbw=;
 b=Qjr6G84ph4IucVs8GjKtKFvKO2xJfZyZ3ECTDavfQp/cXtJ5VJatkkR0
 LzS9IyNVrM4B9vUdDV0Zy0PKyf8yfs4y7j4TINqSI6yriRcwL178xHORc
 iSxHfZXBjEjfZmTV5v0bWGBFZqHr5gOrzAS7SpYuIdmOoiz0ZBczZgqst
 /1UnLjd2ONjeNcwrqZvUTwp50KV9W2KWpNvGY4LgDihZW40oj9DDiV4kR
 3DF4XfM1hY6rel3b+rgd9RDRGTODmj3Sds6EZ0KnYYrt2TdTIrEX5c9gf
 sJ+hhfC+gF1Atz6qjmfy7UJO2QJcOpH9Qxp2IN7J3tlD6k7bjBheCUnOv Q==;
X-CSE-ConnectionGUID: Y9UzXAe5QS6txapbm16mog==
X-CSE-MsgGUID: c7JcewjQSI26txmqfIM3pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844641"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:53 -0700
X-CSE-ConnectionGUID: WhQ8iKwCTWueUGGxN9iq6w==
X-CSE-MsgGUID: xxbVYVAmRNeJFhD8uG/S4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544162"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 20/20] drm/xe/display: move device_remove over to drmm
Date: Fri, 10 May 2024 19:12:33 +0100
Message-ID: <20240510181212.264622-42-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 20 ++++++++++++++++----
 drivers/gpu/drm/xe/display/xe_display.h |  4 ++--
 drivers/gpu/drm/xe/xe_pci.c             |  4 +++-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 734bddbb8932..ac674a08664d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -234,8 +234,6 @@ void xe_display_driver_remove(struct xe_device *xe)
 		return;
 
 	intel_display_driver_remove(xe);
-
-	intel_display_device_remove(xe);
 }
 
 /* IRQ-related functions */
@@ -377,17 +375,31 @@ void xe_display_pm_resume(struct xe_device *xe)
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
index 710e56180b52..148bf7d744e6 100644
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
+static inline int xe_display_probe(struct xe_device *xe) { }
 
 static inline int xe_display_init_nommio(struct xe_device *xe) { return 0; }
 static inline int xe_display_init_noirq(struct xe_device *xe) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 841b02ac6ba1..b366cbceb476 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -768,7 +768,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_display_probe(xe);
+	err = xe_display_probe(xe);
+	if (err)
+		return err;
 
 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d",
 		desc->platform_name,
-- 
2.45.0


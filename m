Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B413C64ED8
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1280910ED80;
	Sat, 25 Feb 2023 00:21:57 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6505810ED8C
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284515; x=1708820515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysXpkHjJbhjnlgX9XpByzKvkGhov2PagzcL9/gxKpSY=;
 b=l88SvY36n18VsFSRvWOnhmxlruhM4gDsN5yAG9SAEWcvFWrVxfHV01/k
 +rPrnszUx1s60gYN4f+wRRWvOcsoXS3hkBxSdr3SQjCDw4Vj3stgUVeaB
 QcmrNrxOgY6flagNZuj9VlqXg2AvO81Xju0fK6k3tZyGrWyFB51yXMYj6
 ca+kN5eO6GPnN6aKFKToyStwqrNcffI7/QjXxah9w4CoveyrwNjCS0UsG
 JxlLn/63lfbNb2Ue+f2hKaasKH/jGtZsh0+0+lh9yqgDhxQuOIXbA5Sij
 i9iS7y9UfCJK8ImL7P0qK8NB7SSevsXQYbfidydsBftEekKNk3uuKnLJg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313246710"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="313246710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:21:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918588999"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="918588999"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:21:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:21:37 -0800
Message-Id: <20230225002138.1759016-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225002138.1759016-1-lucas.demarchi@intel.com>
References: <20230225002138.1759016-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/device: Prefer the drm-managed
 mutex_init
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There's inconsistent use of mutex_init(), in xe_device_create(), with
several of them never calling mutex_destroy() in xe_device_destroy().
Migrate all of them to drmm_mutex_init(), so the destroy part is
automatically called.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a028efa8eebe..5e2f5d93f2ce 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -159,7 +159,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 
 	destroy_workqueue(xe->display.hotplug.dp_wq);
 	destroy_workqueue(xe->ordered_wq);
-	mutex_destroy(&xe->persitent_engines.lock);
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -196,10 +195,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	init_waitqueue_head(&xe->ufence_wq);
 
-	mutex_init(&xe->usm.lock);
+	drmm_mutex_init(&xe->drm, &xe->usm.lock);
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC1);
 
-	mutex_init(&xe->persitent_engines.lock);
+	drmm_mutex_init(&xe->drm, &xe->persitent_engines.lock);
 	INIT_LIST_HEAD(&xe->persitent_engines.list);
 
 	spin_lock_init(&xe->pinned.lock);
@@ -213,12 +212,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	/* Initialize display parts here.. */
 	spin_lock_init(&xe->display.fb_tracking.lock);
 
-	mutex_init(&xe->sb_lock);
-	mutex_init(&xe->display.backlight.lock);
-	mutex_init(&xe->display.audio.mutex);
-	mutex_init(&xe->display.wm.wm_mutex);
-	mutex_init(&xe->display.pps.mutex);
-	mutex_init(&xe->display.hdcp.comp_mutex);
+	drmm_mutex_init(&xe->drm, &xe->sb_lock);
+	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
+	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
+	drmm_mutex_init(&xe->drm, &xe->display.wm.wm_mutex);
+	drmm_mutex_init(&xe->drm, &xe->display.pps.mutex);
+	drmm_mutex_init(&xe->drm, &xe->display.hdcp.comp_mutex);
 	xe->enabled_irq_mask = ~0;
 
 	xe->params.invert_brightness = -1;
@@ -236,7 +235,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
-	mutex_init(&xe->mem_access.lock);
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	return xe;
 
 err_put:
-- 
2.39.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7221C6FA8E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8442110ED71;
	Sat, 25 Feb 2023 00:21:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430910ED90
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284516; x=1708820516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1vBd9MKjatgoVtOaDgVtAkkGDwoiBTIHc6n3N9zypbU=;
 b=dkWGkNLJklTrUoJt2WnRvA+uLy0074fkaw3J+v2DzVadQUE3q/ZrgmJQ
 17W8d5orWtq+pVEkNNbc0Wz3BDwFoQDA88Brfem0hZZyHAbtAvLvREek7
 rAjPzBLnB6v2/ydnlfQFhUeyWq6wenViU/dKn3wO2Y7w+POflZmWsNJLC
 xOwR4wMP5CoU+QccfKFZqpkFrFA/5GPIbiRMxIDbj2TZRylPew0CMWv89
 uYhFyh2WTQg5yPh6HJRS5pCXtZhk+Mn69Zuqzb8rIpCAzQCpcuvCak2gG
 0RA9o/QXTjMIUdrOPkBXB5UKM20sDeAjnImYkCfMeJLD7p2zGw1hBxsOb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313246711"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="313246711"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:21:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918589002"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="918589002"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:21:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:21:38 -0800
Message-Id: <20230225002138.1759016-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225002138.1759016-1-lucas.demarchi@intel.com>
References: <20230225002138.1759016-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/device: Let display init in a common
 block
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

Move mem_access.lock initialization up and display.hotplug.dp_wq down so
all the display initializations are in a common block that can be moved
elsewhere later.

Also, the `goto err` is not correct as it misses the drm_dev_put() to
correctly unwind the actions.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5e2f5d93f2ce..1e7fa507c123 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -206,12 +206,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
-	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
 
 	/* Initialize display parts here.. */
 	spin_lock_init(&xe->display.fb_tracking.lock);
 
+	xe->display.hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
+
 	drmm_mutex_init(&xe->drm, &xe->sb_lock);
 	drmm_mutex_init(&xe->drm, &xe->display.backlight.lock);
 	drmm_mutex_init(&xe->drm, &xe->display.audio.mutex);
@@ -233,15 +236,13 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		goto err;
-
-	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+		goto err_put;
 
 	return xe;
 
 err_put:
 	drm_dev_put(&xe->drm);
-err:
+
 	return ERR_PTR(err);
 }
 
-- 
2.39.0


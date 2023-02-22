Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B49C636D6
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 12:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE4010E046;
	Wed, 22 Feb 2023 12:19:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D19310E046
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677068359; x=1708604359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QwKTlaz25ZxLe5k/1WzJ4EABmGVbbFcPIHW1hQpPhf8=;
 b=Tum1BfkIhOm+3Oop9rsUMyVv3itJlfbeU4sSC8ivBtyL//3lqeIBBul2
 0BRpKlQDB48Uv/rxFkwNG2WB2aqdfW9a7nwGDpkrZbYsLy1/YtgJbLl0a
 1ctCYrlEULzVMsV+e2UwZu5ENkucbxeq5a/m/WoJJWMgX+/7WOIz0ufQI
 vRwoKWeorbiSQa/vVswkwJFMxI3wuZc0KJCYGHdQNj1fgwsTKBmkFMx/M
 UBSDYtGd1txwtQ2VGYA5mSU1vQ9I2W3yiNSNd1e41OeJQOLJwwQJcYdpS
 qZnNDWWIg7z3yq6OylryrtjNLRqeDqwkGTVR9gGyD4N19C9gHXGdr0DQS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="360393654"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="360393654"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 04:19:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="740801680"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="740801680"
Received: from sineadmc-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 04:19:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Feb 2023 12:18:45 +0000
Message-Id: <20230222121845.171417-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/pm: fix unbalanced ref handling
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In local_pci_probe() the core kernel increments the rpm for the device,
just before calling into the probe hook. If the driver/device supports
runtime pm it is then meant to put this ref during probe (like we do in
xe_pm_runtime_init()). However when removing the device we then also
need to take the reference back, otherwise the ref that is put in
pci_device_remove() will be unbalanced when for example unloading the
driver, leading to warnings like:

    [ 3808.596345] xe 0000:03:00.0: Runtime PM usage count underflow!

Fix this by incrementing the rpm ref when removing the device.

v2:
  - Improve the terminology in the commit message; s/drop/put/ etc (Lucas & Rodrigo)
  - Also call pm_runtime_forbid(dev) (Rodrigo)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/193
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 drivers/gpu/drm/xe/xe_pm.c  | 8 ++++++++
 drivers/gpu/drm/xe/xe_pm.h  | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 25598de3a1fc..85d337cd8fbe 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -441,6 +441,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 		return;
 
 	xe_device_remove(xe);
+	xe_pm_runtime_fini(xe);
 	pci_set_drvdata(pdev, NULL);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 44c38e670587..769f380cf1d4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -128,6 +128,14 @@ void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put_autosuspend(dev);
 }
 
+void xe_pm_runtime_fini(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_forbid(dev);
+}
+
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index b8c5f9558e26..6a885585f653 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -14,6 +14,7 @@ int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
 void xe_pm_runtime_init(struct xe_device *xe);
+void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
-- 
2.39.1


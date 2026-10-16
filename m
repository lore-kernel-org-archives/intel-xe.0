Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFEDCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B80112622;
	Fri, 16 Oct 2026 07:19:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422AE112645
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135144; x=1823671144;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G8nj/BvefXN3s8TKSuXv56u3sXwS+dxgCiFHb1T8s3Q=;
 b=iZvDnTetlCko01K4f8IRkeRxOjAXQl/6Wj4eQAbuNyNAyyRdNLeolj4O
 ZIq8dv8Y1zkm3D6RUW3CibqpMUCpKnmzga7pR3RzLU73O4IQvYjOwATpf
 A33txqNDET7oBd3+S17E0dL0o1Gb4Xqy7BqlINZevizQPzrZBiggkwjyv
 kqjSBzb5bfzLJe9+E+oN5t9B3CXUQ9hGieor95zI0qvANEP8KbMR8ZKdV
 I4+hQUHZetBYRInaLld6olOwhJGe+Ne4eNvQbxWfT8gKN7YWEvig9WptT
 prwqqJU/DI1kemlCuZAT+57i1jzQ3zZMj2Ekcu8JfXWDUi0s/UPF2mHlh Q==;
X-CSE-ConnectionGUID: IqMDt2TdSpGiOXxE2+87pA==
X-CSE-MsgGUID: A6CAumUJRRKRKjvuVD9Uew==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813657"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:54 -0700
X-CSE-ConnectionGUID: p5QlzTNrQ1i7/fn5TtQwgg==
X-CSE-MsgGUID: gieiPvG9RZmjQWOCh+UHsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787284"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:53 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 13/18] drm/xe/irq: Protect IRQ state during wedge
 isolation
Date: Fri, 16 Oct 2026 12:48:23 +0530
Message-ID: <20261016071832.222574-14-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

Wedge isolation can disable interrupts from a worker while PM resume
enables them. If both state changes overlap, resume can leave interrupts
enabled after the device is wedged.

Add a mutex to protect updates to `irq.enabled` and the related hardware
programming. Check the wedged state while holding the same lock so the
final IRQ state remains disabled.

v2:
 - Rename pm_lock to state_lock and document the IRQ state it protects.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_irq.c          | 23 ++++++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9f6f015d7559..0696769cf44c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_DEVICE_TYPES_H_
 #define _XE_DEVICE_TYPES_H_
 
+#include <linux/mutex.h>
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
@@ -278,6 +279,9 @@ struct xe_device {
 		/** @irq.lock: lock for processing irq's on this device */
 		spinlock_t lock;
 
+		/** @irq.state_lock: Protects suspend and resume IRQ state updates */
+		struct mutex state_lock;
+
 		/** @irq.enabled: interrupts enabled on this device */
 		atomic_t enabled;
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d314993b14a1..f7ff3fe5b843 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -797,8 +797,14 @@ static void irq_uninstall(void *arg)
 
 int xe_irq_init(struct xe_device *xe)
 {
+	int err;
+
 	spin_lock_init(&xe->irq.lock);
 
+	err = drmm_mutex_init(&xe->drm, &xe->irq.state_lock);
+	if (err)
+		return err;
+
 	return xe_irq_msix_init(xe);
 }
 
@@ -843,6 +849,8 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 
 void xe_irq_suspend(struct xe_device *xe)
 {
+	mutex_lock(&xe->irq.state_lock);
+
 	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
 
 	/* flush irqs */
@@ -851,6 +859,8 @@ void xe_irq_suspend(struct xe_device *xe)
 	else
 		xe_irq_msi_synchronize_irq(xe);
 	xe_irq_reset(xe); /* turn irqs off */
+
+	mutex_unlock(&xe->irq.state_lock);
 }
 
 void xe_irq_resume(struct xe_device *xe)
@@ -858,10 +868,14 @@ void xe_irq_resume(struct xe_device *xe)
 	struct xe_gt *gt;
 	int id;
 
+	mutex_lock(&xe->irq.state_lock);
+
+	if (xe_device_wedged(xe))
+		goto out_unlock;
+
 	/*
-	 * lock not needed:
-	 * 1. no irq will arrive before the postinstall
-	 * 2. display is not yet resumed
+	 * irq.lock is not needed because no IRQ can arrive before
+	 * postinstall and the display has not been resumed yet.
 	 */
 	atomic_set(&xe->irq.enabled, 1);
 	xe_irq_reset(xe);
@@ -869,6 +883,9 @@ void xe_irq_resume(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
+
+out_unlock:
+	mutex_unlock(&xe->irq.state_lock);
 }
 
 /* MSI-X related definitions and functions below. */
-- 
2.43.0


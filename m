Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8CC10F286F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067710EE6D;
	Fri, 27 Mar 2026 20:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHi3TlTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573DD10EE6D
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774643996; x=1806179996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rb169TnepQP8UGzwbJhfnzBJrXj4gs5XKPsy2JYlD34=;
 b=JHi3TlTuRBggYD7IWwZGEJYJYYaKvojcTd3J4AXVKEkeOR3AjCwF//Oq
 xLnzZvurzL6MSWYKfElY6KjbmvQ6XYgwdaQ8/pPsPQ4yra90Y+NtXHqn5
 +lm1FOf8LmFRNeTaTU4Yc8GQWJaADGrdCm0lE5cT4qCFIJiA0HiA5a9aT
 XOB0GpHXr5xRm5QEm7TkR1TcZH6rKI8W9dROfT4qcXUonozDQxNZUoCt+
 MwboeQilb0gtBMoAw6k+6MXJrj1QdhNfI27lzZzXYEcmkSy8c7K4rMWOi
 tlFy4OrXdNOgRSmHr0Omij+rJSRZmDJso8MSga0/eLj5XU4rDDObPhIC0 w==;
X-CSE-ConnectionGUID: aLlO5ExJQnKd/xFgQd2wHw==
X-CSE-MsgGUID: Xp4Bz1kcSMuRDfBOBC2bMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93110332"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="93110332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:39:56 -0700
X-CSE-ConnectionGUID: EStRtI55TEyzf6CwNu5BTQ==
X-CSE-MsgGUID: c/ZOdvThRfyUrQ9pfdiU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="218794358"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 13:39:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 4/9] drm/xe/irq: Introduce xe_irq_disable()
Date: Sat, 28 Mar 2026 02:06:15 +0530
Message-ID: <20260327203620.809353-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327203620.809353-1-raag.jadav@intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
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

In preparation of usecases which require disabling interrupts before
PCIe FLR, introduce xe_irq_disable() helper. With this we avoid any
side-effects of unwarranted irqs.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Add kernel doc (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_irq.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_irq.h |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7560a45f7f64..9a775c6588dc 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -841,7 +841,13 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
 }
 
-void xe_irq_suspend(struct xe_device *xe)
+/**
+ * xe_irq_disable() - Disable irqs
+ * @xe: xe device instance
+ *
+ * Synchronize pending irqs and disable them.
+ */
+void xe_irq_disable(struct xe_device *xe)
 {
 	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
 
@@ -850,6 +856,11 @@ void xe_irq_suspend(struct xe_device *xe)
 		xe_irq_msix_synchronize_irq(xe);
 	else
 		xe_irq_msi_synchronize_irq(xe);
+}
+
+void xe_irq_suspend(struct xe_device *xe)
+{
+	xe_irq_disable(xe);
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index a28bd577ba52..abda0592a105 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -14,6 +14,7 @@ struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+void xe_irq_disable(struct xe_device *xe);
 int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
-- 
2.43.0


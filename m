Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A489F55139
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70E10E040;
	Sun,  8 Mar 2026 13:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaSiwsex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C1A10E040
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978302; x=1804514302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpl4R5kDNPJbRaJ8YMnfR4u3NLnkptle8O0+SYeoqTE=;
 b=EaSiwsexEiq1eye/ejyhv7mloi3fSk9gXC7rET4fFibhrdvAQmRT48S8
 YXoufoHryekRvLAjo/4KEczRUkbpz1MADFWQZFOVBvoTIpvFGCwmm45Xn
 OutXVtPWoVdakiqe2SPktl+1sfKYhV+Fo9kT6oRlYObPr6WfDiiFfoyJP
 1RgAnSDRFQgdCDFqoYGMbywlMMfy1D6+XNkntyi2TMdwocCoC8RL+wipV
 SU1Sjs+py/k0cSAztQUxS0IO0jr4hm2eHrA6GiOsH1cGDxFabiiUzkURW
 Zm33/OwZgxbMQcKx6RovP3fOQJvuhgSDu7vCr5YPqUmxHwzVgF1h7nzjz g==;
X-CSE-ConnectionGUID: mI6ZT8xNQp2YjHjrvNGV9Q==
X-CSE-MsgGUID: UJH3UnQpRbSMt/em6mUOFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934708"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:22 -0700
X-CSE-ConnectionGUID: 9/zKDjfhQcifixgm4k0dMA==
X-CSE-MsgGUID: iKdgOhPgQBKzj4Cl8KQr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523287"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 05/10] drm/xe/irq: Introduce xe_irq_disable()
Date: Sun,  8 Mar 2026 19:25:31 +0530
Message-ID: <20260308135536.3852304-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308135536.3852304-1-raag.jadav@intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
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
index 9e49e2241da4..e9f0b3cad06d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -843,7 +843,13 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
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
 
@@ -852,6 +858,11 @@ void xe_irq_suspend(struct xe_device *xe)
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73667F46C44
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393DC10E168;
	Mon,  6 Apr 2026 14:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkctVHcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC5410E168
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775484717; x=1807020717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YvD7EvIb5lZIAw2CVZGS+nBDBf7qa59QuhghD0/DLTs=;
 b=AkctVHcbddIPNNH5hbx6E8j+t0GdX31GhLbEsmm81ppqiHAX5W6d9kCg
 LrCAIUdMBtobPlqTajboVGx7xSTvjCfECecQIHZ71mvjV67gBoZowZ01F
 FdCKFXAGG0cq+DY+UI76HvNmVKf6HkECruNwTaE5TMoSjuShOmA5WdBYt
 WaWNPe3FH0Sh9TEtfUVjde+OGohdFRhe267BoBqz4Tz0eMofACIGi56CU
 QyHDZ6RfYLZ++xx13fmlBMpXXs2AB5BxYP9yHwJT6rzOvZv4YNi+7eIU8
 yMP7nWkfpXCRdvXEys6ZTSvnQ3zqRjsRdPrO9WE8zni8wP7fzKi8K2gIu A==;
X-CSE-ConnectionGUID: 1MVp+YigTfuo9QnX7bkD9g==
X-CSE-MsgGUID: WVwKnKR5SueH4Jbax39PEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76443883"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76443883"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:11:57 -0700
X-CSE-ConnectionGUID: df9CgbtwTUqOry9NqHIS0Q==
X-CSE-MsgGUID: KEbc2DzZRFa8WkJAJdxqbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227788253"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 07:11:53 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 4/9] drm/xe/irq: Introduce xe_irq_disable()
Date: Mon,  6 Apr 2026 19:37:17 +0530
Message-ID: <20260406140722.154445-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406140722.154445-1-raag.jadav@intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
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

In preparation of usecases which require disabling interrupts before PCIe
FLR, introduce xe_irq_disable() helper. With this we avoid side-effects
of any unwarranted interrupts.

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


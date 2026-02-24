Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40141E9B24D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EA810E254;
	Tue, 24 Feb 2026 10:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxqXsRuk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E500210E254
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929025; x=1803465025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zOhmm83UC16fhaUYaWWJystoaAPjc/QMZ4xHrD7IIFw=;
 b=NxqXsRuksynvj9XQX/O2hVu2YDUQnMMeK1wv4iP4twuUQpTo+dTcWlzg
 FoaAhmZS8i391gzLy7z4Gsa9gZozwia2dNoWy6ZqFRVoJrb4JUJ1TExHE
 cHEfAykmYLdt7WD8bov1KVeozkBHC6IYa7EjIGlwqrEahwBQaIdKM34pC
 JQLiA0ljIjAEGQHFhzzt8tRA/F8Ynkd5ei7y4+k0ncgL7AbQ6faZQFRvo
 9y3iJbz0pHHg7WR3VUMmK2DeH1vn1elCMRoz2eP3Z5U4UMOY4RSh+zfWv
 DlqU0cqpE5gov5FgJpmVuhrn0uZIBLFX+/FmIQOm+iLEa9MgrUK1ns5uv A==;
X-CSE-ConnectionGUID: b7SKKcvZQV26eV6pm/hcOA==
X-CSE-MsgGUID: qB1DzkrJTcu5O3DUFi0KBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046381"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:25 -0800
X-CSE-ConnectionGUID: fJSd4D1oQPal6bVkRm98DQ==
X-CSE-MsgGUID: vv3KayfgRMiQVBUMGHhfig==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 02:30:22 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/6] drm/xe/irq: Introduce FLR helper
Date: Tue, 24 Feb 2026 15:55:16 +0530
Message-ID: <20260224102618.3105171-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
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

In preparation of usecases which require disabling interrupts before FLR,
introduce xe_irq_flr_prepare() helper.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_irq.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..a4c2f8d7a552 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -843,7 +843,7 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 	synchronize_irq(to_pci_dev(xe->drm.dev)->irq);
 }
 
-void xe_irq_suspend(struct xe_device *xe)
+void xe_irq_flr_prepare(struct xe_device *xe)
 {
 	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
 
@@ -852,6 +852,11 @@ void xe_irq_suspend(struct xe_device *xe)
 		xe_irq_msix_synchronize_irq(xe);
 	else
 		xe_irq_msi_synchronize_irq(xe);
+}
+
+void xe_irq_suspend(struct xe_device *xe)
+{
+	xe_irq_flr_prepare(xe);
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index a28bd577ba52..cd9f743c2e9c 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -14,6 +14,7 @@ struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+void xe_irq_flr_prepare(struct xe_device *xe);
 int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
-- 
2.43.0


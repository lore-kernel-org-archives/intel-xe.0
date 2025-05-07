Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05537C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 19:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B865F10E1B1;
	Wed,  7 May 2025 19:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKgzHa1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114410E1B1
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746646701; x=1778182701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uzwPoFHkO51v8T1uZbFF/LoV3DuyfMcS5WgPnR4khuE=;
 b=YKgzHa1A5JE/MalJ/Ir/EJbH8Yo66LvKwzsGTn0CKraWzJQFABm9snnr
 RtYSD++LXbHYRd3X8uCdyf+VV/wrpynS9bPamPoZYeO0IX/fvOc+OKyoA
 Fdu9uiPw1jVhaO1M5/FU/kIe+RRTNVbLbd1hoJVhqeUjZ2J/DhcP2uhoP
 Jc3QpZ+fyB8R9Grtley44BHVKTep3cGURNryEqyzV55xa+iqA4CXW2CEl
 bwGg9rl8hYzuupmUbtt+05CZSrXFMKvZOXXs0xqx4ElWkx9uaRYXWXpMH
 KK5cQQmoOjocDRRj4tJeYI8JO4esAmMQwSP9xY6NhvH4upN1vQ1k4SsUn g==;
X-CSE-ConnectionGUID: egIGvu9FRLaJ4H271Ne8ng==
X-CSE-MsgGUID: s0fZmkxJQx6IsPvYDyPszA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52212198"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="52212198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:38:21 -0700
X-CSE-ConnectionGUID: 9WEUsrf8TMC/SDCsEgW35w==
X-CSE-MsgGUID: ks8xLlyHRp2+vjuaR5irww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136067268"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.222.94])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:38:20 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, nicholas.johnstone@intel.com,
 david.e.box@intel.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Date: Wed,  7 May 2025 15:37:40 -0400
Message-ID: <20250507193811.268719-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
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

The PMT driver API allows kernel level access to device
data.  Because of this, the mutex lock use by the Xe copy
callback function turns out to be a poor choice.

Change the mutex to a spinlock to avoid sleeping when it
isn't allowed.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
v2: checkpatch fix, update email address

 drivers/gpu/drm/xe/xe_device.c       | 5 ++---
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..72c81b8203a5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
+#include <linux/spinlock.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -488,9 +489,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
-	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
-	if (err)
-		goto err;
+	spin_lock_init(&xe->pmt.lock);
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 06c65dace026..b57e1ba7cbdf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -527,7 +527,7 @@ struct xe_device {
 	/** @pmt: Support the PMT driver callback interface */
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
-		struct mutex lock;
+		spinlock_t lock;
 	} pmt;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index b378848d3b7b..df44e28abbdf 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -6,7 +6,7 @@
 #include <linux/errno.h>
 #include <linux/intel_vsec.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/pci.h>
 #include <linux/types.h>
 
@@ -164,7 +164,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t u
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
+	guard(spinlock)(&xe->pmt.lock);
 
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
-- 
2.49.0


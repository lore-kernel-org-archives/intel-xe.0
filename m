Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCA8C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 18:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F105D10E476;
	Mon, 12 May 2025 18:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCaJyo8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B6310E476
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747074021; x=1778610021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKa8nS5ORPjX4e4BH6SgFyvdqN/7Gsv5qVOLiogBsDA=;
 b=mCaJyo8PtpI4BaRwcwbYzthNWo1A1/tT162mm7jvQKvChO/ppVwPb2cq
 sNdS4NSb1o+xL4PMyct2TYhk3pX5bcPAto8ty8CD1tUwkrSFRL+NZLLva
 yIXiYQrpNrZheg1inQdzcTcl7OXc0RE/94VfC3pw2w3N33wwokE/nXz/5
 7oJzlTlfSZh20d92HiIDMAXlkMTZBW9bacOS3fQ9vgqgBCRHyXffaH21C
 F5+pyRFXxc49rceu3nkAvnksNhfqyf/E3IhAAiWUzdZ82Q6ZSPoO5XA5F
 OWHz91DTibzXQhJ0VEWiHIBi4eY3lW2p9+IVrOpZfEdaBso+3K12r1i8V w==;
X-CSE-ConnectionGUID: +c5gmzp9R/2BwxP/DMH4Lg==
X-CSE-MsgGUID: iccej94ZQzS4HabjazN/Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66299537"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66299537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 11:20:20 -0700
X-CSE-ConnectionGUID: JuPu3jHrSgy+NtTfDV1RHA==
X-CSE-MsgGUID: 9/osGUT+SQmuwF8+sTfvSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142643357"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.220.136])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 11:20:19 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, nicholas.johnstone@intel.com,
 david.e.box@intel.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v3] drm/xe/vsec: Allow for kernel context access
Date: Mon, 12 May 2025 14:18:35 -0400
Message-ID: <20250512182012.181644-1-michael.j.ruhl@intel.com>
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

Since the context of the caller can not be known, change
the mutex to a raw_spinlock to account for all use cases.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
v2: checkpatch fix, update email address
v3: use raw_spinlock

drivers/gpu/drm/xe/xe_device.c       | 5 ++---
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 399ae5f40321..0caa77d24f44 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
+#include <linux/spinlock.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -486,9 +487,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
-	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
-	if (err)
-		goto err;
+	raw_spin_lock_init(&xe->pmt.lock);
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 06c65dace026..8f680a89ddb7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -527,7 +527,7 @@ struct xe_device {
 	/** @pmt: Support the PMT driver callback interface */
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
-		struct mutex lock;
+		raw_spinlock_t lock;
 	} pmt;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index b378848d3b7b..3941e1760ea3 100644
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
+	guard(raw_spinlock)(&xe->pmt.lock);
 
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
-- 
2.49.0


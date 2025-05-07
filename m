Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4BFC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 18:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C4910E02B;
	Wed,  7 May 2025 18:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcOH9KnW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECD110E02B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746643161; x=1778179161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1aL3YxIfxvX2h4QkVqprMdL8LQKP7D2njz2IKPs1qJY=;
 b=fcOH9KnWrmJmG6My301+nLPqJoHbMrwwBgAEIIjjbVik5IpnycN1dugl
 ECRVuXVFSCGokuPx3I4MRUoKQPnfq8b1RHV7qoQEq652vfiL6mC9xB3ah
 anB3ZVCvdqBypBBirYIWvW7qNhoqYuGpn9OcwVdRU1v5IyKJRlCfqH6UI
 pRN6ev5wLOWetCqrd5J2jjEh/7qKk+UlTJ4md91qNE3K754bbnenqtfuJ
 3UWKmBbW+tP2LG1dyD85NJKgNe9HK6nzEjB+ITIpzLIL0Nl1evoAyrZ4d
 udzUvGN/scCS4TfyOAu1YM01KuLpr4Cg6JaiWRw/iTxUABcb2KN/yHP/K w==;
X-CSE-ConnectionGUID: oPo6mbydRT+UKFlPYRNDhQ==
X-CSE-MsgGUID: tEXrlUI8R9qj0ApvZyW6Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59748846"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59748846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 11:39:21 -0700
X-CSE-ConnectionGUID: p0pmimdQQDyhCkzbrVJvFw==
X-CSE-MsgGUID: KTEzhyAgRsG/0jNgjUCzQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137038505"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.222.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 11:39:19 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, nicholas.johnstone@intel.com,
 david.e.box@intel.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: "Michael J. Ruhl" <mjruhl@habana.ai>
Subject: [PATCH] drm/xe/vsec: Allow for kernel context access
Date: Wed,  7 May 2025 14:39:01 -0400
Message-ID: <20250507183907.260707-1-michael.j.ruhl@intel.com>
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

From: "Michael J. Ruhl" <mjruhl@habana.ai>

The PMT driver allows kernel level access to device data.
Because of this, the mutex lock turns out to be a poor
lock.

Change the mutex to a spinlock to avoid sleeping when it
isn't allowed.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <mjruhl@habana.ai>
---
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
index 06c65dace026..8bfbe2cfa9c2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -527,7 +527,7 @@ struct xe_device {
 	/** @pmt: Support the PMT driver callback interface */
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
-		struct mutex lock;
+		struct spinlock lock;
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
2.34.1


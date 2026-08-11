Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87B6C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B6810EB8D;
	Tue, 11 Aug 2026 12:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wour5eGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6810EB8D
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786452053; x=1817988053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eyX7YtvnSY2AI6chQno5JL3gxkb+CrytL3oJBmnJR28=;
 b=Wour5eGP5QIfKZxxP/614dl5v0gkVItjTPdssix+PUmw/QJyLXDVjwiF
 gAzzj0Nl6Xs1R981Vi67ZFGKfW5n6GevY57W7wQP0O5aN3ntRzH+Nw3r/
 rDOfdbSLGZVzr2RvJpYONeP4DTKBmSQXbv8aJdFMxq2U87nMoolU2yN1P
 yu3TXMPIrx//nC93kQPxA86AEdGRQmPmaRHdusBwoUHDTAKLB2Kmyl/ZO
 AFntoPi4PXzXKw1gAUToi9X9ir/Mi3G3kO2mateHwE2AoN4fOJELqZEWl
 DQ+zi34/qO4Yh02VTXH8rgOXHXHF6rdQ0gLHcoqalh/1INBvKXMq2Qsz9 g==;
X-CSE-ConnectionGUID: KoI8/tIyT+6c+td4B3SM9w==
X-CSE-MsgGUID: YZ7Bp/HqQYq2UE7B+UlBhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86913018"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86913018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:53 -0700
X-CSE-ConnectionGUID: GUobv0a3SMeU2gsAc10PEA==
X-CSE-MsgGUID: Ci+rRqoFSIWaf41H4yiFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="265329970"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:40:51 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V15 12/14] drm/xe: Add sysfs interface for bad gpu vram pages
Date: Tue, 11 Aug 2026 18:10:16 +0530
Message-ID: <20260811124016.3614699-28-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Include a sysfs interface designed to expose information about bad
VRAM pages — those identified as having hardware faults (e.g., ECC
errors). This interface allows userspace tools and administrators to
monitor the health of the GPU's local memory and track the status of
page retirement. Details on bad gpu vram pages can be found under
/sys/bus/pci/devices/<bdf>/vram_bad_pages.

The format is: pfn : gpu_page_size : flags

flags:
  R: reserved, this gpu page is reserved.
  P: pending for reserve, this gpu page is marked as bad, will be
     reserved in next window of page_reserve.
  F: unable to reserve, this gpu page can't be reserved due to some
     reasons.

For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
  max_pages : 10000
  0x0000000000000000 : 0x0000000000001000 : R
  0x0000000000001234 : 0x0000000000001000 : P

The sysfs binary attribute is created under the PCI device kobject
when the platform supports it and the configfs bad_page_reservation
policy is enabled. Uses RCU-protected list traversal so reads never
block normal VRAM allocation operations.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 7 +++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..47c5be4180fe 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -8,12 +8,14 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_ttm_vram_mgr.h"
 
 /**
  * DOC: Xe device sysfs
@@ -267,6 +269,7 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
 int xe_device_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
+	bool policy;
 	int ret;
 
 	if (xe->d3cold.capable) {
@@ -285,5 +288,9 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
+	policy = xe_configfs_get_bad_page_reservation(to_pci_dev(dev));
+	if (xe->info.platform == XE_CRESCENTISLAND && policy)
+		xe_ttm_vram_sysfs_init(xe);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d5392beff30c..eb55b0f74ef3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -32,6 +32,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_sysfs_init(struct xe_device *xe);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.52.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724D2CCF2C4
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0397810E324;
	Sat, 17 Oct 2026 03:49:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CE510E28A
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792208987; x=1823744987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAAc7V/IFdoFF5KS0qZ0A1/FWdcl7N1akS6SOF2bH5w=;
 b=V9PnYccRyu90opWG7f7NAw1aosd/6deOf2u5RlrZ/9cEi8sz2rRgNMGh
 U0X3FRmxkJxJivPCoF/vI+3kRlb9Y67rE6KVJyy3K5tb8r34NGNG4Vc4o
 F6v47SIyZCJ3g8aX78jNSqhfMDyqCrgSzx4kypkqLNIWZzAm0XrlSNgLT
 GBVGzAtFle0kx6BpHQnBCw3SIOnrpIzIyh7XG8LWIbSoIX0QpqpK4kLxT
 QCtCzjHS2B5xRqDZKa7u+AKIg5wLAmrDSEs7y6/RwyoEfhC7djqAXXCN9
 hno0VhX3uEBDpl45gbHwvjIHnP6UgJJr2PESrxvYZ84Pm0HFHmIOwz3pU g==;
X-CSE-ConnectionGUID: PiVQmMlAQky+4kqoULnlpg==
X-CSE-MsgGUID: cVb7x/iqTmqOPdZQD+h6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1011716"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1011716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:49:47 -0700
X-CSE-ConnectionGUID: iCfgy2+XTdqhiUOMoYPvCg==
X-CSE-MsgGUID: UO65ffByQr2toQRwzFFgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2154347"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2026 20:49:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 3/9] drm/xe/hw_error: Guard csc_hw_error_work() with
 runtime PM
Date: Sat, 17 Oct 2026 09:17:40 +0530
Message-ID: <20261017034842.67054-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017034842.67054-1-raag.jadav@intel.com>
References: <20261017034842.67054-1-raag.jadav@intel.com>
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

xe_device_declare_wedged() callers are expected to hold a runtime PM
reference. Fix it.

Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v10: Guard wedge callers with runtime PM (Sashiko)
---
 drivers/gpu/drm/xe/xe_hw_error.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index f53a6b3055de..ac720710c8e8 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -14,6 +14,7 @@
 #include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_survivability_mode.h"
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
@@ -170,6 +171,7 @@ static void csc_hw_error_work(struct work_struct *work)
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
+	guard(xe_pm_runtime)(xe);
 	xe_survivability_mode_runtime_enable(xe);
 }
 
-- 
2.43.0


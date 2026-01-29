Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F44D61010
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 12:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4687510E244;
	Thu, 29 Jan 2026 12:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjzTCYMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978C810E244
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769688671; x=1801224671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EkhDUek+aNvpt0iTuOceIX1N1/aStdfokvixiTI4neM=;
 b=NjzTCYMFUjHk2GQ+aDi/RzhCImORnOPRBd/wumPmZTi/Iw0Jqon+8f+V
 gHT+7d5n1gN/T5vx6lYc6Yd934q08wI1JJgDRU/YJnkzP7e0U3jSdVkN2
 +dHtLFzfNR+SmE7+V4g9/JDwAOApmSlwvylXPuiGrlUxv1/c3lmL0h8qp
 at3Tq+2Tky22PI3Chy1/CEfshdo06NiW6NSyGMb+EtAqp9shPzHqGPk/P
 e9H/n490Qvg0jRwVwgBDSZaXBFYeNiC0byAJiwuDHl8rhSNitMWAhjN80
 Y1xaDSdRcU8IzXcSa0W7j+WbZqlinxQ3Asg/sKtO7+Sjcu0b55ZTvWvpp w==;
X-CSE-ConnectionGUID: bYYOlPuzTJWZdoc02eRy0Q==
X-CSE-MsgGUID: HwoRWQGgSXy8Oovg8Vltlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70964070"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70964070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:11:11 -0800
X-CSE-ConnectionGUID: x4t1QnH4T1SzlMwuzoTTpA==
X-CSE-MsgGUID: A6beEAiBQBSPTCx0zXiMdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213062144"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:11:07 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v7 5/6] drm/xe/sysctrl: Integrate System Controller into device
Date: Thu, 29 Jan 2026 04:10:46 -0800
Message-ID: <20260129121044.3670780-13-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
References: <20260129121044.3670780-8-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add System Controller to the xe_device structure and wire
up initialization during device probe.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 5 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9cf82bde36c4..2ad7700bfef3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -988,6 +989,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_sysctrl_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 34feef79fa4e..944f909a86ad 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -29,6 +29,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_sriov_vf_types.h"
 #include "xe_validation.h"
 
@@ -370,6 +371,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -636,6 +639,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
-- 
2.43.0


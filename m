Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D6DD3568E
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED1C10E628;
	Wed, 28 Jan 2026 08:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRo+C5MP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953C10E628
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769588103; x=1801124103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhJTSUG5TVOSWIDVou6XzdhsZnXgdyMG2d0cmV5zd4k=;
 b=XRo+C5MPHqc9mgq0Vsa8WTdu+wqbcD/dyimvpHJz3mupWRo/3WitqhHB
 4AKFkUkVXwbCnHY+niJHGIX4fF2zI2H5Gi2zEQADn8qIyYQqJVlFnqmFX
 Ne/SeOZH3MyTDyl8/8q1XMMIuzHZ0dEt/IygHjvWBszoXst8jn0Rue1DD
 YUTCoJm2JFDhoQvtRb8dtOsO33q8celIEkw93l95KbuDrSIuhn2gB6JE9
 RXxaWibpvjhBzgE7fhiVP8oqfIqwA9tSK2l9YkPLUyeaMDE+1l2yGPuE8
 wlLxCpe0Of2qwkN5jpGWvo5zAYkG7qXne0AfGrzf/0712SexdCqqUIMX1 A==;
X-CSE-ConnectionGUID: E3YrR6fyTBStmC0kNvmlkQ==
X-CSE-MsgGUID: oxVbxl1cTWeT6HaNGWynmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643526"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74643526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:28 -0800
X-CSE-ConnectionGUID: ZswNCF7GSdiFv7hG3P1IWA==
X-CSE-MsgGUID: 8mE9/MBLS8+QSwZNT+Eqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231156840"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:14:25 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 5/6] drm/xe/sysctrl: Integrate System Controller into device
Date: Wed, 28 Jan 2026 00:14:07 -0800
Message-ID: <20260128081403.3138456-13-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c       | 5 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f4741cbe4c45..e11339e10433 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -66,6 +66,7 @@
 #include "xe_survivability_mode.h"
 #include "xe_sriov.h"
 #include "xe_svm.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -1027,6 +1028,10 @@ int xe_device_probe(struct xe_device *xe)
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
index a85be9ba175e..6295b2c35d4a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -29,6 +29,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_sysctrl_types.h"
 #include "xe_tile_sriov_vf_types.h"
 #include "xe_validation.h"
 
@@ -340,6 +341,8 @@ struct xe_device {
 		u8 has_soc_remapper_telem:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
+		/** @info.has_sysctrl: Supports System Controller */
+		u8 has_sysctrl:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
@@ -606,6 +609,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @sc: System Controller */
+	struct xe_sysctrl sc;
+
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
-- 
2.43.0


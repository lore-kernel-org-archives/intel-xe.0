Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92824C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422D710F386;
	Fri, 18 Sep 2026 13:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzHLRmMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF62510F399
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789737487; x=1821273487;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cQBStO0wL0j1doAEdI/2ouBdWGwwJE/IqKWgWYv6IT0=;
 b=GzHLRmMfkXtfZxv7/OWXRG6l1VZjgCqIAsYw3q/kPbBwAjhjB8sQWiX3
 i39qLNBVEoQO9LeVxMODfgVlIzXhJKXu/1nmquYLZCSAxqrQn+N47D0mH
 NYt3Xr71LSds30xLyB8pdzaHV2W5OYnaaHqu/y7VafoNZUKQu0/4V360r
 yx/l55bNqS+evwffaveZtlUqNmibN9lhiO/OKq6DyDEIRCWOEFaUPHEt+
 N7o+XXEu/ImwGbwRXBSOrIoAleYnfl+/pLWb/I09+oiXj05mQnBOCG1Ff
 Vqbt+kAD+na4WSXdPMsIWXirBUoEhbuQe5o70pPZWHOmLOsD8sbIicC1c w==;
X-CSE-ConnectionGUID: k7Fr+cQUS/O5iqZUjoV1YA==
X-CSE-MsgGUID: ANt4QFgUS3SRY7LcKqUDFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378251"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89378251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: Mg8Q1ObkQIm0FUR6CXt78Q==
X-CSE-MsgGUID: swdkYMm1RyWdaIElZ+FD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270095336"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v10 10/20] drm/xe/vsec: Support possible hotplug exit
Date: Fri, 18 Sep 2026 06:18:01 -0700
Message-ID: <20260918131751.2408883-32-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
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

DRM has an API that will verify that a device is valid in the hotplug
context.

Verify device is valid before access in the VSEC callback API.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 26c58496fd93..ea60e2f3e917 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -10,6 +10,8 @@
 #include <linux/pci.h>
 #include <linux/types.h>
 
+#include <drm/drm_drv.h>
+
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_mmio.h"
@@ -159,7 +161,12 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
  * @user_offset: a user offset relative to the beginning of the data to read
  * @count: bytes to read
  *
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
+ *
  * Return:
+ * * -ENODEV device is not available (hotplug)
  * * -ENODATA for incorrect power state
  * * -EINVAL for unsupported PMT feature
  * * count   number of bytes read on success
@@ -172,13 +179,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
 
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
@@ -188,11 +199,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		xe_pm_runtime_get(xe);
 		break;
 	case TELEMETRY:
-		if (!xe_pm_runtime_get_if_active(xe))
-			return -ENODATA;
+		if (!xe_pm_runtime_get_if_active(xe)) {
+			ret = -ENODATA;
+			goto dev_exit;
+		}
 		break;
 	case WATCHER:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto dev_exit;
 	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
@@ -204,7 +218,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	xe_pm_runtime_put(xe);
 
-	return count;
+dev_exit:
+	drm_dev_exit(idx);
+
+	return ret == 0 ? count : ret;
 }
 
 static struct pmt_callbacks xe_pmt_cb = {
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFF1C79F8C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2591B10FAF2;
	Fri,  4 Sep 2026 18:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mudu78Kh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C29910FABD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788546309; x=1820082309;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y05JvbiBoc6hnW2yndM8nHg4xST78/jI1JnLeTfb6qQ=;
 b=Mudu78KhIke88sl6xIjLhdkt0eUbT2HzCMMGOaDdllylU8rRZd9wVE7R
 BUdtk29bhtXFLQRhXKN7lmkAaF015NF3supw8aoacL7fBZ8qvbLYwqqgZ
 To7z90nx5Q5IU7UEqZlQhiOvXsyXcfoGQcohKZS+yqGPf6F41qCJHsjjg
 Fl/Wcu76ASsnmY3tlLdzP3pZnqBgrcN38qCDfC31w+GyMyk6fEOxz5RJ0
 NOWsuv/DH5HeRFmQwc288+duPO66vtYVnhL7Oorn0VTw+09nCGlGtBVE3
 UnHiWOwpxq4k+qocNkfCc+sgi72XUF5G12jezIQaRx5NeZh79YBy5fIpq Q==;
X-CSE-ConnectionGUID: JsFEdpsIQ52BXsxCI90s0w==
X-CSE-MsgGUID: yUyYZ/hIRbCNJRulplO6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932230"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="88932230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:25:09 -0700
X-CSE-ConnectionGUID: G0URZvaTRJmJqeb+ebQadQ==
X-CSE-MsgGUID: AaNT3R21RPaD+rSGF0mbaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="294992487"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:25:09 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v6 10/18] drm/xe/vsec: Support possible hotplug exit
Date: Fri,  4 Sep 2026 11:25:00 -0700
Message-ID: <20260904182451.1164868-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
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

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index c0252f5b508f..3bea89f2a5c5 100644
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
  * * -EINVAL for VF and PMT WATCHER requests
  * * count   number of bytes read on success
  */
@@ -171,14 +178,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
 
-	if (IS_SRIOV_VF(xe))
-		return -EINVAL;
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (IS_SRIOV_VF(xe)) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
 
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
@@ -188,11 +201,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
 
 	mutex_lock(&xe->pmt.lock);
@@ -206,7 +222,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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


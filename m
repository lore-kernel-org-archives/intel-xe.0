Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604ACC624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76010EECF;
	Tue,  1 Sep 2026 19:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hn6LICkG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C3910EECE
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788290879; x=1819826879;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bk/D2mfyyuMnySQ0PMLS0AQgmbI/bQcqnPRgb2w6IS0=;
 b=Hn6LICkGrvn/a5Ba8kgQVlYkcufC1+wTUCyWP3VS+lakI2fEE3v7tFbU
 2R+T3QTUuBz5xCThf5JIKgB9wygrWVGxjHJ257Glm/Q6RFGSSzuo4D8Yf
 lccvnc6A6PwE6lecwH8ngskAOJueI2h2xhKBbNoQfVAyk/cIW1EO5vT/5
 5pxcYwoijSj/ffNEViueZ8q39g/je1hwaSUCUUqbEuPzWB8A+ToWhctXV
 1OfEVJLYCk6qTKZW4tWWH9JJH3uwoNUK7S+iGHBbx//isiFd4PKkX8m82
 0HcO4cO6CQ3a0UYR7AD0SHghZGWXuCfTiJdN73wQ0BZUKJ9snZDA0NJFd A==;
X-CSE-ConnectionGUID: SUY5Fq/kR3qUKIqGjB4+rQ==
X-CSE-MsgGUID: kDtYP5Q/TYeSoVnzp+7DkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762516"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="88762516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 12:27:59 -0700
X-CSE-ConnectionGUID: c4VRWyyRR+Wfk5Y0Y3nx3w==
X-CSE-MsgGUID: bNj1hJDQT5KVua9Onqsbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269776759"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 12:27:59 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v4 10/18] drm/xe/vsec: Support possible hotplug exit
Date: Tue,  1 Sep 2026 12:27:45 -0700
Message-ID: <20260901192736.626777-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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

DRM has an API that will verify that a device is valid in
the hotplug context.

Verify device is valid before access in the VSEC callback
API.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 468a221378fa..c6299629dc27 100644
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
@@ -140,6 +142,11 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+/*
+ * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
+ * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
+ * verified (drm_dev_enter()).
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
@@ -148,14 +155,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
 
@@ -165,11 +178,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
@@ -183,7 +199,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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


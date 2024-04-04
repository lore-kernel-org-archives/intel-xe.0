Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF35CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 17:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413211338A;
	Thu,  4 Apr 2024 17:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtWol9gr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15368113387
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712252303; x=1743788303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6YMZHraWthIDyRV/FOjqkk0XcNAkqO+RyMUcD1obR5E=;
 b=HtWol9grynEx7W6ndeSO29BJdeOG/Y/ISNBlnF3wMR94qA0qCVEqpHqi
 alFSKAqZ0y/e3QXbPwaFYZFSRKmC3D21LpOPCu4gwXk1X6SvyNamLgo4u
 CuNcp6vfrXiAaSGC3ol53SpdOPtv4H2A4DcCSSeiGk+CFaTj4/v07paEz
 rBkFD7PvOb23q1fT/sztMgHiDogGrP6DoAD97jd+1CdB61W8YowhR/wHK
 +1kDg6bzWAkasu2oEiQpM7l4iineIkZECJ6KWcjkwg7vqIq8pqVp8vdCz
 6k9//sT/XcIbtC5J/oq/3lWSKCb2CllGPgrVRuYJBmE9ZNMkOmVAxmDtv g==;
X-CSE-ConnectionGUID: nwtgU3WESDqcPVd0GGCLPw==
X-CSE-MsgGUID: 2pCuYBvSQPafrfvgsbhtEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8133219"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8133219"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:38:23 -0700
X-CSE-ConnectionGUID: QKMnSTwYQOm6IxUg+rgtvQ==
X-CSE-MsgGUID: FRkhTYrfQryabqBP7RfeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23512172"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:38:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/vf: Mark supported firmwares as preloaded
Date: Thu,  4 Apr 2024 19:38:14 +0200
Message-Id: <20240404173814.715-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

On current platforms supported firmwares, like GuC and HuC, must
be loaded by the PF driver.  Mark those firmwares as 'preloaded'
so we will skip fetching and loading them on the VF drivers but
still correctly report them as 'running'.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 11 +++++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h       |  8 ++++++--
 drivers/gpu/drm/xe/xe_uc_fw_types.h |  3 ++-
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6adca3a0427c..f27e96c47baa 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -17,6 +17,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_sriov.h"
 #include "xe_uc_fw.h"
 
 /*
@@ -652,7 +653,17 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	xe_assert(xe, !uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
+
+	if (IS_SRIOV_VF(xe)) {
+		/* VF will support only firmwares that driver can autoselect */
+		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
+				       XE_UC_FIRMWARE_PRELOADED :
+				       XE_UC_FIRMWARE_NOT_SUPPORTED);
+		return 0;
+	}
+
 	uc_fw_override(uc_fw);
+
 	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
 			       XE_UC_FIRMWARE_SELECTED :
 			       XE_UC_FIRMWARE_NOT_SUPPORTED);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index 85c20795d1f8..35078038797e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -59,6 +59,8 @@ const char *xe_uc_fw_status_repr(enum xe_uc_fw_status status)
 		return "TRANSFERRED";
 	case XE_UC_FIRMWARE_RUNNING:
 		return "RUNNING";
+	case XE_UC_FIRMWARE_PRELOADED:
+		return "PRELOADED";
 	}
 	return "<invalid>";
 }
@@ -85,6 +87,7 @@ static inline int xe_uc_fw_status_to_error(enum xe_uc_fw_status status)
 	case XE_UC_FIRMWARE_LOADABLE:
 	case XE_UC_FIRMWARE_TRANSFERRED:
 	case XE_UC_FIRMWARE_RUNNING:
+	case XE_UC_FIRMWARE_PRELOADED:
 		return 0;
 	}
 	return -EINVAL;
@@ -134,7 +137,8 @@ static inline bool xe_uc_fw_is_available(struct xe_uc_fw *uc_fw)
 
 static inline bool xe_uc_fw_is_loadable(struct xe_uc_fw *uc_fw)
 {
-	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE;
+	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE &&
+		__xe_uc_fw_status(uc_fw) != XE_UC_FIRMWARE_PRELOADED;
 }
 
 static inline bool xe_uc_fw_is_loaded(struct xe_uc_fw *uc_fw)
@@ -144,7 +148,7 @@ static inline bool xe_uc_fw_is_loaded(struct xe_uc_fw *uc_fw)
 
 static inline bool xe_uc_fw_is_running(struct xe_uc_fw *uc_fw)
 {
-	return __xe_uc_fw_status(uc_fw) == XE_UC_FIRMWARE_RUNNING;
+	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_RUNNING;
 }
 
 static inline bool xe_uc_fw_is_overridden(const struct xe_uc_fw *uc_fw)
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index bc800b696866..0d8caa0e7354 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -50,7 +50,8 @@ enum xe_uc_fw_status {
 	XE_UC_FIRMWARE_LOADABLE, /* all fw-required objects are ready */
 	XE_UC_FIRMWARE_LOAD_FAIL, /* failed to xfer or init/auth the fw */
 	XE_UC_FIRMWARE_TRANSFERRED, /* dma xfer done */
-	XE_UC_FIRMWARE_RUNNING /* init/auth done */
+	XE_UC_FIRMWARE_RUNNING, /* init/auth done */
+	XE_UC_FIRMWARE_PRELOADED, /* preloaded by the PF driver */
 };
 
 enum xe_uc_fw_type {
-- 
2.43.0


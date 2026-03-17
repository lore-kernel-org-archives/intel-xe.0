Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC123FF6E87
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8D10E42F;
	Tue, 17 Mar 2026 22:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oln3KduX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949B510E42F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773784919; x=1805320919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u7wdMTzapREKuYNSlcKic4878qqw7bPdeFaal8mWTEU=;
 b=Oln3KduX0+YgMJr5huIIHmMsGo+zs9xOlwfYJajYTVaVit5YKHm/Vibi
 gMV16gOlHVpVTIlcrvcsF2i5ge/GALATCfjiRS6MVZKrtwiYWv51V/QlJ
 aZ1qMa+yKrz4Ftk+Pp/JmCP+ituQYGRm/TAvun4e5J9vGcJjiDxm1gXrR
 hwjyTn+oStlbvSDGb7qau5zzVEBsqzXhmfiR74qV+eOtluUa27e4BVb8T
 xlhM0fWag9JjuVxnqIXahz2WwUgOheEdFZ600OSTjnsGhAuqLVhWWMVAW
 ol8uPV3/DKQCgnxwOtNgmShl/2lLIz+JcFDhW+6wfk36TuO7bgZINMA03 Q==;
X-CSE-ConnectionGUID: 1yaqeayqQ3qYdNVolyl9aw==
X-CSE-MsgGUID: /QmAoEkPTjildUpKEb28ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74011928"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74011928"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:01:59 -0700
X-CSE-ConnectionGUID: F6H4sUI/TaayLqmpWBNkTw==
X-CSE-MsgGUID: ioP3pJDXQ3mBsGwKUSHnjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="245427929"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 15:01:57 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH 5/5] drm/xe: Normalize double-underscore include guards to
 single-underscore
Date: Tue, 17 Mar 2026 21:57:21 +0000
Message-ID: <20260317215732.2208976-12-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317215732.2208976-7-shuicheng.lin@intel.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
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

Six headers use __XE_<NAME>_H__ (double-underscore prefix and suffix)
as their include guards. Normalize them to the single-underscore
_XE_<NAME>_H_ convention used by the rest of the xe codebase.

Files fixed:
  - xe_eu_stall.h:     __XE_EU_STALL_H__     -> _XE_EU_STALL_H_
  - xe_nvm.h:          __XE_NVM_H__          -> _XE_NVM_H_
  - xe_pxp.h:          __XE_PXP_H__          -> _XE_PXP_H_
  - xe_pxp_debugfs.h:  __XE_PXP_DEBUGFS_H__ -> _XE_PXP_DEBUGFS_H_
  - xe_pxp_submit.h:   __XE_PXP_SUBMIT_H__  -> _XE_PXP_SUBMIT_H_
  - xe_pxp_types.h:    __XE_PXP_TYPES_H__   -> _XE_PXP_TYPES_H_

No functional change.

Suggested-by: Nitin Gote <nitin.r.gote@intel.com>
Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.h    | 4 ++--
 drivers/gpu/drm/xe/xe_nvm.h         | 4 ++--
 drivers/gpu/drm/xe/xe_pxp.h         | 6 +++---
 drivers/gpu/drm/xe/xe_pxp_debugfs.h | 6 +++---
 drivers/gpu/drm/xe/xe_pxp_submit.h  | 6 +++---
 drivers/gpu/drm/xe/xe_pxp_types.h   | 6 +++---
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index d1c76e503799..842bef9f6872 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -3,8 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
-#ifndef __XE_EU_STALL_H__
-#define __XE_EU_STALL_H__
+#ifndef _XE_EU_STALL_H_
+#define _XE_EU_STALL_H_
 
 #include "xe_gt_types.h"
 #include "xe_sriov.h"
diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
index fd3467ad35a4..b14722103f81 100644
--- a/drivers/gpu/drm/xe/xe_nvm.h
+++ b/drivers/gpu/drm/xe/xe_nvm.h
@@ -3,8 +3,8 @@
  * Copyright(c) 2019-2025 Intel Corporation. All rights reserved.
  */
 
-#ifndef __XE_NVM_H__
-#define __XE_NVM_H__
+#ifndef _XE_NVM_H_
+#define _XE_NVM_H_
 
 struct xe_device;
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 71a23280b900..4fb6e0afffd2 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -3,8 +3,8 @@
  * Copyright(c) 2024, Intel Corporation. All rights reserved.
  */
 
-#ifndef __XE_PXP_H__
-#define __XE_PXP_H__
+#ifndef _XE_PXP_H_
+#define _XE_PXP_H_
 
 #include <linux/types.h>
 
@@ -32,4 +32,4 @@ int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo);
 int xe_pxp_bo_key_check(struct xe_pxp *pxp, struct xe_bo *bo);
 int xe_pxp_obj_key_check(struct drm_gem_object *obj);
 
-#endif /* __XE_PXP_H__ */
+#endif /* _XE_PXP_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.h b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
index 988466aad50b..2997de0c90b2 100644
--- a/drivers/gpu/drm/xe/xe_pxp_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
@@ -3,11 +3,11 @@
  * Copyright © 2024 Intel Corporation
  */
 
-#ifndef __XE_PXP_DEBUGFS_H__
-#define __XE_PXP_DEBUGFS_H__
+#ifndef _XE_PXP_DEBUGFS_H_
+#define _XE_PXP_DEBUGFS_H_
 
 struct xe_pxp;
 
 void xe_pxp_debugfs_register(struct xe_pxp *pxp);
 
-#endif /* __XE_PXP_DEBUGFS_H__ */
+#endif /* _XE_PXP_DEBUGFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index c9efda02f4b0..dbbbe6b92bb2 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -3,8 +3,8 @@
  * Copyright(c) 2024, Intel Corporation. All rights reserved.
  */
 
-#ifndef __XE_PXP_SUBMIT_H__
-#define __XE_PXP_SUBMIT_H__
+#ifndef _XE_PXP_SUBMIT_H_
+#define _XE_PXP_SUBMIT_H_
 
 #include <linux/types.h>
 
@@ -19,4 +19,4 @@ int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
 int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
 				       u32 id);
 
-#endif /* __XE_PXP_SUBMIT_H__ */
+#endif /* _XE_PXP_SUBMIT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index f9a8c323b040..42cea41b21c4 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -3,8 +3,8 @@
  * Copyright(c) 2024, Intel Corporation. All rights reserved.
  */
 
-#ifndef __XE_PXP_TYPES_H__
-#define __XE_PXP_TYPES_H__
+#ifndef _XE_PXP_TYPES_H_
+#define _XE_PXP_TYPES_H_
 
 #include <linux/completion.h>
 #include <linux/iosys-map.h>
@@ -132,4 +132,4 @@ struct xe_pxp {
 	u32 last_suspend_key_instance;
 };
 
-#endif /* __XE_PXP_TYPES_H__ */
+#endif /* _XE_PXP_TYPES_H_ */
-- 
2.43.0


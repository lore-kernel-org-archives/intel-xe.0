Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E572AC25B75
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 11:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578C10F4F4;
	Tue,  7 May 2024 11:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0fjAL/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718BF10F4F4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715080211; x=1746616211;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VpriJwu3rJv+rQD2YZvcyq+veovuOU12rLhUEYiek/o=;
 b=A0fjAL/LQnR5VNWpscQ2NRJ2whvniMsBbRucDqrU6/ivmsioHatV6Mhe
 6V1TTopeceMe4PNg4mAIzqOt3PbJ0KFSUeX+p2qwKCgXd4P6OSCL3auxQ
 AHYA1d6l4fIgZDBMMtlPCqjaSb0ovPEbBFl9rEWCIrHyIFNmPJvj1aY25
 FuJaFhPrKFGVZRC8D37EoUtNaXs35+axO5WhBJNtb8D7z+OCNn57xTVbx
 c/fyZUp2bPqc7lHuGDF9Lo0GZlffBAeu0B806utiGsyqQHdvsmUFLywDx
 JmQYT+ja8Sde+c5HlOOgtrCkqJTmHuTa3R/vURnBAIBsU4YqoGbimyB1U g==;
X-CSE-ConnectionGUID: j9d6DVc8RU6vQSgQgcnVdQ==
X-CSE-MsgGUID: OwkiGDYrSpOx2q9aqM7sRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21534537"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="21534537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:11 -0700
X-CSE-ConnectionGUID: SoY3d2pqTHWJQ63RJdPfkA==
X-CSE-MsgGUID: 4rtcUuCeSxSalRn2sS++WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="33053730"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Fix xe_device.h
Date: Tue,  7 May 2024 13:09:59 +0200
Message-Id: <20240507110959.2747-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240507110959.2747-1-michal.wajdeczko@intel.com>
References: <20240507110959.2747-1-michal.wajdeczko@intel.com>
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

Some explicit includes are needed only from the xe_device.c.
And there is no need for redundant forward declarations.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 drivers/gpu/drm/xe/xe_device.h | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 05c28314b748..b63d98872a41 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -17,6 +17,7 @@
 #include <drm/xe_drm.h>
 
 #include "display/xe_display.h"
+#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
@@ -27,6 +28,7 @@
 #include "xe_drv.h"
 #include "xe_exec.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0940ade6a352..bb07f5669dbb 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -6,15 +6,9 @@
 #ifndef _XE_DEVICE_H_
 #define _XE_DEVICE_H_
 
-struct xe_exec_queue;
-struct xe_file;
-
 #include <drm/drm_util.h>
 
-#include "regs/xe_gpu_commands.h"
 #include "xe_device_types.h"
-#include "xe_force_wake.h"
-#include "xe_macros.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
-- 
2.43.0


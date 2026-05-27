Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2893CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478CB10E780;
	Wed, 27 May 2026 11:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDsqig/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED9F10E780
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779881180; x=1811417180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T35H+PXJcAzUBK0zgY7bN9uZ8XvvdTzhUOePvpdCm4Q=;
 b=bDsqig/X8K8mYx+8JT00WFlh5mZvuLa1l4Lqt13bvBO6QSroOa4ltOa7
 z5UIHhTVvunAD+Bt+dfeJJMwaPuW2du+dxw6/9ZNBvdlGUCIaDzuTZfHT
 Cnaaizwop8FV7eRX2caPbS9FtGOPgDo1RdRZEQiDikFW7WF5v+4KXL0cf
 fqlz5nVSjRnz0noQF1hsS5S9jLbAbMDYCU+k1wTMKWIy+bPV0INc60i/3
 lTIE56Cer4fw3xBmFVrjbEbmyTQEfB8TNHv2ybprAP8VV+mXm8kI5eCNc
 6oNV4S0Sc3aEibMz1H/m2ptVhnehNwtxNypVLgtku6tQE3JExqIc05QoV Q==;
X-CSE-ConnectionGUID: BWBkna1NRaC4/+zkkRDEjw==
X-CSE-MsgGUID: BmI5W0lXTi62GhbO8tgFfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80819588"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80819588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:26:19 -0700
X-CSE-ConnectionGUID: B7+dJA6tQqCSsxaAMs2WYw==
X-CSE-MsgGUID: 5Upl39XJS1uEpnuq8740xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="241166985"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:26:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe: Move xe_uc_fw_abi.h to abi/
Date: Wed, 27 May 2026 13:26:07 +0200
Message-ID: <20260527112608.22448-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We aim to keep all pure ABI headers in the abi/ folder, but
somehow we missed this file.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: fix documentation link (Sashiko)
---
 Documentation/gpu/xe/xe_firmware.rst                   | 4 ++--
 drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} | 4 ++--
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h             | 3 ++-
 drivers/gpu/drm/xe/xe_uc_fw.h                          | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} (99%)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index 9c15a300bc62..d3030d1c9a84 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -7,10 +7,10 @@ Firmware
 Firmware Layout
 ===============
 
-.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
+.. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
    :doc: CSS-based Firmware Layout
 
-.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
+.. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
    :doc: GSC-based Firmware Layout
 
 Write Once Protected Content Memory (WOPCM) Layout
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
similarity index 99%
rename from drivers/gpu/drm/xe/xe_uc_fw_abi.h
rename to drivers/gpu/drm/xe/abi/uc_fw_abi.h
index 74b888904fdc..198e949660e0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_UC_FW_ABI_H_
-#define _XE_UC_FW_ABI_H_
+#ifndef _ABI_UC_FW_ABI_H
+#define _ABI_UC_FW_ABI_H
 
 #include <linux/build_bug.h>
 #include <linux/types.h>
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 7fdb24e810b3..ee5efe60774e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,7 +10,8 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
-#include "xe_uc_fw_abi.h"
+
+#include "abi/uc_fw_abi.h"
 
 #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index bb281b72a677..f2d3a3e7208b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -8,8 +8,8 @@
 
 #include <linux/errno.h>
 
+#include "abi/uc_fw_abi.h"
 #include "xe_macros.h"
-#include "xe_uc_fw_abi.h"
 #include "xe_uc_fw_types.h"
 
 struct drm_printer;
-- 
2.47.1


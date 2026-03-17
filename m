Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A297FFF6E89
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6306510E1C6;
	Tue, 17 Mar 2026 22:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkRlGlSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EAD10E305
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773784914; x=1805320914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/oZ6ijdmy5ub/Q0pjIssnyGzMbsJVVb9D+grPBOjCoY=;
 b=ZkRlGlSjGBTG4J6YbU+KlPP8iMTt+30qtInA8IlxYEkPUbwwTf4XDqvH
 gVevDuSqIvVRbxjs1FhF7qFJU9VE/Jll99h7AWE27KMiO914k4rDgPMPz
 wGRKAYMNJLbVwANJMeiPkvSk3GDAN6TJxVOtr1uX/v6+VRCIyDjb8Up9P
 eceeGl7KDnd51+mZjR0hWN/LN4JDmx5fVlIwVZdDphl56cDWbM6jSFkTN
 ++fmCfhacicB2VlamPsPQ4ExZaUPjGe5+Lx4jqkkRS9GjWkgxIOX9mC49
 +E3HDW9RA4BGg9ZiMUtx++1n7DiWsREgKeEnRJkYixjvfaDL51LDcGceX A==;
X-CSE-ConnectionGUID: gUnz2n5iQRiujjoF91+xIg==
X-CSE-MsgGUID: g8aWE07dS2mJVF5BCJXkSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74011924"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74011924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:01:54 -0700
X-CSE-ConnectionGUID: o5cdynC7TlS7CLGoNJTIsQ==
X-CSE-MsgGUID: EE/pLxNjTPCR/ypgfSQJaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="245427918"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 15:01:53 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH 3/5] drm/xe: Add missing trailing underscore to include guards
Date: Tue, 17 Mar 2026 21:57:19 +0000
Message-ID: <20260317215732.2208976-10-shuicheng.lin@intel.com>
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

Four headers use _XE_<NAME>_H (no trailing underscore) as their include
guard. Normalize them to _XE_<NAME>_H_ to match the dominant convention
used across the xe codebase.

Files fixed:
  - xe_guc_capture.h:       _XE_GUC_CAPTURE_H       -> _XE_GUC_CAPTURE_H_
  - xe_guc_capture_types.h: _XE_GUC_CAPTURE_TYPES_H -> _XE_GUC_CAPTURE_TYPES_H_
  - xe_guc_fwif.h:          _XE_GUC_FWIF_H          -> _XE_GUC_FWIF_H_
  - xe_uc_fw_abi.h:         _XE_UC_FW_ABI_H         -> _XE_UC_FW_ABI_H_

No functional change.

Suggested-by: Nitin Gote <nitin.r.gote@intel.com>
Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.h       | 4 ++--
 drivers/gpu/drm/xe/xe_guc_capture_types.h | 4 ++--
 drivers/gpu/drm/xe/xe_guc_fwif.h          | 4 ++--
 drivers/gpu/drm/xe/xe_uc_fw_abi.h         | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 34d6fdc64f56..dca97d52b192 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -3,8 +3,8 @@
  * Copyright © 2021-2024 Intel Corporation
  */
 
-#ifndef _XE_GUC_CAPTURE_H
-#define _XE_GUC_CAPTURE_H
+#ifndef _XE_GUC_CAPTURE_H_
+#define _XE_GUC_CAPTURE_H_
 
 #include <linux/types.h>
 #include "abi/guc_capture_abi.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 04e9bbe3e20b..058a3f2eadce 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2021-2024 Intel Corporation
  */
 
-#ifndef _XE_GUC_CAPTURE_TYPES_H
-#define _XE_GUC_CAPTURE_TYPES_H
+#ifndef _XE_GUC_CAPTURE_TYPES_H_
+#define _XE_GUC_CAPTURE_TYPES_H_
 
 #include <linux/types.h>
 #include "regs/xe_reg_defs.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index bb8f71d38611..72a4b6014465 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_GUC_FWIF_H
-#define _XE_GUC_FWIF_H
+#ifndef _XE_GUC_FWIF_H_
+#define _XE_GUC_FWIF_H_
 
 #include <linux/bits.h>
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 3c9a63d13032..74b888904fdc 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_UC_FW_ABI_H
-#define _XE_UC_FW_ABI_H
+#ifndef _XE_UC_FW_ABI_H_
+#define _XE_UC_FW_ABI_H_
 
 #include <linux/build_bug.h>
 #include <linux/types.h>
-- 
2.43.0


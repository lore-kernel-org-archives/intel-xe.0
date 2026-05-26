Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A1FCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 20:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4465E10E1FD;
	Tue, 26 May 2026 20:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gL4IjbYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5E410E1FD
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 20:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779826954; x=1811362954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAiKxoZlZLu07RLQTYVizSb22NeeOEvRmz5fEcO+kwc=;
 b=gL4IjbYzzmn6JjjmLdO3LUpJudMLoBASdDdL6iz2ac8W2+qZG7M8Mzdt
 QtAdjegzQ4OM18TkCiY9GN8sBfKSJMoY5s8OjyZnGlfrBwruH2hUTDlQM
 rIQo6kD8P38Ko4aTkT7YEOho0askCdyfeiNTzoyrL23HlOvJGDz8w6VON
 E6ZYM9RlbazaWPZdqxBVsN3Ag/H8W2ev0OEGeQVArFVsI43STpX5ROKKe
 ZfsTpAugEi1g8HQyK1UAJoJX6Wh3jfAd79Kn2w7JvTfhKCxMyL4uKvqFK
 c6s5PEiDYWEYDeDj1K//JSBSrRVTSee6unq3vlf5bTWHD4Nx8awDu1plR g==;
X-CSE-ConnectionGUID: 3BrK4RHXQpuFIudt5s1WeA==
X-CSE-MsgGUID: jzquv3gLQNyB+FfsZKiucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98075830"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="98075830"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 13:22:33 -0700
X-CSE-ConnectionGUID: YLCSVUjRQyO/mI48YZLTdw==
X-CSE-MsgGUID: Y+kHT4JhQ6i00wRMsTvBMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265637947"
Received: from adobrzyn-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 13:22:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Move xe_uc_fw_abi.h to abi/
Date: Tue, 26 May 2026 22:22:07 +0200
Message-ID: <20260526202209.20813-1-michal.wajdeczko@intel.com>
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
 drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} | 4 ++--
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h             | 3 ++-
 drivers/gpu/drm/xe/xe_uc_fw.h                          | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)
 rename drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} (99%)

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


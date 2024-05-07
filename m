Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20345C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 11:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27E510F621;
	Tue,  7 May 2024 11:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBeTOI5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990210F4F4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715080210; x=1746616210;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7nVZPuPlgf1A+LmvlkMgLQP+aY6wl/bMWqq3QYydNGU=;
 b=FBeTOI5tu/WVv7289cQw0LvCeA0P/rlcs61FsuESQYKp4BpAJR+rZ8Vq
 s7uZIz4BQJeCI1J/awhlVTlx8C5o8ez6atwfwFEsPiKrfwax5WJFIVEpn
 qJ9T1poUB7olPqVYw+MbTQhTHgyzuZIPcXS71y2xdt4LfC4chB4fkv7cY
 fs2WiACJEL+/h5FRUbF2b3cShj4gKqsEsP4pbKgAfPdsPT0ccU33pLCWW
 T6YumzQJCzJg4u7pMRFb+1Uv8G/aKcJIjRjgCQpw+zm9c8/kWS8vjV26P
 /2HmBkYRfyvL0vJW4kC1hw9sMHcqohDYXxTljT/BCyTTgIjvYDO9iuMcS w==;
X-CSE-ConnectionGUID: Gir6QcO7QUCMonyZZALCwQ==
X-CSE-MsgGUID: XobMbqEkRmOnJzrakbajug==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21534535"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="21534535"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:10 -0700
X-CSE-ConnectionGUID: lmqx2pXOSy+4sFQ+6A/Zrw==
X-CSE-MsgGUID: 9VkWpop3SZ25dUIene2n+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="33053723"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Don't rely on xe_force_wake.h to be included
 elsewhere
Date: Tue,  7 May 2024 13:09:58 +0200
Message-Id: <20240507110959.2747-3-michal.wajdeczko@intel.com>
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

While xe_force_wake.h is now included from the xe_device.h, we
want to drop that include as we don't need it there. Explicitly
include xe_force_wake.h where needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    | 1 +
 drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
 drivers/gpu/drm/xe/xe_gsc.c                 | 1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c           | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c             | 1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 +
 drivers/gpu/drm/xe/xe_guc_pc.c              | 1 +
 drivers/gpu/drm/xe/xe_mmio.c                | 1 +
 drivers/gpu/drm/xe/xe_mocs.c                | 1 +
 drivers/gpu/drm/xe/xe_pat.c                 | 1 +
 drivers/gpu/drm/xe/xe_query.c               | 1 +
 11 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index d46f87a039f2..eb67ecf08db2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -13,6 +13,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_force_wake.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 2c060a0d6251..1011e5d281fa 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 60202b903687..8cc6420a9e7f 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 1b908d238bd1..6d6d1068cf23 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -15,6 +15,7 @@
 #include "abi/gsc_proxy_commands_abi.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_bo.h"
+#include "xe_force_wake.h"
 #include "xe_gsc.h"
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 8fc0f3f6ecc5..a4f6f0a96d05 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_force_wake.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index c3d015a7ac33..105797776a6c 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -7,6 +7,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8fc757900ed1..d10aab29651e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -15,6 +15,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_sysfs.h"
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 2b18e8149ec3..05edab0e085d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,6 +15,7 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 4780708e5fae..f04754ad911b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -9,6 +9,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index d5b516f115ad..4ee32ee1cc88 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -10,6 +10,7 @@
 #include "regs/xe_reg_defs.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index df407d73e5f5..29f847debb5c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -16,6 +16,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc_hwconfig.h"
-- 
2.43.0


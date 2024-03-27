Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCFDC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 18:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0632F10F978;
	Wed, 27 Mar 2024 18:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGIyD2QO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D49E10F8F1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711564082; x=1743100082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2/FQJpUDFJicuywLcAjyRpQPo0ZFyPefQoTHEZpz9J8=;
 b=jGIyD2QOUgKp7v97V7xAsY52w7PUJne7c2ziAyN9dEJoL7/v7x1CBvSv
 +iAYfZHA8/xpzJejBSqkNFjy4lJ9euHlOB5oajA7leUSvJv6gTvPdmltc
 7iqCBkN18YUxemQ/w24KNICTwV9OH5ajO3eHClq0DJNuth4aucKgL4s1u
 Hq+S4Ir38wv5E/oTLZHuHF4bLCYsoXq2Vup3WOu2l/RK2yTuAeJ4u5z98
 4Txm/aJwBd+mbHe0h83uB+uR34OomN6ZF7YZKmTIZ1V87W2FF3lDSBiGr
 ckT2Qb4ajfS2Z9Yp4qE8x644DxY9QkaXc3vILABCiT1aEwfIu+UDyQOQs w==;
X-CSE-ConnectionGUID: DfW2lJp4S0y8kLJYmcW7XA==
X-CSE-MsgGUID: trf6QGw1R36U1skwGHBw6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18074627"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18074627"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20917440"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:28:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Add proper detection of the SR-IOV VF mode
Date: Wed, 27 Mar 2024 19:27:40 +0100
Message-Id: <20240327182740.407-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240327182740.407-1-michal.wajdeczko@intel.com>
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
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

SR-IOV VF mode detection is based on testing VF capability bit on
the register that is accessible from both the PF and enabled VFs.

Bspec: 49904, 53227
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_sriov.c           | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
index 58a4e0fad1e1..617ddb84b7fa 100644
--- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
@@ -14,4 +14,7 @@
 #define   LMEM_EN			REG_BIT(31)
 #define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
 
+#define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
+#define   VF_CAP			REG_BIT(0)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 2bcef998c8a9..3e103edf7174 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -5,7 +5,11 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_sriov_regs.h"
+
 #include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 
 /**
@@ -28,6 +32,13 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
 	}
 }
 
+static bool test_is_vf(struct xe_device *xe)
+{
+	u32 value = xe_mmio_read32(xe_root_mmio_gt(xe), VF_CAP_REG);
+
+	return value & VF_CAP;
+}
+
 /**
  * xe_sriov_probe_early - Probe a SR-IOV mode.
  * @xe: the &xe_device to probe mode on
@@ -44,8 +55,10 @@ void xe_sriov_probe_early(struct xe_device *xe)
 	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
 	bool has_sriov = xe->info.has_sriov;
 
-	/* TODO: replace with proper mode detection */
-	xe_assert(xe, !has_sriov);
+	if (has_sriov) {
+		if (test_is_vf(xe))
+			mode = XE_SRIOV_MODE_VF;
+	}
 
 	xe_assert(xe, !xe->sriov.__mode);
 	xe->sriov.__mode = mode;
-- 
2.43.0


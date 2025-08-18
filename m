Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D5CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 11:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E25E10E431;
	Mon, 18 Aug 2025 11:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flmJkdKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE62710E431
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755517395; x=1787053395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CnC16eWIeUbkzXzKz+gzYxkpHan/PsYNNL5jkg/QIzw=;
 b=flmJkdKSM17dPTdURQQcDEZuuh0s2cUqo8CUqarPyJuvcn+c1Ci8975J
 1Z7gbfsPP1Xvv47/uq5L7UJBHSkcVVhYb/w/00yHM9blGBzdSHEMSkSSG
 PXzAwK7cfpEFg4tIhpQmhaqsk70Fn7IKVgC2sp//Z71H9XHGxhnuuSbDa
 zMff0d6qqAQctFSWvYkZrVN+z0URWPvdPTuycN5ztiBkburjqIbSAZrC6
 RMUoVVwUGzYJTPUJZJHRI13uEY3irDdLhP0jnGtebs/LqamvJ+Tt8oI53
 E+YtcoirYer185uzUsIp7ouD3H+7+SHkBEr4jkcZrOW/i1IZsbj2zAzi4 A==;
X-CSE-ConnectionGUID: Pj0ErAfCQYK8pyQSiul/Zw==
X-CSE-MsgGUID: 6Yw3PPVARquN51PWkQdvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57666185"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57666185"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 04:43:15 -0700
X-CSE-ConnectionGUID: jiVCUOfGSqGjrbiXFrVvWQ==
X-CSE-MsgGUID: eXxyKvOxQAijOdcKDt5J9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167466153"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2025 04:43:13 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
Date: Mon, 18 Aug 2025 17:30:05 +0530
Message-ID: <20250818120005.24363-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

CCS save/restore is supported starting with GuC compatibility version
1.23.0. Gate the feature on the GuC firmware version and keep it disabled
on older or unsupported versions.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.c              | 1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 87911fb4eea7..27f70b5eb4c0 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -11,6 +11,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_guc.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 93435a6f4cb6..928266580221 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -17,8 +17,10 @@
 
 #define IS_VF_CCS_INIT_NEEDED(xe) ({\
 		struct xe_device *___xe = (xe); \
+		struct xe_guc *___guc = &___xe->tiles[0].primary_gt->uc.guc; \
 		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
-		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
+		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20 && \
+		GUC_SUBMIT_VER(___guc) >= MAKE_GUC_VER(1, 23, 0); \
 		})
 
 enum xe_sriov_vf_ccs_rw_ctxs {
-- 
2.43.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B201FD68B30
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D18610E803;
	Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVaGnF+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF09F10E801
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731597778; x=1763133778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fr+ss4+m9Y0T4DEa8+pIihUg5BrR/Rb0XRHQDzMek2k=;
 b=IVaGnF+Qr3o1RaJHUDvxu94rn80uwPSgwOkxPB6oex9B8FaicJsK5VZ0
 TGJQQXh7qs7B9wsHGaoYnKzE7hnoVTqBbPPssM2/BA5QfA901foDMHqSM
 V4gflYmkCi3YXmiBdZBTZ+oK9NjJXMkf63KylewWAlevDWg4P4f2ItRxM
 4tDSYWdXB7U7Mjelkc23F0PmmERO4lK05yjzbq3JxTKJxWZ3Y2aKSBLmC
 eC5c8/krtDufViZZ70VlUP9wlniuVMYFCipLSQl9e31OjUdvaOLdv0n7d
 v+Ra5Ecto4fuOGWSuxpZ8GewTrsYYn20KhIEN3PJXkmeuBaWaTF9QyT87 w==;
X-CSE-ConnectionGUID: HH3cntCUQNqSM1ppPvRXuQ==
X-CSE-MsgGUID: jhoKdLJ9QvWviEO7Qaa1Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="49004055"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="49004055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:58 -0800
X-CSE-ConnectionGUID: cKCHFGEQS3mjt8Ki1LHDLQ==
X-CSE-MsgGUID: ppkXt0GHTcy2fBCu0aiTmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93189389"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/4] drm/xe: Include xe_oa_types.h
Date: Thu, 14 Nov 2024 07:21:46 -0800
Message-ID: <20241114152148.572447-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114152148.572447-1-lucas.demarchi@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
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

xe_device_types.h and xe_gt_types.h only need to know about the xe_oa
struct sizes. Include only the _types.h, like done for other components,
and let the full header to be included by the compilation units.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 1 +
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 drivers/gpu/drm/xe/xe_gt_types.h     | 2 +-
 drivers/gpu/drm/xe/xe_query.c        | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae9..8f7841ad8ded3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -44,6 +44,7 @@
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_oa.h"
 #include "xe_observation.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2c6a2040f0d82..ff19bda9ddadc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,7 +16,7 @@
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
-#include "xe_oa.h"
+#include "xe_oa_types.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index a287b98ee70b4..20901c01ba29a 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -14,7 +14,7 @@
 #include "xe_gt_stats.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
-#include "xe_oa.h"
+#include "xe_oa_types.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 170ae72d1a7bb..3eda616f15026 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -23,6 +23,7 @@
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
+#include "xe_oa.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 
-- 
2.47.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45461C531DB
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB910E9A0;
	Fri,  9 Aug 2024 16:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6VfyGnV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B71810E99D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222350; x=1754758350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CJVIWxhdwc/NXPMO+UWjt0DNdEhK8rPGDeguPuSAjQ=;
 b=a6VfyGnVICCvzSLaB6k1FfkqfRvXC7kyTp+qZQSSRetTcrKJn7PduSgd
 Tqp+Q9XbK3WGx/PLXPT19xVB8BlX3TbcX3ogR+klSet91byfivptJnhpY
 +rJ1dq7LfknuBRWpw8BkFEengn9RAKmkzx1/b+XTCx78XSH4zOUpSvczW
 8mEalAzZYcPOrGjxSn2GUF4GvvNFS0BQs8YbvC18rDw9CXLPh186evLqd
 yRMrtP48M3dvHbg/TErfSyAZGUHQRVgluf8BNUKRk1hnc0PnJR98YYzm7
 SDQ3lXM/He4fI5dQfyKnNgMcoBLool49WAwAXbnoAO4GioZ0jGUPhOy9p g==;
X-CSE-ConnectionGUID: pCT3wc/DTlGcqQdeTpGvzA==
X-CSE-MsgGUID: 6ZW2nWwPQtaLtF8D8wFFXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379437"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:30 -0700
X-CSE-ConnectionGUID: I4PSb0wuROqVUlmddqO9aw==
X-CSE-MsgGUID: 3pNWgg4XSwyDyv/Bgoru4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569348"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 09/12] drm/xe/pf: Define stub for pf_sanitize_vf_resources()
Date: Fri,  9 Aug 2024 18:51:56 +0200
Message-Id: <20240809165159.662-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

For some advanced KUnit test cases we may want to use replacement
function instead of the pf_sanitize_vf_resources() which actually
implements the exported xe_gt_sriov_pf_config_sanitize() function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index eba6793294f3..c77730d6e254 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1938,6 +1938,8 @@ static int pf_sanitize_vf_resources(struct xe_gt *gt, u32 vfid, long timeout)
 	struct xe_device *xe = gt_to_xe(gt);
 	int err = 0;
 
+	XE_TEST_REDIRECT(config->sanitize, gt, vfid, timeout);
+
 	/*
 	 * Only GGTT and LMEM requires to be cleared by the PF.
 	 * GuC doorbell IDs and context IDs do not need any clearing.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 7bc66656fcc7..99b4bc2b81bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -8,9 +8,11 @@
 
 #include <drm/drm_mm.h>
 
+#include "tests/xe_test.h"
 #include "xe_guc_klv_thresholds_set_types.h"
 
 struct xe_bo;
+struct xe_gt;
 
 /**
  * struct xe_gt_sriov_config - GT level per-VF configuration data.
@@ -36,6 +38,9 @@ struct xe_gt_sriov_config {
 	u32 preempt_timeout;
 	/** @thresholds: GuC thresholds for adverse events notifications. */
 	u32 thresholds[XE_GUC_KLV_NUM_THRESHOLDS];
+
+	/* private: */
+	XE_TEST_DECLARE(int (*sanitize)(struct xe_gt *gt, unsigned int vfid, long timeout));
 };
 
 /**
-- 
2.43.0


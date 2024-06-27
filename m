Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEEEC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 23:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1C610E1AF;
	Thu, 27 Jun 2024 23:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyuwVHkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB7610E1AF
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719532269; x=1751068269;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UfXG8oFIadifAEBVS4bZxtonPMJgPlrBw1oAj/lQiV0=;
 b=RyuwVHkZRpwbRVGdfKSQ2Wej5RuMSvrs9r3+7nFmfGrG8BorPY4hRy+3
 wmqM54zJEXf5B0jqS01Oteh3lR6XRl2z0GaixcG4Hl79TJMPYk/mqCkcP
 DKJxtEOg2lI0dqvhIpTVi9KtDVnzRkotJ5BKCSokxMy2pXaiOT0XDsOwy
 8G/xN3prlY73OumpAJvHG/jdx/++SiIAjjp+6a1ScRz7MgEk+ilY8ZW07
 VzKzvGfsFb5H5Fww30dJC0HUsxi/6ZLpAnlGOzG3AFRHoRYFa07r8tzAm
 kXWpLE4IGBGBCPU1cOercg3qlhUwNhdy/h71v9Jj+MJNH+imWKTnpeQKL A==;
X-CSE-ConnectionGUID: KMqYgoODQ/SIIyAdOEWa4Q==
X-CSE-MsgGUID: J3ulV2n5RDeNUNDHFsWtiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="34238480"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="34238480"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 16:51:08 -0700
X-CSE-ConnectionGUID: amyAge+RRDmQHDXmLKiyng==
X-CSE-MsgGUID: jDmBO7B0Q5+PT1oa0PheJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="44445317"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 16:51:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Date: Thu, 27 Jun 2024 16:51:05 -0700
Message-Id: <20240627235105.2631135-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

Per client engine utilization uses RING_TIMESTAMP to return
drm-total-cycles to the user. Current code uses XE_FW_GT to read this
register on the first available engine in a GT. When testing on DG2, it
is observed that this value is 0 when running test on some engines. To
resolve that, get the hwe domain specific FW for reading the engine
timestamp.

v2:
- update commit message
- use domain specific FW (Matt)

v3:
- Drop check for hwe in the helper (Matt, Michal)

v4:
- checkpatch fixes

v5: Rebase

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
 drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4bdb909eabfc..6a26923fa10e 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -260,17 +260,20 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Get the total GPU cycles */
 	for_each_gt(gt, xe, gt_id) {
+		enum xe_force_wake_domains fw;
+
 		hwe = xe_gt_any_hw_engine(gt);
 		if (!hwe)
 			continue;
 
-		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
+		fw = xe_hw_engine_to_fw_domain(hwe);
+		if (xe_force_wake_get(gt_to_fw(gt), fw)) {
 			hwe = NULL;
 			break;
 		}
 
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw));
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 78b50d3a6501..07ed9fd28f19 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
 	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
 }
+
+enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
+{
+	return engine_infos[hwe->engine_id].domain;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 7f2d27c0ba1a..900c8c991430 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -69,5 +69,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
+enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 #endif
-- 
2.34.1


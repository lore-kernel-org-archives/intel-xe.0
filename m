Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFEAC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 15:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D3D10E0DA;
	Tue, 25 Jun 2024 15:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FquyBmQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A5710E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719329931; x=1750865931;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RQNyrSeaV9NK4AC7s2MrnaBhU4pf8YLADMu1ZR4sMD0=;
 b=FquyBmQsacNEj/y8/2CmzCqT28++9MzdloryjlaqF5IxbOrvHzwGXNKR
 yW+4lS3A2EBBxmvrbxbfD8fhu8sAW6aULJtXUAcQl84d5tO3Oi/EZb+B6
 XZzx/A75f7V7lmdli8zwapagtD3AUWEaHkhgoL7hchsYehem3gNE6mEfd
 g1YW2mnUi+W0bHU/jIBXUuaOkT/Y+9CPx2P4PMitjOTJYkk09TszQ9JvX
 b61s6ITWSodHQp9Mv27HbarNtgRPHeMM2Sri5zKUv/IHzggxTMaX1qkDo
 5Q2O/ZoPoqgnNiAR84jkns4+fU09kg8tLD7fq6qYiUDzBnVhvVCvHcsy9 g==;
X-CSE-ConnectionGUID: zufIDAlbSTCsQUpEgHzH7Q==
X-CSE-MsgGUID: cunh4H+NT0iSCHI/EsqOYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="19251653"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="19251653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 08:38:49 -0700
X-CSE-ConnectionGUID: dSrGO7+qTbyWKC2NqKIcow==
X-CSE-MsgGUID: fE22mF4dTnerMqwlznrYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="81219381"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 08:38:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Date: Tue, 25 Jun 2024 23:38:42 +0800
Message-Id: <20240625153842.41070-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

Per client engine utilization uses RING_TIMESTAMP to return drm-total-cycles to
the user. Current code uses XE_FW_GT to read this register on the first
available engine in a GT. When testing on DG2, it is observed that this value is
0 when running test on some engines. To resolve that, get the hwe domain
specific FW for reading the engine timestamp.

v2:
- update commit message
- use domain specific FW (Matt)

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
 drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..886965e81465 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -260,13 +260,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Get the total GPU cycles */
 	for_each_gt(gt, xe, gt_id) {
+		enum xe_force_wake_domains fw;
+
 		hwe = xe_gt_any_hw_engine(gt);
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		fw = xe_hw_engine_to_fw_domain(hwe);
+		xe_force_wake_get(gt_to_fw(gt), fw);
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 78b50d3a6501..97f43ba3a00f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1130,3 +1130,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
 	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
 }
+
+enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
+{
+	return hwe ? engine_infos[hwe->engine_id].domain : 0;
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


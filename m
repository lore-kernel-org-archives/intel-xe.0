Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F3C30653
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 17:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B7610EB15;
	Thu, 27 Jun 2024 17:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwxZ9XAe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2957B10EB05
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719509040; x=1751045040;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=srj7TcvVQ0pq2FMfOEhErXNTwv9tnqs6bKpt9PABXUo=;
 b=XwxZ9XAe3OdXQASTARXKBuGic2cYhOQk7ndTlJRf0Zzcw6mH18Tmt6sJ
 5nIeBwFPVsGthr4+giSv2Gnds3Cvq98KY+ksL247mIE1AIil4BWBHGPoI
 M4jNh2DKo2i2TSxHhS3udDGU4fC3wTOG9PeKgVh3A7PrhkRc2eUgCCzjp
 433XvNuhMHNO7bt8bQKP4wZsrncMMRrbOcvj641l+dJ4IV5+a8yXHCdyg
 ELE8MCyYCXa5E2pku5sNPRsbTvILWfZzKrtZF+GygrSCqUntsxn3J9zmA
 qzDL+ihaYnI9PT42KXwgXqUQ3YYlNv3mKZBcRBqo58gVi69vLaUAWk16G g==;
X-CSE-ConnectionGUID: zQ5vGk3QQL+nOLhxcsGiGA==
X-CSE-MsgGUID: mxULxkj4Ryij2tdOQtTJVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27245544"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="27245544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 10:23:58 -0700
X-CSE-ConnectionGUID: rMTPASF3RrGWeJOa3Sp2CQ==
X-CSE-MsgGUID: hPF0TAOWQoqs+EITZmwLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="49373449"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 10:23:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/2] drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
Date: Fri, 28 Jun 2024 01:23:48 +0800
Message-Id: <20240627172348.84991-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
References: <20240627172348.84991-1-umesh.nerlige.ramappa@intel.com>
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

v3:
- Drop check for hwe in the helper (Matt, Michal)

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 7 +++++--
 drivers/gpu/drm/xe/xe_hw_engine.c  | 5 +++++
 drivers/gpu/drm/xe/xe_hw_engine.h  | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index e0c4a50d372c..bc120b0b06b8 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -257,13 +257,16 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E018D116F3
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB6D10E517;
	Tue,  2 Dec 2025 02:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S36PWe1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0D610E512
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764643880; x=1796179880;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ir87xNCnSnGsgOcNleCwk30qWCZ7XV0wIpZITPvXdIM=;
 b=S36PWe1BMsw/QDXPdcw7CTyot4SiJrP4nxQM7iP1l4BNR52EBCCXbip9
 iLC7iy96vjebxHcgbrHV65kHvzZhRMUzw87HuJKC7VeDB+NI5IvDZ8eVr
 mPprwHsjldcY6b1hbn231syOeDFa+jS2oeG2KoITOEhnnQA+KHwWsYF8S
 xrcPwkXtJFMvnOiTfZeZXp+IsN2gtTUD6AdZgfHCLU+RIeHMiPUuRvCmc
 pqshmgElgu43fhFtluiRjhG9FS1mUy3EYUm02Xt5n2Uz+A8Erpq/tI347
 owUiJzjBGuvY3phEI+RxvX6ZmUEh6xj7AHNI18HJFpma2pRujE4VH7Xy5 w==;
X-CSE-ConnectionGUID: XJkf18tQR1KWnEbIQ+7Xdg==
X-CSE-MsgGUID: N2F9mm5/S0yKI80yZy24fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66635556"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66635556"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
X-CSE-ConnectionGUID: gacC7rh5T9GyiVLpBtgcDg==
X-CSE-MsgGUID: xjpT9pr3SLOOx6NRPnZf0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194077386"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:51:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Date: Mon,  1 Dec 2025 18:51:12 -0800
Message-ID: <20251202025115.373546-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202025115.373546-1-ashutosh.dixit@intel.com>
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
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

gt_id was previously omitted from 'struct drm_xe_oa_unit' because it could
be determine from hwe's attached to the OA unit. However, we now have OA
units which don't have any hwe's attached to them. Hence add gt_id to
'struct drm_xe_oa_unit' in order to provide this needed information to
userspace.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Change gt_id to u16 (Matt Brost)
---
 drivers/gpu/drm/xe/xe_query.c | 4 +++-
 include/uapi/drm/xe_drm.h     | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a7bf1fd6dd6ac..18bd8047ebfdb 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -682,7 +682,9 @@ static int query_oa_units(struct xe_device *xe,
 			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
 					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
 					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS |
-					   DRM_XE_OA_CAPS_OAM;
+					   DRM_XE_OA_CAPS_OAM |
+					   DRM_XE_OA_CAPS_OA_UNIT_GT_ID;
+			du->gt_id = u->gt->info.id;
 			j = 0;
 			for_each_hw_engine(hwe, gt, hwe_id) {
 				if (!xe_hw_engine_is_reserved(hwe) &&
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 37881b1eb6bad..4413c7f918740 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1681,12 +1681,19 @@ struct drm_xe_oa_unit {
 #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
 #define DRM_XE_OA_CAPS_OAM		(1 << 4)
+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
 
+	/** @gt_id: gt id for this OA unit */
+	__u16 gt_id;
+
+	/** @reserved1: MBZ */
+	__u16 reserved1[3];
+
 	/** @reserved: MBZ */
-	__u64 reserved[4];
+	__u64 reserved[3];
 
 	/** @num_engines: number of engines in @eci array */
 	__u64 num_engines;
-- 
2.48.1


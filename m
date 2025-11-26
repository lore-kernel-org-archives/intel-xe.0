Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7234D10377
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 03:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A927510E4FF;
	Wed, 26 Nov 2025 03:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/v9F+fD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA9310E502
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129146; x=1795665146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pSLyWfsY86bjTcGhZIkOyFGGOHC0oij6Xk9UfrH1bZQ=;
 b=F/v9F+fDMe0rPY1cZbRs8AEah3GLqA79+Y9f9aTjFAjn0psVIpyK1CEE
 bDbmbAtnSM+r/SmPbi9tjt/qzDvnTJiLmnf2PuoW1N8NTlfHSR0haLaXU
 4iC0AAF7CU7PdueAcz9XIJLHD7Y3UOCtm7bmn4RamHO/KdPL7SvMWGgwf
 9S2hf7kOXCGbmlYKtI6lNxEmVgSahIHssc+p4FFmz0NZ5W0xbrZG0b75w
 yaR0+laMpU8jFROjOcLp6WXiF1KHANYfNpObjp9PUn4mcc70RY95Vf2XI
 dAOE3VfmskHe3LlDM+PMnVCTzWdHvvMEMTNGLtSwJlWSW8SBOd6/QzF8g g==;
X-CSE-ConnectionGUID: VXn4DFLFQF+yzXnWM1/EUw==
X-CSE-MsgGUID: mifBRFAvQOijL+qZkx5oLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76778735"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76778735"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
X-CSE-ConnectionGUID: VfCXTu7hTnyn3t3RTlyCtg==
X-CSE-MsgGUID: Lbgt1MS0RYW0k259oW5Wjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193260125"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:52:25 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Date: Tue, 25 Nov 2025 19:52:17 -0800
Message-ID: <20251126035220.13089-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035220.13089-1-ashutosh.dixit@intel.com>
References: <20251126035220.13089-1-ashutosh.dixit@intel.com>
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
---
 drivers/gpu/drm/xe/xe_query.c | 4 +++-
 include/uapi/drm/xe_drm.h     | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index 47853659a705e..ec09b281eafe7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1676,12 +1676,16 @@ struct drm_xe_oa_unit {
 #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
 #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
 #define DRM_XE_OA_CAPS_OAM		(1 << 4)
+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
 
+	/** @gt_id: gt id for this OA unit */
+	__u64 gt_id;
+
 	/** @reserved: MBZ */
-	__u64 reserved[4];
+	__u64 reserved[3];
 
 	/** @num_engines: number of engines in @eci array */
 	__u64 num_engines;
-- 
2.48.1


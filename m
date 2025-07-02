Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D543AC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9244A10E062;
	Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ij21NPdz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8744F10E062
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484640; x=1783020640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsHQc9Rq6OxXAbrMVORc1FSinNQYYnTwIYpsSiZlACA=;
 b=Ij21NPdzwuCJAmgV+R1JPr1DqMFYSiv/aEysB8ENAHwSzNNfMhrzCXb5
 3DsJXmzWR2ZVIPXC4VYK+MyqRGmmCRDIQt33cE+tKG70FmjEkBCd4QxDa
 37lxJ5rOzhvBn2oJUbTibP39pzEun3OBD+sTOILO7PIMuOtpzuRKB7zHo
 k2l2bFqvZrEVceg/7oO3H81NPmkEhX7HIxRq+LGpszUkkt3+aosITPatl
 IdhTmh3ka3fE4pFqQTzekSJwHrj4DewLfuOy/ndaYB6Z/KmkAt0vxtcxD
 z6OW5HMwGu/Ux8iO6NQjsQkr6cvIQ3c/T4ErFz2A6kLKCm74h9vpjp0Rb A==;
X-CSE-ConnectionGUID: fQp6FeIETX+7Be3LqcGw8A==
X-CSE-MsgGUID: Tgn0Rr8sRUK11q2hBXfOUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039094"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:40 -0700
X-CSE-ConnectionGUID: PYYVvMi0QTm8Ncd+kVj6CA==
X-CSE-MsgGUID: By4Eq1yPQFiX1AqLPjxIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615520"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:41 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 2/6] drm/xe: add new type to RTP context
Date: Wed,  2 Jul 2025 12:30:32 -0700
Message-ID: <20250702193036.1417416-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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

Prepare the RTP context to be used before GT init. Add the xe device as
a type, put WARN_ONs to protect existing RTP_MATCHes.

v5: split out into separate patch, change definition order

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h       |  3 ++-
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 29e694bb1219..9ae0bf15984a 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -56,10 +56,16 @@ static bool rule_matches(const struct xe_device *xe,
 				xe->info.subplatform == r->subplatform;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.graphics_verx100 == r->ver_start &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.graphics_verx100 >= r->ver_start &&
 				xe->info.graphics_verx100 <= r->ver_end &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
@@ -68,20 +74,32 @@ static bool rule_matches(const struct xe_device *xe,
 			match = xe->info.graphics_verx100 == r->ver_start;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_STEP:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.media_verx100 == r->ver_start &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.media_verx100 >= r->ver_start &&
 				xe->info.media_verx100 <= r->ver_end &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_STEP:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.step.media >= r->step_start &&
 				xe->info.step.media < r->step_end &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
@@ -108,6 +126,9 @@ static bool rule_matches(const struct xe_device *xe,
 			match = hwe->class != r->engine_class;
 			break;
 		case XE_RTP_MATCH_FUNC:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = r->match_func(gt, hwe);
 			break;
 		default:
@@ -186,6 +207,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
 			    struct xe_device **xe)
 {
 	switch (ctx->type) {
+	case XE_RTP_PROCESS_TYPE_DEVICE:
+		*hwe = NULL;
+		*gt = NULL;
+		*xe = ctx->xe;
+		break;
 	case XE_RTP_PROCESS_TYPE_GT:
 		*hwe = NULL;
 		*gt = ctx->gt;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 4fe736a11c42..ac260feaabef 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -422,7 +422,8 @@ struct xe_reg_sr;
 
 #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
 	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
-	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
 
 void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 					       unsigned long *active_entries,
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1b76b947c706..f4cf30e298cf 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -110,12 +110,14 @@ struct xe_rtp_entry {
 };
 
 enum xe_rtp_process_type {
+	XE_RTP_PROCESS_TYPE_DEVICE,
 	XE_RTP_PROCESS_TYPE_GT,
 	XE_RTP_PROCESS_TYPE_ENGINE,
 };
 
 struct xe_rtp_process_ctx {
 	union {
+		struct xe_device *xe;
 		struct xe_gt *gt;
 		struct xe_hw_engine *hwe;
 	};
-- 
2.49.0


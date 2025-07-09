Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E27FC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D1210E86A;
	Wed,  9 Jul 2025 22:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aH3QCiCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2CC10E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099370; x=1783635370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pOHFJ1yAePl+BA+gWJ9D5HN830jUMklZO68OA9RtAPE=;
 b=aH3QCiCCGrB+0ewDxww6wHDaXOf4Sl9rUTm2w4zyE/JuQc123WJyNWL5
 I4CmL5JW/nD3wO74uf6pknXByFStvFEGQb0Ic6WsdSYHlnF8V+OdoPv7u
 ogOznwaUWiQNzxiYqngvUovrD/V2fypDKQP+Al263j+bmf2BWOwvyaKhw
 CZtOxMgTGGVnYIJzS8yKrCstMerzJAQ0QyuJtrZiM2pu07ZX3CW8lrjiF
 MdGz2Fp9f2JUD/P+0lQ+dxJfZWj8CE8mZhkx0FM9Hdb+28xbmoapHEbbh
 5IefrOA7yuUlRKm3DIUsVSEwDifWu/yHN6C2S+1gcMI19vbMLciSvUON8 g==;
X-CSE-ConnectionGUID: s7Bhd70VSHmMvcnAXS61Jw==
X-CSE-MsgGUID: 9SLg/NnuRU+8KPDcHs9kig==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518057"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54518057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:10 -0700
X-CSE-ConnectionGUID: x8Ob93tKRd6gDbOz5DLf6A==
X-CSE-MsgGUID: aMJmkyfASH2hde6XvZKPNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193096140"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:10 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v6 3/6] drm/xe: add new type to RTP context
Date: Wed,  9 Jul 2025 15:16:02 -0700
Message-ID: <20250709221605.172516-4-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709221605.172516-1-matthew.s.atwood@intel.com>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
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
v6: catch missing cases for checking gt init

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 32 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.h       |  3 ++-
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 29e694bb1219..e4b3b135a4af 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -56,37 +56,61 @@ static bool rule_matches(const struct xe_device *xe,
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
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
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
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = xe->info.media_verx100 == r->ver_start;
 			break;
 		case XE_RTP_MATCH_INTEGRATED:
@@ -108,6 +132,9 @@ static bool rule_matches(const struct xe_device *xe,
 			match = hwe->class != r->engine_class;
 			break;
 		case XE_RTP_MATCH_FUNC:
+			if (drm_WARN_ON(&xe->drm, !gt))
+				return false;
+
 			match = r->match_func(gt, hwe);
 			break;
 		default:
@@ -186,6 +213,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B63BCD13DF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 16:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC86310F3CA;
	Thu, 30 Apr 2026 16:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GubemFez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEA310F3C4
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777565704; x=1809101704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6WyQyo+mrFCymg1n4AI6Fw35a94VBqxRt1uQmOKeOTY=;
 b=GubemFez7SzzD/J/afHU0QuZUI0HiK7bebJ5W+mXlR40QCkpuJyA7TOR
 RAZqdpmTvHcWjB+3cxIhfI9y5TrJZkDMC9uteqSmzjgUgZs83n5UGRS8r
 vPMzq9prq27gZiZJShnl7N7cFgKbTiF/9OrejyQxYNmE1NxfxN7GB/lng
 WYR7ZnNGdUiQ/5Ch5gd8XWUn193EbJ25Wd++OGwaIQJmfa1rOsP1KMBan
 vNshpbYug+vzLWdbNThTYBPfRUPnWFhGqM1pY7rnBI7QmlLVbGNierqN1
 Us9D7x10gezKme1kII8atvoCep32MuVrlPk9YgMJXdriZqaM228/H1hx4 A==;
X-CSE-ConnectionGUID: 9f+VoiNXSwat8jZI5fJ3Rw==
X-CSE-MsgGUID: UQZGi3FjTteWWTlpD62krg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89620093"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89620093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
X-CSE-ConnectionGUID: RpLdUBmhTgCgZcp86dJbgw==
X-CSE-MsgGUID: JE+tmEJeQXOzWheXn+pWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="238609917"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe/oa: Refactor oa_unit_supports_oa_format
Date: Thu, 30 Apr 2026 09:14:56 -0700
Message-ID: <20260430161459.2892545-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
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

Minor refactor of oa_unit_supports_oa_format to implement Wa_14026746987.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 5de5bf19240a2..b767dccfc4fc7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1934,16 +1934,18 @@ static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
 	return div_u64(nom + den - 1, den);
 }
 
-static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
+static bool oa_unit_supports_oa_format(struct xe_oa *oa, struct xe_oa_open_param *param)
 {
+	const struct xe_oa_format *f = &oa->oa_formats[param->oa_format];
+
 	switch (param->oa_unit->type) {
 	case DRM_XE_OA_UNIT_TYPE_OAG:
-		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
-			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
+		return f->type == DRM_XE_OA_FMT_TYPE_OAG || f->type == DRM_XE_OA_FMT_TYPE_OAR ||
+			f->type == DRM_XE_OA_FMT_TYPE_OAC || f->type == DRM_XE_OA_FMT_TYPE_PEC;
 	case DRM_XE_OA_UNIT_TYPE_OAM:
 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
 	case DRM_XE_OA_UNIT_TYPE_MERT:
-		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
+		return f->type == DRM_XE_OA_FMT_TYPE_OAM || f->type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
 	default:
 		return false;
 	}
@@ -2083,8 +2085,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		goto err_exec_q;
 
 	f = &oa->oa_formats[param.oa_format];
-	if (!param.oa_format || !f->size ||
-	    !oa_unit_supports_oa_format(&param, f->type)) {
+	if (!param.oa_format || !f->size || !oa_unit_supports_oa_format(oa, &param)) {
 		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
 			param.oa_format, f->type, f->size, param.hwe->class);
 		ret = -EINVAL;
-- 
2.54.0


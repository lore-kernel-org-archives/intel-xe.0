Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3D6C25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBF410E598;
	Wed, 25 Oct 2023 10:43:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9CF10E635
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698230599; x=1729766599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iHtb8jHLRihTq4xKanEW+gteYgjVR5EnnswVcH/EqvU=;
 b=QhulP3S+rOYPVlSbkmR0IedUuAZKqvprPqZwnqUyau6Ad8yhzhwSKyPJ
 LX36BFy8OvgmBDMAdESBDjQFWrYjHIXfSmnhzLtdSUEzbn3XpkaOEgTH5
 Y2enGQavzpJFZiGsNk1KVY184REOvQCcpSV1Gqud09xHRpw4XnT60P6L/
 invjmnnyn7K+mpUvDE8TBeu+7NybOICwT+/Twts2z8oXvYKmmsH7idcMd
 ii/b3f4IeAUvt+qdrmiVfr4lGs7So/DHKO1qmrzV+PIQKfd1HcXHfLlJg
 0ziztOwigMmo0L2UoSw2FX29eoJpC5SGiAU9RgSQsVRoWjy2hRN1jVdZQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="384491542"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384491542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6804151"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:43:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 13:43:06 +0300
Message-Id: <20231025104306.667700-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025104306.667700-1-jani.nikula@intel.com>
References: <20231025104306.667700-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915: drop gt/intel_gt.h include from
 skl_universal_plane.c
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

No longer needed after commit 94bcf876cb6a ("drm/i915/mtl: Drop
Wa_14017240301").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231011142704.985867-1-jani.nikula@intel.com
(cherry picked from commit f17c08a6046f0c9383a61d7009216b0ad3369db4)

---

Note: The cherry-pick conflicted, but it should be trivial to resolve.
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 6ce7dc419df1..188d53bb8594 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -21,7 +21,6 @@
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
-#include "gt/intel_gt.h"
 #ifdef I915
 #include "pxp/intel_pxp.h"
 #else
-- 
2.39.2


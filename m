Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52553CA0FF3
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D06B10E52D;
	Tue,  5 Sep 2023 14:14:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDB710E52C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693923285; x=1725459285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q0rQ5MZn8RdTd6+u1bryEeNgBk5EsGeC8SAqU/KlncA=;
 b=b2ZFjwbKf0mOSSBVzaY23Kt0EluMsnLZK8YYIcp7Yi8bv2mZ1q3QGqe0
 F1fgVclNo0PrjmLCGQugsK818gKOaXqYwDFvbxG3tC7ESaEbV+ztxHoCb
 oZqUzhB//t6nlHU6lC2omnd29+a2IJubs329an7JXLecFAAzCdkT91FZv
 7iGMfXR0dQlNi+DKkvbmrmWAm0OkVT4NbmoGNpa/KoHMOLPeljo0ZcKq5
 196eWfWOJY1LMk1Bsgnui4D1j4QBHliQyDnqrymV6oMIrRE+B/zbtzxQ9
 fk0QkHSZl0bSANJNTuZc5xgR8vKEt0FP3XMy2IESwSC+pEsUJ11kjaAC5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407794927"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407794927"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806626628"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="806626628"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 17:13:46 +0300
Message-Id: <20230905141347.1027082-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
References: <20230905141347.1027082-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] Revert "FIXME: drm/i915/display: Prefer
 i915->uncore over plain uncore"
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 8eed1768a20e799feb89da99ee3a21e9581605a3.
---
 drivers/gpu/drm/i915/display/intel_bios.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 467ab89f1c00..858c959f7bab 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -34,7 +34,6 @@
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_gmbus.h"
-#include "intel_uncore.h"
 
 #define _INTEL_BIOS_PRIVATE
 #include "intel_vbt_defs.h"
@@ -2915,11 +2914,11 @@ bool intel_bios_is_valid_vbt(const void *buf, size_t size)
 	return vbt;
 }
 
-static u32 intel_spi_read(struct drm_i915_private *i915, u32 offset)
+static u32 intel_spi_read(struct intel_uncore *uncore, u32 offset)
 {
-	intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, offset);
+	intel_uncore_write(uncore, PRIMARY_SPI_ADDRESS, offset);
 
-	return intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
+	return intel_uncore_read(uncore, PRIMARY_SPI_TRIGGER);
 }
 
 static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
@@ -2938,7 +2937,7 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 	oprom_offset &= OROM_OFFSET_MASK;
 
 	for (count = 0; count < oprom_size; count += 4) {
-		data = intel_spi_read(i915, oprom_offset + count);
+		data = intel_spi_read(&i915->uncore, oprom_offset + count);
 		if (data == *((const u32 *)"$VBT")) {
 			found = oprom_offset + count;
 			break;
@@ -2949,7 +2948,7 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	/* Get VBT size and allocate space for the VBT */
-	vbt_size = intel_spi_read(i915,
+	vbt_size = intel_spi_read(&i915->uncore,
 				  found + offsetof(struct vbt_header, vbt_size));
 	vbt_size &= 0xffff;
 
@@ -2958,7 +2957,7 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	for (count = 0; count < vbt_size; count += 4)
-		*(vbt + store++) = intel_spi_read(i915, found + count);
+		*(vbt + store++) = intel_spi_read(&i915->uncore, found + count);
 
 	if (!intel_bios_is_valid_vbt(vbt, vbt_size))
 		goto err_free_vbt;
-- 
2.39.2


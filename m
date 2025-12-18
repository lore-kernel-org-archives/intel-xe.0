Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BCDD68BF6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9110ED85;
	Thu, 18 Dec 2025 10:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JclZlEgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6051610ED85
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766053355; x=1797589355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7JhlLP42i5J1dIO3Nkff55IPyMqyPTV4UmA7HZAokE=;
 b=JclZlEgfbgSP1tOLufXOr04fb9BeQAkr6XM2QZXJzA1CnNMnjDY6EyI5
 nU7najInmNF4waAj2hMB0DWf9OG/EwRjp3NGUkCzu0AOZVOi7ZD7ETdnL
 jxbzodHkm3x4BINT9PT+amKyll58wCcplH3eXUvmGH4sdQDtr6jE0lq5p
 zmr1LcIDemsTBeDVZGU/xSUM02uQipF+6+VavsulQ5+zjo1VOrTbZi118
 RJ9VEjiVbl95iOZiSRc+MqpWBA9fPMhObd0sRniEHNOjzzWeAmPSIr1D6
 kiBY4Izp8t0iNXauI707WgkStnkKRrkhfU/JksWpbNSAweKdfzyx3CSyc g==;
X-CSE-ConnectionGUID: X0zi3fELQq+o6Tdij1+pPQ==
X-CSE-MsgGUID: XcHXRBO1Q12ON5QvwNY3SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78641283"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78641283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:22:35 -0800
X-CSE-ConnectionGUID: QVm+HaqySLugCyPWSr9lvQ==
X-CSE-MsgGUID: LBlsy7FGRr66cNdrMVDWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198617760"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:22:33 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v2 1/2] drm/xe/xe_survivability: Remove unused index
Date: Thu, 18 Dec 2025 16:21:53 +0530
Message-ID: <20251218105151.586575-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251218105151.586575-4-riana.tauro@intel.com>
References: <20251218105151.586575-4-riana.tauro@intel.com>
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

Remove unused index variable and fix for loop.

Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/intel-xe/20251210075757.GA1206705@ax162/
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: remove unnecessary offset helper (Rodrigo)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7520d7b7f9b8..2869866537ad 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -128,11 +128,6 @@ xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribu
 	return container_of(attr, struct xe_survivability_attribute, attr);
 }
 
-static u32 aux_history_offset(u32 reg_value)
-{
-	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
-}
-
 static void set_survivability_info(struct xe_mmio *mmio, u32  *info, int id)
 {
 	info[id] = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
@@ -144,7 +139,6 @@ static void populate_survivability_info(struct xe_device *xe)
 	u32 *info = survivability->info;
 	struct xe_mmio *mmio;
 	u32 id = 0, reg_value;
-	int index;
 
 	mmio = xe_root_tile_mmio(xe);
 	set_survivability_info(mmio, info, CAPABILITY_INFO);
@@ -162,13 +156,12 @@ static void populate_survivability_info(struct xe_device *xe)
 			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
 	}
 
+	/* Traverse the linked list of aux info registers */
 	if (reg_value & AUXINFO_SUPPORT) {
-		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
-
-		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
+		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
+		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
+		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
 			set_survivability_info(mmio, info, id);
-			id = aux_history_offset(info[id]);
-		}
 	}
 }
 
-- 
2.47.1


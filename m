Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A391D5CC9D
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 09:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2F010E74C;
	Tue, 16 Dec 2025 09:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxdcASdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41F10E76C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765878168; x=1797414168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZO3XvMcbTGFujxXhoiKMiRuWM1mC1q5q71ttK425GE=;
 b=KxdcASdR32CtiEfDx1MIgq/0wqoR98Js8GDduYPOlxApgtkBI8uUWCE5
 b8oaFQH/XG9qZGpbHtZHMz9DQnlJm264mGLl7pz+PRKJ+eE3plezo+Iy2
 1KxjIQnSrBFrpyKeFnXP1n0GgLBVTJsU2JiuR1p3YTST5Haxm/536gTGQ
 N6XjPvUTkm4U7rmzlMBqIiQdPuZzM0+PeDW8YgPqG7abFNur8FQrUMhe3
 eWJNmjkZWNBLHCBJY0buBdXPG7+xyZNkZjx2ZhL0xHV+WDVumEc04xKdB
 W7ZYT6BVDzrkQ8z0h4ww96YX85jmpNuKyLf+K5TEkVmA48+Ii11nn1NtL A==;
X-CSE-ConnectionGUID: ZgF64+vTRMe+efETBSqKcw==
X-CSE-MsgGUID: qr3mR5y3Q+C5bXKuskJTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67946627"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67946627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:42:48 -0800
X-CSE-ConnectionGUID: Eeaqh7OORByezbdPJnzuuQ==
X-CSE-MsgGUID: O/XGISFcSZy0rrzL74T0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197868100"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:42:46 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com
Subject: [PATCH 1/2] drm/xe/xe_survivability: remove unused index
Date: Tue, 16 Dec 2025 15:42:01 +0530
Message-ID: <20251216101159.332558-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251216101159.332558-4-riana.tauro@intel.com>
References: <20251216101159.332558-4-riana.tauro@intel.com>
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

remove unused index variable and fix for loop

Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/intel-xe/20251210075757.GA1206705@ax162/
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7520d7b7f9b8..7ca3e2851a5a 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -144,7 +144,6 @@ static void populate_survivability_info(struct xe_device *xe)
 	u32 *info = survivability->info;
 	struct xe_mmio *mmio;
 	u32 id = 0, reg_value;
-	int index;
 
 	mmio = xe_root_tile_mmio(xe);
 	set_survivability_info(mmio, info, CAPABILITY_INFO);
@@ -163,11 +162,10 @@ static void populate_survivability_info(struct xe_device *xe)
 	}
 
 	if (reg_value & AUXINFO_SUPPORT) {
-		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
-
-		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
+		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
+		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
+		     id = aux_history_offset(info[id])) {
 			set_survivability_info(mmio, info, id);
-			id = aux_history_offset(info[id]);
 		}
 	}
 }
-- 
2.47.1


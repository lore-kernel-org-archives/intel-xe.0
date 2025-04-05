Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B60C36010
	for <intel-xe@archiver.kernel.org>; Sat,  5 Apr 2025 17:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319710E12B;
	Sat,  5 Apr 2025 17:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UykPns58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6BD10E12B
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Apr 2025 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743873386; x=1775409386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SmJ0CYnqoHzcE2sChpA/IAlRVWyoZON/rnpAudcxaQA=;
 b=UykPns58reEjaHUY4aClsiFpwiZ5gRFEMplHznK5AjuAcKryGIUhC9Hh
 k8QklURD2CLo2Wp+42a5hRoArbrl9Spd6qn8i9J4E/FL9h32+1Nn8yRpl
 u5CzNxTV9D8e59J8Tw1vVZoExLVojtzfdiMyYfxN9dsDUhEOjxRc1PoXY
 O17dsr9KvSPu7E7DvgAvSsUH2/OpBVxSUFxxcd0C2xAlf7a4MVX5YcSHM
 wfbiSmZK5UzwVpwKAtpGWhwvYO1uSJogy5LhDzralm9wwYp562teWFM8g
 ouGp5unSWTHIaVBge2+VjAKp+qnyAobZoRyprk2ndUI/wsh67QcOhtiXa A==;
X-CSE-ConnectionGUID: 9Wj9k+8vTBq87DU89Tck1g==
X-CSE-MsgGUID: VzACznkMQumMOQO1Q8+lnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45390361"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; d="scan'208";a="45390361"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 10:16:24 -0700
X-CSE-ConnectionGUID: dGfH+CeiRPe8VLLSPAWTyQ==
X-CSE-MsgGUID: sfRfybRoTe2NkkVmgVLU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; d="scan'208";a="128062778"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2025 10:16:23 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5] drm/xe: remove unused LE_COS
Date: Sat,  5 Apr 2025 17:15:39 +0000
Message-Id: <20250405171539.599850-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401205703.4179906-1-shuicheng.lin@intel.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
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

The LE_COS definition missed passing the value parameter to
REG_FIELD_PREP. This didn't cause build errors because the entire
macro was unused.
The value for this field is universally "0" for every MOCS entry on
the old Xe_LP platforms, and the whole field has been removed from
Xe_HP onward. Just delete the line so that we don't have an unused
definition.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 58f4218c2569..cbb9f7cbcfc0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -62,7 +62,6 @@
 #define   LE_SSE_MASK				REG_GENMASK(18, 17)
 #define   LE_SSE(value)				REG_FIELD_PREP(LE_SSE_MASK, value)
 #define   LE_COS_MASK				REG_GENMASK(16, 15)
-#define   LE_COS(value)				REG_FIELD_PREP(LE_COS_MASK)
 #define   LE_SCF_MASK				REG_BIT(14)
 #define   LE_SCF(value)				REG_FIELD_PREP(LE_SCF_MASK, value)
 #define   LE_PFM_MASK				REG_GENMASK(13, 11)
-- 
2.25.1


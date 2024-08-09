Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9C7C531DA
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 11:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037A710E8C5;
	Fri,  9 Aug 2024 11:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzZeDKdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E47C10E8C2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 11:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723201414; x=1754737414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1oVuixHuBOiYkPUXbJ1EEFtNXdyq75UOmD0bVVmW8s8=;
 b=PzZeDKdRiWE1ogOHNmIWiiuCrILsj+93mq4+55kYumW4R19nhNBbE8BE
 Q8Rwik9ObgzTQlNwDoz+5TAeCj3Jxrz5vXzBcwln+CiNrmdWafL5uMRuD
 GU1fWvDtCv/QtnAagBXmDwonVwu2GhArNKDONVR/Kpgz3RkzZDP9HGxOm
 YwRJ5ngMkfWQf/Ea8Zdxci8KEqzZEr6+Z23kOzAFgN2ETufQXUV0gtuqP
 kFZZ47tiFS3Mv+CreLqXycVDh3jWbZBb3jiimdxHwHVUrcaGTgSp0e+91
 4u3M1VDBsEc3lueiDLg+76E/NgwIFk+H3q6VEq93qdIy9KFm6UAtV4dzn A==;
X-CSE-ConnectionGUID: oRUR3q+pR0ee8qKMEBGR+Q==
X-CSE-MsgGUID: E6yjEv5fQ8m5oUOc9AxaFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21512415"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21512415"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:03:33 -0700
X-CSE-ConnectionGUID: cyst4DZlQMSq4FdoxRGc1A==
X-CSE-MsgGUID: m4s69xMfTyWDryU2338oLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57494207"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:03:31 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Add has_wmtp GT info
Date: Fri,  9 Aug 2024 12:47:35 +0200
Message-ID: <20240809104736.10423-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240809104736.10423-1-nirmoy.das@intel.com>
References: <20240809104736.10423-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add a GT info member to reflect wmtp feature status.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 631928258d71..bba212924e21 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -131,6 +131,8 @@ struct xe_gt {
 		u8 id;
 		/** @info.has_indirect_ring_state: GT has indirect ring state support */
 		u8 has_indirect_ring_state:1;
+		/** @has_wmtp: gt supports mid-thread preemption */
+		bool has_wmtp;
 	} info;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 402dfa748e16..7ddffc596dc1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -347,14 +347,11 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
 static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
 				      const struct xe_hw_engine *hwe)
 {
-	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
-		return false;
-
 	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
 	    hwe->class != XE_ENGINE_CLASS_RENDER)
 		return false;
 
-	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
+	return !gt->info.has_wmtp;
 }
 
 void
@@ -736,6 +733,15 @@ static void read_compute_fuses(struct xe_gt *gt)
 		read_compute_fuses_from_dss(gt);
 }
 
+static void read_wmtp_fuses(struct xe_gt *gt)
+{
+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
+		return;
+
+	gt->info.has_wmtp = !(xe_mmio_read32(gt, XEHP_FUSE4) &
+			    CFEG_WMTP_DISABLE);
+}
+
 static void check_gsc_availability(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -766,6 +772,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_media_fuses(gt);
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
+	read_wmtp_fuses(gt);
 	check_gsc_availability(gt);
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
-- 
2.42.0


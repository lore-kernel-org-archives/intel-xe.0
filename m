Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8098BC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 22:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4064910E7DC;
	Tue, 18 Jun 2024 22:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7g/Rnvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA5610E7DB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718748043; x=1750284043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vs7S2MT/xtmknup/3V77xD6qJPyhXh5ds3hQEsH/BBw=;
 b=H7g/RnvhPc90KvSkQmDa9qSY7Sj9xiqDUH+8jnu3gvnfF7m3w6NiTpwQ
 ShwvJciD8a6sYJF6hEtgtff1Zhv4ZuxKVqU6S/p8D+Hym1zHmSlVkysab
 ZLjUwX4tN48ur9VRKPYeG2ufr53gjg2ATz1BgfX/8B/xOa8qe7iNQrVTS
 A0y2AUcXyTO/U+dP9mw71FTKtVrBo2zSzWFqjpUPfh7JUyQn3urUzIN09
 GdRIrJSphHQZWwDmO9mLTeKqZNnY41xHjEqQEdCfbAGmhUXX7IUtn7XS/
 NUEGBL8eJ1X7x8Tc3PEeT/BB4HtNQBdake52SRxzk6N3Vlio5Iels6frV Q==;
X-CSE-ConnectionGUID: war0UQhCRJyspSDCy1O6Jw==
X-CSE-MsgGUID: 7jy/Qun2Ru63nBGRy7s7og==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15801658"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15801658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:00:43 -0700
X-CSE-ConnectionGUID: 7ivMgOYETmGNzvxuKK5+Rw==
X-CSE-MsgGUID: bo6nkH0IQBu2y2rO/06oMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41794398"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 15:00:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/2] drm/xe/rtp: Prepare RTP for VF actions
Date: Wed, 19 Jun 2024 00:00:25 +0200
Message-Id: <20240618220026.773-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240618220026.773-1-michal.wajdeczko@intel.com>
References: <20240618220026.773-1-michal.wajdeczko@intel.com>
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

We don't want any current RTP actions to be processed by the VF
drivers, but instead of blocking them completely, add new flags
that would allow VF-ready or VF-only actions to be added later.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: use entry->flags instead of rules (Lucas)
---
 drivers/gpu/drm/xe/xe_rtp.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index ac31cba1dbea..a9525e056019 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -13,6 +13,7 @@
 #include "xe_gt_topology.h"
 #include "xe_macros.h"
 #include "xe_reg_sr.h"
+#include "xe_sriov.h"
 
 /**
  * DOC: Register Table Processing
@@ -233,6 +234,17 @@ static void rtp_mark_active(struct xe_device *xe,
 		bitmap_set(ctx->active_entries, first, last - first + 2);
 }
 
+static bool rtp_check_entry_flags(u8 flags, bool is_vf)
+{
+	if (flags & XE_RTP_ENTRY_FLAG_VF_READY)
+		return true;
+
+	if (flags & XE_RTP_ENTRY_FLAG_VF_ONLY)
+		return is_vf;
+
+	return !is_vf;
+}
+
 /**
  * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
  *                        the save-restore argument.
@@ -254,12 +266,18 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 	struct xe_hw_engine *hwe = NULL;
 	struct xe_gt *gt = NULL;
 	struct xe_device *xe = NULL;
+	bool is_vf;
 
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
+	is_vf = IS_SRIOV_VF(xe);
+
 	for (entry = entries; entry && entry->name; entry++) {
 		bool match = false;
 
+		if (!rtp_check_entry_flags(entry->flags, is_vf))
+			continue;
+
 		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
 			struct xe_hw_engine *each_hwe;
 			enum xe_hw_engine_id id;
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1b76b947c706..f802ac26e01c 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -99,6 +99,8 @@ struct xe_rtp_entry_sr {
 	u8 n_rules;
 	u8 n_actions;
 #define XE_RTP_ENTRY_FLAG_FOREACH_ENGINE	BIT(0)
+#define XE_RTP_ENTRY_FLAG_VF_READY		BIT(1)
+#define XE_RTP_ENTRY_FLAG_VF_ONLY		BIT(2)
 	u8 flags;
 };
 
-- 
2.43.0


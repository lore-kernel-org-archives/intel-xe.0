Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91614CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502E410E503;
	Mon, 13 Oct 2025 20:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jm9xn5lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6992F10E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386202; x=1791922202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VrF9XpraS3aFZw2HSVe9xd89oDNU9RWBCZJS6abMcMI=;
 b=jm9xn5lvGSRRasg0Oye7tH+OY/wUL6fJPlQFcNEbBhJg9CihGnOzPZ+y
 HRx1JPPU4NJAlc4UfDnH1eGqkkN75PDjdqj80fHJ2bWWf+uUVU4n1xbSq
 TtHu94aP/vvYATd2LNUwJQOBnvy/K+I9pie9du3fKChBt4F9xj+8JFKak
 RD8paIXxxKAj830+a1YAEu/85KqCLbtNiZ+uj/FvjHivLhj2Tuq8k7cff
 BOE7WCDP4s/1Mkuj1d+/kt0/Ex5kLxh2Bb+5ytEnbHHrOo12/VOtZRUTl
 EoXlN2zEI8ZdrW2He5m1Co1T9h2ckgkrx3Sp5jrHCyBmPyoFCpdmRu/L9 g==;
X-CSE-ConnectionGUID: qz5FgjIpSlSm5axsYMgQ0w==
X-CSE-MsgGUID: kkelQUxrTBuZoky0FyPYlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800540"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
X-CSE-ConnectionGUID: zC9ykybhTUmHP4wND6/R7Q==
X-CSE-MsgGUID: EhLGrAtVStK9Y65YuGe7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707560"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 11/23] drm/xe/pmu: Initialize PMU event types based on
 first available GT
Date: Mon, 13 Oct 2025 13:09:54 -0700
Message-ID: <20251013200944.2499947-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

GT ID#0 (primary GT on tile 0) may not always be available if the
primary GT has been disabled via configfs.  Instead use the first
available GT when determining which PMU events are supported.  If there
are no GTs, then don't advertise any GT-related events.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..c63335eb69e5 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -497,7 +497,12 @@ static const struct attribute_group *pmu_events_attr_update[] = {
 static void set_supported_events(struct xe_pmu *pmu)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
+	struct xe_gt *gt;
+	int id;
+
+	/* If there are no GTs, don't support any GT-related events */
+	if (xe->info.gt_count == 0)
+		return;
 
 	if (!xe->info.skip_guc_pc) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
@@ -505,6 +510,10 @@ static void set_supported_events(struct xe_pmu *pmu)
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
 	}
 
+	/* Find the first available GT to query engine event capabilities */
+	for_each_gt(gt, xe, id)
+		break;
+
 	if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
 		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
-- 
2.51.0


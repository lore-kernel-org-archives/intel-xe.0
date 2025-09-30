Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCEECCA476
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E92510E641;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBJ2NCA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5210E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VwrzOQCh8kcPAVdO+/+tg4OAAI+n82ayvJohlOhQ57c=;
 b=WBJ2NCA6F7VL8+NTMpFAm9Y+klqMhqFdZnN0ckn4S3KkHYVW/i5Lc43u
 Bv/raAwIve5Mwg0Q5J3ucEhoenRX7vaM7Lb1XN3aAupOrCsr//4TWHVb0
 cRQK6VftZeDqkm3a/i88+411E4KK47EQlv1NFUC0oHJrur+qu7tJDN3Nr
 kvqaW3G1p+U5fzQGySZIlPOoywBCsZcuhV+JouIIF11f1JFC7FphIwKje
 Tv4PHGSG0qPIgijvlfA50mfotUWOiC0PLlPnsM4h3/YeG7rn0Td7lyrgR
 xMs9J4pcfvxJNNVvaMINldcLhpcYepoEKDHndnQo5q2FxDIcMUOPdyEFA w==;
X-CSE-ConnectionGUID: CbRWlRztTpmWTFrXNLMnDw==
X-CSE-MsgGUID: SlW4PV7tS7Ol0jGv4i91cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397751"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: Bq7BWDWTSmeHpoxRjYw41g==
X-CSE-MsgGUID: si5J3UowRuqbUXCkW5OhXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229465"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 11/23] drm/xe/pmu: Initialize PMU event types based on
 first available GT
Date: Tue, 30 Sep 2025 15:56:28 -0700
Message-ID: <20250930225618.140071-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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


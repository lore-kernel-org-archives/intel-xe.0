Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC7AC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4241810EA29;
	Thu, 16 Jan 2025 23:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZY/xOPO8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790B10EA22
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KMlFTOCCKKq/OcWv88L2wKpmeMNWJHHHg52d4VIMOsA=;
 b=ZY/xOPO8n1iQQAZdyKO/U8qL17PFkKOU++qi6grEsTdX/c69fjNKDKRj
 K9SVLlG1dN9667cqmUeTjjd1OLnKFS0W5UK1vl1T1zNd62oRpwKJRZA7m
 8mD0awX28sl3lMLkPeeO6bgMNCmE4/9WOTmTuGHuc05UrZxzHPzSwc9aK
 OIn2oiEcmUmWmvJcao2nRzgH6KDErukhWHz1ytV8TFZ8q9cw6xAd2jcLE
 XKhKMpyP5dYASIbJ2OLNuIAq5Pa+Z8ifECDs6WYGy+OOn4zy5xR2AGkso
 btFGw5XHe/Z0iG3hp9csUvPXD8XyaPuVbkCBONajLDmTqL0XOfbCVnkfZ w==;
X-CSE-ConnectionGUID: gXn72R9UQDiwNdIhkmO3pw==
X-CSE-MsgGUID: UOgN4Te+SgKs+id9rgo7uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364121"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
X-CSE-ConnectionGUID: aFis0aKoSJOEhC8iTdLAtg==
X-CSE-MsgGUID: Rdg4wfaeQo+AZBagD4rsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474357"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 5/7] drm/xe/pmu: Extract xe_pmu_event_update()
Date: Thu, 16 Jan 2025 15:07:16 -0800
Message-ID: <20250116230718.82460-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116230718.82460-1-lucas.demarchi@intel.com>
References: <20250116230718.82460-1-lucas.demarchi@intel.com>
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

Like other pmu drivers, keep the update separate from the read so it can
be called from other methods (like stop()) without side effects.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index ce53cfb846470..f8154bcad891a 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -126,18 +126,11 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	return val;
 }
 
-static void xe_pmu_event_read(struct perf_event *event)
+static void xe_pmu_event_update(struct perf_event *event)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 	struct hw_perf_event *hwc = &event->hw;
-	struct xe_pmu *pmu = &xe->pmu;
 	u64 prev, new;
 
-	if (!pmu->registered) {
-		event->hw.state = PERF_HES_STOPPED;
-		return;
-	}
-
 	prev = local64_read(&hwc->prev_count);
 	do {
 		new = __xe_pmu_event_read(event);
@@ -146,6 +139,19 @@ static void xe_pmu_event_read(struct perf_event *event)
 	local64_add(new - prev, &event->count);
 }
 
+static void xe_pmu_event_read(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->registered) {
+		event->hw.state = PERF_HES_STOPPED;
+		return;
+	}
+
+	xe_pmu_event_update(event);
+}
+
 static void xe_pmu_enable(struct perf_event *event)
 {
 	/*
@@ -175,7 +181,7 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
 
 	if (pmu->registered)
 		if (flags & PERF_EF_UPDATE)
-			xe_pmu_event_read(event);
+			xe_pmu_event_update(event);
 
 	event->hw.state = PERF_HES_STOPPED;
 }
-- 
2.48.0


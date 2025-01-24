Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F73C0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 05:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45C10E8CC;
	Fri, 24 Jan 2025 05:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqHdS8/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B3B10E8CF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737695081; x=1769231081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVR5jzDDrohzFop2gFNUC6J0pS9K0Ewv1D1aIuC0kqk=;
 b=aqHdS8/GmglbD7uXi913J5l5E5BpOUljmslpGwEjExvx2ow/b+ujjd5F
 7wpXzOyBJQtz0+3RyQL5/BlrEgIzxiNkJbNhjN67+LTWGdzBQuK/TBRs0
 rDOUPHSJCZTP+/cutDdb2l6ZZaMhLGaehiC1oUZsICpJfv9JqtWuQryAF
 XRSfdvqS/70p6WJaP9AEQwYYq+i1tRYTxkfl+O8LCaoKXEFv1UJFb/pCW
 LcNNckjnIVKoERCZu6SLs4mwyPTS3JklESSeSrJlxAU5fuWBCkOdixu1Q
 0FaLpOa3ZrF7vn0b6SN4cck7oPWGuD4FvxI5xkhGuobY9eb5OPfZKBlnH g==;
X-CSE-ConnectionGUID: pBOHwWeSRY28SO6puORS2A==
X-CSE-MsgGUID: BlVvbQe5Sly52pQUMdbWyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38253079"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38253079"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:41 -0800
X-CSE-ConnectionGUID: iCrd/MAHT8G2tnl+yxKIxw==
X-CSE-MsgGUID: xJzd6FGsSgG3/X/9hdzrgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112304767"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI 3/6] drm/xe/pmu: Extract xe_pmu_event_update()
Date: Thu, 23 Jan 2025 21:04:08 -0800
Message-ID: <20250124050411.2189060-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index df93ba96bdc1e..33598272db6aa 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -117,18 +117,11 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
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
@@ -137,6 +130,19 @@ static void xe_pmu_event_read(struct perf_event *event)
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
@@ -166,7 +172,7 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
 
 	if (pmu->registered)
 		if (flags & PERF_EF_UPDATE)
-			xe_pmu_event_read(event);
+			xe_pmu_event_update(event);
 
 	event->hw.state = PERF_HES_STOPPED;
 }
-- 
2.48.0


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AACCC0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 04:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F145310E337;
	Thu, 23 Jan 2025 04:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7qk3Hk2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F7310E142
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 04:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737605989; x=1769141989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pSpleNY7DL8U/OvROpulDz21v4xEzXDi0VGn1SlGWvA=;
 b=l7qk3Hk2kGdM71e+uDhVfzko/SYbJHj7sr9ojnFhWR3JVCtIaC1ZKAPg
 MHM3bc83qdhFPPpxFDI3GSRPAvKHy+YhvHE3TBAYm9sOojYFru4KJs8UW
 vW2ARucA/NW2lpn+6QI3FhSBR5LoxslHEoYffzgNDmsnOm6OerdOHetbY
 RE1ZaatSl9hs7xW042r7eJhQ8w5p+79waDLMlMh5Xqc94A6T5nHv4Q1Ce
 aJ4RcQcTcOe6CQXLWxuVV60wK2SAkKD26aKB+S47ufrevWJfdw5tI/qLX
 O7oY1P83rcCdrUGX7FNdQjEZQIcS+bFRORvubl5sv9YjXp58I8+ETCosk g==;
X-CSE-ConnectionGUID: 1Sv6ZDR+R+G91OR/ecXrNQ==
X-CSE-MsgGUID: hcCA3n5dR2emjJSQvzA4Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37971642"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37971642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:48 -0800
X-CSE-ConnectionGUID: 4jYRYycOT7Kq4nEsRQRxlw==
X-CSE-MsgGUID: E1vynHyoQ4WcdCVAIAl1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107202061"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v15 3/6] drm/xe/pmu: Extract xe_pmu_event_update()
Date: Wed, 22 Jan 2025 20:19:20 -0800
Message-ID: <20250123041923.1892837-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250123041923.1892837-1-lucas.demarchi@intel.com>
References: <20250123041923.1892837-1-lucas.demarchi@intel.com>
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


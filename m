Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7885C02190
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 06:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD0810E676;
	Wed, 22 Jan 2025 06:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTw9t1wR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2868A10E670
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737527053; x=1769063053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=APLxJX1II8MNQN4qAv3ScOoDkE5OxD+XykO+oIUFz4Y=;
 b=MTw9t1wRUjhSt8ndU/9eqsFWHksRAwXOB5DKGYg62eQYkaznylj9563+
 Axk/bf4l+esVsJEMJ8cfcKvRrbRa/yC4WnXlTTmvhhVjBGNtXEo9MltuF
 5AW5AU9bdywVgb7Ln1aMMS0HjkkPWF3uUEl68d4XvJYlwHEGzffVzqlsV
 FbouTIJCv2MCi4RkaH2K9aZFPunNiXoD7JtttpAv/EmqVHzbQKvMxhLDr
 E4ybkI7yOZM2CpJyklozbg0yYVtZSODiAM0KrrEMm882qu611l3oB+uJi
 BKrAVtyhqHpSzsdVi/cFIPaYtV3Bv2KE+4AYL2rqcyCg+5SrERsuRMALR g==;
X-CSE-ConnectionGUID: JSIn9etcSh+l7m3L3TINkg==
X-CSE-MsgGUID: mCeIsMl6SVqze0QTS56tNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41643307"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="41643307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
X-CSE-ConnectionGUID: /L/a37S0TsO9P+wZ7Ber0Q==
X-CSE-MsgGUID: SsTqBLhyTHi1xeeQuAaSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112015673"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v14 6/7] drm/xe/pmu: Get/put runtime pm on event init
Date: Tue, 21 Jan 2025 22:23:40 -0800
Message-ID: <20250122062341.1100173-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250122062341.1100173-1-lucas.demarchi@intel.com>
References: <20250122062341.1100173-1-lucas.demarchi@intel.com>
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

When the event is created, make sure runtime pm is taken and later put:
in order to read an event counter the GPU needs to remain accessible and
doing a get/put during perf's read is not possible it's holding a
raw_spinlock.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 68ebec1746a53..8d938d67c1f2c 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -79,6 +79,7 @@ static void xe_pmu_event_destroy(struct perf_event *event)
 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
 
 	drm_WARN_ON(&xe->drm, event->parent);
+	xe_pm_runtime_put(xe);
 	drm_dev_put(&xe->drm);
 }
 
@@ -111,6 +112,7 @@ static int xe_pmu_event_init(struct perf_event *event)
 
 	if (!event->parent) {
 		drm_dev_get(&xe->drm);
+		xe_pm_runtime_get(xe);
 		event->destroy = xe_pmu_event_destroy;
 	}
 
-- 
2.48.0


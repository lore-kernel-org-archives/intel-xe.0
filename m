Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C486EC61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 05:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6193F10E2E7;
	Fri, 24 Nov 2023 05:55:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5010E2E7
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 05:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700805347; x=1732341347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3DI4PZ0vsZqzw5PiIbX50tQop3k6eLDO6/UKmjc0s1k=;
 b=FEjRHN2bH4I69ETcdZNXh5QYE2S1g5fDWEqfM/WPYbz0o6+pEyaji6Eb
 v6CiU57V4xJwa6g7vDO2rwSPDKNdvAfs1OgMzCp4x+bjO81dAncPspdxN
 obeidIa5HmAOuudhDuCqF5WwkqWfOSV85OTk/swBCs8Hz8z55R6ymCzxF
 CXyuLMb8KSDpqx/UGoYMpF3H+mfNR5d+/QtmyfKeNxF7v2Xo60Lwye7IH
 hgha9aBHv7/OWge26c6oHkVQuvQkfG0E+bN9VHLEcwk3Lf7UHOvQBAJ6L
 rRjjiDrB9QtkaIjJr77vixiqsGqbFG6IoGczqlhaqyAHVDnnqOvffT1qH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478580258"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="478580258"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 21:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837982844"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="837982844"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 21:55:45 -0800
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 11:28:18 +0530
Message-Id: <20231124055818.1769898-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/pmu: Drop interrupt pmu event
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

Fix the sample type calculation for engine group events in
engine_group_busyness_read

Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index b573d26f87ad..4fb77c7693c2 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -61,7 +61,7 @@ static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
 
 static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
 {
-	int sample_type = config_counter(config) - 1;
+	int sample_type = config_counter(config);
 	const unsigned int gt_id = gt->info.id;
 	struct xe_device *xe = gt->tile->xe;
 	struct xe_pmu *pmu = &xe->pmu;
-- 
2.25.1


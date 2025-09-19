Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FB7CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 12:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE0D10E162;
	Fri, 19 Sep 2025 12:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jk0hLOvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C02410E162
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758284483; x=1789820483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CtLde+7URGIHYifQpHPiGY5XpB+j9DfJisqjZxT834c=;
 b=Jk0hLOvyCliWOpWKdEaWWUypnWw/ulYCzRuukg3vzULS6CEGsgdmavXB
 zmiNwpFftmoE02d4KCBz+ouEnDIxCNo9kLTTT2RhPl5DbwRFkiOCIvwVm
 RpB/WqJpUJy7M1v9kmyPl3TF2d6Sjez/rFpCzSewJ0qvfBsWo+Q4BcOAU
 G4J9Gq55Jo/OVKbtyxmFqN2+DPy46XjRx2vEPJJ4xlRX6MF2FlCGuxPgZ
 ypjrwxb9wrokRGgYkdHYGzmhDqwaxD9NQdABUPUghsz5BWaMNO3PhsNM8
 fbUeprgeip4JtlDGaA1xs0e8OgRtU8j5BCkp6ENF42IsRUvx5diDotsvK g==;
X-CSE-ConnectionGUID: bvyH2H4jQT6inU8WPWq8Og==
X-CSE-MsgGUID: YMSx/hSrSsaUqMiBZ0xtkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60517454"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60517454"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 05:21:23 -0700
X-CSE-ConnectionGUID: Sr+nJhESTj2lq2m9TMWH+Q==
X-CSE-MsgGUID: xsPPbWPiR2mYDC2Awlm+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="206766345"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 05:21:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joshua Santosh <joshua.santosh.ranjan@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/uapi: loosen used tracking restriction
Date: Fri, 19 Sep 2025 13:20:53 +0100
Message-ID: <20250919122052.420979-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently this is hidden behind perfmon_capable() since this is
technically an info leak, given that this is a system wide metric.
However the granularity reported here is always PAGE_SIZE aligned, which
matches what the core kernel is already willing to expose to userspace
if querying how many free RAM pages there are on the system, and that
doesn't need any special privileges. In addition other drm drivers seem
happy to expose this.

The motivation here if with oneAPI where they want to use the system
wide 'used' reporting here, so not the per-client fdinfo stats. This has
also come up with some perf overlay applications wanting this
information.

Fixes: 1105ac15d2a1 ("drm/xe/uapi: restrict system wide accounting")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joshua Santosh <joshua.santosh.ranjan@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_query.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e1b603aba61b..2e9ff33ed2fe 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -276,8 +276,7 @@ static int query_mem_regions(struct xe_device *xe,
 	mem_regions->mem_regions[0].instance = 0;
 	mem_regions->mem_regions[0].min_page_size = PAGE_SIZE;
 	mem_regions->mem_regions[0].total_size = man->size << PAGE_SHIFT;
-	if (perfmon_capable())
-		mem_regions->mem_regions[0].used = ttm_resource_manager_usage(man);
+	mem_regions->mem_regions[0].used = ttm_resource_manager_usage(man);
 	mem_regions->num_mem_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
@@ -293,13 +292,11 @@ static int query_mem_regions(struct xe_device *xe,
 			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
 				man->size;
 
-			if (perfmon_capable()) {
-				xe_ttm_vram_get_used(man,
-					&mem_regions->mem_regions
-					[mem_regions->num_mem_regions].used,
-					&mem_regions->mem_regions
-					[mem_regions->num_mem_regions].cpu_visible_used);
-			}
+			xe_ttm_vram_get_used(man,
+					     &mem_regions->mem_regions
+					     [mem_regions->num_mem_regions].used,
+					     &mem_regions->mem_regions
+					     [mem_regions->num_mem_regions].cpu_visible_used);
 
 			mem_regions->mem_regions[mem_regions->num_mem_regions].cpu_visible_size =
 				xe_ttm_vram_get_cpu_visible_size(man);
-- 
2.51.0


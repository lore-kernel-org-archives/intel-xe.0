Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84577C71141
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4821710E77B;
	Thu, 12 Jun 2025 10:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYGSjVkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DC610E76E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723896; x=1781259896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XBeCYML0refzWHgbOC6bV+Dp8X3x+yl55patRx/x1QI=;
 b=UYGSjVkQkGxUYaNp5HYc9Ifl3oRSV7T6KclQTMy29F97Rdfm7P3F51MW
 x1Mnk24U3pmN/ycONTNjytPNaZo2mPOSiE7oKnKE18qEkb2u9TfsGl5Em
 qoeehcyg80+fAtLdM9cbONKOkOUkPDUV/vuM/PtVmasBZfG6OH5fnWzU/
 tKqOlNkM68ubRqrKmeggjlnIQVlo9s7fA6sd0+ONH5yctqySBtg0BpRYa
 ghPGyF9gPG+sqReiOQg5NzL3Utj6jJ8IJNJKo/RguGzsFclZjCcSckNka
 5eo983A/p0zgMZvSG8D5hBI7vEtsfL2/NeDxsgJZ2zisEUQLUGk6jJSty Q==;
X-CSE-ConnectionGUID: 8BTXfHsgSvKHk7rociP6pw==
X-CSE-MsgGUID: Mo2IHFWHQ8iPUbEbRZch/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51608603"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51608603"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:24:56 -0700
X-CSE-ConnectionGUID: sAJ7W2MwSgCJ0VsktSaCMQ==
X-CSE-MsgGUID: vlFKiSeUTwys+IgWg/lncA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152382751"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 03:24:53 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 2/8] drm/xe/vf: Skip fixups on migration before getting
 GGTT info
Date: Thu, 12 Jun 2025 12:24:43 +0200
Message-Id: <20250612102449.1412058-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612102449.1412058-1-tomasz.lis@intel.com>
References: <20250612102449.1412058-1-tomasz.lis@intel.com>
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

The RESFIX state should be achievable only after a successful
handshake. If VF KMD has no GGTT configuration yet and we still got
into RESFIX state, then either we're dealing with unclean initial
state due to unusual actions before probe, or the migration
happened while xe init (started by probe) was running.

In 1st case (migration before probe), we should just skip migration -
init procedure will ensure exit from RESFIX state as it starts GuC
handshake with a reset.

In 2nd case (migration during xe init), the migration procedure should
execute normally if GGTT configuration was already acquired from GuC,
and can be skipped if it was not acquired.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 9b2fc9db55b8..74dcfe693d1c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -762,6 +762,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 
+	if (!gt->sriov.vf.self_config.ggtt_size) {
+		/*
+		 * If driver initialization is running in parallel to this handler,
+		 * and it did not reached acquiring GGTT config yet, then ignore
+		 * the migration - init procedure will create the GGTT at new place.
+		 */
+		return;
+	}
+
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
 	 * We need to be certain that if all flags were set, at least one
-- 
2.25.1


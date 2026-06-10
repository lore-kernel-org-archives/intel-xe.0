Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF1CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 06:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4422710E732;
	Wed, 10 Jun 2026 06:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mz62ir2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807D410E732
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 06:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781072607; x=1812608607;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QyR1Lm3YPSG6tmsrsw54RECN0Y/saGmh2LIuItbTkYs=;
 b=Mz62ir2BjNJrpwgh2kmpGKLxbwstOp7zMrbWQfoohFaMdOfNqpRLWK+U
 5M0N3Pigec+bK6Td2GhMjf2Qaa9SA/V+uqXu5BWOOb5IiEvF3XNKxsUJc
 fY8owGYOYDw+khra67K3qYD7Sc0yRuQtAMMoSuMmYEeJV0/dZqg/dlwFj
 thI267MIFUuxXV1kR9/OF9JM89ZiO/Ok/lctC/J/oemRPrGoLEYzUHq4e
 gad6YZchAZ2NLViUfeM5qV+76hcYWUa+MfP7NO9057WBx5+maFKu5WVvF
 pVvk7mghPnMCJhEuD4DyAdBskXqX6Th2MurplEfoSDd8O/CBXqgSatNFF g==;
X-CSE-ConnectionGUID: 3UHpR4XXRvGLJqp1FWmuMg==
X-CSE-MsgGUID: jYFkiudoTr6vcWbASC6aDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93343587"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93343587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 23:23:27 -0700
X-CSE-ConnectionGUID: RwE1sneBRMOfB6ZxRXBgnw==
X-CSE-MsgGUID: 9tU1JaA2SpeXbfF3ywVPcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="241651806"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2026 23:23:25 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/pat: Fix invalid L4 cache policy in xe2_pat_ats
Date: Wed, 10 Jun 2026 12:29:24 +0530
Message-ID: <20260610065923.3382050-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The xe2_pat_ats entry was programmed with L4_CACHE_POLICY=3 (UC) and
COH_MODE=3 (2-way coherent). Per bspec, when COH_MODE is 2-way (11b),
L4_CACHE_POLICY values 01/10/11 are all reserved and forced to WB by
hardware. This caused a mismatch between the programmed value (0xf) and
the readback value (0x3), resulting in igt@xe_pat@pat-* failures.

Fix by setting L4_CACHE_POLICY=0 (WB), which is the only valid L4 value
when 2-way coherency is enabled.

Bspec: 71189, 71582

Fixes: f6a22e686273 ("drm/xe/pat: annotate pat_index with coherency mode")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a9797d09f054..b36b64307ff0 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -217,7 +217,7 @@ static const struct xe_pat_table_entry xe3_lpg_pat_table[] = {
 	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
 };
 /* Special PAT values programmed outside the main table */
-static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
+static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 0, 3 );
 static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
 
 /*
-- 
2.50.1


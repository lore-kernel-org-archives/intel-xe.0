Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494D9C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 16:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F6110E0DD;
	Thu, 21 Dec 2023 16:32:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ED810E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703176336; x=1734712336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5u+/Ka2+78Amr7BDEggMFbk7S0ILbOB90qbK57IQTU8=;
 b=ltWU6kVK9p6Bii88vh5yghMOPd3qlnmKEBmYv6XifUoZcWgtefbMl1nx
 pd0ggKdH1NnoyJeJK3w+jo68NHw3CKSjv1KEebwu1gbHaMyab05PN1eVM
 2jqXyPukPU/0GZaTj4XpxHsA1P3gBz65vUGKWlj1lHLmjWNH5kjXEtbTt
 P3CQBTI1epTa0/2MrZZKEWdW1ObXpVtgJp39Jx1BfzMzUEwT8zC3mw3ZV
 djwHGJ6U7LCWz6Mfn7UJdoNvVBPPyDHsAsWLWAqjhXFZXorapnor+bdJ7
 6X4VePrLfgDNSJCd9hKhoW30C4DdDcy8ThLbVnr7RHdT9P+gB4KcSELre w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="394890004"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="394890004"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 08:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920378434"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="920378434"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 08:32:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/kunit: Drop xe_wa tests for pre-production DG2
Date: Thu, 21 Dec 2023 08:32:13 -0800
Message-Id: <20231221163213.3849523-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As workarounds for pre-production DG2 were dropped in
commit 707d1b992cfe ("drm/xe/dg2: Drop pre-production workarounds"),
there's no point running the kunit tests for them. Drop
those steppings from kunit.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 2e39acebbba4..439477593faf 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -66,14 +66,8 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_P, C0),
 	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
 	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
-	SUBPLATFORM_CASE(DG2, G10, A0),
-	SUBPLATFORM_CASE(DG2, G10, A1),
-	SUBPLATFORM_CASE(DG2, G10, B0),
 	SUBPLATFORM_CASE(DG2, G10, C0),
-	SUBPLATFORM_CASE(DG2, G11, A0),
-	SUBPLATFORM_CASE(DG2, G11, B0),
 	SUBPLATFORM_CASE(DG2, G11, B1),
-	SUBPLATFORM_CASE(DG2, G12, A0),
 	SUBPLATFORM_CASE(DG2, G12, A1),
 	PLATFORM_CASE(PVC, B0),
 	PLATFORM_CASE(PVC, B1),
-- 
2.40.1


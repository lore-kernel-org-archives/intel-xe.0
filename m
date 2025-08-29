Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D15CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8178910EC1E;
	Fri, 29 Aug 2025 17:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmPQj7ch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2979010E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756488000; x=1788024000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xgonM3z9VZrB8vjRo26YEd7Y6haarbM9KjB0jtGU1Eo=;
 b=YmPQj7chZRyEAQVFZBUYCroXPu5LnFbFflI0d2usNzFsaqfzXaBKGFvV
 ta9plDCN3R0YKu1ZJm80l7DWXPnF5tVbpRnkBJVf/k4Gb6kthc5s1Cr1o
 YRkNEFcbwQxXnVOPnGzmr8TmZODdRXhOTpgNCZp7n3AEzS9NVD1UMs6Hr
 ZludXWgdPowafyZUKsGHLLktX2m2EHJWIN3rgAUtJly48soLtMAvgmUeK
 1qUA0lCaCePb7b88zSqBu4aCCZOgoMM+8U5wnFLNDjmFdo39an7NS05vT
 SQiW6ZOR6qXQJMMtu1amKmTsg/JnymXmX7Y7Ikj/w811OsmZIVlrfwc2K g==;
X-CSE-ConnectionGUID: gt49nqXsR1ao/70aj7wChA==
X-CSE-MsgGUID: AIa/MWIwRWaHE8mBrq423Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212769"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:20:00 -0700
X-CSE-ConnectionGUID: rw7VJwJrQE+925cMnJWpDQ==
X-CSE-MsgGUID: N813jVLCT9WzyzrAwOg0ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818376"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 6/7] drm/xe/kunit: Drop xe_wa_test_exit
Date: Fri, 29 Aug 2025 19:19:21 +0200
Message-ID: <20250829171922.572-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829171922.572-1-michal.wajdeczko@intel.com>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
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

Remove xe_wa_test_exit() as it could crach the KUnit kernel in
case of hitting some asserts in xe_wa_test_init() as test->priv
could not be pointing to expected data.

 |    # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:34
 |    Expected ret == 0, but
 |        ret == -19 (0xffffffffffffffed)
 |Bus error - the host /dev/shm or /tmp mount likely just ran out of space
 |Kernel panic - not syncing: Kernel mode signal 7

Note that there is no need to call drm_kunit_helper_free_device()
since our fake device allocated by drm_kunit_helper_alloc_device()
will be cleaned up automatically.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index d67bfa3ec494..49d191043dfa 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -43,13 +43,6 @@ static int xe_wa_test_init(struct kunit *test)
 	return 0;
 }
 
-static void xe_wa_test_exit(struct kunit *test)
-{
-	struct xe_device *xe = test->priv;
-
-	drm_kunit_helper_free_device(test, xe->drm.dev);
-}
-
 static void xe_wa_gt(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
@@ -74,7 +67,6 @@ static struct kunit_case xe_wa_tests[] = {
 static struct kunit_suite xe_rtp_test_suite = {
 	.name = "xe_wa",
 	.init = xe_wa_test_init,
-	.exit = xe_wa_test_exit,
 	.test_cases = xe_wa_tests,
 };
 
-- 
2.47.1


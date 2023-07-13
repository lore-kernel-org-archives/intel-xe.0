Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B461C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 09:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AC610E65F;
	Thu, 13 Jul 2023 09:41:51 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD6710E151
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689241310; x=1720777310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EFmgKM43Af6cebrMPVXgIcb/vMQuIG6XvwMZKTp0Ac=;
 b=CSEYnDRJzR/Bc6STE+5kqz7QRULyLLEFaqim356h00blrkwXAPO0bExL
 WGhFzHvn0gloB8WCGTSe9wGpcx02f0Edbiy4f2DANnBXoPXM9bXki3vz7
 9M1lT5S/QaC7hfgiXU1t0mp9a3C599oasmUsgoXTyc+K0GEntTLOr6eFH
 hKac+VzcL8SKJe4qe8zcI/5OR5l2tFW/k2j4dcYjVHjcpta/FFmAMfMC8
 S3/F+skHe7C4q24eyQkpB/3Y5DM7RUGob/w5IY6fmDaE6CwQTjamr3A8M
 6+vzJxsJFwT9pKXseBEBSsG/z7XjUURz3V9lx0cS+4wNMXXBwAgHdq8+V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431292990"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="431292990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="751555766"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="751555766"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:41:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 10:41:28 +0100
Message-ID: <20230713094125.326709-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713094125.326709-5-matthew.auld@intel.com>
References: <20230713094125.326709-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/selftests: restart GT after
 xe_bo_restore_kernel()
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

Test seems to be failing badly after calling xe_bo_restore_kernel().
Taking a snapshot of the CTB and copying back a potentially old version
seems risky, depending on what might have been inflight. Also it seems
snapshotting the ADS object and copying back results in serious
breakage. Normally when calling xe_bo_restore_kernel() we always fully
restart the GT, which re-intializes such things.  We could potentially
skip saving and restoring such objects in xe_bo_evict_all() however
seems quite fragile not to also restart the GT. Try to do that here by
triggering a GT reset.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 6aad1443b00e..21c6dfef8dc7 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -220,7 +220,21 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 			goto cleanup_all;
 		}
 
+		xe_gt_sanitize(gt);
 		err = xe_bo_restore_kernel(xe);
+		/*
+		 * Snapshotting the CTB and copying back a potentially old
+		 * version seems risky, depending on what might have been
+		 * inflight. Also it seems snapshotting the ADS object and
+		 * copying back results in serious breakage. Normally when
+		 * calling xe_bo_restore_kernel() we always fully restart the
+		 * GT, which re-intializes such things.  We could potentially
+		 * skip saving and restoring such objects in xe_bo_evict_all()
+		 * however seems quite fragile not to also restart the GT. Try
+		 * to do that here by triggering a GT reset.
+		 */
+		xe_gt_reset_async(gt);
+		flush_work(&gt->reset.worker);
 		if (err) {
 			KUNIT_FAIL(test, "restore kernel err=%pe\n",
 				   ERR_PTR(err));
-- 
2.41.0


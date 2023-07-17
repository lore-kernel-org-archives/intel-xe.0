Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507A3C001DF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243BC10E259;
	Mon, 17 Jul 2023 13:32:20 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A89710E256
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689600738; x=1721136738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bND/YjqvR7kiKoitQsMcNqu4gzN9+yzFja3khRYmREQ=;
 b=eqEFUPjET5JYiFc0wgKMtfK0+jAj4GPeJ3NP7YfTq2twNa3+Hpo06tJh
 DiVIdxJBwUiOvtD13fBnZVeaDCkZl6UQ/BM+ULLjxDmnS4z/PDXf8eRUD
 Xw6lGetIvvav9HXq6Jnc46qqWQ19w+3Gy4KUF1jKjwJztmY2EJBQeqZfn
 ugRazJ3QVumcXWhlzbXsXNR3ojVT/Ohjx3KydNNWeo7f0xN/FQalglfHZ
 CD+As2+rP5VDyn3GPAf8RMLLF/ipDdXQURB7OakS47tnwsF3bYFDfhuJ9
 OYWAJ0nHtc9c+RhC9OgUWLYEUZ2gRqO+h2t87K8PE+2KR3MDl+uadvccF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355867845"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355867845"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836881086"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836881086"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 14:32:03 +0100
Message-ID: <20230717133159.47980-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717133159.47980-6-matthew.auld@intel.com>
References: <20230717133159.47980-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] drm/xe/selftests: restart GT after
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
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
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
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


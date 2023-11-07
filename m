Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B05AC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 19:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FDB10E667;
	Tue,  7 Nov 2023 19:29:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B6210E669
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699385352; x=1730921352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NHhvDh23G6PrhHzXmr+I3Yp8N0JLkySjgJDevtYGVIQ=;
 b=J70fBfNXbxzhcUPEfwh7Xp8B8Btum10M7uBZjLVtN7mGn3WVpPRj9dU5
 QpZBMryuppN0KmNJuZq/7zE5pRZd60LzktvBBhfuUI3GBI6jx/7CIHsBf
 kk4G/TP02wPETRQVQl15GUCM8MNFyKMl3ygNewhEkci4BU/mSr/ohHrhw
 PQN8wC4Im5+EkKnx50AgWqQBxZGLHDUkGYSDoRqZ0akgjzX441ygcBtqT
 3W9q/1obe0VEBJrST9hvytM4SuxprWIHTZod4k9lKnusxQEvOUs4E6/Z8
 AePWWOtLF1UhmlmTl625lIko3HwQF7AvlnhaPfrYeIAo69L4QoniTKwQ4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475832923"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="475832923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 11:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="3905800"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa002.jf.intel.com with ESMTP; 07 Nov 2023 11:29:10 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Nov 2023 01:07:51 +0530
Message-Id: <20231107193751.741119-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/tests: Fix migrate test
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

Pass a valid vm to xe_migrate_update_pgtables.

Resolves NPD crash seen with igt@xe_live_ktest@migrate

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index c984307560ee..7aad09140d7e 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -236,7 +236,7 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
 	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
 
 	then = ktime_get();
-	fence = xe_migrate_update_pgtables(m, NULL, NULL, m->q, &update, 1,
+	fence = xe_migrate_update_pgtables(m, m->q->vm, NULL, m->q, &update, 1,
 					   NULL, 0, &pt_update);
 	now = ktime_get();
 	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
-- 
2.25.1


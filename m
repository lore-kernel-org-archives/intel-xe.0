Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A5C61DA4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439C210E0E9;
	Mon,  6 Mar 2023 13:55:11 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BC210E0E9
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678110909; x=1709646909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P54XKuED8rm6N810iegwlj8LeLBZf6QNRtJLQWU/ePc=;
 b=hGWb3bJhf5j1NOZ99eD/FvQ69wOydC1enH4vpnJb+60toaTm+fsZIdmE
 Lt/d+IN9jqzC/J4vlvA8xlmy5b8M7O4/q/jRlU1Jr2RBrxyhxQOyDjfAj
 sQeid+SUK/WRixdIm5FHbKu2TdvvuM3wS9tc6OzmelRAa42DaR1BvZDpc
 d2BTpbfPinGf/7Iokknq/QL+qdnhNeUFphNdBGSIL9I1mIphc4fpU/dQb
 mtKl0bAOsa4DXPGchguwlFWP1kSByHUgGoVomialIXv3Z+YrfpZjtRvOr
 4ycc6Imch8I8xXscvdBi55pQWLAXVxIxoVVc7xaCfJdXxaau815+4rEfK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400378408"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400378408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669449097"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="669449097"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:55:08 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 05:55:04 -0800
Message-Id: <20230306135504.8642-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/migrate: Use proper batch base address
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe_migrate_sanity_kunit test, use proper batch base address
by considering usm case.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0de17e90aba9..0647d61e4b7e 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -35,8 +35,9 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 			  struct xe_bb *bb, u32 second_idx, const char *str,
 			  struct kunit *test)
 {
+	u64 batch_base = xe_migrate_batch_base(m, xe->info.supports_usm);
 	struct xe_sched_job *job = xe_bb_create_migration_job(m->eng, bb,
-							      m->batch_base_ofs,
+							      batch_base,
 							      second_idx);
 	struct dma_fence *fence;
 
-- 
2.21.0.rc0.32.g243a4c7e27


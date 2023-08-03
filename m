Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F6BC00528
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 22:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E7910E67D;
	Thu,  3 Aug 2023 22:03:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657A10E67D;
 Thu,  3 Aug 2023 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691100189; x=1722636189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cmJyRGbVPBP8isDOYHAEQPBWhtURmh1uQ2hxWxW2DbY=;
 b=iM3J4QJj6HAw/i/walHzfuQYla+zphAnOta1OtOu26ZRaAedcub19CBf
 UEc70E63GaWSWVVvkQAZ7a6NaSSmo6/zqKnCLjikNmDOTh6RcZctrFjyR
 e81WzKCh5c0LsjF6vZGxTKYQBp4UyGHQ9u8JjKaDNMC8QoEy6oLWd2zw1
 QkcDC+8lC8weAPSIMjgs/QhRU6CKyJb4Yx5QkgRYUzIHXBSlY25760hh6
 nRWwkuJifp2w65ZN1iZV+1cdiemL2/QoYQRpaT7ll7zKoMloBda+As96g
 pVSgjy/NsnOrWG3YrTgYTX9yh8PSbeMKoJ+RhlDuvC06FhX6PK1gea/PD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="369998791"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="369998791"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 15:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060463650"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="1060463650"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 15:02:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 15:02:48 -0700
Message-Id: <20230803220248.871666-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt] tests/xe_debugfs: Skip test for tile count
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Once upon a time in xe, tile count and gt count were the same thing.
This is not necessarily true anymore. Example: Meteor Lake has just
one tile, but 2 GTs (one for graphics, one for media).

There's little value in comparing what the kernel exports via ioctl
from what the kernel exports via debugfs. Just remove the test.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/xe/xe_debugfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 5434d4645..e51d03661 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -104,9 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
 	switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
 	case 48:
 		val = 3;
-- 
2.40.1


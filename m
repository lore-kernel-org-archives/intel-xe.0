Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CECC76196
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02310E94B;
	Wed, 15 Mar 2023 15:55:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC7B10E8C6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678895742; x=1710431742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lD1wf2p1pPgLbkQ7t3kL9TO8iRo4ScrwXnH//yYrmxA=;
 b=TpzIis4z1I5KEYp1trcA4rFAIgeHGi+GFEI7ceAVScsyoU1gJrUDzo4B
 TfeD+Cg/Ls2c/O1d/zMIFlp4Wu+U2vkn68tRKxrAK6XPIs5UpEEcBf2KC
 xRmm+B1zWSCY69CT0CHSMOqhz99mz+2RhmPwBwZnVu7uPPcWSLjRbugxV
 JT9/eon7x0K77wAQ7UZp0lxsF6JtF3cd3X7m6gsTKm5R4YT2OcD9DCf/o
 Ujf3ex4DtdagopsMxje5b/1Yoraxp9C//44g+N9U3d250BUndLw/YJmkk
 NAbN32OurLqOOX8llAKr+l/4ZuCxfU3yWfNm8eoaJseiR1WQF1HW2qKal w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321583117"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="321583117"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="711973748"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711973748"
Received: from lbarg-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:55:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 16:55:03 +0100
Message-Id: <20230315155507.43933-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
References: <20230315155507.43933-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/7] drm/xe/tests: Support CPU page-table
 updates in the migrate test
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The migrate test currently supports only GPU pagetable updates and
will thus break if we fix the CPU pagetable update selection.

Fix the migrate test first.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ac659b94e7f5..a3bace16282e 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -66,9 +66,16 @@ sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
 {
 	int i;
 	u64 *ptr = dst;
-
-	for (i = 0; i < num_qwords; i++)
-		ptr[i] = (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
+	u64 value;
+
+	for (i = 0; i < num_qwords; i++) {
+		value = (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
+		if (map)
+			xe_map_wr(gt_to_xe(gt), map, (qword_ofs + i) *
+				  sizeof(u64), u64, value);
+		else
+			ptr[i] = value;
+	}
 }
 
 static const struct xe_migrate_pt_update_ops sanity_ops = {
-- 
2.39.2


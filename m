Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D53DFF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 18:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787F10E0C0;
	Tue, 28 Apr 2026 18:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1zFWW1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828110E33B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 18:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777401061; x=1808937061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WXpxsJmy+L2MMYQQV3TjQzwxPiZnXqOE1iXyq0y0X4=;
 b=h1zFWW1upNCszq8YqK5eF+DhGrMUwjc+tPXvGYoaN76W7/BjQDGCIDAU
 aGvxM18kNVjXzcf1HgzEcME+lHzqox4X9xa4ihEgXtxJ/I/s5sKjlP8HX
 BnZfQntMuR9dgIvKVdkABkQaI/cvf/MlXb4Okr31Nk6v3nsbxWewX9A07
 sZRopIfhkRiyZnWhkEpNjhlYN9OzC6NIcWSvGKlJeU+A3KzUTHDuLwlJ5
 RJv9FhU4EHl5IcM5VUX9Q66QyWfVkV41d/GKBOZMDkmTM/fdp5GnDcxNK
 fxKSHAS+svw1b92vPQtrmvvd4TVBxkrNNM0CTW09ryWAi/Iukzxt1xY9w w==;
X-CSE-ConnectionGUID: dx/bGXqSRyWuCogypR9IWQ==
X-CSE-MsgGUID: 46s+Do59Tu2jjVl9KSRzXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78511572"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78511572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 11:31:01 -0700
X-CSE-ConnectionGUID: sXS6m+/QSWecJ/6rTGIcsQ==
X-CSE-MsgGUID: 7KphP4+5QjuD+TfnCc1EOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="272173451"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa001.jf.intel.com with ESMTP; 28 Apr 2026 11:31:00 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Fix EAGAIN sign in pf_migration_consume()
Date: Tue, 28 Apr 2026 18:30:50 +0000
Message-Id: <20260428183050.3998257-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PTR_ERR() returns a negative value, so comparing against the positive
EAGAIN is always true for ERR_PTR(-EAGAIN), causing pf_migration_consume()
to bail out instead of continuing to the remaining GTs. On multi-GT
platforms this can skip GTs that already have data ready.

Compare against -EAGAIN to match the intent (and the following line
that correctly uses -EAGAIN).

Fixes: 67df4a5cbc58 ("drm/xe/pf: Add data structures and handlers for migration rings")
Assisted-by: Claude:claude-opus-4.6
Cc: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 6c4b16409cc9..d6f602f715f0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -149,7 +149,7 @@ pf_migration_consume(struct xe_device *xe, unsigned int vfid)
 
 	for_each_gt(gt, xe, gt_id) {
 		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
-		if (data && PTR_ERR(data) != EAGAIN)
+		if (data && PTR_ERR(data) != -EAGAIN)
 			return data;
 		if (PTR_ERR(data) == -EAGAIN)
 			more_data = true;
-- 
2.43.0


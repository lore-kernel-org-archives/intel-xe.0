Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C01606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JZYtPM05
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F83A10E99C;
	Thu, 26 Nov 2026 13:10:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0663E10E99C
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795698627; x=1827234627;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zehTegUweaapxcw2nJRxcBrJk33VntHlrhppCbhq3n4=;
 b=JZYtPM05gta33Y63LCmN2vDx/hcC/OeAdJimSmuGH0fPlo5XmQxykjQj
 FNMK/m1R3cz3tRZOuv0aemwH2OBRtzsZCpT5S04o5ooyOE/DM05Oe2yZd
 75a0hmwd17tkxi3QuritRUd82fuuWQrbdaWnI7a9oSK7XgKUr3BLliwrn
 Yodyiu+na2zPJ0AvaGLM2c+UvtFS+UGxnPxdB+ylbLgCzQZ1ua7Pe6VP4
 512aHfK+SkAoqjaFpt6ROSnz2CQPb+tRdSusr6uuiF3CpGsyLPIGfvA01
 aWXU1zwJHJ0PtOgz91Cf87BtQF4vHA9Yrha7V2ImE8uI1U4qRdJG5Bc9O g==;
X-CSE-ConnectionGUID: WsRjE8LtQBqnDrVr7Qu5zQ==
X-CSE-MsgGUID: CcILEva4TmarMbCNFzD45w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4609401"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4609401"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:10:27 -0800
X-CSE-ConnectionGUID: cF3GMdTKQ3S6UjS8HrVdrQ==
X-CSE-MsgGUID: IlVuOJFsS3Sf6GOuJmQtdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="13851562"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa012.fm.intel.com with ESMTP; 26 Nov 2026 05:10:25 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org, gustavo.sousa@intel.com
Subject: [PATCH] drm/xe: Print has_sem64 in debugfs info
Date: Thu, 26 Nov 2026 18:38:02 +0530
Message-ID: <20261126130802.1258172-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Print gt->info.has_sem64 alongside the other per-GT fields in the
debugfs info file, which will be needed by stakeholders such as test
and debug tools to know whether to use MI_SEMAPHORE_WAIT_64 on a GT.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index bc62d1054d29..e0458c21eb09 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -242,6 +242,7 @@ static int info(struct seq_file *m, void *data)
 		print_engine_mask(&p, gt, gt->info.engine_mask);
 		drm_printf(&p, "gt%d multi_queue_engine_classes", id);
 		print_engine_class_mask(&p, gt->info.multi_queue_engine_class_mask);
+		drm_printf(&p, "gt%d has_sem64 %s\n", id, str_yes_no(gt->info.has_sem64));
 	}
 
 	return 0;
-- 
2.46.0


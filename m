Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951B8C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 19:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514D410E705;
	Tue, 22 Jul 2025 19:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3TTLS2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0109510E705
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753213951; x=1784749951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zN91GgtwUcjkDy9jXij0Nt5H75MjTo60usELBQQ4p14=;
 b=g3TTLS2ZRb2r9Xb8hEYg4hzSZVAp+biru13ZEI8dDReMjFfV8ukTjbEf
 8crnG7qMBzQamtYEk63imy6slFkzs6VEeOhxQPfXcp03WCYTTh9CI/XtQ
 bOA6eMDkUFbHNd9eIYkP/I1Od5q5aZ81FWOhiok1ONbHUGU0GrTslvNCb
 8IojnfKrsmSN94ByxJcl4Q3LTraBXQf8qiXS2/jkUsV9MCOSJVtN9bPeb
 hUTcqtvo1bwmz84RvUHQZhzJp9nF2420sQMrIE+i/tSQfT4QmklMBlMug
 rlDLF8/L22ft6cRDCKAESqFf35PNZHXCTDlcg5GRQ7YNl57PS1s7WTjqM w==;
X-CSE-ConnectionGUID: NGNC1KS8SRqXK9+opl4T9A==
X-CSE-MsgGUID: rY1ptM9/QDqC+Wcf8cFtgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55638224"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="55638224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 12:52:30 -0700
X-CSE-ConnectionGUID: uOJtp8ckRAmHj4PCfIbXxQ==
X-CSE-MsgGUID: qaCWkccrST6bfJFJLb7aDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="190202000"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 12:52:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm/xe: Fix build without debugfs
Date: Tue, 22 Jul 2025 12:52:08 -0700
Message-ID: <20250722-xe-fix-build-fault-v1-1-157384d50987@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250721-xe-fix-build-fault-b819887c5fb7
X-Mailer: b4 0.15-dev-858c0
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

When CONFIG_DEBUG_FS is off, drivers/gpu/drm/xe/xe_gt_debugfs.o
is not built and build fails on some setups with:

	ld: drivers/gpu/drm/xe/xe_gt.o: in function `xe_fault_inject_gt_reset':
	drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1659): undefined reference to `gt_reset_failure'
	ld: drivers/gpu/drm/xe/xe_gt.h:27:(.text+0x1c16): undefined reference to `gt_reset_failure'
	collect2: error: ld returned 1 exit status

Do not use the gt_reset_failure attribute if debugfs is not enabled.

Fixes: 8f3013e0b222 ("drm/xe: Introduce fault injection for gt reset")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index e9ccab8aedbef..41880979f4ded 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -24,7 +24,7 @@
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
 {
-	return should_fail(&gt_reset_failure, 1);
+	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
 }
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);




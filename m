Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BAFC761A6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 04:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF8610E121;
	Mon,  3 Apr 2023 04:37:11 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39EE10E121
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 04:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680496628; x=1712032628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x6lx5TeDip/m6Gk7n4eoBaB7zmonIS0WMzwlPAgyoJY=;
 b=GDqYl2IwirGB5ir3P04peWE9l5l6+PhwHbFpSnP8fyqtVP4+cw3PGLu1
 59QZYLqJ3jJsMkUMm3FDvsLzhcz79fBpaei7QPByBGELPJ/zeidWfwx5V
 3hVk6y8a3IRN4Ln28q8H8o45mugFcH+M1VH16k12nLcFYuJTqX+zYRtgj
 Yzp1YJrDIMVnYJS5f0mLhjSfEdEvSPUeeUMDvHSdI5m2WpEBecMFGvNXD
 AfHZLlCOhzqQQBrtdhyGyfo2m/2RKc+gD4diMIqVTFAFitb2udATBRHCs
 O4acGxk7u+EpfFJXtNfbYwfh4ujbEYt4Shjr+zZtoyG4anl6uEmDahLv2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="406858014"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="406858014"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 21:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="1015564126"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="1015564126"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 21:37:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun,  2 Apr 2023 21:37:13 -0700
Message-Id: <20230403043713.3086272-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] CI: Print some GuC info on driver load failure
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

---
 drivers/gpu/drm/xe/xe_uc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..65663f24e12e 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -8,6 +8,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
+#include "xe_guc_log.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
@@ -149,8 +150,12 @@ int xe_uc_init_hw(struct xe_uc *uc)
 		return ret;
 
 	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
-	if (ret)
+	if (ret) {
+		struct drm_printer p = drm_info_printer(uc_to_xe(uc)->drm.dev);
+
+		xe_guc_print_info(&uc->guc, &p);
 		return ret;
+	}
 
 	ret = xe_guc_post_load_init(&uc->guc);
 	if (ret)
-- 
2.34.1


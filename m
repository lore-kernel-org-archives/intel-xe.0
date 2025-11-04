Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359ABCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E942410E67F;
	Tue,  4 Nov 2025 22:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNHSSeVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F610E67F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762294714; x=1793830714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GXEpYFa10VdjyCk8+mLgVOReZauRZ33sClVfBIzWG2c=;
 b=QNHSSeVhuUkvFPUyUSkzZGlg6Tg9BCxZyV1QxKDN8hvZYylrZ7hLJPEz
 e11/7GR4/myX8Ffh8D4MDiZynGel+xVJK5j+o1aGZ1TjxW+R70UVEKcaA
 ZXtgOrB6o0JdjWbzwEoHv8wId1eicEkatT7xIXrrgWQ0zapK4+Rv5RkvT
 YkuTNcDQFkKsrGgpevKYeWhmdu+Zpo4HuZ19N4vyMT7i/6byrsOs+B+6j
 u0zp81TVqolTpt+7COpkru2TJM3HFNhAVAFEkAiFQdT4ehiAO0tOU4fWK
 S/Q3kBW4gfwb84wBwEwdWbMB9kD5L3iL4lft6H9tGCl/o1UXtXbOHxt0M g==;
X-CSE-ConnectionGUID: DK5eiOAGSCWYoM3gxP51Iw==
X-CSE-MsgGUID: 4JUtB5J3S16uMXma0O+uwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64098500"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64098500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:18:34 -0800
X-CSE-ConnectionGUID: XUzs8tkkTJakbYTZxflOuA==
X-CSE-MsgGUID: gEqH0c6pTMe94dmRTptf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="191372498"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 04 Nov 2025 14:18:33 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/guc: Register CT fini action before mutex init
Date: Tue,  4 Nov 2025 22:16:14 +0000
Message-ID: <20251104221613.795865-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

xe_guc_ct_init_noalloc() allocates the CT workqueue and other helpers
before it tries to initialize ct->lock. If drmm_mutex_init() fails
we currently bail out without releasing those resources because the
guc_ct_fini() hasn’t been registered yet. Move the drmm_add_action_or_reset()
call ahead of the mutex setup so that the devres unwinder tears everything
down on the error path. This is safe because guc_ct_fini() never
touches ct->lock.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 671d69958ce7..2680e9096c15 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -240,16 +240,16 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
-	err = drmm_mutex_init(&xe->drm, &ct->lock);
+	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
 	if (err)
 		return err;
 
-	primelockdep(ct);
-
-	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
+	err = drmm_mutex_init(&xe->drm, &ct->lock);
 	if (err)
 		return err;
 
+	primelockdep(ct);
+
 	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
 	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
-- 
2.49.0


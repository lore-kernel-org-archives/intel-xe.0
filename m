Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B300CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 18:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51810E2F4;
	Mon, 10 Nov 2025 18:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agiKlIhp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9CB10E2D8
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762800468; x=1794336468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mdmzalaJkYks0rrJKUDbwEyeWLC6wGzAWGj5YR/KKUU=;
 b=agiKlIhpeZ3zFxEMo8/MgTb1bOPOATEruVvq7pqaYtx3BCG+CBeR7Ohv
 yYgo6eWRGAGb7/hJ6iVtwG5NpTOHP15TJSVE0m+JxudCYPYN0iUKmjYWc
 UMFixSLY/cXS5u/V57xCFqOIsaa/1uS2g1WDNvTzoRQkxBsSLE60C9PH9
 6g1jzmDUFmPwsC+RF1lRiBWBiOs8CCl8d/GJsiNbkUeUrBtAUPoeWmDNS
 dN8bwzxn1wD2guXgciRJBmfxY5alYP7sbZDvixsYR3GjZX17AjcesSIFW
 OqmOzs9difL/tbYOnYfaTvZJLJ4EYFv6kYjWBq2tkVUahk2ju75UmgK1p Q==;
X-CSE-ConnectionGUID: Dhj4TRKURTK7H0EXzl7sKw==
X-CSE-MsgGUID: 1DT1zze7Q2eTW9nFuj2eYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="52415001"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="52415001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:47:48 -0800
X-CSE-ConnectionGUID: QJfFyCzASJCPSObwtbhC4g==
X-CSE-MsgGUID: zQNlmqCISJy8+rvAKVjDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188001043"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 10 Nov 2025 10:47:46 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3] drm/xe/guc: Fix resource leak in xe_guc_ct_init_noalloc()
Date: Mon, 10 Nov 2025 18:45:23 +0000
Message-ID: <20251110184522.1581001-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251104221613.795865-2-shuicheng.lin@intel.com>
References: <20251104221613.795865-2-shuicheng.lin@intel.com>
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
guc_ct_fini() hasn’t been registered yet.

Since destroy_workqueue() in guc_ct_fini() may flush the workqueue, which
in turn can take the ct lock, the initialization sequence is restructured
to first initialize the ct->lock, then set up all CT state, and finally
register guc_ct_fini().

v2: guc_ct_fini() does take ct lock. (Matt)
v3: move primelockdep() together with drmm_mutex_init(). (Lucas)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 671d69958ce7..c29807ace363 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -225,6 +225,12 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
 
+	err = drmm_mutex_init(&xe->drm, &ct->lock);
+	if (err)
+		return err;
+
+	primelockdep(ct);
+
 	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
 	if (!ct->g2h_wq)
 		return -ENOMEM;
@@ -240,12 +246,6 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
-	err = drmm_mutex_init(&xe->drm, &ct->lock);
-	if (err)
-		return err;
-
-	primelockdep(ct);
-
 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
 	if (err)
 		return err;
-- 
2.49.0


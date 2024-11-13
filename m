Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C51D637A0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F32B10E0EA;
	Wed, 13 Nov 2024 17:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnDpsths";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A93C10E0EA
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731518242; x=1763054242;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zr46Jo2AqGHR3eNs1JSQRsPSVGSnlC2fC6WzNM9qLNo=;
 b=BnDpsthsbfQLeFPK6NtlwjZV/5BAyt2c/ZYKv1iB8DcQzTx18e/yjPJO
 stmGUrxSzDMY2GLzUQYE+fC0v0w1TKGdtZ+tGaclEB+izR/ZynnK9j1Nq
 Cx0r7+AWFu3a/9AiRwAZFhGP6KGAs0o5q68KW4kB22OL0V64peEsGCugD
 Lmu1QqcYRITlZ88mf48UenIqgi94U9KhmmrU80Xl2oIuaTLnz/ak21tns
 PzFo4pwzfkEpyqQ3dfeWiScPnH42RDkVoO5N8R7ULwqyFWPxRe583ZeN3
 RWdUBelo8eNPZO8dv5R+D/h5aYD6yI90+H7jEtzsF+uj2eVnyzfbytfyB w==;
X-CSE-ConnectionGUID: CPVwC1H2TiS6TMcbb06NAw==
X-CSE-MsgGUID: CYGuHBCuR+ysM9BvCBqcAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56814842"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="56814842"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:17:21 -0800
X-CSE-ConnectionGUID: WPtA3xtlRNSsUhOuY4nc0w==
X-CSE-MsgGUID: nMiponOkRFiFDc4wo6Lb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="118869239"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:17:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Mark preempt fence workqueue as reclaim
Date: Wed, 13 Nov 2024 09:17:51 -0800
Message-Id: <20241113171751.1677784-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Preempt fences are in the path of reclaim, and we signal these fences in
the preempt workqueue. With that, we need to mark the preempt fence
workqueue with reclaim so that this workqueue can make forward progress
during reclaim.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..06d6db8b50f9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -350,7 +350,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
-	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
+	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
+						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
 	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
-- 
2.34.1


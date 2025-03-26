Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BDC3600B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 15:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7512710E6F5;
	Wed, 26 Mar 2025 15:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDPQidhL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B3E10E6F5
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743002573; x=1774538573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k5C01u0llCcEjBVls83dgnMO1JLZESEmgUTXyJM7YiU=;
 b=cDPQidhLevVeuEpVTFEXBTnKLXVbkYEIQ2npVNJ/Z16x4FGrTByW8auh
 LMTBmiVssVNSvKVpgZqYb5QrTggT89m0YaIB28oi1AtjW0/Y8sGfSopRD
 r74KeiBFj1YWQ9Z8U/Dcnphr1oRKOWLqqPTQbi62Gar9w6NvQxsJvEuwu
 ME4zlMAOYw5YCwpuxGIHE2lCwtzT0waqGjSxqpY+/PfdQOcj51wqYsnQM
 SFU25A5Nni9KiyxHrFtcPEJCPhOMlqg4P8DMV9rbdkrvN251M+KLGVSRq
 fYEcHqQPtfpuNSfCd6xJpISqyZNgRjVA+iw2ONezjo+BesmPnrVFJHHLs A==;
X-CSE-ConnectionGUID: 8iYhBNo1SQmOupCF9lKTgg==
X-CSE-MsgGUID: LEJuLpjvTqGIWfIY5v673A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55663845"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="55663845"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:22:29 -0700
X-CSE-ConnectionGUID: tb0S9BSoT7i50VJjMzaZMQ==
X-CSE-MsgGUID: EsBp4JxbQomLfVOwlXixZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="155808886"
Received: from unknown (HELO aradhyab-desk.iind.intel.com) ([10.190.216.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 08:22:26 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>,
 Intel XE List <intel-xe@lists.freedesktop.org>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [RESEND PATCH v2] drm/xe/migrate: Switch from drm to dev managed
 actions
Date: Wed, 26 Mar 2025 20:49:29 +0530
Message-Id: <20250326151929.1495972-1-aradhya.bhatia@intel.com>
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

Change the scope of the migrate subsystem to be dev managed instead of
drm managed.

The parent pci struct &device, that the xe struct &drm_device is a part
of, gets removed when a hot unplug is triggered, which causes the
underlying iommu group to get destroyed as well.

The migrate subsystem, which handles the lifetime of the page-table tree
(pt) BO, doesn't get a chance to keep the BO back during the hot unplug,
as all the references to DRM haven't been put back.
When all the references to DRM are indeed put back later, the migrate
subsystem tries to put back the pt BO. Since the underlying iommu group
has been already destroyed, a kernel NULL ptr dereference takes place
while attempting to keep back the pt BO.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3914
Suggested-by: Thomas Hellstrom <thomas.hellstrom@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
Note:
This is a resend of the original v2 that was sent previously. That patch, for an
unknown reason, did not get registered with intel-xe freedesktop patchwork
setup, despite reaching the intel-xe mailing list server.

original v2:
https://lore.kernel.org/intel-xe/20250325114225.1231973-1-aradhya.bhatia@intel.com/T/#u

Changes in v2:
  - Rebase to latest drm-tip.
  - Add tags: Closes, S-b (Thomas Hellstrom), R-b (Tejas Upadhyay).
  - Drop patch 2/2 from the series, as memory eviction is now being
    comprehensively handled in https://patchwork.freedesktop.org/series/146383/#rev5.
  - v1: https://lore.kernel.org/all/20250228065224.320811-1-aradhya.bhatia@intel.com/

---
 drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index df4282c71bf0..6c26892b05d5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -97,7 +97,7 @@ struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 	return tile->migrate->q;
 }
 
-static void xe_migrate_fini(struct drm_device *dev, void *arg)
+static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
 
@@ -401,7 +401,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	struct xe_vm *vm;
 	int err;
 
-	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
+	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
 	if (!m)
 		return ERR_PTR(-ENOMEM);
 
@@ -455,7 +455,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	might_lock(&m->job_mutex);
 	fs_reclaim_release(GFP_KERNEL);
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_migrate_fini, m);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
 	if (err)
 		return ERR_PTR(err);
 

base-commit: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
-- 
2.34.1


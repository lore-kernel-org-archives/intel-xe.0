Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1933BC35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 11:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9244B10E536;
	Tue, 25 Mar 2025 11:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn3QXHsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D27010E536
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742903116; x=1774439116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=65GoV067M59GtyeS5QeAUnNC7VYoXuzSU09VyT0y+NM=;
 b=Nn3QXHsKgcxCQF6Wkd34N85qpbcMW2GMRdfJWBNj7LeAaygS2oKMbDdw
 kGTee5F9GDIk1/vAVI8Kyc8G3crMFTwupRdhmjU7tiCCVhfh7cbRLeMw8
 DPEGYrkTG20c3TfBb89p11AIcQxBzGHWA54JukUc5fb65lxf8Z3tgSBOh
 6QlCIOwW/Gmw1p7h/rQ7K8s9WYmkaH1YOfaNMiLcL2QhzSDZu71z2LMFl
 v+rhoFoUhzPQEyu4/Vnd85zI/XHsPhSotSsEmvIstb+mp/v2kAQwnFLOO
 VdgNCZhpEp47IJ7aheeTAXhaJe1VvT8Bq/cYjnDhw6zbdgf57nAwDsW1g A==;
X-CSE-ConnectionGUID: uJm/esIPQUGuxF0nf6p51g==
X-CSE-MsgGUID: koEcrgtkT/eYRTc9Rgn2WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44267960"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44267960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:45:16 -0700
X-CSE-ConnectionGUID: Ej7ngTVgSaaWq2EvVL5Tqw==
X-CSE-MsgGUID: aIgka4g6QDG/RqOJd0jsiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124072566"
Received: from unknown (HELO aradhyab-desk.iind.intel.com) ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:45:13 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2] drm/xe_migrate: Switch from drm to dev managed actions
Date: Tue, 25 Mar 2025 17:12:25 +0530
Message-Id: <20250325114225.1231973-1-aradhya.bhatia@intel.com>
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


Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A79EC282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 06:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8576110EC0D;
	Fri, 28 Feb 2025 06:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGEo6ds3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CB810EC0D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740725573; x=1772261573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f0jlm8QflUZ0az0lUtRC3oGyRR+WgDD+t7PU7kYL1Gc=;
 b=JGEo6ds3gj7Z3i+Grbk1uA0GQ4RmvSjGLD1PrhIGxJtq+9BvJpPe+ccc
 YURN0nOTIRNLNPm6Xk3lmfClvx/pbodKRXzssNK+RbturfsiPvxkMJVdE
 t37NDYfE8kCM2Td6SXR711u60qTknxNWS8HmRGCfChPSwsuAo1o1MbcJw
 ziZ9bEN7xmZgAxlRxCGHR5InpCSzMkqdLr9cOa60bAyKtLMQYqKW+xdhY
 bKWdUjd5kq2RcVOnF6qDrMCAghU4GyXcMTifQh3c9Fgi76klDvZTNeBPb
 QhKh3vt5R1dHJklzzPxDRhkCmk4js2ukaNN4oRSQO8DvM1pWZMRDcUORF g==;
X-CSE-ConnectionGUID: WjhlZ3yFTpiQ3LdYw05VVg==
X-CSE-MsgGUID: rHjvXBfDR22V5PMiZdlFAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45562076"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="45562076"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:52:53 -0800
X-CSE-ConnectionGUID: Z4SZYiX2RGSF1f98DfbUaw==
X-CSE-MsgGUID: wO84eaETSM+FjVWMxnLkAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117442411"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:52:51 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
Date: Fri, 28 Feb 2025 06:52:23 +0000
Message-ID: <20250228065224.320811-2-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228065224.320811-1-aradhya.bhatia@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
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

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 278bc96cf593..4e23adfa208a 100644
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
 
-- 
2.45.2

